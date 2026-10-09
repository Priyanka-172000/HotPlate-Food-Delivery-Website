package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.Order;

public interface OrderDAO {

    boolean placeOrder(Order order);

    Order getOrderById(int orderId);

    List<Order> getOrdersByUser(int userId);

    List<Order> getAllOrders();

    boolean updateOrderStatus(int orderId, String status);
}