<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<h1> Welcome <%=session.getAttribute("user")%> </h1>

	<form action="showFlights.jsp" method="POST">


		<h2>Search for Flights in TravelLite!</h2>

		<strong>Flight Class:</strong> <input type="radio" name="trip" value="One Way" checked>One Way 
									   <input type="radio" name="trip" value="Round Trip">Round Trip <br/> <br> 
									   <input type="radio" name="trip" value="Flexible" checked>Flexible
									   
		<strong>From:</strong> <input type="text" name="FROM" /> 
		<strong>To:</strong> <input type="text" name="TO" /> <br /> <br>

		<strong>Number of Passengers:</strong> <input name="someid" type="number"
			onkeypress="return isNumberKey(event)" /> <br>
		<br> <strong>Departure Date:</strong> <input type="date" name="DEPARTURE DATE" />

		<strong>Return Date:</strong> <input type="date" name="RETURN DATE" /> <br /> <br>

		<strong>Flight Type:</strong>
		<select name = "type">
			<option value="fare_economy">economy</option>
			<option value="fare_first">first</option>
			<option value="fare_business">business</option>
		</select> 
		<br><br> 
		
		<!-- <input type="submit" value="Search" /> -->
		<button onclick="location.href='showFlights.jsp'" type="submit">Search</button>
		<button onclick="location.href='logout.jsp'" type="button">Logout</button>

	</form>
</body>
</html>