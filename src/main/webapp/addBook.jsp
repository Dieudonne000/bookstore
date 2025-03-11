<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Book</title>
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
    <h2>Add New Book</h2>
    <form action="book" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="title" placeholder="Book Title" required>
        <input type="text" name="author" placeholder="Author Name" required>
        <input type="number" name="price" placeholder="Price" step="0.01" required>
        <input type="number" name="quantity" placeholder="Quantity" required>
        <button type="submit">Add Book</button>
    </form>
</div>
</body>
</html>
