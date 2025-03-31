<%@ page import="com.janani.login.model.User" %>
<link rel="stylesheet" href="<%=request.getContextPath()+"/custom/bootstap/css/bootstrap.min.css"%>">
    <script src=href="<%=request.getContextPath()+"/custom/bootstap/js/bootstrap.min.js"%>"></script>
<%
    User logUser = (User)session.getAttribute("user");

%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <ul class="navbar-nav">
        <li class="nav-item <%=getActivePage("index.jsp",request)%>">
            <a class="nav-link" href="<%=request.getContextPath()+"/index.jsp"%>">Home</a>
        </li>
        <% if(logUser==null){ %>
            <li class="nav-item <%=getActivePage("Login.jsp",request)%>">
                <a class="nav-link" href="<%=request.getContextPath()+"/Login.jsp"%>">Login</a>
            </li>
            <li class="nav-item <%=getActivePage("signup.jsp",request)%>">
                <a class="nav-link" href="<%=request.getContextPath()+"/signup.jsp"%>">Sign Up</a>
            </li>
        <% }else{%>
            <li class="nav-item <%=getActivePage("showUsers.jsp",request)%>">
                <a class="nav-link" href="<%=request.getContextPath()+"/users/show"%>">User List</a>
            </li>
        <%} %>
    </ul>

    <% if(logUser!=null){ %>
        <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item active">
                <a class="nav-link">
                    <%=(logUser.getFirstName()+" "+logUser.getLastName()+"( "+logUser.getRoles()+" )").toUpperCase()%>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-danger" href="<%=request.getContextPath()+"/user/logout"%>">LogOut</a>
            </li>
        </ul>
    <% } %>


</nav>

<%!
    String getActivePage(String linkName,HttpServletRequest req){
        return req.getRequestURI().contains(linkName)?"active":"";
    }
%>