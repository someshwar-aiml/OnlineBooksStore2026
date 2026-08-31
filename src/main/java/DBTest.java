package com.bookstore;

public class DBTest {
    public static void main(String[] args) {
        System.out.println("=== Testing Database Connection ===\n");
        
        // Test connection
        boolean isConnected = DBConnection.testConnection();
        
        if (isConnected) {
            System.out.println("\n✅ SUCCESS: Database connection is working!");
            System.out.println(DBConnection.getConnectionStatus());
        } else {
            System.out.println("\n❌ FAILED: Database connection failed!");
            System.out.println("Please check:");
            System.out.println("1. MySQL service is running");
            System.out.println("2. Database 'bookstore_db' exists");
            System.out.println("3. Username and password are correct");
            System.out.println("4. User 'somesh_admin' has proper privileges");
        }
    }
}