package com.fooddelivery.admin;

import com.fooddelivery.store.JsonStore;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * GET  ?action=list                         -> JSON array of all restaurants
 * POST action=add                           -> add new restaurant
 * POST action=toggleStatus&id=3             -> flips active/inactive
 * POST action=delete&id=3                   -> deletes a restaurant
 */
@WebServlet("/admin/RestaurantAdminServlet2")
public class RestaurantAdminServlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset=UTF-8");
        String action = req.getParameter("action");
        if ("list".equals(action)) {
            writeJsonArray(resp, JsonStore.readAll("restaurants"));
        } else {
            resp.getWriter().write("[]");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String name = safe(req.getParameter("name"));
            if (name.isEmpty()) {
                resp.getWriter().write("{\"success\":false,\"message\":\"Restaurant name is required\"}");
                return;
            }
            // duplicate check by name
            for (Map<String, String> r : JsonStore.readAll("restaurants")) {
                if (r.get("name") != null && r.get("name").equalsIgnoreCase(name)) {
                    resp.getWriter().write("{\"success\":false,\"duplicate\":true,\"message\":\"A restaurant with this name already exists\"}");
                    return;
                }
            }
            Map<String, String> rec = new LinkedHashMap<>();
            rec.put("name", name);
            rec.put("image", safeOr(req.getParameter("image"), "images/restaurants/kfc.jpg"));
            rec.put("cuisine", safe(req.getParameter("cuisine")));
            rec.put("time", safeOr(req.getParameter("time"), "30-40 min"));
            rec.put("rating", safeOr(req.getParameter("rating"), "4.0"));
            rec.put("costForTwo", safeOr(req.getParameter("costForTwo"), "300"));
            rec.put("tags", safe(req.getParameter("tags")));
            rec.put("promo", safeOr(req.getParameter("promo"), "New on HotPlate"));
            rec.put("status", "active");
            Map<String, String> saved = JsonStore.insert("restaurants", rec);
            resp.getWriter().write("{\"success\":true,\"message\":\"Restaurant added successfully!\",\"id\":\"" + saved.get("id") + "\"}");
            return;
        }

        if ("toggleStatus".equals(action)) {
            String id = req.getParameter("id");
            Map<String, String> r = JsonStore.findById("restaurants", id);
            if (r != null) {
                String cur = r.getOrDefault("status", "active");
                r.put("status", "active".equals(cur) ? "inactive" : "active");
                JsonStore.update("restaurants", id, r);
                resp.getWriter().write("{\"success\":true,\"status\":\"" + r.get("status") + "\"}");
            } else {
                resp.getWriter().write("{\"success\":false}");
            }
            return;
        }

        if ("delete".equals(action)) {
            String id = req.getParameter("id");
            if (id != null) JsonStore.delete("restaurants", id);
            resp.getWriter().write("{\"success\":true}");
            return;
        }

        resp.getWriter().write("{\"success\":false,\"message\":\"Unknown action\"}");
    }

    private String safe(String s) { return s == null ? "" : s.trim(); }
    private String safeOr(String s, String fallback) { return (s == null || s.trim().isEmpty()) ? fallback : s.trim(); }

    private void writeJsonArray(HttpServletResponse resp, List<Map<String, String>> items) throws IOException {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < items.size(); i++) {
            Map<String, String> item = items.get(i);
            sb.append("{");
            int j = 0;
            for (Map.Entry<String, String> e : item.entrySet()) {
                if (j++ > 0) sb.append(",");
                sb.append("\"").append(e.getKey()).append("\":\"").append(jsonEscape(e.getValue())).append("\"");
            }
            sb.append("}");
            if (i < items.size() - 1) sb.append(",");
        }
        sb.append("]");
        resp.getWriter().write(sb.toString());
    }

    private String jsonEscape(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }
}
