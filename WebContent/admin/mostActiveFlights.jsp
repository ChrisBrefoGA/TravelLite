<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%
try{
	Object user = session.getAttribute("user");
	user.toString();
}catch(Exception a){
	out.println("Please sign-in to an account!!<a href='../login.jsp'>login</a>");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airport Flights</title>
</head>
<body>
	<h1>
        <%-- most tickets sold --%>
		Here is a list of the current most active flights: 
    </h1>

    <%-- query --%>

    <%-- table --%>

    <br>

    <form action="adminHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>