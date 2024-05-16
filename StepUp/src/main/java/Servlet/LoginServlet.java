package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import Model.User;
import connection.DB;
import DB.UserDB;
import Model.EmailUtility; // Make sure to import your EmailUtility class

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDB userDB = new UserDB(DB.getConnection());
		User user = userDB.userLogin(email, password);

		if (user != null && user.isActive()) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			Cookie loginCookie = new Cookie("user", session.getId());
			loginCookie.setHttpOnly(true); // Makes the cookie inaccessible to JavaScript running in the browser
			loginCookie.setSecure(true); // Ensures cookie is sent only over HTTPS
			loginCookie.setMaxAge(60 * 60 * 24); // Set for 24 hours
			response.addCookie(loginCookie);

			printCookiesInfo(request);

			if (userDB.isAdmin(email, password)) {
				request.getRequestDispatcher("adminMenu.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}

			// Send welcome email
			String subject = "Welcome to StepUp!";
			String text = "Hello, " + user.getName() + ",\n\nWelcome to StepUp! We are glad to have you with us.";
			try {
				EmailUtility.sendEmail("your email address", email, subject, text);
				System.out.println("Welcome email sent successfully to " + email);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Failed to send welcome email to " + email);
			}
		}else if (user != null && !user.isActive()) {
			request.setAttribute("error", "Failed to login. Your account has been temporarily disabled.");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
		else {
			request.setAttribute("error", "Failed to login. Please check your credentials and try again.");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
	}

	private void printCookiesInfo(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				System.out.println("Cookie Name: " + cookie.getName());
				System.out.println("Cookie Value: " + cookie.getValue());
				System.out.println("Max Age: " + cookie.getMaxAge());
				System.out.println("Secure: " + cookie.getSecure());
				System.out.println("HttpOnly: " + cookie.isHttpOnly());
				System.out.println("Path: " + cookie.getPath());
				System.out.println("Domain: " + cookie.getDomain());
				System.out.println("--------------------------");
			}
		} else {
			System.out.println("No cookies found.");
		}
	}
}