<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import ="java.sql.*" %>
<%
try{
String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
    String userid = request.getParameter("username");//receives the userid from the signup form 
    String pwd = request.getParameter("pwd1");//receives the users password from the signup form
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    String insrt=("INSERT INTO users (userid, password)"+"VALUES(?,?)");// THE Update string for the SQL Table Update
    String insrt2 =("INSERT INTO Customer (user_name, account_num)"+"VALUES(?,?)");// THE Update string for the SQL Table Update
    PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
    PreparedStatement ps2 = con.prepareStatement(insrt2);//The string gets converted for SQL use		
    ps.setString(1,userid);//load the userid into the VALUES
    ps.setString(2, pwd);//load the password into the VALUES
    ps.setString(3, firstname);
    ps.setString(4, lastname);
    ps.executeUpdate();//execute the statement with the loaded values
    Random rand = new Random();
    boolean insert = false;
    int n = 0;
    while(!insert){
    	try{
    	 	n = rand.nextInt();
    		if(n < 0) n *= -1;
    	    ps2.setString(1,userid);//load user_name into the VALUES
    	    ps2.setInt(2, n);//load account_num into VALUES
    	    ps2.executeUpdate();//add the account values into Customer
    	    insert = true;
    	}catch(Exception a){
    		System.out.println("Couldn't be inserted. accountID is a duplicate.");
    	}
    }
    con.close();//close the connection
   	out.println("You have successfully created a new account.\nYour account id is:"+ n +".\n Please <a href='login.jsp'>login</a> to your new account");
}
catch(SQLIntegrityConstraintViolationException a) {
    out.println("Username already exists. Try creating a different username. <a href='createLogin.jsp'>Sign up here</a>");	
}
catch(Exception a){
	out.println(a);
	out.println("You have not successfully created a new account please try again. <a href='createLogin.jsp'>Sign up here</a>");	
}
%>