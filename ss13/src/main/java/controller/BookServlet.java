package controller;

import model.Authors;
import model.Books;
import model.Category;
import service.IBookSrevice;
import service.impl.BookSrevice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import static javax.servlet.jsp.jstl.core.Config.remove;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    IBookSrevice bookSrevice = new BookSrevice();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addList(request, response);
                break;
            case "delete":
                remove(request,response);
                break;

            default:
                showList(request, response);
                break;

        }
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        for (int i = 0; i < bookSrevice.findAll().size(); i++) {
            if (bookSrevice.findAll().get(i).getId().equals(id)){
                bookSrevice.delete(id);
                try {
                    response.sendRedirect("/book");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    private void addList(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/view/create.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Books> booksList = bookSrevice.findAll();
        request.setAttribute("booksList", booksList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            default:
                break;
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        Integer authorsID = Integer.parseInt(request.getParameter("authors"));
        Integer categoryID = Integer.parseInt(request.getParameter("category"));
        Authors authors = new Authors(authorsID);
        Category category = new Category(categoryID);
//        Integer authors = Integer.parseInt(request.getParameter("authors"));
//        Integer category = Integer.parseInt(request.getParameter("category"));

        bookSrevice.save(new Books(id, name, pageSize, authors, category));
        try {
            response.sendRedirect("/book");
        }  catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
