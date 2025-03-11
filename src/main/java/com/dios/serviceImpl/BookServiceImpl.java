package com.dios.serviceImpl;

import com.dios.dao.BookDAO;
import com.dios.daoImpl.BookDAOImpl;
import com.dios.models.Book;
import com.dios.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {
    private BookDAO bookDAO = new BookDAOImpl();

    @Override
    public List<Book> getAllBooks() {
        return bookDAO.getAllBooks();
    }

    @Override
    public void addBook(Book book) {
        bookDAO.addBook(book);
    }

    @Override
    public boolean updateBook(Book book) {
        bookDAO.updateBook(book);
        return false;
    }

    @Override
    public void deleteBook(int id) {
        bookDAO.deleteBook(id);
    }

    @Override
    public Book getBookById(int id) {
        return bookDAO.getBookById(id);
    }
}

