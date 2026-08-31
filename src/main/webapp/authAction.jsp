<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.bookstore.DBConnection" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    
    // Validation
    if (username == null || username.trim().isEmpty() || 
        password == null || password.trim().isEmpty() || 
        role == null || role.trim().isEmpty()) {
        
        response.sendRedirect("register.jsp?error=All fields are required!");
        return;
    }
    
    // Check if username already exists
    Connection con = null;
    PreparedStatement checkStmt = null;
    PreparedStatement insertStmt = null;
    ResultSet rs = null;
    
    try {
        con = DBConnection.getConnection();
        
        // Check for existing username
        String checkSql = "SELECT username FROM users WHERE username = ?";
        checkStmt = con.prepareStatement(checkSql);
        checkStmt.setString(1, username);
        rs = checkStmt.executeQuery();
        
        if (rs.next()) {
            // Username already exists
            response.sendRedirect("register.jsp?error=Username already exists! Please choose another.");
            return;
        }
        
        // Insert new user
        String insertSql = "INSERT INTO users (username, password, role, created_date) VALUES (?, ?, ?, NOW())";
        insertStmt = con.prepareStatement(insertSql);
        insertStmt.setString(1, username);
        insertStmt.setString(2, password); // Note: In production, use password encryption
        insertStmt.setString(3, role);
        
        int rowsAffected = insertStmt.executeUpdate();
        
        if (rowsAffected > 0) {
            // Registration successful
            session.setAttribute("user", username);
            session.setAttribute("role", role);
            
            if ("admin".equals(role)) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("register.jsp?error=Registration failed! Please try again.");
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("register.jsp?error=Database error: " + e.getMessage());
    } finally {
        // Close resources
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (checkStmt != null) try { checkStmt.close(); } catch (SQLException e) {}
        if (insertStmt != null) try { insertStmt.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
%>