<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dios.utility.LanguageUtil" %>
<html>
<head>
    <title><%= LanguageUtil.getText("welcome_page") %></title>
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
            padding: 50px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            transition: transform 0.3s ease;
            border: 1px solid #2a2a3a;
        }
        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
        }
        h1 {
            color: #e0e0e0;
            font-size: 32px;
            margin-bottom: 20px;
            font-weight: 600;
        }
        p {
            font-size: 18px;
            color: #a0a0a0;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .btn {
            display: inline-block;
            padding: 14px 28px;
            margin: 10px;
            font-size: 18px;
            background-color: #4d7cfe; /* Bright blue */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(77, 124, 254, 0.3);
        }
        .btn:hover {
            background-color: #3a68e0; /* Darker blue */
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(77, 124, 254, 0.4);
        }
        .btn:active {
            transform: translateY(0);
        }
        .footer {
            margin-top: 40px;
            font-size: 14px;
            color: #6b7280;
        }
        .footer a {
            color: #4d7cfe;
            text-decoration: none;
            transition: color 0.3s;
        }
        .footer a:hover {
            color: #6e8fff;
            text-decoration: underline;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo span {
            font-size: 36px;
            font-weight: bold;
            color: #4d7cfe;
            text-shadow: 0 0 10px rgba(77, 124, 254, 0.5);
        }
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        @media (max-width: 600px) {
            .container {
                padding: 30px 20px;
                margin: 0 15px;
            }
            h1 {
                font-size: 28px;
            }
            p {
                font-size: 16px;
            }
            .btn {
                padding: 12px 24px;
                font-size: 16px;
                display: block;
                margin: 10px auto;
                width: 80%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <span>📚</span>
    </div>
    <h1><%= LanguageUtil.getText("Welcome to Online Book store") %></h1>
    <p><%= LanguageUtil.getText("Register and login to manage your book effortlessly") %></p>

    <div class="btn-container">
        <a href="login" class="btn"><%= LanguageUtil.getText("login") %></a>
        <a href="register" class="btn"><%= LanguageUtil.getText("register") %></a>
    </div>

    <div class="footer">
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Jean Dieudonne. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>