<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
	<h1>Welcome <%=session.getAttribute("user")%></h1>
	<p>This is the customer rep page</p>
	
	<form>	
		Make reservation for user: <input type = "text" name = "username">
								   <button onclick="location.href='cRepFR.jsp'" type="button">Submit</button><br> <br>
		
		Edit reservation for user: <input type = "text" name = "username">
								   <button onclick="location.href='.jsp'" type="button">Submit</button> <br> <br>
		
		Waiting list for flight: <input type = "text" name = "flightnum">
								 <button onclick="location.href='.jsp'" type="button">Submit</button> <br> <br>
	</form>	
	
	<form action = "cRepA.jsp" method = "POST">
			<strong>Add a Flight, Aircraft, or Airport:</strong>
			<select name = "Thing">
				<option value="Flight">Flight</option>
				<option value="Aircraft">Aircraft</option>
				<option value="Airport">Airport</option>
			</select> 
			<br><br> 
			<button type="submit" value="Submit">Submit</button> <br> <br>
	</form>
	
	<form action = "cRepE.jsp" method = "POST">
			<strong>Edit Flight, Aircraft, or Airport information:</strong>
			<select name = "Thing">
				<option value="Flight">Flight</option>
				<option value="Aircraft">Aircraft</option>
				<option value="Airport">Airport</option>
			</select> 
			<br><br> 
			<button type="submit" value="Submit">Submit</button> <br> <br>
	</form>
	
	<form action = "cRepD.jsp" method = "POST">
			<strong>Delete a Flight, Aircraft, or Airport:</strong>
			<select name="Thing">
				<option value="Flight">Flight</option>
				<option value="Aircraft">Aircraft</option>
				<option value="Airport">Airport</option>
			</select> 
			<br><br> 
			<button type="submit" value="Submit">Submit</button> <br> <br>
	</form>
		<br><br> 
		<button onclick="location.href='../logout.jsp'" type="button">Logout</button> <br> <br>
	
</body>
</html>