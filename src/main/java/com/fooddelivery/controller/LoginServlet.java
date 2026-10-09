package com.fooddelivery.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.daoimpl.UserDAOImpl;
import com.fooddelivery.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAOImpl dao = new UserDAOImpl();

        User user = dao.loginUser(email, password);

        if(user != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute("user", user);

            // Check if there's a redirect destination (e.g., from checkout)
            String redirect = request.getParameter("redirect");
            if ("checkout".equals(redirect)) {
                response.sendRedirect("checkout.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        }
        else {

            String redirect = request.getParameter("redirect");
            if (redirect != null && !redirect.isEmpty()) {
                response.sendRedirect("login.jsp?redirect=" + redirect);
            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }
}
