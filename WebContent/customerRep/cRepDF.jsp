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
	  var fid = document.forms["Delete"]["fID"].value;
	  if (fid.trim() == "" ) {
	    alert("ERROR: PLEASE ENTER THE FLIGHT# YOU WOULD LIKE TO DELETE!!!");
	    return false;
	  }
	}
</script>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
<div>Welcome <%=session.getAttribute("user")%></div>
	<p>Please type in the ID of the <%=type%>you would like to delete.</p>
	<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery("select * from "+ type +"");	
    %>
<div>
	<TABLE BORDER="1">
		<TR>
			<TH>Flight#</TH>
			<TH>Type</TH>
			<TH>Departure Date</TH>
			<TH>Arrival Date</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Time</TH>
			<TH>Fare First</TH>
			<TH>Fare Economy</TH>
			<TH>Fare Business</TH>
			<TH>Available Seats</TH>
			<TH>Is Full</TH> <!-- default is always false -->
			<TH>Number of Stops</TH>
			<TH>Price</TH>
			<TH>Booking fee</TH><!-- static value -->
			<TH>Departure Airport</TH>
			<TH>Arrival Airport</TH>
			<TH>Aircraft ID</TH>
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
			<TD><%= resultSet.getString(15) %></td>
			<TD><%= resultSet.getString(16) %></TD>
			<TD><%= resultSet.getString(17) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	
	<form name="Delete" onsubmit="return validateForm()" action="cRepExecuteD.jsp" method ="POST">
       Please enter a flight#: <input type="text" name="fID"><br>
       <input type="submit" value="Delete"> <br>
    </form>

	<br><br>
	<a href='cRepHome.jsp'>Home Page</a>
	<a href='../logout.jsp'>Log out</a>
</body>
</html>