



<!doctype html>
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
    height: 80vh;
    overflow-y: auto;  
    position:fixed; 
    margin-left:-7%; 
    } 
    #first
    {
        background-color:black; 
        color:white;
    }   
    .right
    {
      margin-left:20%; 
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
            <h1 align="center">Edit Product Details</h1>  
        </div>
        <div class="bd">   
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product where productid="+request.getParameter("b");
resultSet = statement.executeQuery(sql);  
while(resultSet.next()){
%> 

          <form class="needs-validation" action="updateproduct.jsp">
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom01">Product Name</label>
                  <input type="text" class="form-control" id="validationCustom01" value=<%=resultSet.getString("productname") %> placeholder="Product Name" name="productname" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="validationCustom02">Product Category</label>
                  <input type="text" class="form-control" id="validationCustom02" value=<%=resultSet.getString("category") %> placeholder="Product Category"  name="category" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom03">Product Price</label>a
                  <input type="text" class="form-control" id="validationCustom03" value=<%=resultSet.getString("productprice") %> placeholder="Product Price" name="productprice" required>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="validationCustom05">Product Photo</label>
                  <input type="file" class="form-control" id="validationCustom05" value=<%=resultSet.getString("imgsrc") %> name="img" required>
                </div> 
              </div>  
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom01">Discount Price</label>
                  <input type="text" class="form-control" id="validationCustom01" value=<%=resultSet.getString("discountprice") %> placeholder="Discount  Price" name="discountprice" required >
                </div>
              </div>
                <div class="form-row"> 
                  <div class="col-md-12 mb-3"> 
                   <label for="validationCustom06" id="validationCustom06" required>Description</label> 
                    <textarea class="form-control" id="validationCustom06"  name="productdescription" required><%=resultSet.getString("productdescription") %></textarea>
                  </div>
                </div>    
                <input type=hidden name="b" value=<%=request.getParameter("b")%>>
              <button class="btn btn-primary" type="submit" id="bt">Update Product</button>   
              </div>
            </form> 
            <%}
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