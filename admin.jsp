<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.*,java.util.*"%>
<%
//String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:/";
String database = "admin";
String userid = "root";
String password = "";
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    .header
    {
      background-color:black;    
      color:white;
      min-height:60px;
    }
    .lite .list-group-item-action:focus {
    background: transparent;
    border: 0;
    outline: 0;
        }
    .card
    {
        position:relative;
    } 
  
    #btt>a>button
    {
        text-align:center;
        min-width:200px;
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
    } 
    #first
    {
        background-color:black; 
        color:white;
    } 
    .tbl
    {
        margin-left:2.5em; 
        text-align:center;
    }
    </style>
  </head>
  <body>  
    <div class="alert alert-success" role="alert">
        <h5 align="center">Welcome to Admin page</h5> 
        </div>
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
    <div class="button-wrapper" style="flex-basis: 70rem;" id="cd2"> 
        <div class="card-body" id="btt"> 
            <a href="customer.jsp"><button type="button" class="btn btn-primary">
                            <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password); 
                            statement=connection.createStatement();
                            String sql ="select count(*) from login"; 
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){ 
                            	String count=resultSet.getString(1); 
                            	int cn=Integer.parseInt(count);
                            %>
                           <% out.print(cn);%>
                           <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
            <br>Customers</button></a>
            <a href="product.jsp"><button type="button" class="btn btn-secondary">
                            <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password); 
                            statement=connection.createStatement();
                            String sql ="select count(*) from product"; 
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){ 
                            	String count=resultSet.getString(1); 
                            	int cn=Integer.parseInt(count);
                            %>
                           <% out.print(cn);%>
                           <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
            <br>Products</button></a>
            <a href="category.jsp"><button type="button" class="btn btn-success">
                            <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password); 
                            statement=connection.createStatement();
                            String sql ="select count(*) from category"; 
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){ 
                            	String count=resultSet.getString(1); 
                            	int cn=Integer.parseInt(count);
                            %>
                           <% out.print(cn);%>
                           <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
            <br>Categories</button></a>
            <a href="orderlist.jsp"><button type="button" class="btn btn-danger">
                             <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password); 
                            statement=connection.createStatement();
                            String sql ="select count(*) from delievery"; 
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){ 
                            	String count=resultSet.getString(1); 
                            	int cn=Integer.parseInt(count);
                            %>
                           <% out.print(cn);%>
                           <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
            <br>Orders</button></a>
        </div>
        <div class="tbl">  
        <div class="header">
        <h1><font size="5px"><i>Top 10 Maximum Sold Products</i></font></h1>
        </div>
            <table height="100%" width="100%" class="table-light">
                <thead>  
                    <tr>
                    <th scope="col">S.No</th> 
                    <th scope="col">Products</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity Sold</th>
                    <th scope="col">Revenue</th> 
                    </tr>
                </thead>  
                 <tbody> 
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();  
String sql ="select * from `cart` order by `quantity` DESC";
resultSet = statement.executeQuery(sql);   
int count=1;
while(resultSet.next()){
%>  <tr> 
<td><% out.print(count);count+=1;if(count==11){break;} %></td>
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
                 </tbody>
            </table>
        </div>
    </div >
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