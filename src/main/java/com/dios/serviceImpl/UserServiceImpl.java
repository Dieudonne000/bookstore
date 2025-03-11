package com.dios.serviceImpl;

import com.dios.dao.UserDAO;
import com.dios.daoImpl.UserDAOImpl;
import com.dios.models.User;
import com.dios.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    public void register(User user) {
        userDAO.registerUser(user);
    }

    @Override
    public User login(String username, String password) {
        return userDAO.loginUser(username, password);
    }

    @Override
    public User getUserByUsername(String username) {  // 🔥 Implemented
        return userDAO.getUserByUsername(username);
    }
}

