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
		Statement statement = con.createStatement();
		ResultSet resultSet3 = statement.executeQuery("select * from Flights where flight_num ='"+FN+"'");	
		resultSet3.next();	
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

	if(tYP.trim().isEmpty()){
		tYP = resultSet3.getString(2);
	}
	if(tType.trim().isEmpty()){
		tType = resultSet3.getString(3);
	}
	if(dAirport.trim().isEmpty()){
		dAirport = resultSet3.getString(4);
	}
	if(aAirport.trim().isEmpty()){
		aAirport = resultSet3.getString(5);
	}
	if(dDate.trim().isEmpty()){
		dDate = resultSet3.getString(6);
	}
	if(aDate.trim().isEmpty()){
		aDate = resultSet3.getString(7);
	}
	if(dTime.trim().isEmpty()){
		dTime = resultSet3.getString(8);
	}
	if(aTime.trim().isEmpty()){
		aTime = resultSet3.getString(9);
	}
	if(fFirst.trim().isEmpty()){
		fFirst = resultSet3.getString(10);
	}
	if(bFirst.trim().isEmpty()){
		bFirst = resultSet3.getString(11);
	}
	if(eFirst.trim().isEmpty()){
		eFirst = resultSet3.getString(12);
	}
	if(alID.trim().isEmpty()){
		alID = resultSet3.getString(13);
	}
	if(AID.trim().isEmpty()){
		AID = resultSet3.getString(14);
	}
	if(nos.trim().isEmpty()){
		nos = resultSet3.getString(15);
	}
	statement.executeUpdate("UPDATE Flights SET  flight_num ='"+ FN +"'   where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  type = '"+ tYP +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  tripType = '"+ tYP +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  Departure ='"+ dAirport +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  Destination = '"+ aAirport +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  depart_day ='"+ dDate +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  arrival_day = '"+ aDate +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  depart_time ='"+ dTime +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  arrival_time = '"+ aTime +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  fare_first ='"+ fFirst +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  fare_business ='"+ bFirst +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  fare_economy = '"+ eFirst +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET airline_id ='"+ alID +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET aircraft_id ='"+ AID +"'  where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flights SET  num_stops = '"+ nos +"' where flight_num = '"+ FN +"'");
	statement.executeUpdate("UPDATE Uses SET airline_id = '"+ alID +"'where flight_number= '"+ FN +"'");
	statement.executeUpdate("UPDATE Uses SET aircraft_id = '"+ AID +"' where flight_number= '"+ FN +"'");
	out.println("We completed your edit inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepEF.jsp'>Click Here</a> to edit another one.");
	}catch(SQLException a){
		out.println("We could not complete you Flight edit request. You did not type in a correct or unique Flight ID.");
		out.println("<a href='cRepEF.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Airport")){
	try{
	String AID = request.getParameter("id");
	Statement statement = con.createStatement();
	ResultSet resultSet3 = statement.executeQuery("select * from Airport where airport_id ='"+AID+"'");	
	resultSet3.next();
	String Nid = request.getParameter("Nid");
	if(Nid.trim().isEmpty()){
		Nid = resultSet3.getString(1);
	}
	statement.executeUpdate("UPDATE Airport SET airport_id ='"+ Nid +"'  where airport_id = '"+ AID +"'");
	out.println("We completed your edit inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page");
	out.println("<a href='cRepEAP.jsp'>Click Here</a> to edit another one.");
	}catch(SQLException a){
		out.println("We could not complete you Airport edit request. You did not type in a correct or unique Aircraft ID.");
		out.println("<a href='cRepEAP.jsp'>Click Here</a> to try again.");
	}
}
else if(type.equals("Aircraft")){
	try{
	String AID = request.getParameter("id");
	Statement statement = con.createStatement();
	ResultSet resultSet3 = statement.executeQuery("select * from Aircraft where aircraft_id ='"+ AID +"'");	
	resultSet3.next();
	String Nid = request.getParameter("Nid");
	if(Nid.trim().isEmpty()){
		Nid = resultSet3.getString(1);
	}
	statement.executeUpdate("UPDATE Aircraft SET aircraft_id ='"+ Nid +"'  where aircraft_id = '"+ AID +"'");
	out.println("We completed your edit inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page\n");
	out.println("<a href='cRepEA.jsp'>Click Here</a> to edit another one.\n");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft edit request. You did not type in a correct/unique Aircraft ID.\n");
		out.println("<a href='cRepEA.jsp'>Click Here</a> to try again.\n");
	}
}
%>
