package repository;

import model.Book;

import java.util.List;

public interface IRepositoryBook {
    List<Book> findAll();
    Book finById(int id);
    void create(Book book);
    void update(Book book);
    void delete(Book book);
}
