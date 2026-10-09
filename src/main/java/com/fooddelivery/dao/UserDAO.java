package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);

    User getUserById(int userId);

    List<User> getAllUsers();

    boolean updateUser(User user);

    boolean deleteUser(int userId);
}