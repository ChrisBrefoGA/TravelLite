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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<h1> Welcome <%=session.getAttribute("user")%> </h1>

	<form action="../flightSearch/flightClassMid.jsp" method="POST">

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
		<strong>Flight Class:</strong> <select name = "flight-class">
				<option value="One Way">One-Way</option>
				<option value="Round Trip">Two-Way</option>
				<option value="Flexible">Flexible</option>
			</select>
		<button type="submit" value="continue">Continue</button>
	</form>
	<br>	
	<form action = "cAccount.jsp" method = "POST">
			<strong>Please select if you would like to see you past reservations or upcoming reservations:</strong>
			<select name = "Selection">
				<option value="Past">Past Reservations</option>
				<option value="Upcoming">Upcoming Reservations</option>
			</select> 
			<br><br> 
			<button type="submit" value="Submit">Submit</button> <br> <br>
	</form>
	<br>
	<button onclick="location.href='../logout.jsp'" type="button">Logout</button> <br> <br>
</body>
</html>