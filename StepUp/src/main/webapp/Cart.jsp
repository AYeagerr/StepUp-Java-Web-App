<%@page import="java.util.List"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--<jsp:useBean id="cart" class="Model.Cart" scope="session" />-->
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
	<link rel="icon" type="image/x-icon" href="https://cdn-icons-png.freepik.com/512/5499/5499206.png">
<style type="text/css">
.table tbody td {
	align-items: center;
	text-align: center;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}

.header {
	align-items: center;
	text-align: center;
}

span {
	font-size: 30px;
}

.checkout {
	display: flex;
	align-items: center;
	margin-top: 30px;
	justify-content: space-between;
	border: 2px solid #007BFF;
	border-radius: 8px;
	padding: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<%@include file="nav.jsp"%>

	<div class="container" style="margin-top: 130px;">
		<h2 style="margin-top: 30px">Your Shopping Cart</h2>
		<hr>
		<%
		List<Product> products = cart.getProducts();
		if (!products.isEmpty()) {
			for (Product product : products) {
		%>
		<div
			style="display: flex; align-items: center; justify-content: space-between;">
			<span><%=product.getName()%></span> - <span><%=product.getCategory()%></span>
			- <span style="color: green">$<%=product.getPrice()%></span> - <span>Quantity: <%=product.getQyt()%></span>
			<form action="RemoveFromCart" method="post">
				<input type="hidden" name="id" value="<%=product.getId()%>">
				<input type="submit" value="Remove" class="btn btn-danger">
			</form>
		</div>
		<hr>
		<%
		}
		} else {
		%>
		<p>Your cart is empty.</p>
		<%
		}
		%>

		<div class="checkout">
			<h3>
				Total Price: <span style="color: green">$<%=String.format("%.2f", cart.getTotalPrice())%></span></h3>
			<form action="Checkout" method="post" style="margin-left: 20px;">
				<input type="submit" value="Checkout" class="btn btn-primary">
			</form>
		</div>

	</div>
</body>
</html>
