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
ResultSet resultSet = null;%> 






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
        .center
{
margin-left:auto;
margin-right:auto; 
display:block;  
}  
.dropbtn {
  background-color:#007bff;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none; 
  display:inline-block;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
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
                            <a href="cart.jsp" id="cart"><img src="D:\images\download (1).png" height="16%" width="16%" style="margin-left:2rem;"> </a>
                           <h3><span class="badge badge-secondary"> 
                           <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select count(`userid`) from cart where `userid`=\""+id+"\""; 
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
                        <div class="row row-cols-1 row-cols-md-3">    
                         <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password); 
String sr=request.getParameter("search");
statement=connection.createStatement();
String sql ="select * from product where productname=\""+sr+"\"";
resultSet = statement.executeQuery(sql);  
while(resultSet.next()){
%>
                         <div class="col mb-4">
                         <div class="card">
                         <img src="<%=resultSet.getString("imgsrc") %>"  height="40%" width="40%" class="center">
                         <div class="card-body">
                         <h5 class="card-title" align="center" id="name" style="background-color:whitesmoke";><font color="red"><%=resultSet.getString("productname") %></font></h5> 
                         <h5 align="center"><%=resultSet.getString("category") %></h5>
                         <h5 align="center" ><B style="text-decoration:line-through;">Rs<%=resultSet.getString("productprice") %></B>&nbsp;&nbsp;Rs<%=resultSet.getString("presentprice") %></h5>
                         <a href="productdetails.jsp?b=<%=resultSet.getString("productid")%>"><button type="button" class="btn btn-primary btn-sm">Add to Cart</button></a>
                         <a href="productdetails.jsp?a=<%=resultSet.getString("productid")%>"><button type="button" class="btn btn-secondary btn-sm">Details</button></a>
                         </div>
                         </div>
                         </div>
                         <%
                         }
                         connection.close();
                         } catch (Exception e) {
                         e.printStackTrace();
                         }
                         %>
            
                         </div>
        </div> 
    </div> 
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
<script>
 var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
  </body>
</html> 