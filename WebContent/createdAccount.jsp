<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import ="java.sql.*" %>
<%
try{
String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");
    Statement st = con.createStatement();
    String insrt=("INSERT INTO users (userid, password)"+"VALUES(?,?)");
    PreparedStatement ps = con.prepareStatement(insrt);
    ps.setString(1,userid);
    ps.setString(2, pwd);
    ps.executeUpdate();
    con.close();
   	out.println("You have successfully created a new account. Please <a href='login.jsp'>login</a> to your new account");
}catch(Exception a){
	out.println(a);
	out.println("You have not successfully created a new account please try again.<a href='createLogin.jsp'>Signup here</a>");	
}
%>