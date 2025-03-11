package com.dios.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/bookstore";
    private static final String USER = "root";
    private static final String PASS = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ Ensure the driver is loaded
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found! Add the MySQL JDBC dependency.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection failed! Check URL, username, password, and if MySQL is running.");
            e.printStackTrace();
        }
        return conn;
    }
}
