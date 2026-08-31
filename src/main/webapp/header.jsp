<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session check karne ka tarika
    String userPlan = (String) session.getAttribute("plan");
    if (userPlan == null) {
        userPlan = "No Plan"; // Default value agar user login nahi hai
    }
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #141414; color: white; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; }
        .navbar { background-color: rgba(0,0,0,0.9); }
        .btn-netflix { background-color: #e50914; color: white; font-weight: bold; border: none; }
        .btn-netflix:hover { background-color: #ff0000; color: white; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container">
        <a class="navbar-brand text-danger fw-bold fs-3" href="user.jsp">BOOKFLIX</a>
        <div class="navbar-nav ms-auto">
            <span class="nav-link text-white small mt-1">Plan: <%= session.getAttribute("plan") %></span>
            <a class="nav-link" href="logout.jsp">Logout</a>
        </div>
    </div>
</nav>