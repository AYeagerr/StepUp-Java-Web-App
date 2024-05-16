package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Model.Cart;

public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			// If there is no cart, nothing to do
			request.getRequestDispatcher("Cart.jsp").include(request, response);
			return;
		}

		try {
			// Retrieve the product ID from the request and remove the product from the cart
			int productId = Integer.parseInt(request.getParameter("id"));
			cart.removeProduct(productId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		// Redirect back to the Cart page
		request.getRequestDispatcher("Cart.jsp").include(request, response);
	}
}