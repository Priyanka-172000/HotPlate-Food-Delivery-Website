package com.fooddelivery.model;

public class RestaurantAdmin {

    private int restaurantAdminId;
    private String name;
    private String email;
    private String password;
    private int restaurantId;

    public RestaurantAdmin() {}

    public RestaurantAdmin(int restaurantAdminId,
                           String name,
                           String email,
                           String password,
                           int restaurantId) {

        this.restaurantAdminId = restaurantAdminId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.restaurantId = restaurantId;
    }

    public int getRestaurantAdminId() {
        return restaurantAdminId;
    }

    public void setRestaurantAdminId(int restaurantAdminId) {
        this.restaurantAdminId = restaurantAdminId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }
}