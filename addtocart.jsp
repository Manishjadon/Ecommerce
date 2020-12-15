<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%String url = "jdbc:mysql://localhost:/";%>
<%!String dbuser = "root"; String database = "admin";%>
<%!String psw = "";%>
<%
String user=(String)session.getAttribute("email");
String quantity=request.getParameter("quantity");  
int quant=Integer.parseInt(quantity);   
String imgsrc=request.getParameter("imgsrc");  
String productname=request.getParameter("productname");
String presentprice=request.getParameter("presentprice"); 
int pp=Integer.parseInt(presentprice);
int amount=pp*quant;   
out.print(quant);
out.print(user);
out.print(imgsrc);
if(user != null)
{

Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url+database,dbuser,psw);
String sql="insert into cart (userid,imgsrc,productname,presentprice,quantity,amount) VALUES(?,?,?,?,?,?)";
ps = con.prepareStatement(sql); 
ps.setString(1,user);
ps.setString(2,imgsrc);
ps.setString(3,productname);
ps.setInt(4,pp);
ps.setInt(5,quant);
ps.setInt(6,amount);
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