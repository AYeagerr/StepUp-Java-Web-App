<%@page import="Model.Product"%>
<%@page import="DB.ProductDB"%>
<%@page import="connection.DB"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
<%@ include file="AdminNav.jsp"%>
<div class="container mt-5" >
    <% 
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDB pdb = new ProductDB(DB.getConnection());
        Product product = pdb.getProductById(productId);
        if (product != null) {
    %>
    <h2 style="margin-top: 130px">Edit Product</h2>
    <form action="EditProductServlet" method="post">
        <input type="hidden" name="id" value="<%=product.getId()%>" class="form-control">
        <div class="form-group">
            <label>Product Name</label>
            <input type="text" name="name" value="<%=product.getName()%>" required class="form-control">
        </div>
        <div class="form-group">
            <label>Category</label>
            <input type="text" name="category" value="<%=product.getCategory()%>" required class="form-control">
        </div>
        <div class="form-group">
            <label>Price</label>
            <input type="number" step="0.01" name="price" value="<%=product.getPrice()%>" required class="form-control">
        </div>
        <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="img" value="<%=product.getImage()%>" required class="form-control">
        </div>
        <div class="form-group">
            <label>Stock</label>
            <input type="number" name="stock" value="<%=product.getStock()%>" required class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Update Product</button>
    </form>
    <% } else { %>
    <p>Product not found.</p>
    <% } %>
</div>

</body>
</html>