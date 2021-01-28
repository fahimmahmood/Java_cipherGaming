<%-- 
    Document   : admin
    Created on : Dec 28, 2020, 8:07:06 PM
    Author     : ASUS
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ciphergaming.entities.Category"%>
<%@page import="com.mycompany.ciphergaming.dao.CategoryDao"%>
<%@page import="com.mycompany.ciphergaming.helper.FactoryProvider"%>
<%@page import="com.mycompany.ciphergaming.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You don't have permission to access this page!");
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
        <script>
            function hidediv(){
                document.getElementById("hidediv").style.display="none";
            }
            setTimeout("hidediv()",6000);
        </script>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>



        <div class="container mt-5 admin">

            <div class="container-fluid" id="hidediv">

                <%@include file="components/message.jsp"%>

            </div>

            <div class="row mb-5">

                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img src="img/user.png" alt="user_icon" class="img-fluid rounded-circle" style="max-width: 130px;">
                            </div>
                            <h1>2342</h1>
                            <h1 class="text-muted">Users</h1>

                        </div>

                    </div>

                </div>



                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img src="img/categorylist.png" alt="product_list_icon" class="img-fluid rounded-circle" style="max-width: 130px;">
                            </div>
                            <h1>1593</h1>
                            <h1 class="text-muted">Categories</h1>

                        </div>

                    </div>

                </div>       


                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img src="img/product.png" alt="shipping_icon" class="img-fluid rounded-circle" style="max-width: 130px;">
                            </div>
                            <h1>2342</h1>
                            <h1 class="text-muted">Products</h1>

                        </div>

                    </div>
                </div>   



            </div>

            <div class="row mt-5">

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img src="img/addcategory.png" alt="add_category_icon" class="img-fluid rounded-circle" style="max-width: 130px;">
                            </div>
                            <p>Click here to add new category</p>
                            <h1 class="text-muted">Add Category</h1>

                        </div>

                    </div>

                </div>

                <div class="col-md-6" data-toggle="modal" data-target="#add-product-modal">

                    <div class="card"> 

                        <div class="card-body text-center">

                            <div class="container">
                                <img src="img/addproduct.png" alt="add_product_icon" class="img-fluid rounded-circle" style="max-width: 130px;">
                            </div>
                            <p>Click here to add new product</p>
                            <h1 class="text-muted">Add Product</h1>

                        </div>

                    </div>

                </div>  

            </div>

        </div>


        <!-- Modal for adding category -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLongTitle">Insert details for the new Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="POST">

                            <input type="hidden" name="operation" value="addCategory"/>

                            <div class="form-group">

                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required/>

                            </div>

                            <div class="form-group">

                                <textarea style="height: 350px" name="catDescription" class="form-control" placeholder="Enter Category Description"  required></textarea>

                            </div>

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>

                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>




        <!-- Modal for adding Product -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="POST" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addProduct"/>
                            
                            <div class="form-group">

                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/>

                            </div>

                            <div class="form-group">

                                <textarea style="height: 250px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required/>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required/>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="Enter number of products available" name="pQuantity" required/>

                            </div>

                            <%                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();

                            %>

                            <div class="form-group">
                                <label for="catId">Select category of the product :</label>
                                <select name="catId" class="form-control" id="catId">
                                    <%                                    for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>

                                    <% }%>
                                </select>

                            </div>

                            <div class="form-group">
                                <label for="pPic">Upload a photo for the product : </label>

                                <input type="file"
                                       id="pPic" name="pPic"
                                       accept="image/png, image/jpeg" required >

                            </div> 

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>

                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
