package com.dios.dao;

import com.dios.models.User;

public interface UserDAO {
    void registerUser(User user);
    User loginUser(String username, String password);
    User getUserByUsername(String username);
}

