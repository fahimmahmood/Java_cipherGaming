<%-- 
    Document   : index
    Created on : Dec 27, 2020, 2:20:13 PM
    Author     : ASUS
--%>

<%@page import="com.mycompany.ciphergaming.dao.CategoryDao"%>
<%@page import="com.mycompany.ciphergaming.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ciphergaming.entities.Product"%>
<%@page import="com.mycompany.ciphergaming.entities.Product"%>
<%@page import="com.mycompany.ciphergaming.dao.ProductDao"%>
<%@page import="com.mycompany.ciphergaming.dao.ProductDao"%>
<%@page import="com.mycompany.ciphergaming.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <%@include file="components/common_css_js.jsp" %>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript">
            
            $(document).on('click','#cat',function(){
                $(this).addClass('active').siblings().removeClass('active');
            })
        </script>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="row p-5">

            <%                String catId = request.getParameter("category");
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;

                if ((catId == null) || (catId.equals("all"))) {
                    list = dao.getAllProducts();
                } else {
                    int cId = Integer.parseInt(catId.trim());
                    list = dao.getAllProductsById(cId);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();


            %>

            <div class="col-md-2">
                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" id="all" aria-current="true">
                        All Products
                    </a>
                    <% for (Category category : clist) {%>
                    <a href="index.jsp?category=<%= category.getCategoryId()%>" class="list-group-item list-group-item-action" id="cat"><%= category.getCategoryTitle()%></a>
                    <% }%>    
                </div>

            </div>
            <div class="col-md-10">

                <div class="row">

                    <div class="col-md-12">

                        <div class="card-columns">

                            <% for (Product product : list) {%>

                            <div class="card text-center" style="width: 18rem;">
                                <img src="<%= product.getpPhoto()%>" class="card-img-top" alt="<%= product.getpName()%>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= product.getpName()%></h5>
                                    <p class="card-text"><%= product.getpPrice()%></p>
                                    <a href="#" class="btn btn-primary">Add to Cart</a>
                                </div>
                            </div>

                            <% }%>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
