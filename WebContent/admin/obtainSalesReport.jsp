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
	

    <%-- query --%>
    <%
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
	Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
	String input = request.getParameter("month");
	Statement st = con.createStatement();
	ResultSet rs = null;
	rs = st.executeQuery("select sum(total_fare) from Ticket where MONTH(issue_date)= " + input);
    %>

    <h1>
		Here is a sales report for <%=input%>:
    </h1>

    <%-- table --%>
    <TABLE BORDER="1">
        <TR>
            <TH>Total Revenue</TH>
        </TR>
        <% while(rs.next()){ %>
        <TR>
            <TD><%= rs.getString(1) %></TD>
        </TR>
        <% } %>
    </TABLE>

    <br>

    <form action="adminHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>