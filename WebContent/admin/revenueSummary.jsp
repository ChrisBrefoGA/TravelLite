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
		Here is your revenue summary: 
    </h1>

    <%
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
	Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
	String inputType = request.getParameter("inputType");
	String input = request.getParameter("input");
	Statement st = con.createStatement();
	ResultSet rs = null;
	if(inputType.equals("flight_num")){
		rs = st.executeQuery("select flight_num, total from (select flight_num, sum(total_fare) total from Ticket where flight_num = '" + input + "' group by flight_num order by total_fare) tab limit 1");
	}
	else if(inputType.equals("airline_id")){
		rs = st.executeQuery("select airline_id, total from (select Flights.airline_id, sum(total_fare) total from Ticket, Flights where Flights.flight_num = Ticket.flight_num and Flights.airline_id = '" + input + "' group by Ticket.flight_num order by total_fare) tab limit 1");
	}
	else if(inputType.equals("userid")){
		rs = st.executeQuery("select userid, total from (select userid, sum(total_fare) total from Ticket where userid = '" + input + "' group by userid order by total_fare) tab limit 1");
	}
    %>

    <TABLE BORDER="1">
	<TR>
		<TH><%=inputType%></TH>
		<TH>Total Revenue</TH>
	</TR>
	<% while(rs.next()){ %>
	<TR>
		<TD><%= rs.getString(1) %></td>
		<TD><%= rs.getString(2) %></TD>
	</TR>
	<% } %>
</TABLE>

    <br>

    <form action="adminHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>