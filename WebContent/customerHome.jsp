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

	<form action="flightSearchResults.jsp" method="POST">

		<script type="text/javascript">
		function isNumberKey(evt) {
    		var charCode = (evt.which) ? evt.which : evt.keyCode
    		if (charCode > 31 && (charCode < 48 || charCode > 57))
        		return false;
    		return true;
		}
     	
     	function isLetterKey(evt) {
    		var charCode = (evt.which) ? evt.which : evt.keyCode
    		if (charCode >= 48 && charCode <= 90)
        		return false;
    		return true;
		}   	
     	</script>

		<h2>Search for Flights in TravelLite!</h2>

		<strong>Flight Class:</strong> <input type="radio" name="trip" value="One Way" checked>
		
		One Way <input type="radio" name="trip" value="Round Trip">
			
		Round Trip<br/> <br> <strong>From:</strong> <input type="text" name="FROM"
			onkeypress="return isLetterKey(event)" /> <strong>To:</strong> <input type="text"
			name="TO" onkeypress="return isLetterKey(event)" /> <br /> <br>

		<strong>Number of Passengers:</strong> <input name="someid" type="number"
			onkeypress="return isNumberKey(event)" /> <br>
		<br> <strong>Departure Date:</strong> <input type="date" name="DEPARTURE DATE" />

		<strong>Return Date:</strong> <input type="date" name="RETURN DATE" /> <br /> <br>

		<strong>Flight Type:</strong>
		<select>
			<option value="Economy">Economy</option>
			<option value="Business">Business</option>
		</select> 
		<br><br> 
		
		<input type="submit" value="Search" />
		<button onclick="location.href='logout.jsp'" type="button">Logout</button>

	</form>
</body>
</html>