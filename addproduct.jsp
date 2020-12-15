
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:/admin";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String productname=request.getParameter("productname");  
String category=request.getParameter("category");
String productprice=request.getParameter("productprice");    
String imgsrc=request.getParameter("img");    
String prodesc=request.getParameter("productdescription");
imgsrc="D:\\images\\"+imgsrc;
int proprice=Integer.parseInt(productprice);
String discountprice=request.getParameter("discountprice");  
int disprice=Integer.parseInt(discountprice);  
int present=proprice-disprice;
float disper=(float)(((proprice-disprice)*100)/(proprice));  
disper=(float)(100-disper);
if(category != null)
{

Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="INSERT INTO `product` (`productid`,`imgsrc`, `productname`,`category`,`productprice`,`discountprice`,`presentprice`,`quantity`,`discountper`,`productdescription`) VALUES (NULL,?, ?,?,?,?,?,NULL,?,?)";
ps = con.prepareStatement(sql);  
ps.setString(1, imgsrc); 
ps.setString(2, productname);    
ps.setString(3, category); 
ps.setInt(4, proprice); 
ps.setInt(5, disprice); 
ps.setInt(6, present);
ps.setFloat(7, disper);  
ps.setString(8,prodesc);
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