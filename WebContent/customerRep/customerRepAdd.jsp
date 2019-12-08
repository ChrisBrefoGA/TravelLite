<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%
String type = request.getParameter("");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<h1>
		Welcome
		<%=session.getAttribute("user")%></h1>
	<p>These are the current Customers bitch</p>

	<p>Would you like to add a anything right now? (filler statement for
		now)</p>

	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select * from Customer");	
    %>

	<TABLE BORDER="1">
		<TR>
			<TH>Customer Name</TH>
			<TH>Customer ID</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></TD>
		</TR>
		<% } %>
	</TABLE>
	
	<br><br>
	
	<form action="updateCustomerRep.jsp" method ="POST">
       Enter a customer to be made a Customer Rep: <input type="text" name="cust">
       <input type="submit" value="Make Customer Rep"> <br>
    </form>

	<br><br>
	
	<% resultSet = statement.executeQuery("select * from Customer_rep");  %>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Customer Representative Name</TH>
			<TH>Customer Representative ID</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></TD>
		</TR>
		<% } %>
	</TABLE>
	<br>

	<a href='logout.jsp'>Log out</a>
</body>
</html>