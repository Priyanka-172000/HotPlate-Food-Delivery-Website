package com.fooddelivery.daoimpl;

import java.sql.*;
import java.util.*;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.Menu;
import com.fooddelivery.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public boolean addMenuItem(Menu menu) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO menu(restaurant_id, item_name, description, price, image_path, category) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setString(5, menu.getImagePath());
            ps.setString(6, menu.getCategory());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Menu getMenuItemById(int menuId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM menu WHERE menu_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapMenu(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Menu> getMenuByRestaurant(int restaurantId) {
        List<Menu> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM menu WHERE restaurant_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapMenu(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Menu> getAllMenuItems() {
        List<Menu> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM menu");
            while (rs.next()) list.add(mapMenu(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean updateMenuItem(Menu menu) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE menu SET item_name=?, description=?, price=?, image_path=?, category=? WHERE menu_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, menu.getItemName());
            ps.setString(2, menu.getDescription());
            ps.setDouble(3, menu.getPrice());
            ps.setString(4, menu.getImagePath());
            ps.setString(5, menu.getCategory());
            ps.setInt(6, menu.getMenuId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteMenuItem(int menuId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM menu WHERE menu_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, menuId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private Menu mapMenu(ResultSet rs) throws SQLException {
        Menu m = new Menu();
        m.setMenuId(rs.getInt("menu_id"));
        m.setRestaurantId(rs.getInt("restaurant_id"));
        m.setItemName(rs.getString("item_name"));
        m.setDescription(rs.getString("description"));
        m.setPrice(rs.getDouble("price"));
        m.setImagePath(rs.getString("image_path"));
        try { m.setCategory(rs.getString("category")); } catch(Exception ignored){}
        return m;
    }
}
