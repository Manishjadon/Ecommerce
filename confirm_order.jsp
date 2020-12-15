<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%

String id = request.getParameter("b"); 
String status="Confirmed";  
if(id != null)
{

Connection con = null;
PreparedStatement ps = null;    
Statement statement = null;
ResultSet resultSet = null;    
String datetime;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update delievery set `status`=? where `dateandtime`=\""+id+"\"";
ps = con.prepareStatement(sql);
ps.setString(1,status);
int i = ps.executeUpdate();  
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}       

try
{
Class.forName(driverName);    
String nam=(String)session.getAttribute("userid");
con = DriverManager.getConnection(url,user,psw);
String sql="Update `cart` set `status`=? where `dateandtime`=\""+id+"\"";
ps = con.prepareStatement(sql);
ps.setString(1,status);
int i = ps.executeUpdate();  
response.sendRedirect("orderlist.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>