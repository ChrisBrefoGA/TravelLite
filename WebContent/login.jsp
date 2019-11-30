<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
   <head>
      <title>Login</title>
   </head>
   <body>
     <form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/> <br>
       Password:<input type="password" name="password"/> <br/> <br>
       <input type="submit" value="Log In"/> <br/> <br>
     </form>
     <form action="createLogin.jsp">
     <!-- TODO: make this into a button -->
     	 <a href='createLogin.jsp'>Create New Account</a>
     	<!--  <button type="button">Create Account</button>  -->
     </form>
   </body>
</html>