<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
								   <button onclick="location.href='customerRepFlightReg.jsp'" type="button">Submit</button><br> <br>
		
		Edit reservation for user: <input type = "text" name = "username">
								   <button onclick="location.href='.jsp'" type="button">Submit</button> <br> <br>
		
		Waiting list for flight: <input type = "text" name = "flightnum">
								 <button onclick="location.href='.jsp'" type="button">Submit</button> <br> <br>
	</form>	
	
	<form>
			<strong>Add a Flight, Aircraft, or Airport:</strong>
			<select>
				<option value="Flight">Flight</option>
				<option value="Aircraft">Aircraft</option>
				<option value="Airport">Airport</option>
			</select> 
			<br><br> 
			<button onclick="location.href='customerRepAdd.jsp'" type="button">Submit</button> <br> <br>
	</form>
	
	<form>
			<strong>Edit Flight, Aircraft, or Airport information:</strong>
			<select>
				<option value="Flight">Flight</option>
				<option value="Aircraft">Aircraft</option>
				<option value="Airport">Airport</option>
			</select> 
			<br><br> 
			<button onclick="location.href='customerRepEdit.jsp'" type="button">Submit</button> <br> <br>
	</form>
	
	<form>
			<strong>Delete a Flight, Aircraft, or Airport:</strong>
			<select>
				<option value="Flight">Flight</option>
				<option value="Aircraft">Aircraft</option>
				<option value="Airport">Airport</option>
			</select> 
			<br><br> 
			<button onclick="location.href='customerRepDelete.jsp'" type="button">Submit</button> <br> <br>
	</form>

		<button onclick="location.href='logout.jsp'" type="button">Logout</button> <br> <br>
	
</body>
</html>