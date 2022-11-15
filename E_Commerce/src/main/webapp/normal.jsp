<%@page import="com.practice.entities.User"%>
<%
    User user2= (User)session.getAttribute("current-user");
    
    if(user2==null)
    {
        session.setAttribute("D_message", "You have not Logged in yet !! login and try again ");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user2.getUserType().equalsIgnoreCase("admin"))
        {
            session.setAttribute("D_message", "if you are a Admin !! Try to login as a admin ");
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
        <title>Normal - user</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
         <%@include file="components/SideBar.jsp" %>
        <h1>These is Normal Panel</h1>
    </body>
</html>
