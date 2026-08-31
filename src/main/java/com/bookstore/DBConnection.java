package com.bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/bookstore_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "somesh_admin";
    private static final String PASS = "Somesh@123";

    public static Connection getConnection() {
        Connection con = null;

        try {
            // Load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create connection
            con = DriverManager.getConnection(URL, USER, PASS);

            System.out.println("✅ Database Connected Successfully!");

        } catch (ClassNotFoundException e) {
            System.out.println("❌ JDBC Driver Not Found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Connection Failed!");
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }

        return con;
    }
}