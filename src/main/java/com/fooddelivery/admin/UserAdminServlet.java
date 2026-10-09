package com.fooddelivery.admin;

import com.fooddelivery.store.JsonStore;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * GET  ?action=list   -> JSON array of all registered users (admin panel)
 * POST action=register -> creates a new user account (used by register.jsp)
 */
@WebServlet("/admin/UserAdminServlet")
public class UserAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset=UTF-8");
        String action = req.getParameter("action");
        if ("list".equals(action)) {
            List<Map<String, String>> users = JsonStore.readAll("users");
            StringBuilder sb = new StringBuilder("[");
            for (int i = 0; i < users.size(); i++) {
                Map<String, String> u = users.get(i);
                sb.append("{");
                sb.append("\"id\":\"").append(esc(u.get("id"))).append("\",");
                sb.append("\"name\":\"").append(esc(u.get("name"))).append("\",");
                sb.append("\"email\":\"").append(esc(u.get("email"))).append("\",");
                sb.append("\"phone\":\"").append(esc(u.get("phone"))).append("\",");
                sb.append("\"address\":\"").append(esc(u.get("address"))).append("\",");
                sb.append("\"joined\":\"").append(esc(u.get("joined"))).append("\"");
                sb.append("}");
                if (i < users.size() - 1) sb.append(",");
            }
            sb.append("]");
            resp.getWriter().write(sb.toString());
        } else {
            resp.getWriter().write("[]");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        String action = req.getParameter("action");

        if ("register".equals(action)) {
            String name     = safe(req.getParameter("name"));
            String email    = safe(req.getParameter("email"));
            String phone    = safe(req.getParameter("phone"));
            String password = safe(req.getParameter("password"));
            String address  = safe(req.getParameter("address"));

            if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
                resp.getWriter().write("{\"success\":false,\"message\":\"Name, email and password are required\"}");
                return;
            }

            for (Map<String, String> u : JsonStore.readAll("users")) {
                if (u.get("email") != null && u.get("email").equalsIgnoreCase(email)) {
                    resp.getWriter().write("{\"success\":false,\"message\":\"An account with this email already exists\"}");
                    return;
                }
            }

            Map<String, String> rec = new LinkedHashMap<>();
            rec.put("name", name);
            rec.put("email", email);
            rec.put("phone", phone);
            rec.put("password", password);
            rec.put("address", address);
            rec.put("joined", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            Map<String, String> saved = JsonStore.insert("users", rec);

            resp.getWriter().write("{\"success\":true,\"message\":\"Account created successfully!\",\"id\":\"" + saved.get("id") + "\"}");
            return;
        }

        resp.getWriter().write("{\"success\":false,\"message\":\"Unknown action\"}");
    }

    private String safe(String s) { return s == null ? "" : s.trim(); }
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", " ");
    }
}
