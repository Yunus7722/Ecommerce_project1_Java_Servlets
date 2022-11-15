<%@page import="com.practice.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.practice.entities.Category"%>
<%@page import="com.practice.helper.factoryProvider"%>
<%@page import="com.practice.entities.User"%>
<%@page import="com.practice.dao.UserDao"%>
<%@page import="com.practice.entities.Product"%>
<%@page import="com.practice.dao.ProductDao"%>
<%@page import="com.practice.dao.CategoryDao"%>
<%@page import="com.practice.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                background-image: url('img/back_1.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
            .checked {
                color : #ffa000;
                font-size : 20px;
            }
            .unchecked {
                font-size : 20px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/sidebarcol.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://kit.fontawesome.com/4ebab8c70c.js" crossorigin="anonymous"></script>
        <title>Mycart- Homepage</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%            String cat = request.getParameter("category");
//            out.println(cat);
            CategoryDao cdao = new CategoryDao(factoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();

            ProductDao pdao = new ProductDao(factoryProvider.getFactory());
            List<Product> plist = null;

            if (cat == null || cat.trim().equals("all")) {
                plist = pdao.getProducts();
            } else {
                int cid = Integer.parseInt(cat.trim());
                plist = pdao.getProductsByCategory(cid);
            }

            UserDao udao = new UserDao(factoryProvider.getFactory());
            List<User> ulist = udao.getUsers();


        %>



        <%                    User user5 = (User) session.getAttribute("current-user");

            if (plist.size() == 0) {
        %>
        <div class="container">

            <h1 style="color: #673ab7;">No items in these Category</h1>
        </div>


        <%
            }
        %>

        <!-- Vertical navbar -->
        <div class="container kakashi">
            <div class="row">
                <div class="col-md-0">
                    <div class="vertical-nav custom-bg" id="sidebar">
                        <div class="py-4 px-3 mb-4 custom-bg">
                            <div class="media d-flex align-items-center">
                                <img loading="lazy" src="img/teamwork.png" alt="..." width="80" height="80" class="mr-3 rounded-circle img-thumbnail shadow-sm">
                                <%                          if (user5 == null) {

                                %>
                                <div class="media-body">
                                    <h4 class="m-0">Sample</h4>
                                    <p class="font-weight-normal text-muted mb-0">Web developer</p>
                                </div>

                                <%                          } else {
                                %>

                                <div class="media-body">
                                    <h3 class="m-0"><%= user5.getUserName()%></h3>
                                    <p class="font-weight-normal text-muted mb-0"><%=user5.getUserType()%></p>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>

                        <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Dashboard</p>

                        <ul class="nav flex-column bg-white mb-0">
                            <li class="nav-">
                                <a href="index.jsp?category=all" class="nav-link text-dark custom-bg">
                                    <i style="color: #311b92" class="fa-sharp fa-solid fa-layer-group mr-3"></i>
                                    All Products
                                </a>
                            </li>
                            <!--start loop-->
                            <%
                                for (Category c : clist) {

                                    if (c.getCategoryId() == 1) {


                            %>

                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i style="color: #311b92; " class="fa-sharp fa-solid fa-laptop mr-3"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>

                            <%

                                }
                                if (c.getCategoryId() == 2) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i style="color: #311b92" class="fa-sharp fa-solid fa-mobile-screen-button mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 3) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i style="color: #311b92" class="fa-sharp fa-solid fa-bag-shopping mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 4) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-chair mr-4"></i>                            <%= c.getCategoryTitle()%>
                                </a>
                            </li>

                            <!--for future categories-->

                            <%

                                }
                                if (c.getCategoryId() == 5) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-plus mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 6) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-plus mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 7) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-plus mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 8) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-plus mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 9) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-plus mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }
                                if (c.getCategoryId() == 10) {
                            %>



                            <li class="nav-item">
                                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="nav-link text-dark custom-bg">
                                    <i  style="color: #311b92" class="fa-sharp fa-solid fa-plus mr-4"></i>
                                    <%= c.getCategoryTitle()%>
                                </a>
                            </li>
                            <%

                                }

                            %>



                            <%                        }


                            %>

                            <!--end loop-->
                        </ul>


                    </div>
                </div>
                <div class="col-md-12 px-5">

                    <div class="row">





                        <!--<div class="col-md-12">-->
                        <div class="card-columns">

                            <!--traversing products-->

                            <%                                for (Product p : plist) {

                            %>


                            <div class="container uchiha"> 

                                <div class="card product-card" style="width: 26rem;">
                                    <div class="container text-center">
                                        <img style="max-height: 250px; max-width: 100%; width: auto; " src="img/products/<%=p.getpPhoto()%>" class="card-img-top" alt="">

                                    </div>
                                    <div class="card-body">
                                        <h5 style="height: 50px; " class="card-title"><%=p.getpName()%></h5>
                                        <p style="height: 60px; " class="card-text"><%=Helper.get10Characters(p.getpDesc())%></p>
                                        <!--star rating start-->
                                        <%
                                            int num = p.getpRatings();
                                            if (num <= 5) {

                                                for (int i = 0; i < num; i++) {
                                        %>
                                        <span class = "fa fa-star checked"></span>


                                        <%
                                                }
                                            }

                                            int resnum = 5 - num;
                                            if (resnum > 0) {
                                                for (int j = 0; j < resnum; j++) {

                                        %>
                                        <span class = "fa fa-star unchecked"></span>                                   


                                        <%                                          }

                                            }


                                        %>
                                        <br><br>
                                        <!--star rating end-->
                                        <a href="#" class="btn orig-price" >₹ <%=Helper.getNumberinFormat(p.getpPrice())%></a>
                                        <a href="#" class="btn"> ₹ <%=Helper.getNumberinFormat(p.getPriceAfterDiscount())%>/- <span class="discount-label"><%=p.getpDiscount()%>% off </span></a>
                                        <br><br>
                                        <form action="ProductEditableServlet" method="post" >
                                            <span class="delete_button">
                                                 <input type="hidden" name="productIdToDelete" value="<%= p.getpId()%>">
                                                 <button type="submit" name="operation" value="deleteProduct" class="btn">Delete</button>
                                            </span>
                                            
                                            <span class="edit_button">
                                                 <!--<input type="hidden" name="editOperation" value="editProduct">-->
                                                 <button type="submit" name="operation" value="editProduct" class="btn">Edit</button> 
                                            </span>
                                        </form>
                                        
                                    </div>
                                </div>

                            </div>


                            <%                            }
                            %>

                        </div> 
                        <!--                        </div>-->
                    </div>
                </div>
            </div>
        </div>
        <!-- End vertical navbar -->





        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="js/sidebar.js"></script>
    </body>
</html>
