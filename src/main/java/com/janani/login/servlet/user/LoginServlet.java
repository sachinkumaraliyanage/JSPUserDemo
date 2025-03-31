package com.janani.login.servlet.user;

import com.janani.login.model.User;
import com.janani.login.services.UserSevice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
    private final UserSevice userService = UserSevice.getUserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setUsername(req.getParameter("uname"));
        user.setPassword(req.getParameter("psw"));

        User b =userService.login(user);
        if(b.isLoginStatus()){
            HttpSession session = req.getSession(true);
            session.setAttribute("user", b);
            if(b.getRoles().equalsIgnoreCase("admin")){
                resp.sendRedirect(req.getContextPath()+"/users/show");
            }else{
                resp.sendRedirect(req.getContextPath()+"/index.jsp");
            }
//            req.setAttribute("user", b);
//            req.getRequestDispatcher(req.getContextPath()+"/showUsers.jsp").forward(req, resp);
        }else{

            resp.sendRedirect(req.getContextPath()+"/Login.jsp?emsg=login failed re try again");
        }

    }
}
