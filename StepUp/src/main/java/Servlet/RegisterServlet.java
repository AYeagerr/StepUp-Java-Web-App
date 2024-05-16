package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.User;
import connection.DB;
import DB.UserDB;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String name = request.getParameter("name").trim();
	    String email = request.getParameter("email").trim();
	    String password = request.getParameter("password").trim();

	    String REGEX_NAME = "^[a-zA-Z_]+$";
	    String REGEX_PASSWORD = "^(?=.*[0-9])(?=.*[a-zA-Z]).{8,}$";  // Requires at least one letter and one number

	    StringBuilder errors = new StringBuilder();

	    UserDB userDB = new UserDB(DB.getConnection());
	    if (userDB.checkUserExists(email)) {
	        errors.append("<p>Email already registered. Try another email or login.</p>");
	    }
	    if (name.length() < 3) {
	        errors.append("<p>Username length must be at least 3 characters.</p>");
	    }
	    if (!password.matches(REGEX_PASSWORD)) {
	        errors.append("<p>Password must contain at least 8 characters including both letters and numbers.</p>");
	    }
	    if (!name.matches(REGEX_NAME)) {
	        errors.append("<p>Username can only contain letters and underscores (_).</p>");
	    }

	    if (errors.length() > 0) {
	        request.setAttribute("error", errors.toString());
	        request.getRequestDispatcher("registration.jsp").include(request, response);
	    } else {
	        User newUser = new User();
	        newUser.setName(name);
	        newUser.setEmail(email);
	        newUser.setPassword(password);

	        boolean success = userDB.registerUser(newUser);

	        if (success) {
	            response.sendRedirect("login.jsp");
	        } else {
	            request.setAttribute("error", "Registration failed. Please try again.");
	            request.getRequestDispatcher("registration.jsp").include(request, response);
	        }
	    }
	}

}