<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
String email;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:/admin";
String user = "root";
String dbpsw = "";

String sql = "select * from login where username=? and password=?";

String name = request.getParameter("email");
String pass=request.getParameter("pass"); 
if((!(name.equals(null))))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, name); 
ps.setString(2,pass);
rs = ps.executeQuery();
if(rs.next())
{ 
email = rs.getString("username");  
String username=rs.getString("firstname");
if(email.equals("admin@gmail.com"))
{
session.setAttribute("email",username);  
session.setAttribute("username",username);
response.sendRedirect("admin.jsp");
}  
else
{
session.setAttribute("email",email);
session.setAttribute("username",username);
response.sendRedirect("frontpage.jsp");
}
}
else {
session.setAttribute("msg", "Invalid login details!");  
response.sendRedirect("login.jsp");
rs.close();
ps.close();  
}
}
catch(SQLException sqe)
{
out.println(sqe);
} 
}
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<% 
response.sendRedirect("login.jsp");
}
%>
</body>
</html>