<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookStore | Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body { 
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            font-family: 'Poppins', sans-serif; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            margin: 0; 
            color: white; 
        }
        
        .box { 
            background: rgba(22, 33, 62, 0.95);
            backdrop-filter: blur(10px);
            padding: 40px; 
            border-radius: 20px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.5); 
            width: 350px; 
            text-align: center; 
            border-top: 4px solid #e94560;
            animation: fadeIn 0.5s ease-in;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        h2 { 
            margin-bottom: 25px; 
            color: #e94560;
            font-weight: 600;
        }
        
        input { 
            width: 100%; 
            padding: 12px 15px; 
            margin: 10px 0; 
            border: none; 
            border-radius: 8px; 
            background: #0f3460; 
            color: white; 
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.3s ease;
            outline: none;
        }
        
        input:focus {
            background: #1a4a7a;
            box-shadow: 0 0 5px #e94560;
        }
        
        .btn { 
            width: 100%; 
            padding: 12px; 
            background: #e94560; 
            border: none; 
            color: white; 
            border-radius: 8px; 
            cursor: pointer; 
            font-weight: bold; 
            font-size: 16px;
            transition: 0.3s; 
            margin-top: 15px;
        }
        
        .btn:hover { 
            background: #cf3a52; 
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(233, 69, 96, 0.3);
        }
        
        .register-link {
            margin-top: 20px;
            font-size: 14px;
        }
        
        .register-link a {
            color: #e94560;
            text-decoration: none;
            font-weight: bold;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
        
        .error-msg {
            background: rgba(255, 68, 68, 0.2);
            border-left: 3px solid #ff4444;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 13px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>🔐 Welcome Back</h2>
        
        <%
            String error = request.getParameter("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div class="error-msg">
                ❌ <%= error %>
            </div>
        <%
            }
        %>
        
        <form action="loginAction.jsp" method="POST">
            <input type="text" name="username" placeholder="👤 Username" required autocomplete="off">
            <input type="password" name="password" placeholder="🔒 Password" required>
            <button type="submit" class="btn">🚀 Login</button>
        </form>
        
        <div class="register-link">
            New to BookStore? <a href="register.jsp">Create an account</a>
        </div>
    </div>
</body>
</html>