<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
	  var tNum = document.forms["Edit"]["tNum"].value;
	  var rTrip = document.forms["Edit"]["roundTrip"].value;
	  var bFee = document.forms["Edit"]["bFee"].value;
	  var iDate = document.forms["Edit"]["iDate"].value;
	  var fNum = document.forms["Edit"]["fNum"].value;
	  var tFare = document.forms["Edit"]["tFare"].value;
	  if (tNum.trim() == "" || rTrip.trim() == ""|| bFee.trim() == "" ||
			  iDate.trim() == ""|| fNum.trim() == "" || tFare.trim() == "") {
	    alert("ERROR: PLEASE ENTER ALL THE VALUES!!!");
	    return false;
	  }
	}
</script>
<meta charset="ISO-8859-1">
<title>Reservation Edit</title>
</head>
<body>
	<h1>
		Edit a User
	</h1>
	<p>Fill out the desired fields to edit information of a users.</p>

    <%-- check if user given exists and is not admin first --%>
  <%
    String edited_user = request.getParameter("user");
    session.setAttribute("edited_user", edited_user);
  %>

	<form name = "Edit" onsubmit="return validateForm()" action="updateInformation.jsp" method ="POST">
       Please select the ticket number you want to edit: <input type="text" name="tNum"> <br>
       Change the round_trip (0-no, 1-yes): <input type="text" name="roundTrip"> <br>
       Change the booking fee: <input type="text" name="bFee"> <br>
       Change the issue date(YYYY/MM/DD): <input type="text" name="iDate"> <br>
       Change the flight number: <input type="text" name="fNum"> <br>
       Change the total fare: <input type="text" name="tFare"> <br> <br>     
       <input type="submit" value="UPDATE INFORMATION"> <br>
    </form>

    <br>

    <form action="cRepHome.jsp" method ="POST">
        <input type="submit" value="Go Back"> <br>
    </form>

</body>
</html>