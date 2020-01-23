<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
	Statement st = connection.createStatement();
    String edited_user = (String)session.getAttribute("edited_user");
    session.setAttribute("edited_user", edited_user);
    String tNum = request.getParameter("tNum");
    String rTrip = request.getParameter("roundTrip");
    String bFee = request.getParameter("bFee");
    String iDate = request.getParameter("iDate");
    String fNum = request.getParameter("fNum");
    String tFare = request.getParameter("tFare");
    st.executeUpdate("UPDATE Ticket SET round_trip = '" + rTrip  + "' where userid = '" + edited_user + "' and ticket_num='"+tNum+"'");
    st.executeUpdate("UPDATE Ticket SET booking_fee = '" + bFee  + "' where userid = '" + edited_user + "' and ticket_num='"+tNum+"'");
    st.executeUpdate("UPDATE Ticket SET total_fare = '" + tFare  + "' where userid = '" + edited_user + "' and ticket_num='"+tNum+"'");
    st.executeUpdate("UPDATE Ticket SET flight_num = '" +  fNum + "' where userid = '" + edited_user + "' and ticket_num='"+tNum+"'");
    st.executeUpdate("UPDATE Ticket SET issue_date = '" + iDate  + "' where userid = '" + edited_user + "' and ticket_num='"+tNum+"'");  
	out.println("We completed your reservation edit inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
}
catch(SQLException a) {
	out.println("We could not complete your reservation edit request. It's possible you may have an incorrect flight number.");
	out.println("<a href='cRepHome.jsp'>Click Here</a> to try again.");
}
catch(Exception a){
	out.println("We could not complete your reservation edit request.");
	out.println("<a href='cRepHome.jsp'>Click Here</a> to try again.");
}
%>