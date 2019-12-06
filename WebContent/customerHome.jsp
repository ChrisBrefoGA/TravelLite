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
	<h1>Welcome <%=session.getAttribute("user")%></h1>
	<p>This is the customer page peasant</p> 
	<form>
		
		<input type="radio" name="trip" value="One Way" checked> One Way
    	<input type="radio" name="trip" value="Round Trip"> Round Trip<br/> <br>
	 	
	 	From: <input type="text" name="FROM"/>
     	
     	To: <input type="text" name="TO"/> <br/> <br>
     	
     	Number of Passengers: <input type="number" name="NUM OF PASSANGERS"/> <br/> <br>
     	
     	Departure Date: <input type="date" name="DEPARTURE DATE"/>
     	
     	Return Date: <input type="date" name="RETURN DATE"/> <br/> <br>
     	
     	Flight Class:
     	<select>
     		<option value = "Economy">Economy</option>
     		<option value = "Business">Business</option>
     	</select>
     	
     	<br><br>
     	
     	<input type="submit" value="Search"/>
     	
     	<button onclick="location.href='logout.jsp'" type="button">Logout</button>
    	
     </form>
</body>
</html>