package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DB.ProductDB;
import Model.Product;
import connection.DB;


public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        String category = request.getParameter("category");
	        String price = request.getParameter("price");
	        String img = request.getParameter("img");
	        int stock = Integer.parseInt(request.getParameter("stock"));

	        Product product = new Product();
	        product.setId(id);
	        product.setName(name);
	        product.setCategory(category);
	        product.setPrice(price);
	        product.setImage(img);
	        product.setStock(stock);

	        ProductDB pdb = new ProductDB(DB.getConnection());
	        boolean success = pdb.updateProduct(product);

	        if (success) {
	            response.sendRedirect("inventoryManagement.jsp");
	        } else {
	            request.setAttribute("error", "Failed to update product.");
	            request.getRequestDispatcher("EditProduct.jsp?productId=" + id).include(request, response);
	        }
	}

}
