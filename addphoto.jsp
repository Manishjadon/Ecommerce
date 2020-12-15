<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String fr="D:\\images\\";
String id = fr+request.getParameter("pic");  
if(id.equals(fr))
		{
	response.sendRedirect("myaccount.jsp");
		}
else
{

Connection con = null;
PreparedStatement ps = null;
String name=(String)session.getAttribute("email");
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update login set `imgsrc`=? where username=\""+name+"\"";
ps = con.prepareStatement(sql);   
ps.setString(1,id);
int i = ps.executeUpdate();    

response.sendRedirect("myaccount.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>