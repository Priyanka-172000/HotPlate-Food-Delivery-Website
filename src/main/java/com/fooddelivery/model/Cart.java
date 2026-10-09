package com.fooddelivery.model;

public class Cart {

    private int cartId;
    private int userId;
    private int menuId;
    private int quantity;
    private String itemName;
    private double price;
    private double totalPrice;

    public Cart() {}

    public Cart(int cartId, int userId, int menuId, int quantity) {
        this.cartId = cartId;
        this.userId = userId;
        this.menuId = menuId;
        this.quantity = quantity;
    }

    public int getCartId() { return cartId; }
    public void setCartId(int cartId) { this.cartId = cartId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getTotalPrice() { return price * quantity; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
}
