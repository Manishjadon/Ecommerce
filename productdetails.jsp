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
String id=(String)session.getAttribute("email");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
.btn
{
    min-width:50px;
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
  top:130px;
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
.center
{
margin-left:auto;
margin-right:auto; 
display:block;  
margin-top:2rem; 
height:70%;
width:30%;
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
                       <form class="form-inline" action="search.jsp" >
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                            <a href="search.jsp"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button></a>
                            <a href="cart.jsp" id="cart"><img src="D:\images\download (1).png" height="16%" width="16%"style="margin-left:2rem;" > </a>
                           <h3><span class="badge badge-secondary"> 
                           <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password); 
                            id=(String)session.getAttribute("email");
                            statement=connection.createStatement();
                            String sql ="select count(`userid`) from cart where `userid`=\""+id+"\" and `status`=\""+"Pending"+"\" and `flag`=\""+"false"+"\" and `dateandtime`=\""+"0000-00-00 00:00:00"+"\""; 
                            resultSet = statement.executeQuery(sql);  
                            while(resultSet.next()){ 
                            	String count=resultSet.getString(1); 
                            	int cn=Integer.parseInt(count);
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
                            <a class="navbar-brand" href="#"><font size="3px">LOGIN</font></a>
                            <%} %>
          </nav>  
    </div>  
    </div> 
    <div class="middle">  
      <div class="container">
         <div class="row"> 
            <div class="col">   
         
                       <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();   
id=request.getParameter("b");
String sql ="select * from product where productid="+id;
resultSet = statement.executeQuery(sql); 
resultSet.next();  
  %>
         
            <img src="<%=resultSet.getString("imgsrc") %>"  class="center">
            </div> 
            <div class="col">  
              <h1 align="center" style="min-height:14px;color:white;background-color:black;">Product Description</h1> 
              <h1><font color="red" size="5px"><I><%=resultSet.getString("productname") %></I></font></h1> <p><%=resultSet.getString("productdescription") %></p>
              <B>Price</B> <br> 
              <form class="form-contol" action="addtocart.jsp" > 
                   <label for="quantity">Quantity:</label>
                   <input type="number" size="5" min="1" max="20" name="quantity">   
                   <input type="hidden" value=<%=resultSet.getString("imgsrc")%> name="imgsrc" >
                   <input type="hidden" value=<%=resultSet.getString("productname")%> name="productname" >
                   <input type="hidden" value=<%=resultSet.getString("presentprice")%> name="presentprice" >
                   <br><br>
                   <button type="submit" class="btn btn-danger btn-sm">Add to Cart</button>&nbsp;&nbsp;&nbsp;
  
              </form>  
              <br><br><br><br>
             </div>
         </div>
      </div>  
     </div>   
      <%
      connection.close();
      } catch (Exception e) {
      e.printStackTrace();
      }
      %>
    <div class="bottom">
     <div class="firse"> 
      <nav class="navbar navbar-dark bg-primary">
           <a class="navbar-brand" href="#"><font size="3px">INFORMATION</font></a> 
           <a class="navbar-brand" href="#"><font size="3px">WHY BUY FROM US</font></a>
           <a class="navbar-brand" href="myaccount.jsp"><font size="3px">MY ACCOUNT</font></a>
           <a class="navbar-brand" href="#"><font size="3px">CONTACT US</font></a> 
      </nav>  
    </div> 
   </div>   
  </body>
</html> 