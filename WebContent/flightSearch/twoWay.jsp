<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

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
String trip = (String) session.getAttribute("type");
session.setAttribute("Filter", "none");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<h1> Welcome <%=session.getAttribute("user")%> </h1>

	<form action="showFlights.jsp" method="POST">

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
		
		<h3>Two Way Flights</h3>
									   
		<strong>From:</strong> <input type="text" name="FROM"/> 
		<strong>To:</strong> <input type="text" name="TO"/> <br /> <br>

		<strong>Number of Passengers:</strong> <input name="someid" type="number"/> <br><br> 
		<strong>Departure Date:(YYYY-MM-DD)</strong> <input type="date" name="DEPARTURE DATE" />

		<strong>Return Date:(YYYY-MM-DD)</strong> <input type="date" name="RETURN DATE" /> <br /> <br>

		<strong>Flight Type:</strong>
		<select name = "type">
			<option value="fare_economy">fare_economy</option>
			<option value="fare_business">fare_business</option>
			<option value="fare_first">fare_first</option>
		</select> 
		<br><br> 
		<button type="Submit">Search</button>
		<button onclick="location.href='logout.jsp'" type="button">Logout</button>

	</form>
</body>
</html>
