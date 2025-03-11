package com.dios.controllers;

import com.dios.models.Book;
import com.dios.service.BookService;
import com.dios.serviceImpl.BookServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/book")
public class BookController extends HttpServlet {
    private BookService bookService = new BookServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Book newBook = new Book(0, title, author, price, quantity);
            bookService.addBook(newBook);

            response.sendRedirect("dashboard");
        }
        if ("edit".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String title = request.getParameter("title");
                String author = request.getParameter("author");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                BookService bookService = new BookServiceImpl();
                Book book = new Book(id, title, author, price, quantity);
                bookService.updateBook(book);
                response.sendRedirect("dashboard?message=success");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("editBook.jsp?id=" + request.getParameter("id") + "&error=invalid_data");
            }
        }
    }
}
