<%-- 
    Document   : admin
    Created on : Dec 28, 2020, 8:07:06 PM
    Author     : ASUS
--%>
<%@page import="com.mycompany.ciphergaming.entities.User"%>
<%
    
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message","You don't have permission to access this page!");
            response.sendRedirect("login.jsp");
            return;
        }
    }





%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin User Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Admin Panel</h1>
    </body>
</html>
