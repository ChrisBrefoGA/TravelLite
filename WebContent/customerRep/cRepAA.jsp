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
	  var id = document.forms["Add"]["id"].value;
	  var airlineID = document.forms["Add"]["airlineID"].value;
	  if (id.trim() == "" || airlineID.trim() == "") {
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
	<TABLE BORDER="1">
		<TR>
			<TH>Aircraft ID</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></td>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	
		<% 
    	ResultSet resultSet2 = statement.executeQuery("select * from Airlines");	
    %>
<div>
	<TABLE BORDER="1">
		<TR>
			<TH>Airline ID</TH>
			<TH>Airline Name</TH>
		</TR>
		<% while(resultSet2.next()){ %>
		<TR>
			<TD><%= resultSet2.getString(1) %></td>
			<TD><%= resultSet2.getString(2) %></TD>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	
			<% 
    	ResultSet resultSet3 = statement.executeQuery("select * from Owns");	
    %>
<div>
	<TABLE BORDER="1">
		<TR>
			<TH>Airline ID</TH>
			<TH>Aircraft ID</TH>
		</TR>
		<% while(resultSet3.next()){ %>
		<TR>
			<TD><%= resultSet3.getString(1) %></td>
			<TD><%= resultSet3.getString(2) %></TD>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	
	<form name="Add" onsubmit="return validateForm()" action="cRepExecuteA.jsp" method ="POST">
       Please enter a unique aircraft id: <input type="text" name="id"><br>
       Please enter the Airline ID it's owned by:(Ex. AA) <input type="text" name="airlineID"><br>
       <input type="submit" value="Add"> <br>
    </form>

	<br><br>
	<a href='cRepHome.jsp'>Home Page</a>
	<a href='../logout.jsp'>Log out</a>
</body>
</html>