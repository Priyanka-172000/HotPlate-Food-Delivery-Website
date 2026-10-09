package com.fooddelivery.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Handles admin panel login. Uses a fixed admin/admin123 credential pair
 * so the admin panel works out-of-the-box with no database setup required.
 */
@WebServlet("/admin/AdminLoginServlet2")
public class AdminLoginServlet2 extends HttpServlet {

    private static final String ADMIN_USER = "admin";
    private static final String ADMIN_PASS = "admin123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (ADMIN_USER.equals(username) && ADMIN_PASS.equals(password)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("isAdmin", "true");
            session.setAttribute("adminName", "Admin User");
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/admin-login.jsp?error=1");
        }
    }
}
