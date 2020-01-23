<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
	  var tNum = document.forms["Edit"]["tNum"].value;
	  var rTrip = document.forms["Edit"]["roundTrip"].value;
	  var bFee = document.forms["Edit"]["bFee"].value;
	  var iDate = document.forms["Edit"]["iDate"].value;
	  var fNum = document.forms["Edit"]["fNum"].value;
	  var tFare = document.forms["Edit"]["tFare"].value;
	  if (tNum.trim() == "" || rTrip.trim() == ""|| bFee.trim() == "" ||
			  iDate.trim() == ""|| fNum.trim() == "" || tFare.trim() == "") {
	    alert("ERROR: PLEASE ENTER ALL THE VALUES!!!");
	    return false;
	  }
	  if(rTrip > 1 || rTrip < 0){
		  alert("ERROR: PLEASE ENTER THE RIGHT VALUE FOR ROUND-TRIP!!!");
	  }
	}
</script>
<meta charset="ISO-8859-1">
<title>Reservation Edit</title>
</head>
<body>
	<h1>
		Edit a User
	</h1>
	<p>Fill out the desired fields to edit information of a users.(If you don't want to change information please retype the info already there)</p>

    <%-- check if user given exists and is not admin first --%>
  <%
    String edited_user = request.getParameter("user");
    session.setAttribute("edited_user", edited_user);
  %>
  
  	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select * from Ticket where userid ='"+session.getAttribute("edited_user")+"'");	
    %>
<div>
	<TABLE BORDER="1">
		<TR>
			<TH>Ticket Number</TH>
			<TH>Round Trip</TH>
			<TH>Booking Fee</TH>
			<TH>Issued Date</TH>
			<TH>Flight Number</TH>
			<TH>User-Name</TH>
			<TH>Total Price</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></td>
			<TD><%= resultSet.getString(3) %></td>
			<TD><%= resultSet.getString(4) %></td>
			<TD><%= resultSet.getString(5) %></td>
			<TD><%= resultSet.getString(6) %></td>
			<TD><%= resultSet.getString(7) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
<br> <br> 
		<% 
			resultSet = statement.executeQuery("select * from Flights");	
    %>
<div>
<strong>FLIGHTS</strong>
	<TABLE BORDER="1">
		<TR>
			<TH>Flight#</TH>
			<TH>Type</TH>
			<TH>Trip Type</TH>
			<TH>Departure</TH>
			<TH>Destination</TH>
			<TH>Departure Date</TH>
			<TH>Arrival Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival /time</TH>
			<TH>Fare First</TH>
			<TH>Fare Business</TH>
			<TH>Fare Economy</TH>
			<TH>Airline</TH>
			<TH>Aircraft</TH>
			<TH>Number of Stops</TH>

		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
			<TD><%= resultSet.getString(2) %></TD>
			<TD><%= resultSet.getString(3) %></td>
			<TD><%= resultSet.getString(4) %></TD>
			<TD><%= resultSet.getString(5) %></td>
			<TD><%= resultSet.getString(6) %></TD>
			<TD><%= resultSet.getString(7) %></td>
			<TD><%= resultSet.getString(8) %></TD>
			<TD><%= resultSet.getString(9) %></td>
			<TD><%= resultSet.getString(10) %></TD>
			<TD><%= resultSet.getString(11) %></td>
			<TD><%= resultSet.getString(12) %></TD>
			<TD><%= resultSet.getString(13) %></td>
			<TD><%= resultSet.getString(14) %></TD>
			<TD><%= resultSet.getString(15) %></TD>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	<form name = "Edit" onsubmit="return validateForm()" action="updateInformation.jsp" method ="POST">
       Please select the ticket number you want to edit: <input type="text" name="tNum"> <br>
       Change the round_trip (0-no, 1-yes): <input type="text" name="roundTrip"> <br>
       Change the booking fee: <input type="text" name="bFee"> <br>
       Change the issue date(YYYY/MM/DD): <input type="text" name="iDate"> <br>
       Change the flight number: <input type="text" name="fNum"> <br>
       Change the total fare: <input type="text" name="tFare"> <br> <br>     
       <input type="submit" value="UPDATE INFORMATION"> <br>
    </form>

    <br>

    <form action="cRepHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>