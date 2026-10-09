package com.fooddelivery.model;

public class Restaurant {

    private int restaurantId;
    private String restaurantName;
    private String cuisineType;
    private String address;
    private String imagePath;

    public Restaurant() {}

    public Restaurant(int restaurantId,
                      String restaurantName,
                      String cuisineType,
                      String address,
                      String imagePath) {

        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.cuisineType = cuisineType;
        this.address = address;
        this.imagePath = imagePath;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}