<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
   <head>
   <meta charset="ISO-8859-1">
      <title>Search Results</title>
   </head>
 	
 	<body>
 	
 	<form>
		
		<h2>Flight Search Results</h2>
		
		<br> <br>
		
		Sort by:
		<input type="radio" name="sort" value="price" checked> Price
    	<input type="radio" name="sort" value="departure time"> Departure time
		<input type="radio" name="sort" value="arrival time"> Arrival time<br> <br>
		
		Filter by: <br> <br>
		
		Price: 
		<input type="checkbox" name="price" value="< $200"> < $200   
 		<input type="checkbox" name="price" value="$200 - $500"> $200 - $500    
 		<input type="checkbox" name="price" value="> $500"> > $500<br> <br>
 		
 		Number of stops: 
		<input type="checkbox" name="Number of stops" value="0"> 0   
 		<input type="checkbox" name="Number of stops" value="1"> 1    
 		<input type="checkbox" name="Number of stops" value="2"> 2<br> <br>
 		
 		Airline: 
		<input type="checkbox" name="Airline" value="Frontier"> Frontier    
 		<input type="checkbox" name="Airline" value="Spirit"> Spirit    
 		<input type="checkbox" name="Airline" value="Alaska"> Alaska    
		<input type="checkbox" name="Airline" value="United"> United    
		<input type="checkbox" name="Airline" value="Delta"> Delta<br> <br>
		
		
		
		
	
	</form>
 	
 	</body>   