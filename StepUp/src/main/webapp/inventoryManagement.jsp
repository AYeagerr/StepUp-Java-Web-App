<%@page import="java.util.ArrayList"%>
<%@page import="DB.ProductDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.Product"%>
<%@page import="connection.DB"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management</title>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        .inactive {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <%@ include file="AdminNav.jsp"%>
    <div class="container mt-5">
        <h2 style="margin-top: 130px; text-align: center;">Inventory Management</h2>
        <div class="row">
            <div class="col-md-12">
                <h3>Add New Product</h3>
                <% if (request.getAttribute("error") != null) { %>
                    <div style="color: red; text-align: center; margin-top: 10px">
                        <%=request.getAttribute("error")%>
                    </div>
                <% } %>
                <form action="AddProductServlet" method="post">
                    <input type="text" name="name" placeholder="Product Name" required class="form-control mb-2">
                    <input type="text" name="category" placeholder="Category" required class="form-control mb-2">
                    <input type="number" step="0.01" name="price" placeholder="Price" required class="form-control mb-2">
                    <input type="url" name="img" placeholder="Image URL" required class="form-control mb-2">
                    <input type="number" name="stock" placeholder="Stock" required class="form-control mb-2">
                    <button type="submit" class="btn btn-primary">Add Product</button>
                </form>
            </div>
            <div class="col-md-12 mt-4">
                <h3>Product List</h3>
                <table class="table table-bordered" style="border: 2px solid #007BFF; text-align: center; font-weight: bold;">
                    <thead>
                        <tr style="border: 2px solid #007BFF;">
                            <th style="border: 2px solid #007BFF;">ID</th>
                            <th style="border: 2px solid #007BFF;">Name</th>
                            <th style="border: 2px solid #007BFF;">Category</th>
                            <th style="border: 2px solid #007BFF;">Price</th>
                            <th style="border: 2px solid #007BFF;">Image</th>
                            <th style="border: 2px solid #007BFF;">Stock</th>
                            <th style="border: 2px solid #c82333;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            ProductDB pdb = new ProductDB(DB.getConnection());
                            ArrayList<Product> products = pdb.getAllProducts();
                            for (Product product : products) {
                                String rowClass = product.isActive() ? "" : "inactive";
                        %>
                        <tr class="<%= rowClass %>">
                            <td style="border: 2px solid #007BFF;"><%= product.getId() %></td>
                            <td><%= product.getName() %></td>
                            <td><%= product.getCategory() %></td>
                            <td>$<%= product.getPrice() %></td>
                            <td><img src="<%= product.getImage() %>" style="height: 50px;"></td>
                            <td><%= product.getStock() %></td>
                            <td style="border: 2px solid #c82333;">
                                <a href="EditProduct.jsp?productId=<%= product.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                                <% if (!product.isActive()) { %>
                                    <form action="ActivateProductServlet" method="post" style="display: inline;">
                                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                                        <button type="submit" class="btn btn-success btn-sm">Activate</button>
                                    </form>
                                <% } else { %>
                                    <form action="DeactivateProductServlet" method="post" style="display: inline;">
                                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                                        <button type="submit" class="btn btn-danger btn-sm">Deactivate</button>
                                    </form>
                                <% } %>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>