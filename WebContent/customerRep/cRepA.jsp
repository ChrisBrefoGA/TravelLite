<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

 <%
try{
	Object user = session.getAttribute("user");
	user.toString();
}catch(Exception a){
	out.println("Please sign-in to an account!!<a href='../login.jsp'>login</a>");
	return;
}
%>

<%
String type = request.getParameter("Thing");
session.setAttribute("type",type);
%>


<% 
if(type.equals("Flights")){//For Flights
  response.sendRedirect("cRepAF.jsp");
}
else if(type.equals("Aircraft")){//For Aircrafts
        	response.sendRedirect("cRepAA.jsp");
        }
else if(type.equals("Airport")){//For Airports
        	response.sendRedirect("cRepAAP.jsp");
        }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> </title>
</head>
<body>

</body>
</html>