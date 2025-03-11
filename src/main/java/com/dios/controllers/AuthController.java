package com.dios.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import com.dios.models.User;
import com.dios.service.UserService;
import com.dios.serviceImpl.UserServiceImpl;
//import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

//@WebServlet("/auth")
public class AuthController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            User user = userService.login(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("dashboard");
            } else {
                response.sendRedirect("login?error=Invalid Username or Password");
            }
        } else if ("register".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            User existingUser = userService.getUserByUsername(username);
            if (existingUser != null) {
                response.sendRedirect("register?error=User already exists, please choose another one");
                return;
            }

            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            userService.register(user);

            response.sendRedirect("register?message=registered");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            // Prevent caching to stop back button access
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0
            response.setDateHeader("Expires", 0); // Proxies

            response.sendRedirect("Home");
        }
    }
}
