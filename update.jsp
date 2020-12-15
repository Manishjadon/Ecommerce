<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
System.out.print("manish");
String id = request.getParameter("b");  
String first_name=request.getParameter("first");
String last_name=request.getParameter("last");
String user_id=request.getParameter("user");
String password=request.getParameter("pass");
System.out.print(id);

if(id != null)
{

Connection con = null;
PreparedStatement ps = null;
try
{  
	out.print(id);
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update `login` set `firstname`=?,`lastname`=?,`username`=?,password=? where `username`=\""+id+"\"";
ps = con.prepareStatement(sql);
ps.setString(1, first_name);
ps.setString(2, last_name);
ps.setString(3, user_id);
ps.setString(4,password);
int i = ps.executeUpdate();    

response.sendRedirect("customer.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>