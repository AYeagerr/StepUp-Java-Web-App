package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DB.ProductDB;
import connection.DB;


public class ActivateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDB pdb = new ProductDB(DB.getConnection());

        if (pdb.activateProduct(productId)) {
            response.sendRedirect("inventoryManagement.jsp"); // Redirect back to the inventory page
        } else {
            request.setAttribute("error", "Failed to activate product.");
            request.getRequestDispatcher("inventoryManagement.jsp").include(request, response);
        }
	}

}
