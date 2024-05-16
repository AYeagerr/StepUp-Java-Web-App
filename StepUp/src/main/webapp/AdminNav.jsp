<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        .navbar-custom {
            box-shadow: 0 4px 6px rgba(0,0,0,.1);
            background-color: #007bff; /* Bootstrap blue */
            color: #ffffff;
            padding: 10px 0;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1050;
        }
        .navbar-custom .navbar-brand {
            font-size: 30px; /* Slightly smaller than the oversized 50px */
            color: #fff; /* Ensuring the text is white */
        }
        .navbar-custom .nav-link {
            color: #fff;
            font-size: 18px;
            position: relative; /* Needed for the underline effect */
        }
        .navbar-custom .nav-link::after {
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
        .navbar-custom .nav-link:hover::after {
            width: 100%; /* Full width underline on hover */
            left: 0;
            background: #fff; /* Underline color */
        }
        .navbar-custom .btn-outline-light {
            border-color: #f8f9fa;
            color: #f8f9fa;
        }
        .navbar-custom .btn-outline-light:hover {
            background-color: #f8f9fa;
            color: #007bff;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="adminMenu.jsp">StepUp</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#adminNav"
                    aria-controls="adminNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="adminNav">
                <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="userManagement.jsp">Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="inventoryManagement.jsp">Inventory</a></li>
                    <li class="nav-item"><a class="nav-link" href="OrdersAdmin.jsp">Orders</a></li>
                    <li class="nav-item">
                        <form action="Logout" method="get" style="margin: 0;">
                            <button type="submit" class="btn btn-outline-light">Logout</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>