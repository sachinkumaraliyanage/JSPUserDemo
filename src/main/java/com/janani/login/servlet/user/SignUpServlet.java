package com.janani.login.servlet.user;

import com.janani.login.model.User;
import com.janani.login.services.UserSevice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/user/signup")
public class SignUpServlet extends HttpServlet {
    private final UserSevice userSevice = UserSevice.getUserService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User(req.getParameter("uName"), req.getParameter("Password1"),
                req.getParameter("fName"), req.getParameter("lName"), req.getParameter("role"));
        String urlParam="?uname="+req.getParameter("uName")+
                "&fname="+req.getParameter("fName")+
                "&lname="+req.getParameter("lName");
        if(userSevice.isExistUserName(user)){
             urlParam+="&msg= User Name alrady Exists! Try New User Name";
            resp.sendRedirect(req.getContextPath()+"/signup.jsp"+urlParam);
        }else{
            boolean result = userSevice.addUser(user);
            if(result){
                resp.sendRedirect(req.getContextPath()+"/Login.jsp?smsg=User Added Successfully. Try Login");
            }else{
                urlParam+="&msg= Error Adding User. Try Again";
                resp.sendRedirect(req.getContextPath()+"/signup.jsp"+urlParam);
            }
        }
    }
}
