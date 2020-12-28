<%-- 
    Document   : login
    Created on : Dec 28, 2020, 2:03:09 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Login</h3>
                        </div>
                        
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                             
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
