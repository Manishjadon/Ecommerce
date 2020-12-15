
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String categoryname=request.getParameter("category");
if(categoryname != null)
{

Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="INSERT INTO `category` (`categoryid`, `categoryname`) VALUES (NULL, ?)";
ps = con.prepareStatement(sql);
ps.setString(1, categoryname);
int i = ps.executeUpdate();    
response.sendRedirect("category.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>