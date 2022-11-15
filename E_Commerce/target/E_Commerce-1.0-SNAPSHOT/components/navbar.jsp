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
<%@page import="com.practice.entities.User"%>
<%
    String cat2 = request.getParameter("category");
//            out.println(cat);
    CategoryDao ccdao = new CategoryDao(factoryProvider.getFactory());
    List<Category> cclist = ccdao.getCategories();

    ProductDao ppdao = new ProductDao(factoryProvider.getFactory());
    List<Product> pplist = null;

    if (cat2 == null || cat2.trim().equals("all")) {
        pplist = ppdao.getProducts();
    } else {
        int cid = Integer.parseInt(cat2.trim());
        pplist = ppdao.getProductsByCategory(cid);
    }

//            UserDao udao = new UserDao(factoryProvider.getFactory());
//            List<User> ulist = udao.getUsers();

%>


<%    User user1 = (User) session.getAttribute("current-user");

%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container" >
        <a class="navbar-brand" href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>


                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" href="index.jsp?category=all" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Product Categories
                    </a>

                    <!--start loop-->


                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="index.jsp?category=all">All Products</a>                        
                        <div class="dropdown-divider"></div>
                        <%                                for (Category c : cclist) {


                        %>
                        <a class="dropdown-item" href="index.jsp?category=<%= c.getCategoryId() %>"><%=c.getCategoryTitle() %></a>
                       <%                      }
                        %>
                    </div>

                </li>

                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
                
            </ul>
                    
            <ul class="navbar-nav ml-auto">
                
                <%                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp"><%=user1.getUserName()%></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>

                <%
                    }
                %>

            </ul>
        </div>

    </div>  
</nav>

<script src="js/Dropdown.js"></script>
