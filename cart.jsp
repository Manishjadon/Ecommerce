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
int cn=0;
String id=(String)session.getAttribute("email");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
if(session.getAttribute("email")==null)
{
	response.sendRedirect("login.jsp");
}
%>







<!doctype html>
<html lang="en">
  <head>  
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <title>Manish</title> 
    <style>
        .fir a:hover 
        {
            background-color:#007bff;
        }   
        .firse
        {
          margin-top: 10%;
        }  
        #cart
        {
          margin-right:-26%;
        }  
        .top
{
  position:fixed;
  top:0;
  left:6px;
  right:6px;
} 
.middle
{
  position:fixed;
  top:170px;
  bottom:80px;
  left:0;
  right:0;
  overflow:auto;
} 
.bottom
{
  position:fixed;
  bottom:0;
  left:6px;
  right:6px;
}  
.dropbtn {
  background-color:#007bff;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: whitesmoke;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #007bff;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: #007bff;}
    </style>
  </head>
  <body>  
    <div class="top">
    <nav class="navbar navbar-light ">
          <a class="navbar-brand"><i>Online Shopping Karona</i></a>
          <form class="form-inline" action="search.jsp">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>  
                <a href="cart.jsp" id="cart"><img src="D:\images\download (1).png" height="16%" width="16%"style="margin-left:2rem;" > </a>
                <h3><span class="badge badge-secondary">
                <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select count(`userid`) from cart where `userid`=\""+id+"\" and `status`=\""+"Pending"+"\" and `flag`=\""+"false"+"\" and `dateandtime`=\""+"0000-00-00 00:00:00"+"\""; 
                       
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){ 
                            	String count=resultSet.getString(1); 
                            	 cn=Integer.parseInt(count);
                            %>
                           Cart(<% out.print(cn);%>) 
                           <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
                </span></h3>   
          </form>
    </nav>     
    <div class="fir"> 
          <nav class="navbar navbar-dark bg-primary">
               <a class="navbar-brand" href="frontpage.jsp"><font size="3px">HOME</font></a> 
                    <div class="dropdown">
                           <button class="dropbtn">CATEGORIES</button>
                           <div class="dropdown-content">  
                           <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select * from category";
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){
                            %> 
                            <a href="show.jsp?b=<%=resultSet.getString("categoryname")%>"><%=resultSet.getString("categoryname") %></a> 
                            <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
                            </div>  
                            </div>
                            <div class="dropdown">
                            <button class="dropbtn">TOP BRANDS</button>
                            <div class="dropdown-content">  
                            <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select * from product order by quantity";
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){
                            %> 
                            <a href="showbrands.jsp?b=<%=resultSet.getString("productname")%>"><%=resultSet.getString("productname") %></a> 
                            <%
                             }
                             connection.close();
                             } catch (Exception e) {
                             e.printStackTrace();
                             }
                             %>
                            </div> 
                            </div>
               <a class="navbar-brand" href="myhistory.jsp"><font size="3px">HISTORY</font></a> 
               <%if(session.getAttribute("email")!=null)
            	  {%>
            	  <a class="navbar-brand" href="logout.jsp"><font size="3px">LOGOUT</font></a>
            	  <%}
               else{%>
               <a class="navbar-brand" href="login.jsp"><font size="3px">LOGIN</font></a>
               <%} %>
          </nav>  
    </div>  
    </div> 
    <div class="middle"> 
                          <%if(cn==0){%>  
                          <div class="alert alert-danger" role="alert">
                               <h4 class="alert-heading" align="center">Oops!</h4>
                         <p align="center">Your cart is empty!.</p>
                       <hr>
                             <p class="mb-0" align="center">Add items in your cart.</p>
                         </div>
                        	 <% }else{%>
                      
            <h2 align="center">Cart Details</h1>  
            <table class="table table-striped table-dark">
             <thead> 
             <tr>
             <th scope="col">S.NO</th>
             <th scope="col">Product</th>
             <th scope="col">Price</th>
             <th scope="col">Quantity</th>
             <th scope="col">Amount</th> 
             <th scope="col">Operation</th> 
             </tr>
             </thead> 
              <tbody id="dl">  
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();  
String sql ="select * from `cart` where `userid`=\""+id+"\" and `status`=\""+"Pending"+"\" and `flag`=\""+"false"+"\" and `dateandtime`=\""+"0000-00-00 00:00:00"+"\"";
resultSet = statement.executeQuery(sql);   
int count=1;
while(resultSet.next()){
%>  <tr> 
<td><% out.print(count);count+=1; %></td>
<td><img src="<%=resultSet.getString("imgsrc") %>" height="20px" width="20px" align="left"><%=resultSet.getString("productname") %></td>  
<td><%=resultSet.getString("presentprice") %></td> 
<td><%=resultSet.getString("quantity") %></td> 
<td><%=resultSet.getString("amount") %></td> 
<td class="text-center"><a href="deletecart.jsp?d=<%=resultSet.getString("sno")%>"><button type="button"  class="btn btn-danger">Delete</button></a></td>
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
String sql ="select sum(amount) from `cart` where `userid`=\""+id+"\" and `status`=\""+"Pending"+"\" and `flag`=\""+"false"+"\" and `dateandtime`=\""+"0000-00-00 00:00:00"+"\"";
resultSet = statement.executeQuery(sql); 
String total="";
while(resultSet.next()){  
%> 
<tr>
<td colspan="4">Total Bill...</td> 
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

                </tbody> 
                </table>  
                <a href="placeorder.jsp"><button class="btn btn-success">Place Order</button></a> 
                <br><br><br><br>
    </div><%} %>
    <div class="bottom">
     <div class="firse"> 
      <nav class="navbar navbar-dark bg-primary">
           <a class="navbar-brand" href="#"><font size="3px">INFORMATION</font></a> 
           <a class="navbar-brand" href="#"><font size="3px">WHY BUY FROM US</font></a>
           <a class="navbar-brand" href="myaccount.jsp"><font size="3px">MY ACCOUNT</font></a>
           <a class="navbar-brand" href="#"><font size="3px">CONTACT</font></a> 
      </nav>  
     </div> 
    </div>   
  </body>
</html> 