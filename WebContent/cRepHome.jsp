<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<h1>Welcome <%=session.getAttribute("user")%></h1>
	<p>This is the rep page you slave</p>
	<a href='logout.jsp'>Log out</a>
</body>
</html>