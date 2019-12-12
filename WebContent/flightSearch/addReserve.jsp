<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>





<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation</title>
</head>
<body>

Your Reservation is confirmed. Thank you for choosing TravelLite. We hope you TravelLit.


Your Ticket:


<% 
		String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
//		String flight_num = request.getParameter("flight_num");
//		System.out.println(flight_num);

		Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
		Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
		Statement st = con.createStatement();
		ResultSet rs = null;
		
		 st.executeUpdate("INSERT INTO Ticket (ticket_num, round_trip, booking_fee, issue_date, total_fare) "+"VALUES(1, 0, 25, GETDATE(), 175)");// THE Update string for the SQL Table Update
/*	        PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
	        ps.setInt(1,1);//load the userid into the VALUES
	        ps.setString(2, "no");//load the password into the VALUES
	        ps.setInt(3, 25);
//	        ps.setDate(4, GETDATE());
	        ps.setInt(4, 175);
	        ps.executeUpdate();
*/		
		
//		rs = st.executeQuery("INSERT INTO Ticket (ticket_num, round_trip, booking_fee, issue_date, total_fare)"+"VALUES(1, no, 25, 2019/12/11, 175)");
//		rs = st.executeQuery("INSERT INTO Ticket (ticket_num, round_trip, booking_fee, issue_date, total_fare)"+"VALUES(?, ?, ?, ?, ?)");
		


%>







Back to home page: 
<form action="customerHome.jsp" method="POST">
<button type="submit">Home</button>
</form>
















</body>
</html>