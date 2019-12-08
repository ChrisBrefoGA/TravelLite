<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

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
	<p>These are the current Customers.</p>

	<p>Would you like to edit anything right now? (filler statement for
		now)</p>

	<form action="makeCustomerRep.jsp" method ="POST">
       MAKE REP: enter a customer to be made a Customer Rep: <input type="text" name="cust">
       <input type="submit" value="Make Customer Rep"> <br>
    </form>
	<br><br>

	<form action="adminDelete.jsp" method ="POST">
       DELETE: enter a customer or customer rep to be deleted: <input type="text" name="user">
       <input type="submit" value="Delete User"> <br>
    </form>
	<br><br>

	<form action="adminDelete.jsp" method ="POST">
       EDIT CUSTOMER: enter a customer or customer to be edited: <input type="text" name="user">
       <input type="submit" value="Edit User"> <br>
    </form>
	<br><br>

	<form action="adminDelete.jsp" method ="POST">
       EDIT CUSTOMER REP: enter a customer rep to be edited: <input type="text" name="user">
       <input type="submit" value="Edit User"> <br>
    </form>
	<br><br>

	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select u.*, c.revenue from Customer c, users u where c.userid = u.userid");	
    %>

	<TABLE BORDER="1">
		<TR>
			<TH>Customer Username</TH>
			<TH>Customer Password</TH>
			<TH>First Name</TH>
			<TH>Last Name</TH>
			<TH>Customer ID</TH>
			<TH>Customer Revenue</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></TD>
			<TD><%= resultSet.getString(3) %></TD>
			<TD><%= resultSet.getString(4) %></TD>
			<TD><%= resultSet.getString(5) %></TD>
			<TD><%= resultSet.getString(6) %></TD>
		</TR>
		<% } %>
	</TABLE>
	
	<br><br>
	
	<% resultSet = statement.executeQuery("select users.* from Customer_rep, users where Customer_rep.userid = users.userid");  %>
	
	<TABLE BORDER="1">
		<TR>
			<TH>CR Username</TH>
			<TH>CR Password</TH>
			<TH>CR First Name</TH>
			<TH>CR Last Name</TH>
			<TH>CR ID</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></TD>
			<TD><%= resultSet.getString(3) %></TD>
			<TD><%= resultSet.getString(4) %></TD>
			<TD><%= resultSet.getString(5) %></TD>
		</TR>
		<% } %>
	</TABLE>
	<br>

	<a href='../logout.jsp'>Log out</a>
</body>
</html>