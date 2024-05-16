<%@page import="java.util.ArrayList"%>
<%@page import="connection.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.User"%>
<%@page import="DB.ProductDB"%>
<%@page import="Model.Product"%>



<html>
<head>
<title>StepUp</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon"
	href="https://cdn-icons-png.freepik.com/512/5499/5499206.png">
<style>
.card {
	width: 250px; /* Consistent card width */
	height: 400px; /* Consistent card height */
	margin: 10px; /* Margin around each card */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Soft shadow for depth */
	border-radius: 8px; /* Rounded corners for a softer look */
	overflow: hidden; /* Hides anything outside the border radius */
	display: flex;
	flex-direction: column;
	justify-content: space-between; /* Distributes space inside the card */
	background: #fff; /* White background */
}

.card-img-top {
	width: 100%; /* Full width of the card */
	height: 200px; /* Fixed height */
	object-fit: contain;
	/* Ensures the image contains the area, keeps aspect ratio */
}

.card-body {
	padding: 10px; /* Padding inside the card body */
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	flex-grow: 1;
	/* Allows the card body to fill the space not used by the image */
}

.card-title {
	font-size: 18px; /* Larger font size for the product name */
	font-weight: bold; /* Bold font for emphasis */
	color: #333; /* Dark color for better readability */
	margin-bottom: 5px; /* Space below the title */
	overflow: hidden; /* Prevents text from overflowing */
	text-overflow: ellipsis; /* Adds an ellipsis if the text is too long */
	white-space: nowrap; /* Keeps the title in a single line */
}

.price {
	font-size: 16px; /* Font size for the price */
	color: #666; /* Slightly lighter color for contrast */
	margin-bottom: 10px; /* Space below the price */
}

.form-inline {
	display: flex; /* Sets the display to flex for side-by-side layout */
	align-items: center; /* Aligns items vertically in the center */
	width: 100%; /* Ensures the form container fills the card width */
}

input[type="number"] {
	flex-grow: 1; /* Allows the input to grow and fill available space */
	padding: 8px; /* Padding for aesthetics */
	margin-right: 5px; /* Small margin between input and button */
	border: 1px solid #ccc; /* Border styling */
	border-radius: 4px; /* Rounded corners */
}

.btn-primary {
	padding: 10px 12px; /* Padding adjustments for button */
	border-radius: 4px; /* Rounded corners for button */
	cursor: pointer; /* Pointer cursor on hover */
	white-space: nowrap; /* Prevents text wrapping in the button */
}

.btn-primary:hover {
	background-color: #0056b3; /* Darker shade on hover for feedback */
}
</style>
</head>

<%
// Delete cached page
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>

<%
ProductDB pdb = new ProductDB(DB.getConnection());
ArrayList<Product> products = pdb.getAllProducts();
%>

<body>
	<%@ include file="nav.jsp"%>

	<jsp:useBean id="user" class="Model.User" scope="session" />
	<%
	if (user.getName() != null) {
	%>
	<Strong><h1
			style="text-align: center; margin-top: 130px; margin-bottom: 30px">
			Welcome,
			<%=user.getName()%>!
		</h1></Strong>
	<%
	} else {
	%>
	<h1 style="text-align: center; margin-top: 130px; margin-bottom: 30px">Welcome,
		Guest</h1>
	<p style="text-align: center; margin-top: 30px; margin-bottom: 30px">
		Please <a href="login.jsp">login</a> or <a href="registration.jsp">register</a>.
	</p>
	<%
	}
	%>
	<hr>

	<div class="container">
		<div
			class="card-header my-3 d-flex justify-content-between align-items-center"
			style="background-color: #007BFF; color: white; text-align: center; border-radius: 6px;">
			<strong>All Products</strong> <select id="sortPrice"
				class="form-control" style="width: auto;">
				<option value="default">Default Order</option>
				<option value="asc">Lowest to Highest</option>
				<option value="desc">Highest to Lowest</option>
			</select> </select>
		</div>
		<div class="row" id="productContainer">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
					if (p.getStock() > 0 && p.isActive()) { // Check if stock is greater than 0 and product is active
			%>
			<div class="col-md-3 my-3 product-card"
				data-price="<%=p.getPrice()%>">
				<div class="card w-100"
					style="width: 18rem; box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1); border-radius: 8px;">
					<img class="card-img-top" src="<%=p.getImage()%>"
						alt="Card image cap"
						style="border-top-left-radius: 8px; border-top-right-radius: 8px;">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: <span style="color: green">$<%=p.getPrice()%></span>
						</h6>
						<h6 class="category"><%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<!--Fetch content-->
							<form action="AddtoCart" method="post">
								<input type="hidden" name="id" value="<%=p.getId()%>"> <input
									type="hidden" name="name" value="<%=p.getName()%>"> <input
									type="hidden" name="price" value="<%=p.getPrice()%>"> <input
									type="hidden" name="category" value="<%=p.getCategory()%>">
								<input type="number" name="quantity" min="1"
									max="<%=p.getStock()%>" value="1"> <input type="submit"
									value="Add to cart" class="btn btn-primary">
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			} else {
			%>
			<p style="text-align: center; width: 100%; margin-top: 20px;">No
				products available.</p>
			<%
			}
			%>
		</div>
	</div>


	<script>
document.addEventListener('DOMContentLoaded', function () {
    var container = document.getElementById('productContainer');
    var originalCards = Array.from(container.getElementsByClassName('product-card')).map(card => card.cloneNode(true)); // Clone and store the original cards

    document.getElementById('sortPrice').addEventListener('change', function() {
        var cards = Array.from(container.getElementsByClassName('product-card'));
        var sortBy = this.value;

        if (sortBy === 'default') {
            cards = originalCards.map(card => card.cloneNode(true)); // Restore original order from cloned cards
        } else {
            // Sort cards by price
            cards.sort(function(a, b) {
                var priceA = parseFloat(a.getAttribute('data-price'));
                var priceB = parseFloat(b.getAttribute('data-price'));
                return sortBy === 'asc' ? priceA - priceB : priceB - priceA;
            });
        }

        // Clear the container and append sorted or original cards
        while (container.firstChild) {
            container.removeChild(container.firstChild);
        }
        cards.forEach(function(card) {
            container.appendChild(card);
        });
    });
});
</script>



</body>
</html>