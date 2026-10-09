package com.fooddelivery.daoimpl;

import java.sql.*;
import java.util.*;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;
import com.fooddelivery.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection con = DBConnection.getConnection();

    @Override
    public boolean addRestaurant(Restaurant restaurant) {

        try {

            String sql =
                "INSERT INTO restaurants(restaurant_name,cuisine_type,address,image_path) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setString(3, restaurant.getAddress());
            ps.setString(4, restaurant.getImagePath());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {
        return null;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurants = new ArrayList<>();

        try {

            Statement stmt = con.createStatement();

            ResultSet rs =
                stmt.executeQuery("SELECT * FROM restaurants");

            while(rs.next()) {

                Restaurant r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setRestaurantName(rs.getString("restaurant_name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setAddress(rs.getString("address"));
                r.setImagePath(rs.getString("image_path"));

                restaurants.add(r);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return restaurants;
    }

    @Override
    public boolean updateRestaurant(Restaurant restaurant) {
        return false;
    }

    @Override
    public boolean deleteRestaurant(int restaurantId) {
        return false;
    }
}