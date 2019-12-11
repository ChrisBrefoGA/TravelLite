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
	String FN = request.getParameter("fID");
	System.out.println(FN);
	Statement statement = con.createStatement();
	statement.executeUpdate("DELETE FROM Flights where flight_num ='"+ FN +"'");
	out.println("We completed your delete inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepDF.jsp'>Click Here</a> to add another one.");
	}catch(SQLException a){
		out.println("We could not complete your flight delete request. You did not type in a unique flight id.");
		out.println("<a href='cRepDF.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Airport")){
	try{
		String AID = request.getParameter("id");
		Statement statement = con.createStatement();
		statement.executeUpdate("DELETE FROM Airport where airport_id = '"+ AID +"'");
	out.println("We completed your delete inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepDAP.jsp'>Click Here</a> to add another one.");
	}catch(SQLException a){
		out.println("We could not complete you airport delete request. You did not type in a unique airport id.");
		out.println("<a href='cRepDAP.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Aircraft")){
	try{
		String AID = request.getParameter("id");
		Statement statement = con.createStatement();
		statement.executeUpdate("DELETE FROM Aircraft where aircraft_id = '"+ AID +"'");
	out.println("We completed your delete inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page\n");
	out.println("<a href='cRepDA.jsp'>Click Here</a> to add another one.\n");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft delete request. You did not type in a unique aircraft id.\n");
		out.println("<a href='cRepDA.jsp'>Click Here</a> to try again.\n");
	}
}
%>
