<%@ page import="java.sql.*, com.bookstore.DBConnection" %>
<%@ include file="header.jsp" %>
<%
    String id = request.getParameter("id");
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
%>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-4 text-center">
            <img src="<%= rs.getString("image_url") %>" class="img-fluid rounded shadow-lg">
            <h2 class="mt-3 text-danger"><%= rs.getString("title") %></h2>
            <p class="text-muted"><%= rs.getString("category") %></p>
            <div class="bg-secondary p-3 rounded small text-white text-start">
                <strong>About:</strong> <%= rs.getString("about_book") %><br><br>
                <strong>Summary:</strong> <%= rs.getString("summary") %>
            </div>
            <% if(session.getAttribute("plan").equals("VIP")) { %>
                <a href="<%= rs.getString("pdf_url") %>" download class="btn btn-success mt-3 w-100">📥 Download PDF</a>
            <% } %>
        </div>
        <div class="col-md-8">
            <h5 class="text-warning">📖 Reading Online</h5>
            <div class="bg-white text-dark p-4 rounded shadow-lg" style="height: 600px; overflow-y: scroll; font-size: 1.1rem; line-height: 1.8;">
                <%= rs.getString("text_content") %>
            </div>
        </div>
    </div>
</div>
<% } %>