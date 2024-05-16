<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
	
	<link rel="icon" type="image/x-icon" href="https://cdn-icons-png.freepik.com/512/5499/5499206.png">
</head>
<body>
	<%@ include file="nav.jsp"%>
	<h2 style="text-align: center; margin-top: 250px;">Login to Your
		Account</h2>
	<%
	if (request.getAttribute("error") != null) {
	%>
	<div style="color: red; text-align: center; margin-top: 10px">
		<%=request.getAttribute("error")%>
	</div>
	<%
	}
	%>
	<div class="container">
    <!-- width 50, margin left and right auto, margin top and bottom 5 -->
    <div class="card w-50 mx-auto my-5" style="box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05); border: 2px solid #007BFF;">
        <div class="card-header text-center">User Login</div>
        <!-- Bootstrap default card design -->
        <div class="card-body">
            <form action="LoginServlet" method="post">
                <!-- Bootstrap default form design -->
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="********" required>
                    <div class="form-check mt-2">
                        <input class="form-check-input" type="checkbox" id="showPassword">
                        <label class="form-check-label" for="showPassword">
                            Show Password
                        </label>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary" value="Login" style="margin-top: 20px; margin-bottom: 20px;">Login</button>
                </div>
                <div class="text-center">
                    <p>
                        Don't have an account? <a href="registration.jsp">Register here</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
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