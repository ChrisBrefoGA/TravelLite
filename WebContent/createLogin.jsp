<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
   <head>
      <title>Create Login Form</title>
	  <script type="text/javascript">
  function checkForm(form)
  {
    if(form.username.value == "") {
      alert("Error: Username cannot be blank!");
      form.username.focus();
      return false;
    }
    re = /^\w+$/;
    if(!re.test(form.username.value)) {
      alert("Error: Username must contain only letters, numbers and underscores!");
      form.username.focus();
      return false;
    }
	
	// CANNOT CONNECT TO DATABASE USING JAVASCRIPT
	// FIND ALTERNATIVE SOLUTION
	//alert("before duplicate check");
	/*
	String url = "jdbc:mysql://db336.cwmds0owoihg.us-east-2.rds.amazonaws.com:3306/TravelLite";
	Class.forName("com.mysql.jdbc.Driver");//SQL connection stuff
	Connection con = DriverManager.getConnection(url,"Admin_Saber", "ChrisBrefo63!");//SQL connection stuff
    Statement st = con.createStatement();//SQL connection stuff
    ResultSet rs;//ResultSet for the query statement. If executed properly rs will hold the userid and password 
    rs = st.executeQuery("select userid from users where userid='" + form.username.value + "'");
	String check = rs.getString("userid");
	alert("Check value: " + check);
	if (form.username.value === check) {
		alert("Error: Username already taken!");
		form.username.focus();
		return false;
	}
	*/
    if(form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
      if(form.pwd1.value == form.username.value) {
        alert("Error: Password must be different from Username!");
        form.pwd1.focus();
        return false;
      }
	  if(form.pwd1.value.length < 8) {
        alert("Error: Password must contain at least eight characters!");
        form.pwd1.focus();
        return false;
      }
	  re = /[a-z]/;
	  if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        form.pwd1.focus();
        return false;
      }
	  re = /[A-Z]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        form.pwd1.focus();
        return false;
      }
      re = /[0-9]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one number (0-9)!");
        form.pwd1.focus();
        return false;
      }
	  re=/[!@#\$%\^&]/
	  if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one special character (!@#$%^&)!");
        form.pwd1.focus();
        return false;
      }
    } else {
      alert("Error: Please check that the passwords you've entered match!");
      form.pwd1.focus();
      return false;
  }
    return true;
  }
</script>
   </head>
   <body>
   		<form action="createdAccount.jsp" method="POST" onsubmit="return checkForm(this);">
       		New Username: <input type="text" name="username"/> <br/> <br>
       		New Password:<input type="password" name="pwd1"/> <br/> <br>
       		Re-enter Password:<input type="password" name="pwd2"/> <br/>
			Password must be as follow: >= 8 characters, >= 1 uppercase char, >= 1 lowercase char, >= 1 special character. <br/> <br>
       		<input type="submit" value="Create New Account"/>
       	</form>
   </body>
</html>