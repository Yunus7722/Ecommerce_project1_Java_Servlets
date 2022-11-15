
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <div class="container-fluid entry">

            <div class="row mt-3">
                <div class="col-md-4 offset-md-4" >
                    <div style="border-radius: 35px 35px 35px 35px; border: 1px solid #673AB7;" class="card" >

                        <div style="border-radius: 35px 35px 0px 0px;" class="card-header  custom-bg text-white">

                            <div class="text-center">
                                <img src="img/add-friend.png" width="12%" height="12%" />
                            </div>   

                            <h3 class="text-center my-0 text-white" >Create Account</h3>
                        </div>


                        <div class="card-body px-5">
                            <%@include file="components/message.jsp" %>


                            <form action="RegisterServlet" method="post" >
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="email">E-mail Address</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone No</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="user_address" style="height: 100px;" class="form-control" placeholder="Enter Your Address"></textarea>
                                </div>
                                <div>
                                    Already have an account ? <a href="login.jsp"> Sign in</a>
                                </div>
                                <br>


                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary" >Register</button>
                                    <button type="reset" class="btn btn-primary" >Reset</button>


                                </div>

                            </form>

                        </div>
                    </div>

                </div>

            </div>


        </div>


    </div>
</body>
</html>
