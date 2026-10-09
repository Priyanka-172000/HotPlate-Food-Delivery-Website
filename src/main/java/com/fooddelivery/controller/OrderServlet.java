package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.daoimpl.OrderDAOImpl;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.User;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        OrderDAOImpl dao = new OrderDAOImpl();
        List<Order> orders = dao.getOrdersByUser(user.getUserId());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("order-history.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Admin: update order status
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");
        OrderDAOImpl dao = new OrderDAOImpl();
        dao.updateOrderStatus(orderId, status);
        response.sendRedirect("admin/order-management.jsp");
    }
}
