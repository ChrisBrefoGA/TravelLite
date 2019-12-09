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
	<p>These are the current flights you filthy plebians</p>

	<p>Flight Table</p>
    
<%
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    ResultSet resultSet;//ResultSet for the query statement. 
    ResultSet resultSet2;
    
    String sorting_parameter = request.getParameter("sort");//receives the sort parameter
    String filter_price = request.getParameter("flight_price");
    String filter_stops = request.getParameter("number_stops");
    String filter_airline = request.getParameter("airline_name");
    
    resultSet = st.executeQuery("select * from Flight where num_stops = " 
    + filter_stops + " and price " + filter_price + " order by " + sorting_parameter);
    
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
	
	<br> 
	
	<% resultSet2 = st.executeQuery("select * from Airlines where airline_id = " + filter_airline); %>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Airline ID</TH>
			<TH>Airline Name</TH>
		</TR>
		<% while(resultSet2.next()){ %>
		<TR>
			<TD><%= resultSet2.getString(1) %></td>
			<TD><%= resultSet2.getString(2) %></TD>
		</TR>
		<% } %>
	</TABLE>

	<br><br>
	
	<form action="logout.jsp">
         <button onclick="window.location.href = 'logout.jsp';">Logout</button>
     </form>
     <br>
	<form action="flightSearch.jsp">
         <button onclick="window.location.href = 'flightSearch.jsp';">Back</button>
     </form>
</body>
</html>