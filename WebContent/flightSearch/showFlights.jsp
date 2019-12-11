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

	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		String from = request.getParameter("FROM");
		String to = request.getParameter("TO");
		String d_date = request.getParameter("DEPARTURE DATE");
		String a_date = request.getParameter("RETURN DATE");
		String trip = (String) session.getAttribute("type");
		String type = request.getParameter("type");
		
		Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
		Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff	
		Statement st = con.createStatement();
		Statement st2 = con.createStatement(); //statement for second result set
	    ResultSet rs = null;
	    ResultSet rs2 = null; //second result set for second table for Round Trip and Flexible
	    
	    
	    
		if(trip.equals("One Way")){
			
			if(type.equals("fare_economy")){
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_economy, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
			}else if(type.equals("fare_first")){
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time,  price, fare_first, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
			}else{
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_business, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
			}
			
		}else if(trip.equals("Round Trip")){
			
			if(type.equals("fare_economy")){
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_economy, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
				rs2 = st2.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_economy, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + to + "' and arrival_airport='" + from + "' and depart_date='" + a_date + "' and type='" + trip + "'");
			}else if(type.equals("fare_first")){
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_first, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
				rs2 = st2.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_first, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + to + "' and arrival_airport='" + from + "' and depart_date='" + a_date + "' and type='" + trip + "'");
			}else{
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_business, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
				rs2 = st2.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_business, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + to + "' and arrival_airport='" + from + "' and depart_date='" + a_date + "' and type='" + trip + "'");
			}
			
		}else if(trip.equals("Flexible")){
			
			if(type.equals("fare_economy")){
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_economy, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
				rs2 = st2.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_economy, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + to + "' and arrival_airport='" + from + "' and depart_date='" + a_date + "' and type='" + trip + "'");
			}else if(type.equals("fare_first")){
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_first, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
				rs2 = st2.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_first, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + to + "' and arrival_airport='" + from + "' and depart_date='" + a_date + "' and type='" + trip + "'");
			}else{
				rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_business, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
				rs2 = st2.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, price, fare_business, booking_fee, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + to + "' and arrival_airport='" + from + "' and depart_date='" + a_date + "' and type='" + trip + "'");
			}
		}
    %>
	
	<%if(trip.equals("One Way")){ %>
	
		<h1>One Way Flights</h1>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Departure Date</TH>
			<TH>Arrival Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Time</TH>
			<TH>Base Price</TH>
			<TH>Class Fee</TH>
			<TH>Booking Fee</TH>
			<TH>Available Seats</TH>
			<TH>Number of Stops</TH>
			<TH>Departure Airport</TH>
			<TH>Arrival Airport</TH>
			<TH>Airline</TH>
			
		</TR>
		<% while(rs.next()){ %>
		<TR>
			<TD><%= rs.getString(1) %></td>
			<TD><%= rs.getString(2) %></TD>
			<TD><%= rs.getString(3) %></td>
			<TD><%= rs.getString(4) %></TD>
			<TD><%= rs.getString(5) %></td>
			<TD><%= rs.getString(6) %></TD>
			<TD><%= rs.getString(7) %></TD>
			<TD><%= rs.getString(8) %></TD>
			<TD><%= rs.getString(9) %></td>
			<TD><%= rs.getString(10) %></td>
			<TD><%= rs.getString(11) %></td>
			<TD><%= rs.getString(12) %></td>
			<TD><%= rs.getString(13) %></TD>
			
		</TR>
		<% } %>
	</TABLE>
	
	<br>
	
	<form action = "flightSearchResults.jsp" method = "POST">		
		Sort by:
			<input type="radio" name="sort" value="price" checked> Price
    		<input type="radio" name="sort" value="depart_time"> Departure time
			<input type="radio" name="sort" value="arrive_time"> Arrival time<br> <br>
		
		Filter by: <br> <br>
		
		Price: 
		<input type="text" name="flight_price" value = "<500">  
 		
 		<br> <br>
 		
 		Number of stops: 
		<input type="text" name="number_stops" value = 0>
 		
 		<br> <br>
 		
 		Airline: 
 		<select name = "airline_name">
  			<option value="1">Spirit</option>
  			<option value="2">Frontier</option>
  			<option value="3">United Airlines</option>
  			<option value="4">Delta</option>
  			<option value="5">American Airlines</option>
  			<option value="6">Alaska Airlines</option>
		</select>
		
		<br> <br>	
		
		<button type = "submit"> Filter Flights </button>		
		</form>
			
	<% }else if(trip.equals("Round Trip") || trip.equals("Flexible")){ %>
		
		<%if(trip.equals("Round Trip")){ %>
			<h1>Round Trip Flights</h1>
			<br>
		<% }else{ %>
			<h1>Flexible Flights</h1>
			<br>
		<% } %>
	
		<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Departure Date</TH>
			<TH>Return Date</TH> <!-- Changed from Arrival date to return date -->
			<TH>Departure Time</TH>
			<TH>Arrival Time</TH>
			<TH>Price</TH>
			<TH>Available Seats</TH>
			<TH>Number of Stops</TH>
			<TH>Departure Airport</TH>
			<TH>Arrival Airport</TH>
			
		</TR>
		<% while(rs.next()){ %>
		<TR>
			<TD><%= rs.getString(1) %></td>
			<TD><%= rs.getString(2) %></TD>
			<TD><%= rs.getString(3) %></td>
			<TD><%= rs.getString(4) %></TD>
			<TD><%= rs.getString(5) %></td>
			<TD><%= rs.getString(6) %></TD>
			<TD><%= rs.getString(14) %></TD>
			<TD><%= rs.getString(8) %></td>
			<TD><%= rs.getString(9) %></td>
			<TD><%= rs.getString(10) %></td>
			<TD><%= rs.getString(11) %></TD>
		</TR>
		<% } %>
	</TABLE>
	
	<button type="button">Choose a Flight</button>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Departure Date</TH>
			<TH>Return Date</TH> <!-- Changed from Arrival date to return date -->
			<TH>Departure Time</TH>
			<TH>Arrival Time</TH>
			<TH>Price</TH>
			<TH>Available Seats</TH>
			<TH>Number of Stops</TH>
			<TH>Departure Airport</TH>
			<TH>Arrival Airport</TH>
			
		</TR>
		<% while(rs2.next()){ %>
		<TR>
			<TD><%= rs2.getString(1) %></td>
			<TD><%= rs2.getString(2) %></TD>
			<TD><%= rs2.getString(3) %></td>
			<TD><%= rs2.getString(4) %></TD>
			<TD><%= rs2.getString(5) %></td>
			<TD><%= rs2.getString(6) %></TD>
			<TD><%= rs2.getString(7) %></TD>
			<TD><%= rs2.getString(8) %></td>
			<TD><%= rs2.getString(9) %></td>
			<TD><%= rs2.getString(10) %></td>
			<TD><%= rs2.getString(11) %></TD>
		</TR>
		<% } %>
	</TABLE>

	<% } %>
		
	<br><br>
		
</body>
</html>