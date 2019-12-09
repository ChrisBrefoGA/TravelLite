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
		String FN = request.getParameter("fID");	
		Statement statement = con.createStatement();
		ResultSet resultSet3 = statement.executeQuery("select * from Flight where flight_number ='"+FN+"'");	
		resultSet3.next();
	String tYP = request.getParameter("type");
	String dDate = request.getParameter("dDate");		
	String aDate = request.getParameter("aDate");			
	String dTime = request.getParameter("dTime");			
	String aTime = request.getParameter("aTime");			
	String fFirst = request.getParameter("fFare");
	String eFirst = request.getParameter("eFare");
	String bFirst = request.getParameter("bFare");
	String aSeats = request.getParameter("aSeats");
	String isFull = request.getParameter("isFull");
	String nos = request.getParameter("nos");
	String dAirport = request.getParameter("dAirport");	
	String price = request.getParameter("price");
	String bFee = request.getParameter("bFee");
	String aAirport = request.getParameter("aAirport");	
	String AID = request.getParameter("aID");	
	
	if(tYP.trim().isEmpty()){
		tYP = resultSet3.getString(2);
	}
	if(dDate.trim().isEmpty()){
		dDate = resultSet3.getString(3);
	}
	if(aDate.trim().isEmpty()){
		aDate = resultSet3.getString(4);
	}
	if(dTime.trim().isEmpty()){
		dTime = resultSet3.getString(5);
	}
	if(aTime.trim().isEmpty()){
		aTime = resultSet3.getString(6);
	}
	if(fFirst.trim().isEmpty()){
		fFirst = resultSet3.getString(7);
	}
	if(eFirst.trim().isEmpty()){
		eFirst = resultSet3.getString(8);
	}
	if(bFirst.trim().isEmpty()){
		bFirst = resultSet3.getString(9);
	}
	if(aSeats.trim().isEmpty()){
		aSeats = resultSet3.getString(10);
	}
	if(isFull.trim().isEmpty()){
		isFull = resultSet3.getString(11);
	}
	if(nos.trim().isEmpty()){
		nos = resultSet3.getString(12);
	}
	if(price.trim().isEmpty()){
		price = resultSet3.getString(13);
	}
	if(bFee.trim().isEmpty()){
		bFee = resultSet3.getString(14);
	}
	if(dAirport.trim().isEmpty()){
		dAirport = resultSet3.getString(15);
	}
	if(aAirport.trim().isEmpty()){
		aAirport = resultSet3.getString(16);
	}
	if(AID.trim().isEmpty()){
		AID = resultSet3.getString(17);
	}
	
	statement.executeUpdate("UPDATE Flight SET  flight_number ='"+ FN +"'   where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  type = '"+ tYP +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  depart_date ='"+ dDate +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  arrival_date = '"+ aDate +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  depart_time ='"+ dTime +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  arrive_time = '"+ aTime +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  fare_first ='"+ fFirst +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  fare_economy = '"+ eFirst +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  fare_business ='"+ bFirst +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  available_seats = '"+ aSeats +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  is_full ='"+ isFull +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  num_stops = '"+ nos +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  price ='"+ price +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  booking_fee = '"+ bFee +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET departure_airport ='"+ dAirport +"'  where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET  arrival_airport = '"+ aAirport +"' where flight_number = '"+ FN +"'");
	statement.executeUpdate("UPDATE Flight SET aircraft_id ='"+ AID +"'  where flight_number = '"+ FN +"'");
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
	String abbr = request.getParameter("Abbr");
	String name = request.getParameter("Name");
	if(abbr.trim().isEmpty()){
		abbr = resultSet3.getString(2);
	}
	if(name.trim().isEmpty()){
		name = resultSet3.getString(3);
	}
	statement.executeUpdate("UPDATE Airport SET airport_id ='"+ AID +"'  where airport_id = '"+ AID +"'");
	statement.executeUpdate("UPDATE Airport SET  abbreviation = '"+ abbr +"' where airport_id = '"+ AID +"'");
	statement.executeUpdate("UPDATE Airport SET name ='"+ name +"'  where airport_id = '"+ AID +"'");
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
	String seat = request.getParameter("seats");
	if(seat.isEmpty()){
		seat = resultSet3.getString(2);
	}
	statement.executeUpdate("UPDATE Aircraft SET aircraft_id ='"+ AID +"'  where aircraft_id = '"+ AID +"'");
	statement.executeUpdate("UPDATE Aircraft SET  Max_seats = '"+ seat +"' where aircraft_id = '"+ AID +"'");
	out.println("We completed your edit inquiry!!<a href='cRepHome.jsp'>Click Here</a> to go back to the home page\n");
	out.println("<a href='cRepEA.jsp'>Click Here</a> to edit another one.\n");
	}catch(SQLException a){
		out.println("We could not complete you Aircraft edit request. You did not type in a correct/unique Aircraft ID.\n");
		out.println("<a href='cRepEA.jsp'>Click Here</a> to try again.\n");
	}
}
%>
