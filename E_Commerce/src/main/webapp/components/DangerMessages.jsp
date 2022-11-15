<%
    String n_message =(String) session.getAttribute("D_message");
    if(n_message!=null)
    {
        %>
        
 <div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><%=n_message%></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    <%
        session.removeAttribute("D_message");
 }
    

%>