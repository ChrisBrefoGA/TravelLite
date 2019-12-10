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
String flightNum = request.getParameter("Flight");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waiting List</title>
</head>
<body>
<div>Welcome <%=session.getAttribute("user")%></div>
	<p>Here is the waiting list for Flight <%=flightNum %>.</p>
	<% 
		ResultSet resultSet = null;
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
		Connection connection = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
		Statement statement = connection.createStatement();
		Statement statement2 = connection.createStatement();
    	resultSet = statement.executeQuery("select * from Waitinglist w where w.flight = '"+ flightNum +"'");	
		ResultSet testSet = statement2.executeQuery("select * from Waitinglist w where w.flight = '"+ flightNum +"'");;
    	if(testSet.next() == false){
    		out.println("There is no waiting list for this flight, or the flight doesn't exist.");
    		out.println("<a href='cRepHome.jsp'>Click Here</a> to try again.");
    		return;
    	}
    %>
<div>
	<TABLE BORDER="1">
		<TR>
			<TH>Username's waiting for this flight</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(2) %></TD>
		</TR>
		<% } %>
	</TABLE>
</div>	
	<br><br>
	<a href='cRepHome.jsp'>Home Page</a>
	<a href='../logout.jsp'>Log out</a>
</body>
</html>