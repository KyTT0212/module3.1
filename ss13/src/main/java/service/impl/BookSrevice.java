package service.impl;

import model.Books;
import repository.IBookRepository;
import repository.impl.BookRepository;
import service.IBookSrevice;

import java.util.List;

public class BookSrevice implements IBookSrevice {
    IBookRepository bookRepository = new BookRepository();
    @Override
    public List<Books> findAll() {
        return bookRepository.findALL();
    }

    @Override
    public void save(Books books) {
        bookRepository.save(books);
    }

    @Override
    public void delete(int id) {
        bookRepository.delete(id);
    }
}
