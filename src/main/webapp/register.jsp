<!DOCTYPE html>
<html>
<head>
    <title>BookFlix | Join Now</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #141414; color: white; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .auth-card { background: rgba(0,0,0,0.75); padding: 50px; border-radius: 10px; width: 400px; }
        .btn-netflix { background: #e50914; color: white; border: none; }
    </style>
</head>
<body>
    <div class="auth-card">
        <h2 class="mb-4 text-center text-danger fw-bold">Sign Up</h2>
        <form action="authAction.jsp" method="POST">
            <input type="text" name="username" placeholder="Username" class="form-control mb-3 bg-secondary text-white border-0" required>
            <input type="password" name="password" placeholder="Password" class="form-control mb-3 bg-secondary text-white border-0" required>
            <select name="role" class="form-control mb-4 bg-secondary text-white border-0">
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
            <button type="submit" class="btn btn-netflix w-100 py-2 fw-bold">Register & Login</button>
        </form>
    </div>
</body>
</html>