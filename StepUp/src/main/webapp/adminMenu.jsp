<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Menu</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="https://cdn-icons-png.freepik.com/512/5499/5499206.png">
<style>
    .admin-menu-container {
        text-align: center;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }
    .admin-menu-option {
        margin: 20px;
        padding: 40px;
        width: 250px;
        height: 200px;
        border: 2px solid #007BFF;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s, box-shadow 0.3s;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
    .admin-menu-option:hover {
        background-color: #007BFF;
        color: white;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }
    .admin-menu-option a {
        text-decoration: none;
        color: inherit;
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
    <h2 style="text-align: center; margin-top: 130px; margin-buttom: 0">Admin Menu</h2>
    <div class="container admin-menu-container">
        <div class="admin-menu-option">
            <a href="userManagement.jsp">
                <h3>Users Management</h3>
                <p>Manage user accounts.</p>
            </a>
        </div>
        <div class="admin-menu-option">
            <a href="inventoryManagement.jsp">
                <h3>Inventory Management</h3>
                <p>Manage products and inventory.</p>
            </a>
        </div>
        <div class="admin-menu-option">
            <a href="OrdersAdmin.jsp">
                <h3>Order Details</h3>
                <p>View order details.</p>
            </a>
        </div>
    </div>
</body>
</html>
