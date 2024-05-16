package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DB.UserDB;
import connection.DB;

public class ActivateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));

		UserDB userDB = new UserDB(DB.getConnection());
		boolean success = userDB.activateUser(userId);

		if (success) {
			request.getRequestDispatcher("userManagement.jsp").include(request, response);
		} else {
			request.setAttribute("error", "Failed to activate user.");
			request.getRequestDispatcher("userManagement.jsp").include(request, response);
		}
	}

}
