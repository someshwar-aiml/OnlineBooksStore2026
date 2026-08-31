<%@ page import="java.sql.*, com.bookstore.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark p-3">
        <div class="container"><span class="navbar-brand">Admin Dashboard</span></div>
    </nav>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4">
                <div class="card p-3 shadow-sm">
                    <h5 class="fw-bold">Add New Book</h5>
                    <form action="addBookAction.jsp" method="POST">
                        <input type="text" name="title" class="form-control mb-2" placeholder="Title" required>
                        <input type="number" name="hours" class="form-control mb-2" placeholder="Read Time (Hrs)" required>
                        <input type="text" name="img" class="form-control mb-2" placeholder="Image Path (e.g. images/python.jpg)">
                        <input type="text" name="pdf" class="form-control mb-3" placeholder="PDF Link">
                        <button type="submit" class="btn btn-success w-100">Add Book</button>
                    </form>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card p-3">
                    <table class="table align-middle">
                        <thead><tr><th>Cover</th><th>Title</th><th>Hours</th></tr></thead>
                        <tbody>
                            <%
                                Connection con = DBConnection.getConnection();
                                ResultSet rs = con.createStatement().executeQuery("SELECT * FROM books");
                                while(rs.next()){
                            %>
                            <tr>
                                <td><img src="<%= rs.getString("image_url") %>" width="50"></td>
                                <td><%= rs.getString("title") %></td>
                                <td><%= rs.getInt("reading_hours") %> Hrs</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>