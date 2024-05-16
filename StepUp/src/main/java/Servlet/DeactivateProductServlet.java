package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DB.ProductDB;
import connection.DB;

public class DeactivateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDB pdb = new ProductDB(DB.getConnection());
        
        if (pdb.deactivateProduct(productId)) {
            response.sendRedirect("inventoryManagement.jsp"); // Redirect back to the inventory page or refresh
        } else {
            request.setAttribute("error", "Failed to delete product.");
            request.getRequestDispatcher("inventoryManagement.jsp").include(request, response);
        }
	}
}