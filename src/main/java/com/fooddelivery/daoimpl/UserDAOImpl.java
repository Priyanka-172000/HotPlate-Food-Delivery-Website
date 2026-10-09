package com.fooddelivery.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.model.User;
import com.fooddelivery.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    private Connection con = DBConnection.getConnection();

    @Override
    public boolean registerUser(User user) {

        try {

            String sql = "INSERT INTO users(name,email,password,phone,address) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public User loginUser(String email, String password) {

        try {

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                return user;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public User getUserById(int userId) {

        try {

            String sql = "SELECT * FROM users WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                return user;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        try {

            String sql = "SELECT * FROM users";

            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while(rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));

                users.add(user);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public boolean updateUser(User user) {

        try {

            String sql =
                    "UPDATE users SET name=?,email=?,phone=?,address=? WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getUserId());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteUser(int userId) {

        try {

            String sql = "DELETE FROM users WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}