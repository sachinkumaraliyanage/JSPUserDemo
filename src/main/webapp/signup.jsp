<%@ page import="com.janani.login.model.User" %><%--
  Created by IntelliJ IDEA.
  User: jakli
  Date: 2025-03-31
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignUp</title>
    <%
        String fname = request.getParameter("fname")!=null?request.getParameter("fname"):"";
        String lname = request.getParameter("lname")!=null?request.getParameter("lname"):"";
        String uname = request.getParameter("uname")!=null?request.getParameter("uname"):"";
    %>
</head>
<body onload="validateData()">
<jsp:include page="header.jsp"/>
<%
    User loginUser = (User)session.getAttribute("user");
    if(loginUser!=null){
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
%>
<div class="container" style="margin-top:80px">
    <div class="alert alert-warning alert-dismissible fade show" role="alert" style="display: <%= request.getParameter("msg")==null?"none":"block" %>">
        <strong>Warning!</strong> <%= request.getParameter("msg")%>
    </div>

    <form action="<%=request.getContextPath()+"/user/signup"%>" method="post">
        <div class="form-group">
            <label for="fName">First Name</label>
            <input type="text" class="form-control" id="fName" name="fName" oninput="validateData()" value="<%=fname%>">
        </div>
        <div class="form-group">
            <label for="lName">Last Name</label>
            <input type="text" class="form-control" id="lName" name="lName" oninput="validateData()" value="<%=lname%>">
        </div>
        <div class="form-group">
            <label for="uName">Username</label>
            <input type="text" class="form-control" id="uName" name="uName" oninput="validateData()" value="<%=uname%>">
        </div>
        <div class="form-group">
            <label for="role">Username</label>
            <select id="role" class="form-control" name="role">
                <option selected value="user">User</option>
                <option value="admin">Admin</option>
            </select>
        </div>

        <div class="form-group">
            <label for="Password1">Password</label>
            <input type="password" class="form-control" id="Password1" name="Password1" oninput="validateData()">
            <div class="invalid-feedback" id="e1">
            </div>
        </div>
        <div class="form-group">
            <label for="Password2">Comfirm Password</label>
            <input type="password" class="form-control" id="Password2" name="Password2" oninput="validateData()">
            <div class="invalid-feedback" id="e2">
            </div>
        </div>

        <button type="submit" class="btn btn-secondary" id="submitBtn" style="width: 100%">Submit</button>
    </form>
</div>
<script>
    function validateData() {
        let fName = document.getElementById('fName').value;
        let lName = document.getElementById('lName').value;
        let uName = document.getElementById('uName').value;
        let Password1 = document.getElementById('Password1').value;
        let Password2 = document.getElementById('Password2').value;
        let btnDes = false;
        if(fName=="" || lName==""||uName==""||Password1==""||Password2==""){
            btnDes=true;
        }
        if(Password1!="" && Password2!=""){
            if(Password1!=Password2){
                document.getElementById('Password1').classList.add('is-invalid');
                document.getElementById('Password2').classList.add('is-invalid');
                document.getElementById('Password1').classList.remove('is-valid');
                document.getElementById('Password2').classList.remove('is-valid');
                document.getElementById('e1').innerHTML='password mismatch';
                document.getElementById('e2').innerHTML='password mismatch';
                btnDes=true;
            }else if(Password1==""||Password2==""){
                document.getElementById('Password1').classList.remove('is-invalid');
                document.getElementById('Password2').classList.remove('is-invalid');
                document.getElementById('Password1').classList.remove('is-valid');
                document.getElementById('Password2').classList.remove('is-valid');
                document.getElementById('e1').innerHTML='';
                document.getElementById('e2').innerHTML='';
            }else{
                document.getElementById('Password1').classList.remove('is-invalid');
                document.getElementById('Password2').classList.remove('is-invalid');
                document.getElementById('Password1').classList.add('is-valid');
                document.getElementById('Password2').classList.add('is-valid');
                document.getElementById('e1').innerHTML='';
                document.getElementById('e2').innerHTML='';
            }

        }else{
            document.getElementById('Password1').classList.remove('is-invalid');
            document.getElementById('Password2').classList.remove('is-invalid');
            document.getElementById('Password1').classList.remove('is-valid');
            document.getElementById('Password2').classList.remove('is-valid');
            document.getElementById('e1').innerHTML='';
            document.getElementById('e2').innerHTML='';
        }

        document.getElementById('submitBtn').disabled = btnDes;
        document.getElementById('submitBtn').classList.remove(btnDes?'btn-success':'btn-secondary');
        document.getElementById('submitBtn').classList.add(btnDes?'btn-secondary':'btn-success');

    }

</script>
</body>
</html>
