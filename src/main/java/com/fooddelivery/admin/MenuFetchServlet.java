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
 * Public-facing endpoint used by menu.jsp to load the live menu
 * (including any items added via the admin panel) for a restaurant.
 *
 * GET ?restaurantId=1 -> JSON array of menu items for that restaurant
 */
@WebServlet("/MenuFetchServlet")
public class MenuFetchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset=UTF-8");
        String restaurantId = req.getParameter("restaurantId");
        if (restaurantId == null) restaurantId = "1";

        List<Map<String, String>> all = JsonStore.readAll("menu_items");
        List<Map<String, String>> filtered = new ArrayList<>();
        for (Map<String, String> item : all) {
            if (restaurantId.equals(item.get("restaurantId"))) {
                filtered.add(item);
            }
        }

        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < filtered.size(); i++) {
            Map<String, String> item = filtered.get(i);
            sb.append("{");
            int j = 0;
            for (Map.Entry<String, String> e : item.entrySet()) {
                if (j++ > 0) sb.append(",");
                sb.append("\"").append(e.getKey()).append("\":\"")
                  .append(jsonEscape(e.getValue())).append("\"");
            }
            sb.append("}");
            if (i < filtered.size() - 1) sb.append(",");
        }
        sb.append("]");
        resp.getWriter().write(sb.toString());
    }

    private String jsonEscape(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }
}
