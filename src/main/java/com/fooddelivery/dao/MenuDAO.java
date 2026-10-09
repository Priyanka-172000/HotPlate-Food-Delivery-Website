package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.Menu;

public interface MenuDAO {

    boolean addMenuItem(Menu menu);

    Menu getMenuItemById(int menuId);

    List<Menu> getMenuByRestaurant(int restaurantId);

    boolean updateMenuItem(Menu menu);

    boolean deleteMenuItem(int menuId);
}