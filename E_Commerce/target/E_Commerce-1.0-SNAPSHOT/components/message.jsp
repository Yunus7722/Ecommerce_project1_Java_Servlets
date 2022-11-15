<%
    String message =(String) session.getAttribute("message");
    if(message!=null)
    {
        %>
        
 <div class="alert alert-info alert-dismissible fade show" role="alert">
  <strong><%=message%></strong><a href="login.jsp" class="alert-link">  ..Sign in</a> To Continue.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    <%
        session.removeAttribute("message");
 }
    

%>