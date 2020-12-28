<%-- 
    Document   : register
    Created on : Dec 28, 2020, 3:07:43 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-bidy p-5">
                            <form action="RegisterServlet" method="post">
                                <h3>Sign Up</h3>
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="name" name="user_name" class="form-control" id="name" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="password">User password</label>
                                    <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea style="height: 200px" name="user_address" class="form-control" ></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
