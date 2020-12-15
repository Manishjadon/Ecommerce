<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.*,java.util.*"%>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:/";
String database = "admin";
String userid = "root";
String password = ""; 
String id=request.getParameter("b");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <title>Admin</title> 
    <style>   
    .lite a:hover
    {
        background-color:#007bff ;
        color:#fff;
    }  
    .alone
    {
        background-color:#007bff !important;
        color:#fff!important;
    } 
    .lite .list-group-item-action:focus {
    background: transparent;
    border: 0;
    outline: 0;
        }
    div#MAN {
    flex-direction: inherit;
    }
    .sidebar-pannel{
    flex-grow: 0;
    flex-shrink: 0;
    flex-basis: 15rem;
    padding: 1.25rem; 
    height: 100vh;
    overflow-y: auto;  
    position:fixed; 
    margin-left:-8%; 
    } 
    #first
    {
        background-color:black; 
        color:white;
    }   
    .right
    {
      margin-left:14%; 
      margin-right:-10%;
    } 
    #hii
    {
        background-color:black; 
        color:white; 
        min-height:65px; 
        margin-top:2.5rem;  
        margin-left:1.5rem;
        margin-right:1.5rem;  
        font-size: small;
    }   
    #tbl
    {
        margin-top:1.5rem;   
        width:95%; 
        margin-left:1.5rem; 
        text-align:center;
    }  
    #tbl1
    {
        margin-top:1.5rem;   
        width:95%; 
        margin-left:1.5rem; 
        text-align:center;
    } 
    #ctg
    {
        margin-left:11.5rem;
    } 
    .btnheader
    { 
      margin-left:40%;
    }
    </style>
  </head>
  <body>   
    <div class="container" >
      <div class="left">
    <div class="card" style="width:100%;" id="MAN"> 
        <div class="sidebar-pannel">
        <img src="D:\images\Admin.jpg" class="card-img-top" alt="...">
        <div class="list-group"> 
            <li class="list-group-item">Administrator</li>
            <li class="list-group-item">Manish</li> 
            <div class="lite">
            <a href="admin.jsp" class="list-group-item list-group-item-action alone" >Home</a>
            <a href="category.jsp" class="list-group-item list-group-item-action">Categories</a>
            <a href="product.jsp" class="list-group-item list-group-item-action">All Product</a>
            <a href="orderlist.jsp" class="list-group-item list-group-item-action">Order List</a>
            <a href="customer.jsp" class="list-group-item list-group-item-action">Customers List</a>
            <a href="changepassword.jsp" class="list-group-item list-group-item-action">Change Password</a>
            <a href="logout.jsp" class="list-group-item list-group-item-action">Logout</a>
            </div>
        </div>
        </div>  
      </div>  
      </div> 
      <div class="right">  
        <div class="header" id="hii">
            <h1 align="center">Order details of Customer No 1</h1>  
        </div>
            <h2 align="center">Delievery Address</h1>
        <div class="bd"> 
            <table class="table table-striped table-dark" id="tbl">   
            <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from delievery where `dateandtime`=\""+id+"\"";
resultSet = statement.executeQuery(sql);   
while(resultSet.next()){
%> 
                  <tr>
                    <td>Customer Name:</td>
                    <td><B><%=resultSet.getString("name") %></B></td>
                    <td>Order Date:</td> 
                    <td><B><%=resultSet.getString("dateandtime") %></B></td>
                  </tr> 
                  <tr>
                    <td>Name:</td>
                    <td><B><%=resultSet.getString("name") %></B></td>
                    <td>Mobile:</td> 
                    <td><B><%=resultSet.getString("phone") %></B></td>
                  </tr> 
                  <tr>
                    <td>State:</td>
                    <td><B><%=resultSet.getString("state") %></B></td>
                    <td>City:</td> 
                    <td><B><%=resultSet.getString("city") %></B></td>
                  </tr>
                  <tr>
                    <td>Locality:</td>
                    <td><B><%=resultSet.getString("locality") %></B></td>
                    <td>Pin:</td> 
                    <td><B><%=resultSet.getString("pincode") %></B></td>
                  </tr>
                  <tr>
                    <td>Address:</td>
                    <td><B><%=resultSet.getString("address") %></B></td>
                    <td>Address Type:</td> 
                    <td><B><%=resultSet.getString("type") %></B></td>
                  </tr> 
                  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
            </table>  
            <table class="table table-striped" id="tbl1">
              <thead>
               <th scope="col">S.NO</th> 
               <th scope="col">Product Name</th>
               <th scope="col">Price</th>
               <th scope="col">Quantity</th>
               <th scope="col">Amount</th>
              </thead>  
              <tbody> 
                       <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from cart where `dateandtime`=\""+id+"\""; 
int count=1;
resultSet = statement.executeQuery(sql);  
while(resultSet.next()){
%> 
                <tr>
                 <td><%out.print(count);count+=1; %></td>   
                 <td><img src="<%=resultSet.getString("imgsrc") %>" height="20px" width="20px" align="left"><%=resultSet.getString("productname") %></td>
                 <td><%=resultSet.getString("presentprice") %></td>
                 <td><%=resultSet.getString("quantity") %></td>
                 <td><%=resultSet.getString("amount") %></td>
                </tr> 
                                 <%
} 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();    
String sql ="select sum(amount) from `cart` where `dateandtime`=\""+id+"\"";
resultSet = statement.executeQuery(sql); 
String total="";
while(resultSet.next()){  
%>  
                <tr>
                  <td colspan="4"><font color="black" size="4">Total Bill...</font></td>
                  <% if(resultSet.getString(1)!=null){ %>
<td><%=resultSet.getString(1) %></td>
<%} 
else{%> 
	<td>0</td>
<% }%>
</tr> 
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
                </tr>
              </tbody>
            </table>  
        </div>   
        <div class="btnheader">  
                 <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from delievery where `dateandtime`=\""+id+"\"";
resultSet = statement.executeQuery(sql);   
while(resultSet.next()){
%>  
        <% if((resultSet.getString("status")).equals("Pending")){ %>
          <a href="confirm_order.jsp?b=<%=id%>"><button class="btn btn-secondary">Confirm Order</button></a> 
          <%}%>   
          <a href="orderlist.jsp"><button class="btn btn-secondary" align="right">Back</button></a>
          <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
        </div>
    </div > 
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
     <script>
          $(".list-group-item").click(function() {
  $(this).siblings(".list-group-item").removeClass("alone");
  $(this).addClass("alone");
  });   
     </script>
  </body>
</html>