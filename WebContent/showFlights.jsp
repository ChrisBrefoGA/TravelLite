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
/*		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();*/
		String from = request.getParameter("FROM");
		String to = request.getParameter("TO");
		String d_date = request.getParameter("DEPARTURE DATE");
		String a_date = request.getParameter("RETURN DATE");
		String trip = request.getParameter("trip");
		String type = request.getParameter("type");
		System.out.println(from + " " + to + " " + d_date + " " + a_date + " " + trip + " " + type);
		Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
		Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff	
		Statement st = con.createStatement();
	    ResultSet rs;
		if(type.equals("fare_economy")){
			rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, fare_economy, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
			
		}
		else if(type.equals("fare_first")){
			rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, fare_first, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
			
		}
		else{
			rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, fare_business, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
		}
		
		
//	    rs = st.executeQuery("select flight_number, type, depart_date, arrival_date, depart_time, arrive_time, fare_economy, fare_first, fare_business, available_seats, num_stops, departure_airport, arrival_airport from Flight where departure_airport='" + from + "' and arrival_airport='" + to + "' and depart_date='" + d_date + "' and type='" + trip + "'");
    %>
	
	<TABLE BORDER="1">
		<TR>
			<TH>Flight #</TH>
			<TH>Flight Type</TH>
			<TH>Departure Date</TH>
			<TH>Arrival Date</TH>
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
			<TD><%= rs.getString(7) %></TD>
			<TD><%= rs.getString(8) %></td>
			<TD><%= rs.getString(9) %></td>
			<TD><%= rs.getString(10) %></td>
			<TD><%= rs.getString(11) %></TD>
		</TR>
		<% } %>
	</TABLE>
	
	<br><br>
	
	
	
	
</body>
</html>