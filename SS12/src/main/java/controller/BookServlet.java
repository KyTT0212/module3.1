package controller;

import model.Books;
import service.IBookSrevice;
import service.impl.BookSrevice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    IBookSrevice bookSrevice = new BookSrevice();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addList(request,response);
                break;
            case "delete":
                break;
            default:
                showList(request,response);
                break;

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
        request.setAttribute("booksList",booksList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action== null){
            action ="";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            default:
                break;
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        Integer authors = Integer.parseInt(request.getParameter("authors"));
        Integer category = Integer.parseInt(request.getParameter("category"));

        bookSrevice.save(new Books(id,name,pageSize,authors,category));
        try {
            request.getRequestDispatcher("/book").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
