<%@ page import="com.janani.login.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jakli
  Date: 2025-03-30
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>show</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
  User loginUser = (User)session.getAttribute("user");
  if(loginUser!=null && !"admin".equalsIgnoreCase(loginUser.getRoles())){
    response.sendRedirect(request.getContextPath()+"/index.jsp");
  }
%>
<%
  List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container" style="margin-top:80px">
  <div class="row justify-content-center">
    <% for(User u: users){%>
      <div class="col-4">
        <div class="card mb-md-3">
          <h5 class="card-header"><%= u.getFirstName()+" "+u.getLastName() %></h5>
          <div class="card-body">
            <h5 class="card-title"><%= u.getRoles() %></h5>
            <p class="card-text">
              <ul class="list-unstyled">
                <li><strong>First Name: </strong><%= u.getFirstName() %></li>
                <li><strong>Last Name: </strong><%= u.getLastName() %></li>
                <li><strong>User Name: </strong><%= u.getUsername() %></li>
                <li><strong>Role: </strong><%= u.getRoles() %></li>
                <li><strong>Password: </strong><%= u.getPassword() %></li>
                <li><strong>Login Status: </strong><%= u.isLoginStatus() %></li>
              </ul>
            </p>
            <a href="#" class="btn btn-warning">Edit</a>
          </div>
        </div>
      </div>
    <%}%>

  </div>

</div>
</body>
</html>
