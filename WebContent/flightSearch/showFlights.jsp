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
		String filter = (String) session.getAttribute("Filter");
		String from = null;
		String to = null;
		String dayNum = null;
		String d_date = null;
		String r_date = null;
		String trip = null;
		String type = null;
		
		
		if(filter.equals("none")){
			
			from = request.getParameter("FROM");
			session.setAttribute("FM", from);
			
			r_date = request.getParameter("RETURN DATE");
			session.setAttribute("RD", r_date);
			
			d_date = request.getParameter("DEPARTURE DATE");
			session.setAttribute("DD", d_date);
			
			to = request.getParameter("TO");
			session.setAttribute("GOING",to);
			
			dayNum = request.getParameter("day_num"); 
			session.setAttribute("d_n", dayNum);
			
			type = request.getParameter("type");
			session.setAttribute("class", type);
			
		}
				
		from = (String) session.getAttribute("FM");
		to = (String) session.getAttribute("GOING");
		dayNum = (String) session.getAttribute("d_n");
		type = (String) session.getAttribute("class");		
		trip = (String) session.getAttribute("type");
		r_date = (String) session.getAttribute("RD");
		d_date = (String) session.getAttribute("DD");
		
		Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
		Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff	
		Statement st = con.createStatement();
		Statement st2 = con.createStatement(); //statement for second result set
		ResultSet resultSet;
		Statement resultState = con.createStatement();
		String sorting_parameter = null;
		String filter_price = null;
		String filter_stops = null;
		String filter_airline = null;
	    ResultSet rs = null;
	    ResultSet rs2 = null; //second result set for second table for Round Trip and Flexible
	    
	    
		if(trip.equals("One-Way")){
							
			if(type.equals("fare_economy")){
				rs = st.executeQuery("SELECT flight_num, type, tripType, Departure, fare_economy, Destination, depart_day, arrival_day, depart_time, arrival_time FROM Flights WHERE Departure='" + from + "'and Destination='" + to + "'and tripType='" + trip + "'and depart_day='" + d_date + "'");
			}else if(type.equals("fare_first")){
				rs = st.executeQuery("SELECT flight_num, type, tripType, Departure, fare_first, Destination, depart_day, arrival_day, depart_time, arrival_time FROM Flights WHERE Departure='" + from + "'and Destination='" + to + "'and tripType='" + trip + "'and depart_day='" + d_date + "'");
			}else{
				rs = st.executeQuery("SELECT flight_num, type, tripType, Departure, fare_business, Destination, depart_day, arrival_day, depart_time, arrival_time FROM Flights WHERE Departure='" + from + "'and Destination='" + to + "'and tripType='" + trip + "'and depart_day='" + d_date + "'");
			}
			
		}else if(trip.equals("Round-Trip")){
			
			if(type.equals("fare_economy")){
				rs = st.executeQuery("select flight_num, type, tripType, Departure, fare_economy, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights where Departure='" + from + "'and Destination='" + to + "'and tripType='" + trip + "'and depart_day='" + d_date + "'and arrival_day='" + r_date + "'");
				rs2 = st2.executeQuery("select flight_num, type, tripType, Departure, fare_economy, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights where Departure='" + to + "'and Destination='" + from + "'and tripType='" + trip + "'and depart_day='" + d_date + "'and arrival_day='" + r_date + "'");
			}else if(type.equals("fare_first")){
				rs = st.executeQuery("select flight_num, type, tripType, Departure, fare_first, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights where Departure='" + from + "'and Destination='" + to + "'and tripType='" + trip + "'and depart_day='" + d_date + "'and arrival_day='" + r_date + "'");
				rs2 = st2.executeQuery("select flight_num, type, tripType, Departure, fare_first, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights where Departure='" + to + "'and Destination='" + from + "'and tripType='" + trip + "'and depart_day='" + d_date + "'and arrival_day='" + r_date + "'");
			}else{
				rs = st.executeQuery("select flight_num, type, tripType, Departure, fare_business, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights where Departure='" + from + "'and Destination='" + to + "'and tripType='" + trip + "'and depart_day='" + d_date + "'and arrival_day='" + r_date + "'");
				rs2 = st2.executeQuery("select flight_num, type, tripType, Departure, fare_business, Destination, depart_day, arrival_day, depart_time, arrival_time from Flights where Departure='" + to + "'and Destination='" + from + "'and tripType='" + trip + "'and depart_day='" + d_date + "'and arrival_day='" + r_date + "'");
			}
			
		}
	    
		int class_type = 0;
		if(filter.equals("filter")) {
			
			if(type.equals("fare_first")) {
				class_type = 10;
			}
			if(type.equals("fare_business")) {
				class_type = 11;
			}
			if(type.equals("fare_economy")) {
				class_type = 12;
			}
			sorting_parameter = (String) session.getAttribute("s_p");
			System.out.println(sorting_parameter);
			filter_price = (String) session.getAttribute("f_p");
			filter_stops = (String) session.getAttribute("n_s");
			filter_airline = (String) session.getAttribute("a_n");
			if(type.equals(""))
			System.out.println(filter_airline);
			rs = st.executeQuery("select * from Flights where num_stops=" + filter_stops + " and " + type + filter_price + " order by " + type);

		}
	    
    %>
       
    <%if(trip.equals("One-Way")){ %>
	
		<h1>One Way Flights</h1>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Trip Type</TH>
			<TH>Departure</TH>
			<TH>Destination</TH>
			<TH>Depart Day</TH>
			<TH>Arrival Day</TH>
			<TH>Depart Time</TH>
			<TH>Arrival Time</TH>
			<TH><%=session.getAttribute("class")%> Price</TH>
		</TR>
		<% while(rs.next()){ %>
		<TR>
			<TD><%= rs.getString(1) %></td>
			<TD><%= rs.getString(2) %></TD>
			<TD><%= rs.getString(3) %></td>
			<TD><%= rs.getString(4) %></TD>
			<TD><%= rs.getString(5) %></TD>
			<TD><%= rs.getString(6) %></TD>
			<TD><%= rs.getString(7) %></TD>
			<TD><%= rs.getString(8) %></td>	
			<TD><%= rs.getString(9) %></td>
			<TD><%= rs.getString(10) %></td>
		</TR>
		<% } %>
	</TABLE>	
	<br>
	
	<br>
	
	<form action="reservation.jsp" method="POST">
	Flight Number: 
	<input type="text" name="flight_num">
	<strong>Flight Type:</strong>
		<select name = "flight-trip">
			<option value="fare_economy">fare_economy</option>
			<option value="fare_business">fare_business</option>
			<option value="fare_first">fare_first</option>
		</select>
	<button type="submit">Choose a Flight</button>
	</form>
	
	
	
	<form action = "flightSearchResults.jsp" method = "POST">		
		Sort by:
			<input type="radio" name="sort" value= <%=session.getAttribute("class")%> checked> <%=session.getAttribute("class")%> 
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
 		<input type="text" name="airline_name" value = "AA">
		
		<br> <br>	
		
		<button type = "submit"> Filter Flights </button>		
		</form>
			
	<% }else if(trip.equals("Round-Trip") || trip.equals("Flexible")){ %>
		
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
			<TH>Trip Type</TH>
			<TH>Departure</TH>
			<TH><%=session.getAttribute("class")%> Price</TH>
			<TH>Destination</TH>
			<TH>Depart Day</TH>
			<TH>Arrival Day</TH>
			<TH>Depart Time</TH>
			<TH>Arrival Time</TH>
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
			<TD><%= rs.getString(8) %></td>
			<TD><%= rs.getString(9) %></td>
			<TD><%= rs.getString(10) %></td>
		</TR>
		<% } %>
	</TABLE>
	
	<br> <br>
	
	<button type="button">Choose a Flight</button>
	
	<br> <br>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Trip Type</TH>
			<TH>Departure</TH>
			<TH><%=session.getAttribute("class")%> Price</TH>
			<TH>Destination</TH>
			<TH>Depart Day</TH>
			<TH>Arrival Day</TH>
			<TH>Depart Time</TH>
			<TH>Arrival Time</TH>
		</TR>
		<% while(rs2.next()){ %>
		<TR>
			<TD><%= rs2.getString(1) %></td>
			<TD><%= rs2.getString(2) %></TD>
			<TD><%= rs2.getString(3) %></td>
			<TD><%= rs2.getString(6) %></TD>
			<TD><%= rs2.getString(5) %></td>
			<TD><%= rs2.getString(4) %></TD>
			<TD><%= rs2.getString(7) %></TD>
			<TD><%= rs2.getString(8) %></td>
			<TD><%= rs2.getString(9) %></td>
			<TD><%= rs2.getString(10) %></td>
		</TR>
		<% } %>
	</TABLE>
	
	<br>
	
	<button type="button">Choose a Flight</button>

	<br>
	
	<% } %>



	<br><br>
		
</body>
</html>