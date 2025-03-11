package com.dios.daoImpl;
import org.mindrot.jbcrypt.BCrypt;
import com.dios.dao.UserDAO;
import com.dios.models.User;
import com.dios.utility.DBConnection;

import java.sql.*;

public class UserDAOImpl implements UserDAO {
    private Connection conn = DBConnection.getConnection();

    @Override
    public void registerUser(User user) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("DB connection is null! Check your DB settings.");
                return;
            }

            // Hash the password before storing it in the database
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());

            String query = "INSERT INTO users (username, password) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, hashedPassword);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public User loginUser(String username, String password) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("DB connection is null! Check your DB settings.");
                return null;
            }

            // Fetch the user and hashed password from the database
            String query = "SELECT * FROM users WHERE username=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Get the hashed password from the database
                String storedHashedPassword = rs.getString("password");

                // Check if the provided password matches the stored hashed password
                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    // If the password matches, return the User object
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    return user;
                } else {
                    System.out.println("Invalid password.");
                }
            } else {
                System.out.println("User not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User getUserByUsername(String username) {  // 🔥 Implemented
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}


