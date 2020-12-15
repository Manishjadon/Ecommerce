<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("b");   
String productname=request.getParameter("productname");  
String imgsrc=request.getParameter("img");  
imgsrc="D:\\"+imgsrc;
String category=request.getParameter("category");
String productprice=request.getParameter("productprice");    
String prodesc=request.getParameter("productdescription");
int proprice=Integer.parseInt(productprice);
String discountprice=request.getParameter("discountprice");  
int disprice=Integer.parseInt(discountprice);
float disper=(float)(((proprice-disprice)*100)/(proprice));
disper=(float)(100-disper);
if(id != null)
{

Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update product set `imgsrc`=?,`productname`=?,`category`=?,`productprice`=?,`discountprice`=?,`discountper`=?,`productdescription`=? where productid="+personID;
ps = con.prepareStatement(sql); 
ps.setString(1, imgsrc);
ps.setString(2, productname);
ps.setString(3, category);
ps.setInt(4, proprice);
ps.setInt(5,disprice); 
ps.setFloat(6,disper);  
ps.setString(7,prodesc);
int i = ps.executeUpdate();    
response.sendRedirect("product.jsp");
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>