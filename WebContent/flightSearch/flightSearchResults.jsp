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
session.setAttribute("Filter","filter");
%>
    
<%
	//change all variables to sessions
	String url2 = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";

	String sorting_parameter = request.getParameter("sort");//receives the sort parameter
	session.setAttribute("s_p",sorting_parameter);
	sorting_parameter = (String) session.getAttribute("s_p");
	
	String filter_price = request.getParameter("flight_price");
	session.setAttribute("f_p", filter_price);
	filter_price = (String) session.getAttribute("f_p");
	
	String filter_stops = request.getParameter("number_stops");
	session.setAttribute("n_s", filter_stops);
	filter_stops = (String) session.getAttribute("n_s");
	
	String filter_airline = request.getParameter("airline_name");
	session.setAttribute("a_n", filter_airline);
	filter_airline = (String) session.getAttribute("a_n");
	
	Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
	Connection con = DriverManager.getConnection(url2,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
     
	//bring this query into showFlights
    
    response.sendRedirect("showFlights.jsp");
    
%>