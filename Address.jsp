<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>  
<%
String name=request.getParameter("name");  
String phone=request.getParameter("phone");
String city=request.getParameter("city");    
String state=request.getParameter("state");    
String pin=request.getParameter("pin");
String address=request.getParameter("address");
String locality=request.getParameter("locality"); 
String type=request.getParameter("radio");
String id=(String)session.getAttribute("email"); 
String datetime="";
Statement statement = null;
ResultSet resultSet = null;
if(session.getAttribute("email") != null)
{
Connection connection = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
connection = DriverManager.getConnection(url,user,psw);
String sql="INSERT INTO `delievery` (`userid`,`name`,`phone`, `city`,`state`,`pincode`,`address`,`locality`,`type`) VALUES (?,?,?,?,?,?,?,?,?) ";
ps = connection.prepareStatement(sql);  
ps.setString(1, id); 
ps.setString(2, name);    
ps.setString(3, phone); 
ps.setString(4, city); 
ps.setString(5, state); 
ps.setString(6, pin);
ps.setString(7, address);  
ps.setString(8,locality); 
ps.setString(9,type);
int i = ps.executeUpdate();   
session.setAttribute("msg","order placed successfully!");  
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}  
try
{
connection = DriverManager.getConnection(url, user, psw);
statement=connection.createStatement();   
String sql ="select `dateandtime` from `delievery` where `userid`=\""+id+"\" and status=\""+"Pending"+"\" order by `dateandtime` DESC";
resultSet = statement.executeQuery(sql);    
while(resultSet.next())
{
	   datetime=resultSet.getString("dateandtime");    
	   resultSet.next();   
	   break;
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}   
try
{
Class.forName(driverName);
connection = DriverManager.getConnection(url,user,psw);
String sql="Update cart set `dateandtime`=? ,`flag`=? where `userid`=\""+id+"\" and `status`=\""+"Pending"+"\" and `dateandtime`=\""+"0000-00-00 00:00:00"+"\""; 
String flag="true";
ps = connection.prepareStatement(sql); 
ps.setString(1,datetime);  
ps.setString(2,flag);
int i = ps.executeUpdate();   
response.sendRedirect("frontpage.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>