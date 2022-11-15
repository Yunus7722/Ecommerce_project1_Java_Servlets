<%@page import="com.practice.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - page</title>
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
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">

            <div class="row mt-5">
                <div class="col-md-4 offset-md-4" >
                    <div style="border-radius: 35px 35px 35px 35px; border: 1px solid #673AB7;" class="card" >

                        <div style="border-radius: 35px 35px 0px 0px;" class="card-header  custom-bg text-white">
                           
                            <div class="text-center">
                                <img src="img/locksmith.png" width="15%" height="15%" />
                                <h5>Login</h5>
                            </div>
                        </div>
                        <div class="card-body px-5">
                            <%@include file="components/loginmessage.jsp" %>
                            <%@include file="components/DangerMessages.jsp" %>

                            <form  action="LoginServlet"method="post">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control" id="myInput" placeholder="Enter your Password">

                                </div>
                                <div class="form-group">
                                    <input type="checkbox" onclick="myFunction()" id="group" > 
                                    <label for="group">Show Password</label>

                                </div>

                                <div>
                                    Doesn't have an account yet ? <a href="register.jsp"> Sign Up</a>
                                </div>
                                <br>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-primary">Reset</button>

                                </div>
                            </form> 


                        </div>

                    </div>

                </div>


            </div>


        </div>

    </body>
</html>
