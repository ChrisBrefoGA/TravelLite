<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{
    String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    String edited_user = (String)session.getAttribute("edited_user");
    System.out.println(edited_user);
    String users = request.getParameter("user");
    String pass = request.getParameter("pass");
    String first = request.getParameter("first");
    String last = request.getParameter("last");
    String acctnumS = request.getParameter("acctnum");
    String revenueS = request.getParameter("rev");
    System.out.println(acctnumS);
    int acctnum = -1;
    int revenue = -1;
    if (acctnumS.matches(".*\\d.*")) {
        System.out.println("GAAAAAAAAAAAAA");
        acctnum = new Integer(acctnumS);
    }
    if (revenueS.matches(".*\\d.*")) {
        revenue = new Integer(revenueS);
    }
    System.out.println("username: " + users);
    System.out.println("password: " + pass);
    System.out.println("firstname: " + first);
    System.out.println("lastname: " + last);
    System.out.println("acctnum: " + acctnum);
    System.out.println("revenue: " + revenue);
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff

    //update all given information

    //edit username
    System.out.println(users=="");
    if (users != "") {
        System.out.println("editing username");
        st.executeUpdate("UPDATE users SET userid = '" + users  + "'" + " where userid = '" + edited_user + "'");
        st.executeUpdate("UPDATE Customer SET userid = '" + users  + "'" + " where userid = '" + edited_user + "'");
        st.executeUpdate("UPDATE Customer_rep SET userid = '" + users  + "'" + " where userid = '" + edited_user + "'");
        edited_user = users;
    }
    if (pass != "") {
        System.out.println("editing password");
        st.executeUpdate("UPDATE users SET password = '" + pass  + "'" + " where userid = '" + edited_user + "'");
    }
    if (first != "") {
        System.out.println("editing first name");
        st.executeUpdate("UPDATE users SET First_name = '" + first  + "'" + " where userid = '" + edited_user + "'");
    }
    if (last != "") {
        System.out.println("editing last name");
        st.executeUpdate("UPDATE users SET Last_name = '" + last  + "'" + " where userid = '" + edited_user + "'");
    }
    if (acctnum > 0) {
        System.out.println("editing acctnum");
        st.executeUpdate("UPDATE users SET account_id = '" + acctnum  + "'" + " where userid = '" + edited_user + "'");
        st.executeUpdate("UPDATE Customer SET account_num = '" + acctnum  + "'" + " where userid = '" + edited_user + "'");
        st.executeUpdate("UPDATE Customer_rep SET customer_rep_id = '" + acctnum  + "'" + " where userid = '" + edited_user + "'");
    }
    if (revenue > 0) {
        System.out.println("editing revenue");
        st.executeUpdate("UPDATE Customer SET revenue = '" + revenue  + "'" + " where userid = '" + edited_user + "'");
    }
    

}
catch(SQLException a) {
    System.out.println(a);
    System.out.println("Error in sql statements.");	
}
catch(Exception a){
	System.out.println(a);
	System.out.println("Error in general.");	
}
response.sendRedirect("adminHome.jsp");
%>