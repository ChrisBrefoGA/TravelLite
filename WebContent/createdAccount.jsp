<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import ="java.sql.*" %>
<%
try{
String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    String userid = request.getParameter("username");//receives the userid from the signup form 
    String pwd = request.getParameter("password");//receives the users password from the signup form
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    /*
    	It would probably be best to put the Validity of the users userid here before the insertion and have them redirected 
    	if it is a duplicate to another userid.
    */
    String insrt=("INSERT INTO users (userid, password)"+"VALUES(?,?)");// THE Update string for the SQL Table Update
    PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
    ps.setString(1,userid);//load the userid into the VALUES
    ps.setString(2, pwd);//load the password into the VALUES
    ps.executeUpdate();//execute the statement with the loaded values
    con.close();//close the connection
   	out.println("You have successfully created a new account. Please <a href='login.jsp'>login</a> to your new account");
}catch(Exception a){
	out.println(a);
	out.println("You have not successfully created a new account please try again.<a href='createLogin.jsp'>Signup here</a>");	
}
%>