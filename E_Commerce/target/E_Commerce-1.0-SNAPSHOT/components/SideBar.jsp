<%@page import="com.practice.entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <style>

        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/sidebarcol.css">
    </head>
    <body>

        <%
            User user3 = (User) session.getAttribute("current-user");

        %>

        <!-- Vertical navbar -->
        <div class="container kakashi">
            <div class="vertical-nav custom-bg" id="sidebar">
                <div class="py-4 px-3 mb-4 custom-bg">
                    <div class="media d-flex align-items-center">
                        <img loading="lazy" src="img/teamwork.png" alt="..." width="80" height="80" class="mr-3 rounded-circle img-thumbnail shadow-sm">
                        <%                          if (user3 == null) {

                        %>
                        <div class="media-body">
                            <h4 class="m-0">Sample</h4>
                            <p class="font-weight-normal text-muted mb-0">Web developer</p>
                        </div>

                        <%                          } else {
                        %>

                        <div class="media-body">
                            <h3 class="m-0"><%= user3.getUserName()%></h3>
                            <p class="font-weight-normal text-muted mb-0"><%=user3.getUserType() %></p>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>

                <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Dashboard</p>

                <ul class="nav flex-column bg-white mb-0">
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-th-large mr-3 text-primary fa-fw"></i>
                            home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                            about
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                            services
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-picture-o mr-3 text-primary fa-fw"></i>
                            Gallery
                        </a>
                    </li>
                </ul>

                <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">Charts</p>

                <ul class="nav flex-column bg-white mb-0">
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-area-chart mr-3 text-primary fa-fw"></i>
                            area charts
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-bar-chart mr-3 text-primary fa-fw"></i>
                            bar charts
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-pie-chart mr-3 text-primary fa-fw"></i>
                            pie charts
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-dark custom-bg">
                            <i class="fa fa-line-chart mr-3 text-primary fa-fw"></i>
                            line charts
                        </a>
                    </li>
                </ul>
            </div>

        </div>
        <!-- End vertical navbar -->




        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="js/sidebar.js"></script>
    </body>
</html>

