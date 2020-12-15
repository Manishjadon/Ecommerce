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
    .card
    {
        position:relative;
    } 
  
    #btt>button
    {
        text-align:center;
        min-width:262px;
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
    }  
    .left
    {
    margin-left:-8%;
    }
    
    #first
    {
        background-color:black; 
        color:white;
    }  
    #hii
    {
       background-color:black; 
        color:white; 
        min-height:65px; 
        margin-top:2.5rem;  
        margin-left:1.5rem;
        margin-right:1.5rem;  
    } 
    #tbl
    {
        margin-top:1.5rem;   
        width:95%; 
        margin-left:1.5rem; 
        text-align:center;
    } 
    #at
    {
        text-align:center; 
        background-color: whitesmoke; 
        margin-left:8%;
        margin-right:8%;
    }  
    #ctg
    {
        margin-left:11.5rem;
    } 
    .right
    {
        margin-left:16%; 
      margin-right:-12%;
    }
    </style>
  </head>
  <body>  
        <div class="container"> 
        <div class="left">  
        <div class="card" style="width:100%;" id="MAN"> 
        <div class="sidebar-pannel">
        <img src="D:\images\Admin.jpg" class="card-img-top" alt="...">
        <div class="list-group"> 
            <li class="list-group-item">Administrator</li>
            <li class="list-group-item">Manish</li> 
            <div class="lite">
            <a href="admin.jsp" class="list-group-item list-group-item-action" >Home</a>
            <a href="category.jsp" class="list-group-item list-group-item-action alone">Categories</a>
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
        <div class="card-body" id="btt"> 
         <h1 align="center" id="hii">Categories Management</h1>
        </div> 
        <div class="tt">   
            <div class="card" id="at">
                <form  action="addcategory.jsp" method="post">
                  <div class="form-group">
                    <label for="Categories Name"><b>Category Name</b></label>
                    <input type="text" name="category" class="form-control" placeholder="Category Name" style="width:300px;margin-left:32%;">
                  </div>    
                  <button type="submit" class="btn btn-primary" id="creator" ">Add Category</button> 
                  </form>
            </div>
        </div>  
        <div class="bd"> 
            <table class="table table-striped table-dark" id="tbl"> 
              <thead>
                <tr>
                  <th scope="col">Category ID</th>
                  <th scope="col">Category Name</th>
                  <th scope="col">Operation</th>
                </tr> 
              </thead> 
               <tbody id="dl">
    </tr>  
    <tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from category"; 
int count=1;
resultSet = statement.executeQuery(sql);  
while(resultSet.next()){
%>
<tr>  
<td><% out.print(count);count+=1; %></td>
<td><%=resultSet.getString("categoryname") %></td>   
   <td class="text-center"><a href="delete1.jsp?d=<%=resultSet.getString("categoryid")%>"><button type="button"  class="btn btn-danger">Delete</button></a></td>
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