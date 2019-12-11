<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{
	String url2 = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
    String cust_username = request.getParameter("cust");
    Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
    Connection con = DriverManager.getConnection(url2,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    ResultSet result_set = st.executeQuery("select * from Customer where userid = '" + cust_username + "'");
	while(result_set.next()) {
		String user_name = result_set.getString(1);
        System.out.println(user_name);
		int acct_num = result_set.getInt(2);
        System.out.println(acct_num);
		//st.executeQuery("insert into Customer_rep (userid, customer_rep_id) values (" + user_name +" ," + acct_num + ")");
		//st.executeQuery("delete from Customer where userid = '" + user_name + "'");
        String insrt=("INSERT INTO Customer_rep (userid, customer_rep_id)"+"VALUES(?,?)");// THE Update string for the SQL Table Update
        PreparedStatement ps = con.prepareStatement(insrt);//The string gets converted for SQL use
        ps.setString(1,user_name);//load the userid into the VALUES
        ps.setInt(2, acct_num);//load the password into the VALUES
        ps.executeUpdate();//execute the statement with the loaded values
        /*
        String insrt2=("delete from Customer where userid = ?");// THE Update string for the SQL Table Update
        PreparedStatement ps2 = con.prepareStatement(insrt);//The string gets converted for SQL use
        ps2.setString(1,user_name);//load the userid into the VALUES
        ps2.executeUpdate();//execute the statement with the loaded values
        */
        int i = st.executeUpdate("DELETE FROM Customer WHERE userid='"+user_name + "'");
        System.out.println(i);
    }
}
catch(Exception a){
	out.println(a);
	out.println("The customer you entered does not exist.");	
}
response.sendRedirect("adminHome.jsp");
%>