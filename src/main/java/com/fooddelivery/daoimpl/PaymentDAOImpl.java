package com.fooddelivery.daoimpl;

import java.sql.*;

import com.fooddelivery.dao.PaymentDAO;
import com.fooddelivery.model.Payment;
import com.fooddelivery.util.DBConnection;

public class PaymentDAOImpl implements PaymentDAO {

    @Override
    public boolean makePayment(Payment payment) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO payments(order_id, amount, payment_method, payment_status) VALUES(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, payment.getOrderId());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getPaymentMethod());
            ps.setString(4, "Success");
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Payment getPaymentByOrderId(int orderId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM payments WHERE order_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Payment p = new Payment();
                p.setPaymentId(rs.getInt("payment_id"));
                p.setOrderId(rs.getInt("order_id"));
                p.setAmount(rs.getDouble("amount"));
                p.setPaymentMethod(rs.getString("payment_method"));
                p.setPaymentStatus(rs.getString("payment_status"));
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
