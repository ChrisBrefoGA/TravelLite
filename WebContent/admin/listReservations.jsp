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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airport Flights</title>
</head>
<body>
	<h1>
		Here is a list of reservations: 
    </h1>

    <%
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
	Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
	String inputType = request.getParameter("inputType");
	String input = request.getParameter("input");
	Statement st = con.createStatement();
	ResultSet rs = null;
	rs = st.executeQuery("select * from Ticket where" + inputType + " = " + input);
    %>

    <%-- table --%>
	<TABLE BORDER="1">
		<TR>
			<TH>Ticket Number</TH>
			<TH>Round Trip</TH>
			<TH>Booking Fee</TH>
			<TH>Issue Date</TH>
			<TH>Flight Number</TH>
			<TH>Username</TH>
			<TH>Total Fare</TH>
		</TR>
		<% while(resultSet.next()){ %>
		<TR>
			<TD><%= resultSet.getString(1) %></TD>
			<TD><%= resultSet.getString(2) %></TD>
			<TD><%= resultSet.getString(3) %></TD>
			<TD><%= resultSet.getString(4) %></TD>
			<TD><%= resultSet.getString(5) %></TD>
			<TD><%= resultSet.getString(6) %></TD>
			<TD><%= resultSet.getString(7) %></TD>
		</TR>
		<% } %>
	</TABLE>

    <br>

    <form action="adminHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>