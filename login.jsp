

<!doctype html>
<html lang="en">
<%if(session.getAttribute("email")!=null)
	{
	response.sendRedirect("myaccount.jsp");
	}%>
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
            background-color:white;
        }   
        .firse
        {
          margin-top: 10%;
        } 
    </style>
  </head>
  <body>      
    
    
    <div class="container" >  
  <%    
       if(session.getAttribute("msg")!=null) 
       {%>  
       <div class="alert alert-danger" role="alert" style="text-align:center;"> 
       <% 
    	out.println(session.getAttribute("msg"));
    	session.setAttribute("msg", null); 
       }
    %>
</div>
      <div class="row">
        <div class="col-sm-3">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" align="center">Existing Customers</h5>
              <form action="checkuser.jsp" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">UserID</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" name="pass" id="exampleInputPassword1">
                </div>
                <button type="submit" class="btn btn-primary">Sign In</button>
              </form>
            </div>
          </div>
        </div> 
        <div class="col-sm-6">
          <div class="card" >
            <div class="card-body">
              <h5 align="center">Register New Account</h5>
              <form action="adduser.jsp">
                <div class="form-row">
                      <div class="col-md-6 mb-3">
                           <label for="validationServer01">First name</label>
                           <input type="text" class="form-control" name="first" id="validationServer01"  required>
                      </div>
                      <div class="col-md-6 mb-3">
                           <label for="validationServer02">Last name</label>
                           <input type="text" class="form-control" name="last" id="validationServer02"  required>
                     </div> 
                </div>
                <div class="form-row">
                      <div class="col-md-6 mb-3">
                    <label for="exampleInputEmail1">UserID</label>
                    <input type="email" class="form-control" name="user" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                     </div> 
                     <div class="col-md-3 mb-3">
                           <label for="validationserver04">Password</label> 
                           <input type="password" class="form-control" name="pass" id="validationserver04" required>
                     </div>  
                </div>
                <div class="form-group">
                         
                      <div  id="invalidCheck3Feedback" class="invalid-feedback">
                            You must agree before submitting.
                     </div>
                </div>
                <button class="btn btn-primary" type="submit">Create Account</button> 
            </form> 
            <br> 
            </div>
          </div>
        </div>  
        <div class="col-sm-3">
          <div class="card" mt="5">
            <div class="card-body">
                <img src="D:\images\download.png" height="295px" width="215px">
            </div>
          </div>
        </div>
      </div>  
     </div>  
     <div class="firse"> 
      <nav class="navbar navbar-dark bg-primary">
           <a class="navbar-brand" href="#">INFORMATION</a> 
           <a class="navbar-brand" href="#">WHY BUY FROM US</a>
           <a class="navbar-brand" href="#">MY ACCOUNT</a>
           <a class="navbar-brand" href="#">CONTACT</a> 
      </nav>  
</div> 
  </body>
</html> 