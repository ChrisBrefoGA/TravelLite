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
if(type.equals("Flights")){
	try{
	String insrt=("INSERT INTO Flights (flight_num, type, tripType, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time, fare_first, fare_business, fare_economy, airline_id, aircraft_id, num_stops)"+"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");// The Insert string for the Flights
	PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	String FN = request.getParameter("fID");	
	String tYP = request.getParameter("DItype");
	String tType = request.getParameter("tType");
	String dAirport = request.getParameter("dAirport");	
	String aAirport = request.getParameter("aAirport");
	String dDate = request.getParameter("dDate");	
	String aDate = request.getParameter("aDate");	
	String dTime = request.getParameter("dTime");
	String aTime = request.getParameter("aTime");	
	String fFirst = request.getParameter("fFare");
	String bFirst = request.getParameter("bFare");
	String eFirst = request.getParameter("eFare");	
	String alID = request.getParameter("alID");	
	String AID = request.getParameter("aID");
	String nos = request.getParameter("nos");
	String DOW = request.getParameter("DOW");	
	ps.setString(1, FN);
	ps.setString(2, tYP);
	ps.setString(3, tType);
	ps.setString(4, dAirport);
	ps.setString(5, aAirport);
	ps.setString(6, dDate);
	ps.setString(7, aDate);
	ps.setString(8, dTime);
	ps.setString(9, aTime);
	ps.setString(10, fFirst);
	ps.setString(11, bFirst);
	ps.setString(12, eFirst);
	ps.setString(13, alID);
	ps.setString(14, AID);	
	ps.setString(15,nos);
	ps.executeUpdate();
	String insrt2=("INSERT INTO Uses (aircraft_id, flight_number, airline_id)"+"VALUES(?,?,?)");// The Insert string for the Flights
	PreparedStatement ps2 = con.prepareStatement(insrt2);//The string gets converted for SQL use
	ps2.setString(1,AID);
	ps2.setString(2, FN);
	ps2.setString(3, alID);
	ps2.executeUpdate();
	String insrt3=("INSERT INTO flights_on (day_number, flight_number, airline_id)"+"VALUES(?,?,?)");// The Insert string for the Flights
	PreparedStatement ps3 = con.prepareStatement(insrt3);//The string gets converted for SQL use
	ps3.setString(1,DOW);
	ps3.setString(2, FN);
	ps3.setString(3, alID);
	ps3.executeUpdate();
	out.println("We completed your addition inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepAF.jsp'>Click Here</a> to add another one.");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft addition request. You did not type in the correct information Flight ID.");
		out.println("<a href='cRepAF.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Airport")){
	try{
	String insrt=("INSERT INTO Airport (airport_id)"+"VALUES(?)");//The Insert string for the Aircrafts
	PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	String AID = request.getParameter("id");
	ps.setString(1, AID);
	ps.executeUpdate();
	out.println("We completed your addition inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepAAP.jsp'>Click Here</a> to add another one.");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft addition request. You did not type in the correct information.");
		out.println("<a href='cRepAAP.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Aircraft")){
	try{
	String insrt=("INSERT INTO Aircraft (aircraft_id)"+"VALUES(?)");// THE Insert string for the Airport
	PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	String AID = request.getParameter("id");
	String alID = request.getParameter("airlineID");
	ps.setString(1, AID);
	ps.executeUpdate();
	String insrt2=("INSERT INTO Owns (airline_id, aircraft_id)"+"VALUES(?,?)");// THE Insert string for the Airport
	PreparedStatement ps2 = con.prepareStatement(insrt2);//The string gets converted for SQL use
	ps2.setString(1, alID);
	ps2.setString(2, AID);
	ps2.executeUpdate();
	out.println("We completed your addition inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page\n");
	out.println("<a href='cRepAA.jsp'>Click Here</a> to add another one.\n");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft addition request. You did not type in the correct information.\n");
		out.println("<a href='cRepAA.jsp'>Click Here</a> to try again.\n");
	}
}
%>
