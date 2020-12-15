<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<% 
String id=request.getParameter("password"); 
String newpass=request.getParameter("newpassword");
if(id != null)
{

Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update login set `password`=? where `password`=\""+id+"\"";
ps = con.prepareStatement(sql);
ps.setString(1,newpass);
int i = ps.executeUpdate();   
response.sendRedirect("admin.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>