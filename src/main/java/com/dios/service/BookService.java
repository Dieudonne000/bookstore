package com.dios.service;

import com.dios.models.Book;
import java.util.List;

public interface BookService {
    List<Book> getAllBooks();
    void addBook(Book book);
    boolean updateBook(Book book);
    void deleteBook(int id);
    Book getBookById(int id);
}

