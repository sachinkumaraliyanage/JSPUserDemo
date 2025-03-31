<%@ page import="com.janani.login.model.User" %><%--
  Created by IntelliJ IDEA.
  User: jakli
  Date: 2025-03-30
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        form {border: 3px solid #f1f1f1;}

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<%
    User loginUser = (User)session.getAttribute("user");
    if(loginUser!=null){
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
%>
        <form action="<%=request.getContextPath()+"/user/login"%>" method="post">
    <div class="container" style="margin-top:80px">
        <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: <%= request.getParameter("emsg")==null?"none":"block" %>">
            <strong>Error!</strong> <%= request.getParameter("emsg")%>
        </div>
        <div class="alert alert-success alert-dismissible fade show" role="alert" style="display: <%= request.getParameter("smsg")==null?"none":"block" %>">
            <strong>Success!</strong> <%= request.getParameter("smsg")%>
        </div>
        <label for="uname"><b>Username</b></label>
        <input id="uname" type="text" placeholder="Enter Username" name="uname" required>

        <label for="psw"><b>Password</b></label>
        <input id="psw" type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit">Login</button>

    </div>


</form>

</body>
</html>

