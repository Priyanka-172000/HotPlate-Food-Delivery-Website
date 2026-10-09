package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.daoimpl.RestaurantDAOImpl;
import com.fooddelivery.model.Restaurant;

@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImpl dao = new RestaurantDAOImpl();
        List<Restaurant> restaurants = dao.getAllRestaurants();
        request.setAttribute("restaurants", restaurants);
        request.getRequestDispatcher("restaurants.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        RestaurantDAOImpl dao = new RestaurantDAOImpl();

        if ("add".equals(action)) {
            Restaurant r = new Restaurant();
            r.setRestaurantName(request.getParameter("restaurantName"));
            r.setCuisineType(request.getParameter("cuisineType"));
            r.setAddress(request.getParameter("address"));
            r.setImagePath(request.getParameter("imagePath"));
            dao.addRestaurant(r);
        } else if ("delete".equals(action)) {
            dao.deleteRestaurant(Integer.parseInt(request.getParameter("restaurantId")));
        }
        response.sendRedirect("admin/restaurant-management.jsp");
    }
}
