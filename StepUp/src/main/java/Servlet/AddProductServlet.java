package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import DB.ProductDB;
import Model.Product;
import connection.DB;

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String img = request.getParameter("img");
        String stockString = request.getParameter("stock");
        int stock = 0;
        if (stockString != null && !stockString.isEmpty()) {
            try {
                stock = Integer.parseInt(stockString);
            } catch (NumberFormatException e) {
                // Handle the case where stock is not a valid integer
                stock = 0; // default value or handle the error appropriately
            }
        }
        Product product = new Product();
        product.setName(name);
        product.setCategory(category);
        product.setPrice(price);
        product.setImage(img);
        product.setStock(stock);

        ProductDB productDB = new ProductDB(DB.getConnection());
        boolean success = productDB.addProduct(product);

        if (success) {
            response.sendRedirect("inventoryManagement.jsp"); // Redirect to the admin page or refresh
        } else {
            request.setAttribute("error", "Failed to add product.");
            request.getRequestDispatcher("inventoryManagement.jsp").include(request, response);
        }
	}

}
