package service;

import model.Books;

import java.util.List;

public interface IBookSrevice {
    List<Books> findAll();

    void save(Books books);

    void delete(int id);
}
