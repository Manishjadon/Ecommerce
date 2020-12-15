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
        .card
        {
        margin-left:10rem;
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
                            String id=(String)session.getAttribute("email");
                            statement=connection.createStatement();
                            String sql ="select count(`userid`) from cart where `userid`=\""+id+"\" and `status`=\""+"Pending"+"\" and `flag`=\""+"false"+"\""; 
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
            <h2 align="center"><B>Delivery Address</B></h1>  
            
    <div class="card" style="width: 50rem;">
        <div class="card-body">  
            <form class="needs-validation" action="Address.jsp">
                <div class="form-row">
                        <div class="col-md-6 mb-3">
                              <label for="validationCustom01">Name</label>
                              <input type="text" class="form-control" id="validationCustom01" name="name" placeholder="Enter Name" required>
                        </div>
                        <div class="col-md-6 mb-3">
                              <label for="validationCustom02">10-Digit Phone Number</label>
                              <input type="number" class="form-control" id="validationCustom02" name="phone" placeholder="10-Digit Phone Number" required>
                        </div>
                </div>
                <div class="form-row">
                        <div class="col-md-6 mb-3">
                              <label for="validationCustom03">City</label>
                              <input type="text" class="form-control" id="validationCustom03" name="city" placeholder="City" required>
                        </div>
                        <div class="col-md-3 mb-3">
                              <label for="validationCustom04">State</label>
                              <select class="custom-select" name="state" id="validationCustom04" required>
                                     <option selected disabled value="">Choose</option> 
                                     <option>Arunachal Pradesh</option> 
                                     <option>Andhra Pradesh</option> 
                                     <option>Himachal Pradesh</option>
                                     <option>Uttar Pradesh</option> 
                                     <option>Madhya Pradesh</option> 
                              </select>
                        </div>
                        <div class="col-md-3 mb-3">
                              <label for="validationCustom05">Pin Code</label>
                              <input type="text" class="form-control" id="validationCustom05" name="pin" placeholder="Pin Code" required>
                        </div> 
                </div>
                <div class="form-row"> 
                        <div class="col-md-12 mb-3"> 
                              <label for="validationCustom06" id="validationCustom06" required>Adress</label> 
                              <textarea class="form-control" id="validationCustom06" name="address" placeholder="Address" required></textarea>
                        </div>
                 </div> 
                 <div class="form-row"> 
                        <div class="col-md-12 mb-3"> 
                              <label for="validationCustom06" id="validationCustom06" required>Locality</label> 
                              <input type="text" class="form-control" id="validationCustom06" name="locality" placeholder="Locality"required>
                        </div>
                 </div > 
                 <div class="rad"> 
                    <h5>Delievery Type</h5>
                    <input type="radio" name="radio" value="Home(All Day)" required>Home(All Day) &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio" value="Work Between 10am to 5pm)" required>(Work Between 10am to 5pm)
                  </div>
                <button class="btn btn-primary" type="submit" id="bt">Place Order</button> 
              </form> 
              <br><br><br><br>
        </div>
    </div>
            
    </div>
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