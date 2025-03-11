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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #0f0f1a;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, #1a1a2e 0%, #16213e 100%);
            padding: 30px 0;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            z-index: 10;
            transition: all 0.3s ease;
        }

        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
            text-align: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #4d7cfe;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo span {
            margin-right: 10px;
            font-size: 28px;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .user-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4d7cfe, #3a68e0);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            color: white;
            margin-bottom: 10px;
            box-shadow: 0 4px 10px rgba(77, 124, 254, 0.3);
        }

        .user-name {
            font-size: 18px;
            font-weight: 600;
            color: #e0e0e0;
            margin-bottom: 5px;
        }

        .user-role {
            font-size: 14px;
            color: #a0a0a0;
        }

        .sidebar-menu {
            flex: 1;
            padding: 0 15px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            border-radius: 8px;
            color: #a0a0a0;
            margin-bottom: 8px;
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none;
        }

        .menu-item.active, .menu-item:hover {
            background-color: rgba(77, 124, 254, 0.1);
            color: #4d7cfe;
        }

        .menu-item span {
            margin-right: 10px;
            font-size: 20px;
        }

        .sidebar-footer {
            padding: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logout-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #f43f5e, #ec4899);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(244, 63, 94, 0.3);
        }

        .logout-btn span {
            margin-right: 8px;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            margin-left: 250px;
            transition: all 0.3s ease;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .page-title {
            font-size: 28px;
            font-weight: 600;
            color: #e0e0e0;
            background: linear-gradient(to right, #4d7cfe, #6e8fff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .header-actions {
            display: flex;
            gap: 15px;
        }

        .search-box {
            position: relative;
        }

        .search-input {
            padding: 10px 15px 10px 40px;
            border-radius: 8px;
            border: 1px solid #2a2a3a;
            background-color: #1e1e2d;
            color: #e0e0e0;
            font-size: 14px;
            width: 250px;
            transition: all 0.3s;
        }

        .search-input:focus {
            border-color: #4d7cfe;
            box-shadow: 0 0 0 3px rgba(77, 124, 254, 0.2);
            outline: none;
            width: 300px;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0a0a0;
        }

        .add-btn {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            background: linear-gradient(to right, #4d7cfe, #6e8fff);
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: 0 4px 6px rgba(77, 124, 254, 0.2);
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(77, 124, 254, 0.3);
        }

        .add-btn span {
            margin-right: 8px;
            font-size: 20px;
        }

        /* Books Grid */
        .books-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .book-card {
            background: linear-gradient(145deg, #1e1e2d, #252535);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: all 0.3s;
            border: 1px solid rgba(255, 255, 255, 0.05);
            position: relative;
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
            border-color: rgba(77, 124, 254, 0.3);
        }

        .book-header {
            padding: 20px;
            background: linear-gradient(to right, rgba(77, 124, 254, 0.8), rgba(110, 143, 255, 0.8));
            color: white;
            position: relative;
        }

        .book-id {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: rgba(0, 0, 0, 0.2);
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        .book-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .book-author {
            font-size: 14px;
            opacity: 0.9;
        }

        .book-body {
            padding: 20px;
        }

        .book-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .detail-item {
            text-align: center;
            flex: 1;
        }

        .detail-label {
            font-size: 12px;
            color: #a0a0a0;
            margin-bottom: 5px;
        }

        .detail-value {
            font-size: 16px;
            font-weight: 600;
        }

        .price {
            color: #4ade80;
        }

        .quantity {
            position: relative;
        }

        .quantity-indicator {
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-left: 5px;
        }

        .high {
            background-color: #4ade80;
        }

        .medium {
            background-color: #facc15;
        }

        .low {
            background-color: #f87171;
        }

        .book-actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
            text-decoration: none;
        }

        .edit-btn {
            background: linear-gradient(to right, #10b981, #34d399);
            color: white;
        }

        .delete-btn {
            background: linear-gradient(to right, #ef4444, #f87171);
            color: white;
        }

        .edit-btn:hover, .delete-btn:hover {
            transform: translateY(-2px);
        }

        .action-btn span {
            margin-right: 5px;
        }

        /* Mobile Responsiveness */
        @media (max-width: 1024px) {
            .books-container {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
                padding: 20px 0;
            }

            .sidebar-header {
                padding: 0 10px 15px;
            }

            .logo-text, .user-name, .user-role, .menu-text {
                display: none;
            }

            .user-avatar {
                width: 50px;
                height: 50px;
                font-size: 20px;
            }

            .menu-item {
                justify-content: center;
                padding: 12px;
            }

            .menu-item span {
                margin-right: 0;
            }

            .logout-btn span {
                margin-right: 0;
            }

            .main-content {
                margin-left: 70px;
                padding: 20px;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .header-actions {
                width: 100%;
                flex-direction: column;
            }

            .search-box {
                width: 100%;
            }

            .search-input, .search-input:focus {
                width: 100%;
            }

            .add-btn {
                width: 100%;
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .books-container {
                grid-template-columns: 1fr;
            }
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 50px 20px;
            background: rgba(30, 30, 45, 0.5);
            border-radius: 12px;
            margin-top: 30px;
        }

        .empty-state-icon {
            font-size: 60px;
            color: #4d7cfe;
            margin-bottom: 20px;
        }

        .empty-state-text {
            font-size: 18px;
            color: #a0a0a0;
            margin-bottom: 20px;
        }

        /* Toggle sidebar button for mobile */
        .toggle-sidebar {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(to right, #4d7cfe, #6e8fff);
            color: white;
            border: none;
            font-size: 24px;
            cursor: pointer;
            z-index: 100;
            box-shadow: 0 4px 10px rgba(77, 124, 254, 0.3);
        }

        @media (max-width: 768px) {
            .toggle-sidebar {
                display: flex;
                align-items: center;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="logo">
                <span>📚</span>
                <div class="logo-text">BookStore</div>
            </div>
            <div class="user-info">
                <div class="user-avatar">
                    <%= user.getUsername().substring(0, 1).toUpperCase() %>
                </div>
                <div class="user-name"><%= user.getUsername() %></div>
                <div class="user-role">Administrator</div>
            </div>
        </div>

        <div class="sidebar-menu">
            <a href="#" class="menu-item active">
                <span>📊</span>
                <div class="menu-text">Dashboard</div>
            </a>
            <a href="#" class="menu-item">
                <span>📚</span>
                <div class="menu-text">Books</div>
            </a>
            <a href="#" class="menu-item">
                <span>👥</span>
                <div class="menu-text">Users</div>
            </a>
            <a href="#" class="menu-item">
                <span>⚙️</span>
                <div class="menu-text">Settings</div>
            </a>
        </div>

        <div class="sidebar-footer">
            <form action="auth" method="get">
                <input type="hidden" name="action" value="logout">
                <button type="submit" class="logout-btn">
                    <span>🚪</span>
                    <div class="menu-text"><%= LanguageUtil.getText("logout") %></div>
                </button>
            </form>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1 class="page-title"><%= LanguageUtil.getText("dashboard") %></h1>

            <div class="header-actions">
                <div class="search-box">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search books...">
                </div>

                <a href="addBook" class="add-btn">
                    <span>➕</span>
                    Add New Book
                </a>
            </div>
        </div>

        <% if (books.isEmpty()) { %>
        <div class="empty-state">
            <div class="empty-state-icon">📚</div>
            <div class="empty-state-text">No books found. Add your first book!</div>
            <a href="addBook" class="add-btn">
                <span>➕</span>
                Add New Book
            </a>
        </div>
        <% } else { %>
        <div class="books-container">
            <% for (Book book : books) { %>
            <div class="book-card">
                <div class="book-header">
                    <div class="book-id">#<%= book.getId() %></div>
                    <h3 class="book-title"><%= book.getTitle() %></h3>
                    <div class="book-author">by <%= book.getAuthor() %></div>
                </div>

                <div class="book-body">
                    <div class="book-details">
                        <div class="detail-item">
                            <div class="detail-label">Price</div>
                            <div class="detail-value price">$<%= book.getPrice() %></div>
                        </div>

                        <div class="detail-item">
                            <div class="detail-label">Quantity</div>
                            <div class="detail-value quantity">
                                <%= book.getQuantity() %>
                                <% if (book.getQuantity() > 10) { %>
                                <span class="quantity-indicator high" title="High stock"></span>
                                <% } else if (book.getQuantity() > 5) { %>
                                <span class="quantity-indicator medium" title="Medium stock"></span>
                                <% } else { %>
                                <span class="quantity-indicator low" title="Low stock"></span>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div class="book-actions">
                        <a href="editBook.jsp?id=<%= book.getId() %>" class="action-btn edit-btn">
                            <span>✏️</span> Edit
                        </a>
                        <a href="deleteBook.jsp?id=<%= book.getId() %>" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this book?');">
                            <span>🗑️</span> Delete
                        </a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } %>
    </div>
</div>

<!-- Mobile sidebar toggle button -->
<button class="toggle-sidebar" onclick="toggleSidebar()">☰</button>

<script>
    function toggleSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const mainContent = document.querySelector('.main-content');

        if (sidebar.style.transform === 'translateX(-100%)') {
            sidebar.style.transform = 'translateX(0)';
        } else {
            sidebar.style.transform = 'translateX(-100%)';
        }
    }

    // Initialize for mobile
    if (window.innerWidth <= 768) {
        const sidebar = document.querySelector('.sidebar');
        sidebar.style.transform = 'translateX(-100%)';
    }
</script>
</body>
</html>