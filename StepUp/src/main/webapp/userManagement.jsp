<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="DB.UserDB"%>
<%@ page import="Model.User"%>
<%@ page import="connection.DB"%>
<!DOCTYPE html>
<html>
<head>
<title>User Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
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

.user-card {
	background: #ffffff;
	margin-top: 20px;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	border: 2px solid #007BFF;
}

.user-header {
	font-size: 20px;
	font-weight: bold;
	color: #343a40;
}

.user-info {
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
		<h1 style="margin-top: 100px">User Management</h1>
		<form action="AddUserServlet" method="post" class="form-inline mb-3">
    <input type="text" name="name" placeholder="Name" required class="form-control mb-2 mr-2">
    <input type="email" name="email" placeholder="Email" required class="form-control mb-2 mr-2">
    <input type="password" name="password" id="password" placeholder="Password" required class="form-control mb-2 mr-2">
    <div class="form-check mb-2 mr-2">
        <input class="form-check-input" type="checkbox" id="showPassword">
        <label class="form-check-label" for="showPassword">
            Show Password
        </label>
    </div>
    <button type="submit" class="btn btn-primary mb-2">Add User</button>
</form>
		<%
		if (request.getAttribute("error") != null) {
		%>
		<div style="color: red; text-align: center; margin-top: 10px">
			<%=request.getAttribute("error")%>
		</div>
		<%
		}
		%>
		<%
        Connection conn = DB.getConnection();
        try {
            UserDB userDB = new UserDB(conn);
            List<User> users = userDB.getAllUsers();
            for (User user : users) {
                String cardClass = user.isActive() ? "user-card" : "user-card inactive";
        %>
        <div class="<%= cardClass %>">
            <h3 class="user-header">User ID: <%= user.getId() %> - Name: <%= user.getName() %></h3>
            <div class="user-info">Email: <%= user.getEmail() %></div>
            <form action="DeactivateUserServlet" method="post" style="display: inline;">
                <input type="hidden" name="userId" value="<%= user.getId() %>">
                <button type="submit" class="btn btn-warning" <% if (!user.isActive()) { %>disabled<% } %>>Deactivate</button>
            </form>
            <form action="ActivateUserServlet" method="post" style="display: inline;">
                <input type="hidden" name="userId" value="<%= user.getId() %>">
                <button type="submit" class="btn btn-success" <% if (user.isActive()) { %>disabled<% } %>>Activate</button>
            </form>
        </div>
        <hr>
        <%
            }
        } catch (Exception ex) {
            out.println("Database connection error: " + ex.getMessage());
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception ignore) {}
        }
        %>
    </div>
    
    <script>
    document.getElementById('showPassword').addEventListener('change', function() {
        var passwordField = document.getElementById('password');
        if (this.checked) {
            passwordField.type = 'text';
        } else {
            passwordField.type = 'password';
        }
    });
</script>
</body>
</html>