<%-- 
    Document   : index
    Created on : Dec 27, 2020, 2:20:13 PM
    Author     : ASUS
--%>

<%@page import="com.mycompany.ciphergaming.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <h1>creating session factory object</h1>
        <%
            out.println(FactoryProvider.getFactory());
        %>
    </body>
</html>
