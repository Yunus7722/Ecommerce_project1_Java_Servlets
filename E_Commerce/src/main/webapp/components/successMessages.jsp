<%
    String s_message =(String) session.getAttribute("s_message");
    if(s_message!=null)
    {
        %>
        
 <div class="alert alert-primary alert-dismissible fade show" role="alert">
  <strong><%=s_message%></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    <%
        session.removeAttribute("s_message");
 }
    

%>