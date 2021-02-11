<%-- 
    Document   : normal
    Created on : Dec 28, 2020, 8:06:35 PM
    Author     : ASUS
--%>
<%
    
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regular User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Regular User Page</h1>
    </body>
    <%@include file="components/common_modals.jsp" %>
</html>
