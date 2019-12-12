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
<title>Ticket</title>
</head>
<body>

<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		String flight_num = request.getParameter("flight_num");
		String flight_num2 = request.getParameter("flight_num2");
		String flight_class = request.getParameter("flight-class");
		String flight_trip = request.getParameter("flight-trip");
		int tick_num = (int) Math.floor(Math.random() * 100) + 1;
		
		System.out.println(flight_trip + "  " + flight_class);
//		System.out.println(flight_class.equals("fare_economy"));
		
		Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
		Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
		Statement st = con.createStatement();
		ResultSet rs = null;
		Statement st2 = con.createStatement();
		ResultSet rs2 = null;
//		if(flight_trip.equals("One-Way")){
			if(flight_trip.equals("fare_economy")){
				rs = st.executeQuery("select Flights.fare_economy, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num + "' and Aircraft.aircraft_id = 1");
			}
			else if(flight_trip.equals("fare_business")){
				rs = st.executeQuery("select Flights.fare_business, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num + "' and Aircraft.aircraft_id = 1");
			}
			else if(flight_trip.equals("fare_first")){
				rs = st.executeQuery("select Flights.fare_first, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num + "' and Aircraft.aircraft_id = 1");
			}
			
/*			rs.next();
			int x = rs.getInt(1) + 25;
			
			
			String insrt=("INSERT INTO Ticket (ticket_num, round_trip, booking_fee, issue_date, total_fare, userid, flight_num) "+"VALUES(?, ?, ?, ?, ?, ?, ?)");// THE Update string for the SQL Table Update
	        PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	        ps.setInt(1,tick_num);//load the userid into the VALUES
	        ps.setInt(2, 0);//load the password into the VALUES
	        ps.setInt(3, 25);
	        ps.setString(4, "2019/12/12");
	        ps.setInt(5, x);
	        ps.setString(6, "tom");
	        ps.setString(7, flight_num);
	        ps.executeUpdate();
*/	
//			st2.executeUpdate("INSERT INTO Ticket (ticket_num, round_trip, booking_fee, issue_date, total_fare, userid, flight_num) "+"VALUES(" + tick_num + ", 0, 25, NOW(), " + rs.getInt(1) + ", tom," + flight_num + ")");
//		}
/*		else if(flight_trip.equals("Round-Trip")){
//			System.out.println("It gets here");
//			System.out.println("the second number is: " + flight_num2);
			
			if(flight_class.equals("fare_economy")){
//				System.out.println("It gets here");
				rs = st.executeQuery("select Flights.fare_economy, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num + "' and Aircraft.aircraft_id = 4");
				rs2 = st2.executeQuery("select Flights.fare_economy, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num2 + "' and Aircraft.aircraft_id = 2");
//				System.out.println("It gets here");	
			}
			else if(flight_class.equals("fare_business")){
				rs = st.executeQuery("select Flights.fare_business, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num + "' and Aircraft.aircraft_id = 4");
				rs2 = st2.executeQuery("select Flights.fare_economy, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num2 + "' and Aircraft.aircraft_id = 2");
				
			}
			else if(flight_class.equals("fare_first")){
				rs = st.executeQuery("select Flights.fare_first, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num + "' and Aircraft.aircraft_id = 4");
				rs2 = st2.executeQuery("select Flights.fare_economy, Aircraft.aircraft_id, Departure, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights, Aircraft where Flights.aircraft_id = Aircraft.aircraft_id and Flights.flight_num = '" + flight_num2 + "' and Aircraft.aircraft_id = 2");
				
			}
			
		}
*/		
		
%>


This is your ticket. Confirm your reservation. <br> <br>



<TABLE BORDER="1">
		<TR>
			<TH>Flight Number</TH>
			<TH>Seat Number</TH>
  			<TH>From</TH>
  			<TH>To</TH>
			<TH>Departure Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Date</TH>
			<TH>Arrival Time</TH>
			<TH>Class</TH>
			<TH>Base Price</TH>
			<TH>Booking Fee</TH>
			<TH>Total Fee</TH>
			
		</TR>
		<% while(rs.next()){ %>
		
		<TR>
			<TD><%= flight_num %></td>
			<TD><%= rs.getString(2) %></td>
			<TD><%= rs.getString(3)%></TD>
			<TD><%= rs.getString(4) %>
			<TD><%= rs.getString(5) %></td>
			<TD><%= rs.getString(7) %></td>
			<TD><%= rs.getString(6) %></td>
			<TD><%= rs.getString(8) %></td>
			<TD><%= flight_class %></TD>
			<TD><%= rs.getInt(1)%></TD>
			<TD><%= 25 %>
			<TD><%= rs.getInt(1) + 25%></TD>

		</TR>
		<% } %>
	</TABLE>

	<br> <br>
	


	
	
	<%// }else if(flight_trip.equals("Round-Trip") || flight_trip.equals("Flexible")){ %>
		
		<%//if(flight_trip.equals("Round-Trip")){ %>
		<!--  	<h1>Round Trip Flights</h1>
			<br>-->
		<% //}else{ %>
		<!--	<h1>Flexible Flights</h1>
			<br>
		<%// } %>
		
		<TABLE BORDER="1">
		<TR>
			<TH>Flight Number</TH>
			<TH>Seat Number</TH>
  			<TH>From</TH>
  			<TH>To</TH>
			<TH>Departure Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Date</TH>
			<TH>Arrival Time</TH>
			<TH>Class</TH>
			<TH>Base Price</TH>
			<TH>Booking Fee</TH>
			<TH>Total Fee</TH>
			
		</TR>
		<%// while(rs.next()){ %>
		
		<TR>
			<TD><%//= flight_num %></td>
			<TD><%//= rs.getString(2) %></td>
			<TD><%//= rs.getString(3)%></TD>
			<TD><%//= rs.getString(4) %>
			<TD><%//= rs.getString(5) %></td>
			<TD><%//= rs.getString(7) %></td>
			<TD><%//= rs.getString(6) %></td>
			<TD><%//= rs.getString(8) %></td>
			<TD><%//= flight_class %></TD>
			<TD><%//= rs.getInt(1)%></TD>
			<TD><%//= 25 %>
			<TD><%//= rs.getInt(1) + 25%></TD>
		</TR>
		<% //} %>
	</TABLE>
		
		<br> <br>
		
		<TABLE BORDER="1">
		<TR>
			<TH>Flight Number</TH>
			<TH>Seat Number</TH>
  			<TH>From</TH>
  			<TH>To</TH>
			<TH>Departure Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Date</TH>
			<TH>Arrival Time</TH>
			<TH>Class</TH>
			<TH>Base Price</TH>
			<TH>Booking Fee</TH>
			<TH>Total Fee</TH>
			
		</TR>
		<%// while(rs2.next()){ %>
		
		<TR>
			<TD><%//= flight_num2 %></td>
			<TD><%//= rs2.getString(2) %></td>
			<TD><%//= rs2.getString(3)%></TD>
			<TD><%//= rs2.getString(4) %>
			<TD><%//= rs2.getString(5) %></td>
			<TD><%//= rs2.getString(7) %></td>
			<TD><%//= rs2.getString(6) %></td>
			<TD><%//= rs2.getString(8) %></td>
			<TD><%//= flight_class %></TD>
			<TD><%//= rs2.getInt(1)%></TD>
			<TD><%//= 25 %>
			<TD><%//= rs2.getInt(1) + 25%></TD>
		</TR>
		<%// } %>
	</TABLE>
	
		
		
		
		
		<%// } %>
		
	<br><br>
		
	-->

<!-- <form action="addReserve.jsp" method = "POST">
<button type="submit">Confirm</button>
</form>
<br>
<form action="customerHome.jsp" method="POST">
<button type="submit">Cancel</button>
</form> -->

</body>
</html>