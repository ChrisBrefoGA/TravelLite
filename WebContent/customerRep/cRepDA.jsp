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
	  var id = document.forms["Delete"]["id"].value;
	  if (id.trim() == "" ) {
	    alert("ERROR: PLEASE ENTER THE AIRCRAFT ID YOU WOULD LIKE TO DELETE!!!");
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
	
	<form name="Delete" onsubmit="return validateForm()" action="cRepExecuteD.jsp" method ="POST">
       Please enter an aircraft id: <input type="text" name="id"><br>
       <input type="submit" value="Delete"> <br>
    </form>

	<br><br>
	<a href='cRepHome.jsp'>Home Page</a>
	<a href='../logout.jsp'>Log out</a>
</body>
</html>