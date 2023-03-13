package service;

import model.Book;

import java.util.List;

public interface IServiceBook {
    List<Book> findAll();
    Book findById(int id);
    void create(Book book);
    void update(Book book);
    void delete(Book book);
}
