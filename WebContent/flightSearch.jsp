<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
   <head>
   <meta charset="ISO-8859-1">
      <title>Search Results</title>
   </head>
 	
 	<body>
 	
 	<form action = "flightSearchResults.jsp" method = "POST">
		
		<h2>Search for Flights!</h2>
				
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
		<input type="text" name="airline_name" value = "Frontier">
		
		<br> <br>	
		
		<button onclick="window.location.href = 'flightSearchResults.jsp';" 
		type = "submit">Search Flights</button>
	</form>
	
 	</body>   