package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fooddelivery.daoimpl.CartDAOImpl;
import com.fooddelivery.daoimpl.OrderDAOImpl;
import com.fooddelivery.daoimpl.PaymentDAOImpl;
import com.fooddelivery.model.*;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String paymentMethod = request.getParameter("paymentMethod");

        CartDAOImpl cartDao = new CartDAOImpl();
        List<Cart> cartItems = cartDao.getCartItems(user.getUserId());

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        double total = 0;
        for (Cart item : cartItems) {
            total += item.getPrice() * item.getQuantity();
        }

        // Place order
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setTotalAmount(total);
        order.setStatus("Pending");

        OrderDAOImpl orderDao = new OrderDAOImpl();
        boolean orderPlaced = orderDao.placeOrder(order);

        if (orderPlaced) {
            // Record payment
            Payment payment = new Payment();
            payment.setOrderId(order.getOrderId());
            payment.setAmount(total);
            payment.setPaymentMethod(paymentMethod);
            payment.setPaymentStatus("Success");

            PaymentDAOImpl paymentDao = new PaymentDAOImpl();
            paymentDao.makePayment(payment);

            // Clear cart
            cartDao.clearCart(user.getUserId());

            session.setAttribute("lastOrderId", order.getOrderId());
            session.setAttribute("lastOrderTotal", total);
            response.sendRedirect("order-success.jsp");
        } else {
            response.sendRedirect("checkout.jsp?error=true");
        }
    }
}
