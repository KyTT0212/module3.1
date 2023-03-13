package controller;

import model.Book;
import service.IServiceBook;
import service.impl.ServiceBook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/Book")
public class BookServlet extends HttpServlet {
    IServiceBook serviceBook = new ServiceBook();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createForm(request, response);
                break;
            case "delete":
                deleteForm(request, response);
                break;
            case "update":
                updateForm(request, response);
                break;
            default:
                List<Book> bookList = serviceBook.findAll();
                request.setAttribute("bookList", bookList);
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        }


    }

    private void updateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = serviceBook.findById(id);

        request.setAttribute("book", book);
        request.getRequestDispatcher("/view/update.jsp").forward(request, response);
    }

    private void deleteForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/view/delete.jsp");
    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/view/create.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "update":
                update(request,response);
            default:
                break;
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        Integer page = Integer.parseInt(request.getParameter("page"));
        String author = request.getParameter("author");
        Integer category = Integer.parseInt(request.getParameter("category"));

        Book book = serviceBook.findById(id);

        if (book==null){
            request.getRequestDispatcher("/view/error404.jsp").forward(request,response);
        }else {
            book.setTitle(title);
            book.setPageSize(page);
            book.setAuthor(author);
            book.setCategory(category);
            serviceBook.update(book);
            response.sendRedirect("/Book");
        }


    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = serviceBook.findById(id);

        if (book == null) {
            try {
                response.sendRedirect("/view/error404.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            serviceBook.delete(book);
            try {
                response.sendRedirect("/Book");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        Integer page = Integer.parseInt(request.getParameter("page"));
        String author = request.getParameter("author");
        Integer category = Integer.parseInt(request.getParameter("category"));
        serviceBook.create(new Book(title, page, author, category));

        try {
            response.sendRedirect("/Book");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }
}
