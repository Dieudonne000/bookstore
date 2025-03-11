<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dios.utility.LanguageUtil" %>
<html>
<head>
    <title><%= LanguageUtil.getText("register") %></title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
        }
        .container {
            background-color: #1e1e2d;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease;
            border: 1px solid #2a2a3a;
        }
        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
        }
        h2 {
            color: #e0e0e0;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #a0a0a0;
            font-size: 14px;
            transition: color 0.3s;
        }
        .input-group {
            position: relative;
            margin-bottom: 25px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #2c2c3c;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            transition: all 0.3s;
            background-color: #252535;
            color: #e0e0e0;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #4d7cfe;
            background-color: #2a2a40;
            box-shadow: 0 0 0 3px rgba(77, 124, 254, 0.2);
            outline: none;
        }
        button {
            width: 100%;
            padding: 14px;
            background-color: #4d7cfe; /* Bright blue */
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: 0 4px 6px rgba(77, 124, 254, 0.3);
            margin-top: 10px;
        }
        button:hover {
            background-color: #3a68e0; /* Darker blue */
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(77, 124, 254, 0.4);
        }
        button:active {
            transform: translateY(0);
        }
        a {
            color: #4d7cfe;
            text-decoration: none;
            text-align: center;
            display: block;
            margin-top: 20px;
            font-weight: 500;
            transition: color 0.3s;
        }
        a:hover {
            color: #6e8fff;
            text-decoration: underline;
        }
        .message {
            font-size: 14px;
            text-align: center;
            margin: 15px 0;
            padding: 10px;
            border-radius: 6px;
        }
        .green {
            color: #4ade80;
            background-color: rgba(74, 222, 128, 0.1);
            border: 1px solid rgba(74, 222, 128, 0.2);
        }
        .red {
            color: #f87171;
            background-color: rgba(248, 113, 113, 0.1);
            border: 1px solid rgba(248, 113, 113, 0.2);
        }
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-footer {
            text-align: center;
            margin-top: 25px;
            color: #6b7280;
            font-size: 14px;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo span {
            font-size: 28px;
            font-weight: bold;
            color: #4d7cfe;
            text-shadow: 0 0 10px rgba(77, 124, 254, 0.5);
        }
        ::placeholder {
            color: #6b7280;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <span>✦</span>
    </div>
    <h2><%= LanguageUtil.getText("register") %></h2>

    <% String message = request.getParameter("message"); %>
    <% if ("registered".equals(message)) { %>
    <p class="message green"><%= LanguageUtil.getText("registration_success") %></p>
    <% } %>

    <% String error = request.getParameter("error"); %>
    <% if ("user_exists".equals(error)) { %>
    <p class="message red"><%= LanguageUtil.getText("user_already_exists") %></p>
    <% } %>

    <form action="auth" method="post">
        <input type="hidden" name="action" value="register">

        <div class="input-group">
            <label for="username"><%= LanguageUtil.getText("username") %></label>
            <input type="text" id="username" name="username" required placeholder="Enter your username">
        </div>

        <div class="input-group">
            <label for="password"><%= LanguageUtil.getText("password") %></label>
            <input type="password" id="password" name="password" required placeholder="Enter your password">
        </div>

        <button type="submit"><%= LanguageUtil.getText("register") %></button>
    </form>

    <p><a href="login"><%= LanguageUtil.getText("already_registered") %></a></p>

    <div class="form-footer">
        &copy; <%= new java.util.Date().getYear() + 1900 %> All Rights Reserved
    </div>
</div>
</body>
</html>