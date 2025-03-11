<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dios.models.Book, com.dios.service.BookService, com.dios.serviceImpl.BookServiceImpl" %>
<%
  int bookId = Integer.parseInt(request.getParameter("id"));
  BookService bookService = new BookServiceImpl();
  Book book = bookService.getBookById(bookId);
%>
<html>
<head>
  <title>Edit Book</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0; }
    .container {
      max-width: 600px; margin: 40px auto; padding: 20px; background-color: white;
      border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center;
    }
    h2 { color: #1a3c8c; }
    input { width: 90%; padding: 10px; margin: 8px 0; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; }
    button { width: 45%; padding: 10px; background-color: #1a3c8c; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
    button:hover { background-color: #12356a; }
  </style>
</head>
<body>
<div class="container">
  <h2>Edit Book</h2>
  <form action="edit" method="post">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="<%= book.getId() %>">
    <input type="text" name="title" value="<%= book.getTitle() %>" required>
    <input type="text" name="author" value="<%= book.getAuthor() %>" required>
    <input type="number" name="price" value="<%= book.getPrice() %>" step="0.01" required>
    <input type="number" name="quantity" value="<%= book.getQuantity() %>" required>
    <button type="submit">Update Book</button>
  </form>
</div>
</body>
</html>
