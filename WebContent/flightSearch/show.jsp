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

	<form action="reservation.jsp" method="POST">
	<strong>Flight Trip:</strong> <select name = "flight-trip">
				<option value="One-Way">One-Way</option>
				<option value="Round-Trip">Round-Trip</option>
				<option value="Flexible">Flexible</option>
				</select>
	<br>
	<strong>Flight Class:</strong> <select name = "flight-class">
				<option value="fare_economy">fare_economy</option>
				<option value="fare_business">fare_business</option>
				<option value="fare_first">Fare_first</option>
				</select>
				
	<br>
	Flight Number: 
	<input type="text" name="flight_num">
	<br>
	If Round Trip, Flight Number for return flight:
	<input type="text" name="flight_num2">
	<button type="submit">Choose a Flight</button>
	</form>
	
	
	
		
</body>
</html>