package com.dios.service;

import com.dios.models.User;

public interface UserService {
    void register(User user);
    User login(String username, String password);
    User getUserByUsername(String username);
}

