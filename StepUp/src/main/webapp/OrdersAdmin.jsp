<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="connection.DB"%>
<%@ page import="Model.User"%>
<!DOCTYPE html>
<html>
<head>
<title>All Orders</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="https://cdn-icons-png.freepik.com/512/5499/5499206.png">
<style>
body {
    background: #f8f9fa;
    padding: 30px 0;
    border-radius: 8px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
    margin-top: 130px;
}
h1 {
    color: #007bff;
    border-bottom: 2px solid #dee2e6;
    padding-bottom: 10px;
}
.order-card {
    background: #ffffff;
    margin-top: 20px;
    padding: 15px;
    border-radius: 5px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    border: 2px solid #007BFF;
}
.order-header {
    font-size: 20px;
    font-weight: bold;
    color: #343a40;
}
.order-info {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}
ul {
    padding-left: 20px;
}
li {
    margin-bottom: 5px;
}
hr {
    margin-top: 30px;
}
</style>
</head>

<%
// Delete cached page
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>

<body>
    <%@ include file="AdminNav.jsp"%>
    <div class="container">
        <h1 style="margin-top: 100px">All Orders</h1>
        <% 
        Connection conn = DB.getConnection();
        try {
            String sql = "SELECT o.order_id, o.order_date, o.total_price, u.name AS user_name FROM orders o JOIN users u ON o.user_id = u.id ORDER BY u.name, o.order_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                Date orderDate = rs.getTimestamp("order_date");
                double totalPrice = rs.getDouble("total_price");
                String userName = rs.getString("user_name");
        %>
        <div class="order-card">
            <h3 class="order-header">Order ID: <%= orderId %> - User: <%= userName %></h3>
            <div class="order-info">Order Date: <%= orderDate %></div>
            <div class="order-info">Total Price: <span style="color: green">$<%= String.format("%.2f", totalPrice) %></span></div>
            <ul>
                <% 
                String detailSql = "SELECT od.quantity, od.price, p.name AS product_name FROM order_details od JOIN products p ON od.product_id = p.id WHERE od.order_id = ?";
                PreparedStatement psDetail = conn.prepareStatement(detailSql);
                psDetail.setInt(1, orderId);
                ResultSet rsDetail = psDetail.executeQuery();
                while (rsDetail.next()) {
                    String productName = rsDetail.getString("product_name");
                    int quantity = rsDetail.getInt("quantity");
                    double price = rsDetail.getDouble("price");
                %>
                <li><%= productName %> - Quantity: <%= quantity %>, Price: <span style="color: green">$<%= String.format("%.2f", price) %></span></li>
                <% 
                }
                rsDetail.close();
                psDetail.close();
                %>
            </ul>
        </div>
        <hr>
        <% 
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            out.println("Database connection error: " + ex.getMessage());
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
        %>
    </div>
</body>
</html>