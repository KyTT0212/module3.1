package repository;

import model.Books;

import java.util.List;

public interface IBookRepository {
    List<Books> findALL();

    void save(Books books);

    void delete(int id);
}
