<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dios.utility.LanguageUtil, com.dios.models.User, com.dios.models.Book, com.dios.service.BookService, com.dios.serviceImpl.BookServiceImpl, java.util.List" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login?error=session_expired");
        return;
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    User user = (User) sessionObj.getAttribute("user");
    BookService bookService = new BookServiceImpl();
    List<Book> books = bookService.getAllBooks();
%>
<html>
<head>
    <title><%= LanguageUtil.getText("dashboard") %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .logout-btn {
            width: 100%;
            padding: 10px;
            background-color: #1a3c8c; /* Navy Blue */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #12356a; /* Darker Navy Blue */
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #1a3c8c;
            color: white;
        }
        .action-btn {
            padding: 8px 12px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            color: white;
            text-decoration: none;
        }
        .edit-btn { background-color: #2ecc71; }
        .delete-btn { background-color: #e74c3c; }
        .edit-btn:hover { background-color: #27ae60; }
        .delete-btn:hover { background-color: #c0392b; }
        .add-btn {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #1a3c8c;
            color: white;
            text-align: center;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
        }
        .add-btn:hover {
            background-color: #12356a;
        }
    </style>
</head>
<body>
<div class="container">
    <h2><%= LanguageUtil.getText("welcome") %>, <%= user.getUsername() %>!</h2>

    <a href="addBook" class="add-btn">+ Add New Book</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        <% for (Book book : books) { %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td>$<%= book.getPrice() %></td>
            <td><%= book.getQuantity() %></td>
            <td>
                <a href="editBook.jsp?id=<%= book.getId() %>" class="action-btn edit-btn">Edit</a>
                <a href="deleteBook.jsp?id=<%= book.getId() %>" class="action-btn delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
    <form action="auth" method="get">
        <input type="hidden" name="action" value="logout">
        <button type="submit" class="logout-btn"><%= LanguageUtil.getText("logout") %></button>
    </form>
</div>
</body>
</html>
