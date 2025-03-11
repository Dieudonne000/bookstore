package com.dios.utility;
import java.sql.*;

public class LanguageUtil {
    private static String currentLang = "english"; // Default language

    public static void setLanguage(String lang) {
        currentLang = lang;
    }

    public static String getText(String key) {
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT " + currentLang + " FROM translations WHERE key_name=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, key);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return key;
    }
}
