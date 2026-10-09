package com.fooddelivery.daoimpl;

import java.sql.*;
import java.util.*;

import com.fooddelivery.dao.CartDAO;
import com.fooddelivery.model.Cart;
import com.fooddelivery.util.DBConnection;

public class CartDAOImpl implements CartDAO {

    @Override
    public boolean addToCart(Cart cart) {
        try (Connection con = DBConnection.getConnection()) {
            // If item already exists, update quantity
            String checkSql = "SELECT cart_id, quantity FROM cart WHERE user_id=? AND menu_id=?";
            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setInt(1, cart.getUserId());
            checkPs.setInt(2, cart.getMenuId());
            ResultSet rs = checkPs.executeQuery();
            if (rs.next()) {
                int existingQty = rs.getInt("quantity");
                int cartId = rs.getInt("cart_id");
                String updateSql = "UPDATE cart SET quantity=? WHERE cart_id=?";
                PreparedStatement upPs = con.prepareStatement(updateSql);
                upPs.setInt(1, existingQty + cart.getQuantity());
                upPs.setInt(2, cartId);
                return upPs.executeUpdate() > 0;
            }
            String sql = "INSERT INTO cart(user_id, menu_id, quantity) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cart.getUserId());
            ps.setInt(2, cart.getMenuId());
            ps.setInt(3, cart.getQuantity());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Cart> getCartItems(int userId) {
        List<Cart> items = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT c.cart_id, c.user_id, c.menu_id, c.quantity, m.item_name, m.price " +
                         "FROM cart c JOIN menu m ON c.menu_id = m.menu_id WHERE c.user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCartId(rs.getInt("cart_id"));
                cart.setUserId(rs.getInt("user_id"));
                cart.setMenuId(rs.getInt("menu_id"));
                cart.setQuantity(rs.getInt("quantity"));
                cart.setItemName(rs.getString("item_name"));
                cart.setPrice(rs.getDouble("price"));
                items.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    @Override
    public boolean updateCart(Cart cart) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE cart SET quantity=? WHERE cart_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cart.getQuantity());
            ps.setInt(2, cart.getCartId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean removeCartItem(int cartId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM cart WHERE cart_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cartId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean clearCart(int userId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM cart WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            return ps.executeUpdate() >= 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
