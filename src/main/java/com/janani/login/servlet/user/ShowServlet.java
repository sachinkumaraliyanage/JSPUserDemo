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

@WebServlet("/users/show")
public class ShowServlet extends HttpServlet {
    private final UserSevice userService = UserSevice.getUserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");
        if(u == null || !u.getRoles().equalsIgnoreCase("admin")){
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
        }else{
            req.setAttribute("users", userService.getAllUsers());
            req.getRequestDispatcher("../showUsers.jsp").forward(req, resp);
        }
    }
}
