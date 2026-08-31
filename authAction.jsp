<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
    String username = request.getParameter("username");
%>

<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>Hello, <%= username %> 👋</h2>
</body>
</html>