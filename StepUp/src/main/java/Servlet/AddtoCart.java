package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Model.Cart;
import Model.Product;

public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart"); // cart is a list
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Get product details from the request
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String category = request.getParameter("category");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		// Create a new product object and set its attributes
		Product product = new Product();
		product.setId(id);
		product.setName(name);
		product.setPrice(price);
		product.setCategory(category);
		product.setQyt(quantity);

		// Add the product to the cart or update its quantity if it already exists
		cart.addProduct(product);

		// Redirect the user to the Cart page using a GET request
	    response.sendRedirect("Cart.jsp"); // Use sendRedirect instead of forward in order to not resubmit the request
	}
}