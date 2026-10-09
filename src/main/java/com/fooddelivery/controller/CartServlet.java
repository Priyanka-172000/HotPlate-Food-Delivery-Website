package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.daoimpl.CartDAOImpl;
import com.fooddelivery.model.Cart;
import com.fooddelivery.model.User;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        CartDAOImpl dao = new CartDAOImpl();

        if ("add".equals(action)) {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            int qty = 1;
            try { qty = Integer.parseInt(request.getParameter("quantity")); } catch(Exception ignored){}

            Cart cart = new Cart();
            cart.setUserId(user.getUserId());
            cart.setMenuId(menuId);
            cart.setQuantity(qty);
            dao.addToCart(cart);
            response.sendRedirect("cart.jsp");

        } else if ("remove".equals(action)) {
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            dao.removeCartItem(cartId);
            response.sendRedirect("cart.jsp");

        } else if ("update".equals(action)) {
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int qty = Integer.parseInt(request.getParameter("quantity"));
            Cart cart = new Cart();
            cart.setCartId(cartId);
            cart.setQuantity(qty);
            if (qty <= 0) dao.removeCartItem(cartId);
            else dao.updateCart(cart);
            response.sendRedirect("cart.jsp");

        } else if ("clear".equals(action)) {
            dao.clearCart(user.getUserId());
            response.sendRedirect("cart.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
