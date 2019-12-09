<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import ="java.sql.*" %>
  
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
String type = (String) session.getAttribute("type");
%>

<%
Connection con = null;
try{
String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
Statement st = con.createStatement();//SQL connection stuff
}catch(SQLException a) {
    out.println("Couldn't setup a connection!!");
    response.sendRedirect("cRepHome.jsp");
}
catch(Exception a){
	out.println("Couldn't setup a connection!!");
    response.sendRedirect("cRepHome.jsp");	
}
if(type.equals("Flight")){
	try{
	String insrt=("INSERT INTO Flight (flight_number, type, depart_date, arrival_date, depart_time, arrive_time, fare_first, fare_economy, fare_business, available_seats, is_full, num_stops, price, booking_fee, departure_airport, arrival_airport, aircraft_id)"+"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");// The Insert string for the Flights
	PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	String FN = request.getParameter("fID");	
	String tYP = request.getParameter("type");
	String dDate = request.getParameter("dDate");		
	String aDate = request.getParameter("aDate");			
	String dTime = request.getParameter("dTime");			
	String aTime = request.getParameter("aTime");			
	String fFirst = request.getParameter("fFare");
	String eFirst = request.getParameter("eFare");
	String bFirst = request.getParameter("bFare");	
	String nos = request.getParameter("nos");
	String dAirport = request.getParameter("dAirport");	
	String price = request.getParameter("price");	
	String aAirport = request.getParameter("aAirport");	
	String AID = request.getParameter("aID");	
	Statement statement = con.createStatement();
	ResultSet resultSet3 = statement.executeQuery("select * from Aircraft where aircraft_id ='"+AID+"'");	
	resultSet3.next();
	String AS = resultSet3.getString(2);
	ps.setString(1, FN);
	ps.setString(2, tYP);
	ps.setString(3, dDate);
	ps.setString(4, aDate);
	ps.setString(5, dTime);
	ps.setString(6, aTime);
	ps.setString(7, fFirst);
	ps.setString(8, eFirst);
	ps.setString(9, bFirst);
	ps.setString(10,AS);
	ps.setBoolean(11, false);
	ps.setString(12, nos);
	ps.setString(13, price);
	ps.setString(14, "25");
	ps.setString(15, dAirport);
	ps.setString(16, aAirport);
	ps.setString(17, AID);	
	ps.executeUpdate();
	out.println("We completed your addition inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepAF.jsp'>Click Here</a> to add another one.");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft addition request. You did not type in a unique Flight ID.");
		out.println("<a href='cRepAF.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Airport")){
	try{
	String insrt=("INSERT INTO Airport (airport_id, abbreviation, name)"+"VALUES(?,?,?)");//The Insert string for the Aircrafts
	PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	String AID = request.getParameter("id");		
	String abbr = request.getParameter("Abbr");
	String name = request.getParameter("Name");
	ps.setString(1, AID);
	ps.setString(2, abbr);
	ps.setString(3, name);
	ps.executeUpdate();
	out.println("We completed your addition inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepAAP.jsp'>Click Here</a> to add another one.");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft addition request. You did not type in a unique Airport ID.");
		out.println("<a href='cRepAAP.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Aircraft")){
	try{
	String insrt=("INSERT INTO Aircraft (aircraft_id, Max_seats)"+"VALUES(?,?)");// THE Insert string for the Airport
	PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	String AID = request.getParameter("id");
	String abbr = request.getParameter("seats");
	ps.setString(1, AID);
	ps.setString(2, abbr);
	ps.executeUpdate();
	out.println("We completed your addition inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page\n");
	out.println("<a href='cRepAA.jsp'>Click Here</a> to add another one.\n");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft addition request. You did not type in a unique Aircraft ID.\n");
		out.println("<a href='cRepAA.jsp'>Click Here</a> to try again.\n");
	}
}
%>
