package com.fooddelivery.daoimpl;

import java.sql.*;
import java.util.*;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.model.Order;
import com.fooddelivery.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public boolean placeOrder(Order order) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO orders(user_id, total_amount, status, order_date) VALUES(?,?,?,NOW())";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, "Pending");
            int rows = ps.executeUpdate();
            if (rows > 0) {
                ResultSet keys = ps.getGeneratedKeys();
                if (keys.next()) order.setOrderId(keys.getInt(1));
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Order getOrderById(int orderId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM orders WHERE order_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapOrder(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {
        List<Order> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapOrder(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.createStatement()
                .executeQuery("SELECT * FROM orders ORDER BY order_date DESC");
            while (rs.next()) list.add(mapOrder(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE orders SET status=? WHERE order_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private Order mapOrder(ResultSet rs) throws SQLException {
        Order o = new Order();
        o.setOrderId(rs.getInt("order_id"));
        o.setUserId(rs.getInt("user_id"));
        o.setTotalAmount(rs.getDouble("total_amount"));
        o.setStatus(rs.getString("status"));
        o.setOrderDate(rs.getTimestamp("order_date"));
        return o;
    }
}
