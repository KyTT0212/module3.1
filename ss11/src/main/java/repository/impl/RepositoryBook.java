package repository.impl;

import model.Book;
import repository.IRepositoryBook;

import java.util.ArrayList;
import java.util.List;

public class RepositoryBook implements IRepositoryBook {

    static List<Book> bookList = new ArrayList<>();
    static {
        bookList.add(new Book("Nguyến Văn A",55,"Nguyễn A",6));
        bookList.add(new Book("Nguyến Văn B",85,"Nguyễn B",1));
        bookList.add(new Book("Nguyến Văn C",863,"Nguyễn C",2));
        bookList.add(new Book("Nguyến Văn D",758,"Nguyễn D",3));
        bookList.add(new Book("Nguyến Văn E",75,"Nguyễn E",1));
        bookList.add(new Book("Nguyến Văn F",245,"Nguyễn F",4));
        bookList.add(new Book("Nguyến Văn G",100,"Nguyễn G",3));
    }

    @Override
    public List<Book> findAll() {
        return bookList;
    }

    @Override
    public Book finById(int id) {
        for (Book book:bookList) {
            if(id== book.getId()){
                return book;
            }
        }
        return null;
    }

    @Override
    public void create(Book book) {
        bookList.add(book);
    }

    @Override
    public void update(Book book) {

    }

    @Override
    public void delete(Book book) {
        for (int i = 0; i < bookList.size(); i++) {
            if (book.getId()==bookList.get(i).getId()){
                bookList.remove(i);
            }
        }
    }
}
