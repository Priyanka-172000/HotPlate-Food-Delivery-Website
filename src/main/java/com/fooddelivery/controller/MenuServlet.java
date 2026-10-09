package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.daoimpl.MenuDAOImpl;
import com.fooddelivery.daoimpl.RestaurantDAOImpl;
import com.fooddelivery.model.Menu;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MenuDAOImpl menuDao = new MenuDAOImpl();
        List<Menu> menuItems = menuDao.getAllMenuItems();
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Admin: add/update/delete menu item
        String action = request.getParameter("action");
        MenuDAOImpl dao = new MenuDAOImpl();

        if ("add".equals(action)) {
            Menu m = new Menu();
            m.setRestaurantId(Integer.parseInt(request.getParameter("restaurantId")));
            m.setItemName(request.getParameter("itemName"));
            m.setDescription(request.getParameter("description"));
            m.setPrice(Double.parseDouble(request.getParameter("price")));
            m.setImagePath(request.getParameter("imagePath"));
            m.setCategory(request.getParameter("category"));
            dao.addMenuItem(m);
            response.sendRedirect("admin/menu-management.jsp");

        } else if ("delete".equals(action)) {
            dao.deleteMenuItem(Integer.parseInt(request.getParameter("menuId")));
            response.sendRedirect("admin/menu-management.jsp");
        }
    }
}
