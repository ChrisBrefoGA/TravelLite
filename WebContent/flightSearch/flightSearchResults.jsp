<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	try {
		Object user = session.getAttribute("user");
		user.toString();
	}
	catch(Exception a) {
		out.println("Please sign-in to an account!!<a href='../login.jsp'>login</a>");
		return;
	}
%>
    
<%
	String url2 = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
	String sorting_parameter = request.getParameter("sort");//receives the sort parameter
	String filter_price = request.getParameter("flight_price");
	String filter_stops = request.getParameter("number_stops");
	String filter_airline = request.getParameter("airline_name");
	Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
	Connection con = DriverManager.getConnection(url2,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
	Statement st = con.createStatement();//SQL connection stuff
	ResultSet resultSet; 
     
    resultSet = st.executeQuery("select * from Flight where num_stops = " 
    + filter_stops + " and price " + filter_price + " and airline = " + filter_airline + " order by " + sorting_parameter);
    
    response.sendRedirect("showFlights.jsp");
    
%>