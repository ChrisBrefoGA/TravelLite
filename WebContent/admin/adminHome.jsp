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
<title>Admin Home</title>
</head>
<body>
	<h1>
		Welcome
		<%=session.getAttribute("user")%></h1>

	<p>Would you like to edit any user data?</p>

	<form action="makeCustomerRep.jsp" method ="POST">
       MAKE REP | enter a customer to be made a Customer Rep: <input type="text" name="cust">
       <input type="submit" value="Make Customer Rep"> <br>
    </form>

	<%-- whitelist the admin so they can't be deleted--%>
	<form action="adminDelete.jsp" method ="POST">
       DELETE | enter a customer or customer rep to be deleted: <input type="text" name="user">
       <input type="submit" value="Delete User"> <br>
    </form>

	<form action="adminEdit.jsp" method ="POST">
       EDIT | enter a customer or customer rep to be edited(give current username): <input type="text" name="user">
       <input type="submit" value="Edit User"> <br>
    </form>

	<br>
	<p>Would you like site statistics?</p>

	<form action="obtainSalesReport.jsp" method ="POST">
       SALES REPORT | Enter a month to obtain a sales report for that month: <input type="text" name="month">
       <input type="submit" value="Obtain Sales Report"> <br>
    </form>
	
	<%-- figure out how to check for input type of two things --%>
	<form action="listReservations.jsp" method ="POST">
       LIST RESERVATIONS | Enter a flight number or customer name(username) for a list of reservations: 
	   	<select name = "inputType">
		   	<option value="flight_num">Flight Number</option>
			<option value="userid">Customer Username</option>
		</select>
	   <input type="text" name="input">
       <input type="submit" value="Obtain Flight Reservations"> <br>
    </form>

	<form action="revenueSummary.jsp" method ="POST">
       REVENUE SUMMARY | Enter a flight number, airline id, or customer name for revenue summary: 
	   <select name = "inputType">
			<option value="flight_num">Flight Number</option>
			<option value="airline_id">Airline ID</option>
			<option value="userid">Customer Username</option>
		</select>
	   <input type="text" name="input">
       <input type="submit" value="Obtain Revenue Summary"> <br>
    </form>

	<form action="mostActiveFlights.jsp" method ="POST">
       MOST ACTIVE FLIGHTS | Click here to obtain a list of the current most active flights:
       <input type="submit" value="CLICK ME"> <br>
    </form>

	<form action="listAirportFlights.jsp" method ="POST">
       LIST AIRPORT FLIGHTS | Enter an airport to obtain a list of its currently active flights: <input type="text" name="airport_id">
       <input type="submit" value="Obtain Flight List"> <br>
    </form>

	<br><br>

	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select u.*, c.revenue from Customer c, users u where c.userid = u.userid ORDER BY userid");	
    %>

	<h3>Current Customers:</h3>
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

	<% 
		resultSet = statement.executeQuery("select u.*, c.revenue from Customer c, users u where c.userid = u.userid ORDER BY revenue DESC LIMIT 1");	
    %>

	<h3>Most Valued Customer (Highest Total Revenue):</h3>
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
	
	<h3>Current Customer Reps:</h3>
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