package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Cart;
import Model.Product;
import Model.User;
import connection.DB;

public class Checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	//allows the server to maintain a session with a specific client across multiple requests
    	//if the request does not have a session, this method will create a new session.
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User userobj = (User) session.getAttribute("user");

        if (userobj == null || userobj.getId() == 0) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (cart == null || cart.getProducts().isEmpty()) {
            request.getRequestDispatcher("Cart.jsp").include(request, response);
            return;
        }

        Connection conn = null;
        try {
            conn = DB.getConnection();

            // Insert into orders table
            String sqlOrder = "INSERT INTO orders (user_id, total_price) VALUES (?, ?)";
            int orderId;
            try (PreparedStatement psOrder = conn.prepareStatement(sqlOrder)) {
                psOrder.setInt(1, userobj.getId());
                psOrder.setDouble(2, cart.getTotalPrice());
                psOrder.executeUpdate();

                // Retrieve the generated order ID
                String sqlLastInsertId = "SELECT LAST_INSERT_ID()";
                try (PreparedStatement psLastInsertId = conn.prepareStatement(sqlLastInsertId);
                     ResultSet rs = psLastInsertId.executeQuery()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    } else {
                        throw new SQLException("Failed to retrieve order ID.");
                    }
                }
            }

            // Insert into order_details and update stock
            String sqlDetail = "INSERT INTO order_details (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            String sqlUpdateStock = "UPDATE products SET stock = stock - ? WHERE id = ? AND stock >= ?";

            for (Product product : cart.getProducts()) {
                // Order detail insertion
                try (PreparedStatement psDetail = conn.prepareStatement(sqlDetail)) {
                    psDetail.setInt(1, orderId);
                    psDetail.setInt(2, product.getId());
                    psDetail.setInt(3, product.getQyt());
                    psDetail.setDouble(4, Double.parseDouble(product.getPrice()));
                    psDetail.executeUpdate();
                }

                // Stock update
                try (PreparedStatement psUpdateStock = conn.prepareStatement(sqlUpdateStock)) {
                    psUpdateStock.setInt(1, product.getQyt());
                    psUpdateStock.setInt(2, product.getId());
                    psUpdateStock.setInt(3, product.getQyt());
                    psUpdateStock.executeUpdate();
                }
            }


        } catch (SQLException ex) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback on error
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ex.printStackTrace();
            request.getRequestDispatcher("Cart.jsp").include(request, response);
            return;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        session.removeAttribute("cart"); // Clear the cart
        request.getRequestDispatcher("Orders.jsp").forward(request, response); // Redirect to orders page
    }
}
