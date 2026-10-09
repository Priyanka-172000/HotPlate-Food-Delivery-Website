package com.fooddelivery.daoimpl;

import java.sql.*;

import com.fooddelivery.dao.AdminDAO;
import com.fooddelivery.model.Admin;
import com.fooddelivery.util.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    private Connection con = DBConnection.getConnection();

    @Override
    public Admin adminLogin(String username, String password) {

        try {

            String sql =
                    "SELECT * FROM admin WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                Admin admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));

                return admin;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}