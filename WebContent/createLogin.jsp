<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
   <head>
      <title>Create Login Form</title>
   </head>
   <body>
   		<form action="createdAccount.jsp" method="POST">
       		New Username: <input type="text" name="username"/> <br/>
       		New Password:<input type="password" name="password"/> <br/>
       		Re-enter Password:<input type="password" name="password"/> <br/>
       		<input type="submit" value="Create"/>
       	</form>
   </body>
</html>