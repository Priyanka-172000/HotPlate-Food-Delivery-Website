package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.Cart;

public interface CartDAO {

    boolean addToCart(Cart cart);

    List<Cart> getCartItems(int userId);

    boolean updateCart(Cart cart);

    boolean removeCartItem(int cartId);

    boolean clearCart(int userId);
}