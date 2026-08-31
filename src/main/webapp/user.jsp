<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.bookstore.DBConnection" %>
<%
    // CHECK IF USER IS LOGGED IN
    String user = (String) session.getAttribute("user");
    if (user == null || user.trim().isEmpty()) {
        // If not logged in, redirect to login page
        response.sendRedirect("login.jsp");
        return; // Stop further execution
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BookFlix - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #141414; color: white; }
        .row-scroll { display: flex; overflow-x: auto; gap: 15px; padding: 20px; scrollbar-width: none; }
        .card-book { min-width: 180px; transition: 0.3s; cursor: pointer; }
        .card-book:hover { transform: scale(1.1); }
        .card-book img { width: 100%; height: 260px; object-fit: cover; border-radius: 5px; }
        .plan-box { background: #222; border: 1px solid #e50914; border-radius: 10px; padding: 20px; text-align: center; transition: 0.3s; cursor: pointer; }
        .plan-box:hover { transform: translateY(-5px); }
        .logout-btn { background: #e50914; color: white; border: none; padding: 5px 15px; border-radius: 5px; }
        .logout-btn:hover { background: #f6121d; }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-black p-3 shadow">
        <a class="navbar-brand text-danger fw-bold fs-3 px-4">BOOKFLIX</a>
        <div class="ms-auto px-4 d-flex align-items-center gap-3">
            <span>Hello, <%= user %></span>
            <a href="logout.jsp" class="logout-btn btn btn-sm">Logout</a>
        </div>
    </nav>

    <div class="container-fluid mt-4">
        <h4 class="px-4 fw-bold">Competitive Exams (UPSC/JEE/NEET)</h4>
        <div class="row-scroll">
            <%
                Connection con = null;
                ResultSet rs = null;
                try {
                    con = DBConnection.getConnection();
                    if (con != null) {
                        rs = con.createStatement().executeQuery("SELECT * FROM books");
                        boolean hasBooks = false;
                        while(rs.next()) {
                            hasBooks = true;
            %>
            <div class="card-book">
                <img src="<%= rs.getString("image_url") != null ? rs.getString("image_url") : "https://via.placeholder.com/180x260" %>" 
                     alt="<%= rs.getString("title") %>">
                <p class="text-center mt-2 small text-secondary"><%= rs.getString("title") %></p>
            </div>
            <%
                        }
                        if (!hasBooks) {
            %>
            <p class="text-center text-secondary">No books available at the moment.</p>
            <%
                        }
                    } else {
            %>
            <p class="text-center text-danger">Database connection failed!</p>
            <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
            %>
            <p class="text-center text-danger">Error loading books: <%= e.getMessage() %></p>
            <%
                } finally {
                    if (rs != null) try { rs.close(); } catch(Exception e) {}
                    if (con != null) try { con.close(); } catch(Exception e) {}
                }
            %>
        </div>

        <h3 class="text-center mt-5 mb-4">Choose Your Subscription</h3>
        <div class="row justify-content-center g-3 px-5 mb-5">
            <div class="col-md-2">
                <div class="plan-box" onclick="selectPlan('1 Month', 99)">
                    <h6>1 Month</h6>
                    <h4 class="text-danger">₹99</h4>
                </div>
            </div>
            <div class="col-md-2">
                <div class="plan-box" onclick="selectPlan('3 Months', 159)">
                    <h6>3 Months</h6>
                    <h4 class="text-danger">₹159</h4>
                </div>
            </div>
            <div class="col-md-2">
                <div class="plan-box" onclick="selectPlan('6 Months', 199)">
                    <h6>6 Months</h6>
                    <h4 class="text-danger">₹199</h4>
                </div>
            </div>
            <div class="col-md-2">
                <div class="plan-box" style="background: #e50914; color: white;" onclick="selectPlan('1 Year VIP', 499)">
                    <h6>1 Year VIP</h6>
                    <h4>₹499</h4>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectPlan(plan, price) {
            if(confirm('You selected ' + plan + ' plan for ₹' + price + '\nProceed to payment?')) {
                window.location.href = 'payment.jsp?plan=' + encodeURIComponent(plan) + '&price=' + price;
            }
        }
    </script>
</body>
</html>