package service.impl;

import model.Book;
import repository.IRepositoryBook;
import repository.impl.RepositoryBook;
import service.IServiceBook;

import java.util.List;

public class ServiceBook implements IServiceBook {
    IRepositoryBook repositoryBook = new RepositoryBook();
    @Override
    public List<Book> findAll() {
        return repositoryBook.findAll();
    }

    @Override
    public Book findById(int id) {
        return repositoryBook.finById(id);
    }

    @Override
    public void create(Book book) {
        repositoryBook.create(book);
    }

    @Override
    public void update(Book book) {

    }

    @Override
    public void delete(Book book) {
        repositoryBook.delete(book);
    }
}
