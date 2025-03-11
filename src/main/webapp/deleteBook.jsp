<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dios.service.BookService, com.dios.serviceImpl.BookServiceImpl" %>
<%
    int bookId = Integer.parseInt(request.getParameter("id"));
    BookService bookService = new BookServiceImpl();
    bookService.deleteBook(bookId);
    response.sendRedirect("dashboard.jsp");
%>
