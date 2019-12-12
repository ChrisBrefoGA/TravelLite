<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

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
String type = (String) session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
	  var fid = document.forms["Add"]["fID"].value;
	  var type = document.forms["Add"]["DItype"].value;
	  var type = document.forms["Add"]["tType"].value;
	  var dAirport = document.forms["Add"]["dAirport"].value;
	  var aAirport = document.forms["Add"]["aAirport"].value;
	  var dDate = document.forms["Add"]["dDate"].value;
	  var aDate = document.forms["Add"]["aDate"].value;
	  var dTime = document.forms["Add"]["dTime"].value;
	  var aTime = document.forms["Add"]["aTime"].value;
	  var fFare = document.forms["Add"]["fFare"].value;
	  var eFare = document.forms["Add"]["eFare"].value;
	  var bFare = document.forms["Add"]["bFare"].value;
	  var alID = document.forms["Add"]["alID"].value;
	  var aID = document.forms["Add"]["aID"].value;
	  var nos = document.forms["Add"]["nos"].value;

	  if (fid.trim() == "" || type.trim() == "" || tType.trim() == ""  || dAirport.trim() == ""
		  || aAirport.trim() == "" || dDate.trim() == "" || aDate.trim() == ""
			  || dTime.trim() == "" || aTime.trim() == "" || fFare.trim() == "" || bFare.trim() == ""  
			  || eFare.trim() == "" || alID.trim() == ""|| aID.trim() == ""|| nos.trim() == "") {
	    alert("ERROR: PLEASE ENTER ALL OF THE VALUES!!!");
	    return false;
	  }
	}
</script>
<meta charset="ISO-8859-1">
<title>Add</title>
</head>
<body>
<div>Welcome <%=session.getAttribute("user")%></div>
	<p>Please add the information for this <%=type%> below in the form.</p>
	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select * from "+ type +"");	
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
		<%     	ResultSet resultSet2 = statement.executeQuery("select * from Airport");	    %>
<div>
<strong>Airports</strong>
	<TABLE BORDER="1">
		<TR>
			<TH>Airport ID</TH>
		</TR>
		<% while(resultSet2.next()){ %>
		<TR>
			<TD><%= resultSet2.getString(1) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	
		<%     	ResultSet resultSet3 = statement.executeQuery("select * from Aircraft");    %>
<div>
<strong>Aircraft</strong>
	<TABLE BORDER="1">
		<TR>
			<TH>Aircraft ID</TH>
		</TR>
		<% while(resultSet3.next()){ %>
		<TR>
			<TD><%= resultSet3.getString(1) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	<%     	ResultSet resultSet4 = statement.executeQuery("select * from Airlines");	   %>
<div>
<strong>Airlines</strong>
	<TABLE BORDER="1">
		<TR>
			<TH>Airline ID</TH>
			<TH>Airline Name</TH>
		</TR>
		<% while(resultSet4.next()){ %>
		<TR>
			<TD><%= resultSet4.getString(1) %></td>
			<TD><%= resultSet4.getString(2) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	<%     	ResultSet resultSet5 = statement.executeQuery("select * from Uses");	   %>
<div>
<strong>USES</strong>
	<TABLE BORDER="1">
		<TR>
			<TH>Aircraft ID</TH>
			<TH>Flight#</TH>
			<TH>Airline ID</TH>
		</TR>
		<% while(resultSet5.next()){ %>
		<TR>
			<TD><%= resultSet5.getString(1) %></td>
			<TD><%= resultSet5.getString(2) %></td>
			<TD><%= resultSet5.getString(3) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>

	<%     	ResultSet resultSet8 = statement.executeQuery("select * from Owns");	   %>
<div>
<strong>OWNS</strong>
	<TABLE BORDER="1">
		<TR>
			<TH>Airline ID</TH>
			<TH>Aircraft ID</TH>
		</TR>
		<% while(resultSet8.next()){ %>
		<TR>
			<TD><%= resultSet8.getString(1) %></td>
			<TD><%= resultSet8.getString(2) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	
	<form name="Add" onsubmit="return validateForm()" action="cRepExecuteA.jsp" method ="POST">
       Please enter a unique flight#: <input type="text" name="fID"><br>
       Please enter a unique type(Domestic or International): <input type="text" name="DItype"><br>
       Please enter a unique Trip Type(One Way, Round Trip, Flexible): <input type="text" name="tType"><br>
       Please enter the departure airport for this flight: <input type="text" name="dAirport"><br>
       Please enter the arrival airport for this flight: <input type="text" name="aAirport"><br>
       Please enter a unique departure date(YYYY/MM/DD): <input type="text" name="dDate"><br>
       Please enter a unique arrival date(YYYY/MM/DD): <input type="text" name="aDate"><br>
       Please enter a unique departure time(HH:MM:SS): <input type="text" name="dTime"><br>
       Please enter a unique arrival time(HH:MM:SS): <input type="text" name="aTime"><br>
       Please enter a unique first class fare: <input type="text" name="fFare"><br>
       Please enter a unique business fare: <input type="text" name="bFare"><br>
       Please enter a unique economy fare: <input type="text" name="eFare"><br>
 	   Please enter the airline id for this flight: <input type="text" name="alID"><br>
       Please enter the aircraft id for this flight:(Airline and Aircraft ID pair must match the Owns table) <input type="text" name="aID"><br>
       Please enter the number of stops for this flight: <input type="text" name="nos"><br>
       <input type="submit" value="Add"> <br>
    </form>

	<br><br>
	<a href='cRepHome.jsp'>Home Page</a>
	<a href='../logout.jsp'>Log out</a>
</body>
</html>