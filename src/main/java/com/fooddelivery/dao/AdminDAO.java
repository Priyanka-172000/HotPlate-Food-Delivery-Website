package com.fooddelivery.dao;

import com.fooddelivery.model.Admin;

public interface AdminDAO {

    Admin adminLogin(String username, String password);
}