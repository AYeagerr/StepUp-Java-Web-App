<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

    <style>
        .navbar {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
            padding: 10px 0; /* Reducing the default Bootstrap padding */
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 99999;
            background-color: #007bff; /* Bootstrap blue */
        }

        .navbar-brand, .nav-link {
            color: #fff !important; /* Ensures the brand and links use white color */
        }

        .btn-danger {
            border: none; /* Remove border */
            margin: 10px 0; /* Auto margin for vertical centering within the navbar */
        }

        .nav-link {
            font-size: 30px; /* Larger text for better readability */
            position: relative; /* Needed for the underline effect */
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 3px;
            display: block;
            margin-top: 5px;
            right: 0;
            background: #fff; /* White underline */
            transition: width .3s ease; /* Smooth transition for the underline */
            -webkit-transition: width .3s ease;
        }

        .nav-link:hover::after {
            width: 100%; /* Full width underline on hover */
            left: 0;
            background: #fff; /* Underline color */
        }
        
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp" style="font-size: 30px">Stepup</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                    <% User u = (User) session.getAttribute("user");
                       if (session.getAttribute("user") != null && u.getId() != 0) { %>
                        <li class="nav-item"><a class="nav-link" href="Cart.jsp">Cart</a></li>
                        <li class="nav-item"><a class="nav-link" href="Orders.jsp">Orders</a></li>
                        <li class="nav-item">
                            <form action="Logout" method="get" style="display: inline;">
                                <button type="submit" class="btn btn-danger">Logout</button>
                            </form>
                        </li>
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>