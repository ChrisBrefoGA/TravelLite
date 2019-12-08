<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    String user = request.getParameter("user");
	System.out.println(user);
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    int i = st.executeUpdate("DELETE FROM users WHERE userid='"+user + "'");
    System.out.println(i);
    i = st.executeUpdate("DELETE FROM Customer WHERE userid='"+user + "'");
    System.out.println(i);
    i = st.executeUpdate("DELETE FROM Customer_rep WHERE userid='"+user + "'");
    System.out.println(i);
}
catch(SQLException a) {
    System.out.println(a);
    System.out.println("Error in sql statements.");	
}
catch(Exception a){
	System.out.println(a);
	System.out.println("Error in sql statements.");	
}
response.sendRedirect("adminHome.jsp");
%>