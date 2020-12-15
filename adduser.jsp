
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String firstname=request.getParameter("first");  
String lastname=request.getParameter("last");
String username=request.getParameter("user");  
String password=request.getParameter("pass");
if(username != null)
{

Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="INSERT INTO `login` (`firstname`,`lastname`,`username`,`password`) VALUES (?,?,?,?)";
ps = con.prepareStatement(sql);  
ps.setString(1, firstname); 
ps.setString(2, lastname);    
ps.setString(3, username); 
ps.setString(4, password);
int i = ps.executeUpdate();   
session.setAttribute("email",username);
session.setAttribute("username",firstname);
response.sendRedirect("frontpage.jsp");
}
catch(SQLException sql)
{  
session.setAttribute("msg","UserID Aready Registered!!!");
response.sendRedirect("login.jsp");
}
}
%>