<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">   
    </head>       
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.*,java.util.*"%>
<%    
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:/";
String database = "admin";
String userid = "root";
String password = "";     
String n=request.getParameter("d");  
int x=Integer.parseInt(n);
System.out.println(x);
    	   try
    	   {
    	   Class.forName("com.mysql.cj.jdbc.Driver");
    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/admin", "root", "");
    	   Statement st=conn.createStatement();
    	   int it=st.executeUpdate("DELETE FROM cart WHERE cart.sno="+x);  
    	   conn.close();  
    	   response.sendRedirect("cart.jsp");
    	   }
    	   catch(Exception e)
    	   {
    	   System.out.print(e);
    	   e.printStackTrace();
    	   }    
    	   %> 
  </html>