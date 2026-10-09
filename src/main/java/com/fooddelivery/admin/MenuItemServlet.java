package com.fooddelivery.admin;

import com.fooddelivery.store.JsonStore;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Handles admin "Add Menu Item" actions.
 *
 * GET  ?action=list                -> JSON array of all menu items
 * POST action=checkDuplicate       -> returns {"duplicate":"true|false"} for a name+restaurantId
 * POST action=add                  -> inserts new item (force=true bypasses duplicate check)
 * POST action=delete&id=5          -> deletes an item
 */
@WebServlet("/admin/MenuItemServlet")
public class MenuItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        resp.setContentType("application/json; charset=UTF-8");
        if ("list".equals(action)) {
            List<Map<String, String>> items = JsonStore.readAll("menu_items");
            writeJsonArray(resp.getWriter(), items);
        } else {
            resp.getWriter().write("{}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        resp.setContentType("application/json; charset=UTF-8");

        if ("checkDuplicate".equals(action)) {
            String name = req.getParameter("name") == null ? "" : req.getParameter("name").trim();
            String restaurantId = req.getParameter("restaurantId") == null ? "1" : req.getParameter("restaurantId");
            boolean dup = false;
            for (Map<String, String> item : JsonStore.readAll("menu_items")) {
                if (item.get("name") != null
                        && item.get("name").trim().equalsIgnoreCase(name)
                        && restaurantId.equals(item.get("restaurantId"))) {
                    dup = true;
                    break;
                }
            }
            resp.getWriter().write("{\"duplicate\": " + dup + "}");
            return;
        }

        if ("add".equals(action)) {
            String name        = safe(req.getParameter("name"));
            String price       = safe(req.getParameter("price"));
            String category    = safe(req.getParameter("category"));
            String veg         = safe(req.getParameter("veg"));
            String description = safe(req.getParameter("description"));
            String image       = req.getParameter("image");
            String restaurantId= safe(req.getParameter("restaurantId"));
            String force       = req.getParameter("force"); // "true" to bypass duplicate check

            if (image == null || image.trim().isEmpty()) {
                image = "images/menu/butter-chicken.jpg"; // sensible default
            }
            if (restaurantId.isEmpty()) restaurantId = "1";
            if (category.isEmpty()) category = "Main Course";
            if (veg.isEmpty()) veg = "true";

            if (name.isEmpty() || price.isEmpty()) {
                resp.getWriter().write("{\"success\": false, \"message\": \"Name and price are required\"}");
                return;
            }

            boolean isDuplicate = false;
            if (!"true".equals(force)) {
                for (Map<String, String> item : JsonStore.readAll("menu_items")) {
                    if (item.get("name") != null
                            && item.get("name").trim().equalsIgnoreCase(name)
                            && restaurantId.equals(item.get("restaurantId"))) {
                        isDuplicate = true;
                        break;
                    }
                }
            }

            if (isDuplicate) {
                resp.getWriter().write("{\"success\": false, \"duplicate\": true, \"message\": \"Item already exists for this restaurant\"}");
                return;
            }

            Map<String, String> rec = new LinkedHashMap<>();
            rec.put("name", name);
            rec.put("price", price);
            rec.put("category", category);
            rec.put("veg", veg);
            rec.put("description", description);
            rec.put("image", image);
            rec.put("restaurantId", restaurantId);
            Map<String, String> saved = JsonStore.insert("menu_items", rec);

            resp.getWriter().write("{\"success\": true, \"message\": \"Menu item added successfully!\", \"id\": \"" + saved.get("id") + "\"}");
            return;
        }

        if ("delete".equals(action)) {
            String id = req.getParameter("id");
            if (id != null) JsonStore.delete("menu_items", id);
            resp.getWriter().write("{\"success\": true}");
            return;
        }

        if ("update".equals(action)) {
            String id = req.getParameter("id");
            Map<String, String> existing = JsonStore.findById("menu_items", id);
            if (existing == null) {
                resp.getWriter().write("{\"success\": false, \"message\": \"Item not found\"}");
                return;
            }
            existing.put("name", safe(req.getParameter("name")));
            existing.put("price", safe(req.getParameter("price")));
            existing.put("category", safe(req.getParameter("category")));
            existing.put("veg", safe(req.getParameter("veg")));
            existing.put("description", safe(req.getParameter("description")));
            JsonStore.update("menu_items", id, existing);
            resp.getWriter().write("{\"success\": true, \"message\": \"Menu item updated\"}");
            return;
        }

        resp.getWriter().write("{\"success\": false, \"message\": \"Unknown action\"}");
    }

    private String safe(String s) { return s == null ? "" : s.trim(); }

    private void writeJsonArray(PrintWriter out, List<Map<String, String>> items) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < items.size(); i++) {
            Map<String, String> item = items.get(i);
            sb.append("{");
            int j = 0;
            for (Map.Entry<String, String> e : item.entrySet()) {
                if (j++ > 0) sb.append(",");
                sb.append("\"").append(e.getKey()).append("\":\"")
                  .append(jsonEscape(e.getValue())).append("\"");
            }
            sb.append("}");
            if (i < items.size() - 1) sb.append(",");
        }
        sb.append("]");
        out.write(sb.toString());
    }

    private String jsonEscape(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }
}
