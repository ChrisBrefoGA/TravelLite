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
<title>Home</title>
</head>
<body>
	<h1>
		Welcome
		<%=session.getAttribute("user")%></h1>
	<p>These are the current flights you filthy plebians</p>

	<p>Flight Table</p>

	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select * from Flight f order by f.price");	
    %>

	<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Departure Date</TH>
			<TH>Arrival Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Time</TH>
			<TH>Price</TH>
			<TH>Available Seats</TH>
			<TH>Number of Stops</TH>
			<TH>Departure Airport</TH>
			<TH>Arrival Airport</TH>
			
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></TD>
			<TD><%= resultSet.getString(3) %></td>
			<TD><%= resultSet.getString(4) %></TD>
			<TD><%= resultSet.getString(5) %></td>
			<TD><%= resultSet.getString(6) %></TD>
			<TD><%= resultSet.getString(13) %></TD>
			<TD><%= resultSet.getString(10) %></td>
			<TD><%= resultSet.getString(12) %></TD>
			<TD><%= resultSet.getString(15) %></TD>
			<TD><%= resultSet.getString(16) %></td>
		</TR>
		<% } %>
	</TABLE>
	
	<br><br>

	<a href='logout.jsp'>Log out</a>
</body>
</html>