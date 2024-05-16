<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="0;url=login.jsp" />
    <title>Logout</title>
</head>
<body>
<%
    // Invalidate the session
    HttpSession s = request.getSession(false);
    if (s != null) {
        s.invalidate();
    }

    // Clear any cookies that are used to store session info
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("userSession".equals(cookie.getName())) {
                cookie.setValue("");
                cookie.setMaxAge(0); // Expire the cookie
                cookie.setPath("/"); // Global path
                response.addCookie(cookie);
            }
        }
    }

    // Redirect is handled by the meta refresh in the head
%>
</body>
</html>