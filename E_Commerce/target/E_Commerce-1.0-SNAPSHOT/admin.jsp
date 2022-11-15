<%@page import="com.practice.dao.UserDao"%>
<%@page import="com.practice.entities.Product"%>
<%@page import="com.practice.dao.ProductDao"%>
<%@page import="com.practice.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.practice.helper.factoryProvider"%>
<%@page import="com.practice.dao.CategoryDao"%>
<%@page import="com.practice.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("D_message", "You have not Logged in yet !! login and try again ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equalsIgnoreCase("normal")) {
            session.setAttribute("D_message", "You are not a Admin !! you cannot access these page ");
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
        <title>Admin</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body {
                background-image: url('img/back_1.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }



        </style>
    </head>
    <body>
        <%            CategoryDao cdao = new CategoryDao(factoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();
            ProductDao pdao = new ProductDao(factoryProvider.getFactory());
            List<Product> plist = pdao.getProducts();
            UserDao udao = new UserDao(factoryProvider.getFactory());
            List<User> ulist = udao.getUsers();


        %>
        <%@include file="components/navbar.jsp" %>

        <%@include file="components/SideBar.jsp" %>
        <!--1st row-->

        <div  class="container admin">
            <div class="container-fluid mt-0">
                <%@include file="components/successMessages.jsp" %>
            </div>

            <div class="row mt-0">
                <!--1st col-->
                <div class="col md-4 mt-3">
                    <div  class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 175px;" class="img-fluid rounded-circle" src="img/teamwork.png" alt="alt"/>
                            </div>
                            <h3 class="mt-3"><%=ulist.size()%></h3>
                            <h3>Users</h3>
 <a href="#" target="_blank"> <p class="mt-3 text-muted">Click here to Edit Users</p></a>
                        </div>
                    </div>
                </div>
                <!--2nd col-->
                <div class="col md-4 mt-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 175px;" class="img-fluid rounded-circle" src="img/browsing.png" alt="alt"/>
                            </div>
                            <h3 class="mt-3"><%=clist.size()%></h3>
                            <h3>Categories</h3>
 <a href="#" target="_blank"> <p class="mt-3 text-muted">Click here to Edit Categories</p></a>
                        </div>
                    </div>
                </div>
                <!--3rd col-->
                <div class="col md-4 mt-3">
                    
                        <div class="card text-center"  >
                            <div class="card-body">
                                <div class="container">
                                    <img style="max-width: 175px;" class="img-fluid rounded-circle" src="img/procurement.png" alt="alt"/>
                                </div>
                                <h3 class="mt-3"><%=plist.size()%></h3>
                                <h3>Products</h3>
 <a href="AdminEdit.jsp" target="_blank"> <p class="mt-3 text-muted">Click here to Edit Products</p></a>
                            </div>
                        </div>
                    
                </div>


            </div>



            <!--2nd row-->


            <div class="row">

                <!--1st col-->
                <div class="col md-6 mt-3">
                    <div class="card text-center" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container" >
                                <img style="max-width: 200px;" class="img-fluid rounded-circle" src="img/test.png" alt="alt"/>
                            </div>
                            <p class="mt-3 text-muted">Click to add new Categories</p>
                            <h3> Add Categories</h3>
                        </div>
                    </div>
                </div>
                <!--2nd col-->
                <div class="col md-6 mt-3">
                    <div class="card text-center" data-toggle="modal" data-target="#add-product-modal" >
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 200px;" class="img-fluid rounded-circle" src="img/add-product.png" alt="alt"/>
                            </div>
                            <p class="mt-3 text-muted">Click to add new Products</p>
                            <h3>Add Products</h3>
                        </div>
                    </div>
                </div>


            </div>



        </div>

        <!-- 1st modal start-->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-top modal-lg" role="document">
                <div class="modal-content" style="border-radius: 25px 25px 25px 25px; border: 1px solid #673ab7;">
                    <div class="modal-header custom-bg text-white" style="border-radius: 25px 25px 0px 0px; " >
                        <h5 class="modal-title" id="exampleModalCenterTitle">Add Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory" >
                            <div class="form-group">
                                <label>Category Title</label>
                                <input name="catTitle" type="text" class="form-control" placeholder="Enter Here" required="true">
                            </div>
                            <div class="form-group">
                                <label>Category Description</label>
                                <textarea name="catDescription" style="height: 200px;" placeholder="Enter Description" class="form-control" required="true" ></textarea>
                            </div>
                            <div class="container text-right">

                                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Add category</button>

                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- 1st modal end-->


        <!--2nd modal start (Product Model)-->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-top modal-lg " role="document">
                <div class="modal-content" style="border-radius: 25px 25px 25px 25px; border: 1px solid #673ab7;">
                    <div class="modal-header custom-bg text-white" style="border-radius: 25px 25px 0px 0px; " >
                        <h5 class="modal-title" id="exampleModalCenterTitle">Add Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >

                            <input type="hidden" name="operation" value="addproduct">

                            <div class="form-group">
                                <label for="pName">Product Name</label>
                                <input name="pName" type="text" class="form-control" placeholder="Enter Here" required="true">
                            </div>
                            <div class="form-group">
                                <label for="pDescription" >Product Description</label>
                                <textarea name="pDescription" style="height: 100px;" placeholder="Enter Description" class="form-control" required="true" ></textarea>
                            </div>

                            <div class="form-group">
                                <label for="pPic">Product Image</label>
                                <input name="pPic" type="file" class="form-control-file" >
                            </div>


                            <%  CategoryDao catDao = new CategoryDao(factoryProvider.getFactory());
                                List<Category> list = catDao.getCategories();
                            %>
                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label for="catId">Category Type</label>
                                    <select name="catId" class="form-control" required="true" >

                                        <%
                                            for (Category c : list) {


                                        %>
                                        <option value="<%=c.getCategoryId()%>" ><%= c.getCategoryTitle()%></option>

                                        <% }%>
                                    </select>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="pRatings">Product Ratings ★</label>
                                    <select name="pRatings" class="form-control col-md-3" required="true" >
                                        <option value="5" >5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="5">1</option>
                                    </select>
                                </div>
                            </div>
                            <!--o-->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="pPrice">Price (₹)</label>
                                    <input name="pPrice" type="number" class="form-control" placeholder="Enter Here" required="true">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="pDiscount">Discount (₹)</label>
                                    <input name="pDiscount" type="number" class="form-control" placeholder="Enter Here" required="true">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="pQuantity">Quantity (₹)</label>
                                    <input  name="pQuantity" type="number" class="form-control" placeholder="Enter Here" required="true">
                                </div>

                                <!--l-->

                                <div class="container text-right mt-4 mb-3">

                                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                                    <button type="reset" class="btn btn-primary">Reset</button>
                                    <button type="submit" class="btn btn-primary">Add Product</button>

                                </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- 2nd modal end (Product Model)-->


    </body>
</html>
