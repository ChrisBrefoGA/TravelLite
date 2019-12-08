<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%!
public int userAccess(String account, Connection cc){
	Statement ss = null;
	try{
		ss = cc.createStatement();//SQL connection stuff
    	ResultSet rs;//ResultSet for the query statement(Customer)
    	ResultSet rs2;//ResultSet for the query statement(Customer_rep)
    	ResultSet rs3;//ResultSet for the query statement(Admin)
    	rs = ss.executeQuery("select * from Customer where user_name='" + account +"'");
    	if(rs.next()){//if the account is a customer
    		return 1;
    	}
   		rs2 = ss.executeQuery("select * from Customer_rep where user_name='" + account+"'");
    	if(rs2.next()){//if the account is a customer_rep
    		return 2;
    	}
    	rs3 = ss.executeQuery("select * from Admin where user_name='" + account +"'");
    	if(rs3.next()){//if the account is an Admin
    		return 3;
    	}
	}
	catch(Exception c){
		System.out.println("Statments couldn't be resolved");
	}
	return 0;
}
%>

<%
String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    String userid = request.getParameter("username");//receives the userid from the login form    
    String pwd = request.getParameter("password");//receives the userid from the login form  
    String account = " ";
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    ResultSet rs;//ResultSet for the query statement. If executed properly rs will hold the userid and password 
    rs = st.executeQuery("select * from users where userid='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
    	out.println("made it");
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);   // does this actually print anywhere?
        out.println("<a href='logout.jsp'>Log out</a>"); // or this
        int access = userAccess(userid, con);
        if(access == 1){//it's a customer account
        	response.sendRedirect("customer/customerHome.jsp");
        }
        else if(access == 2){//it's a customer rep account
        	response.sendRedirect("customerRep/cRepHome.jsp");
        }
        else if(access == 3){//it's an admin account
        	response.sendRedirect("admin/adminHome.jsp");
        }
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>