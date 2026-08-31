<%@ page import="java.sql.*, com.bookstore.DBConnection" %>
<%
    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("INSERT INTO books (title, reading_hours, image_url, pdf_url) VALUES (?, ?, ?, ?)");
        ps.setString(1, request.getParameter("title"));
        ps.setInt(2, Integer.parseInt(request.getParameter("hours")));
        ps.setString(3, request.getParameter("img"));
        ps.setString(4, request.getParameter("pdf"));
        ps.executeUpdate();
        response.sendRedirect("admin.jsp");
    } catch(Exception e) { out.print(e); }
%>