<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<h1>
		Edit a User
	</h1>
	<p>Fill out the desired fields to edit information of the user (fields left blank will remain unchanged).</p>

    <%-- check if user given exists and is not admin first --%>
  <%
    String edited_user = request.getParameter("user");
    session.setAttribute("edited_user", edited_user);
  %>

	<form action="updateInformation.jsp" method ="POST">
       Change username: <input type="text" name="user"> <br>
       Change password: <input type="text" name="pass"> <br>
       Change first name: <input type="text" name="first"> <br>
       Change last name: <input type="text" name="last"> <br>
       Change user's ID number: <input type="text" name="acctnum"> <br>
       Change Customer Revenue (customer only): <input type="text" name="rev"> <br> <br>
       
       <input type="submit" value="UPDATE INFORMATION"> <br>
    </form>

    <br>

    <form action="adminHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>