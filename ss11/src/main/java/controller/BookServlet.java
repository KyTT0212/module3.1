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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
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
        Book book = this.serviceBook.findById(id);
        request.setAttribute("book", book);
        request.getRequestDispatcher("/view/update.jsp").forward(request, response);
    }

    private void deleteForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        for (int i = 0; i <serviceBook.findAll().size() ; i++) {
           if (serviceBook.findAll().get(i).getId()==id){
//               try {
//                   request.getRequestDispatcher("/view/delete.jsp").forward(request,response);
//               } catch (ServletException e) {
//                   throw new RuntimeException(e);
//               }
               serviceBook.delete(i);
           }
        }
        response.sendRedirect("/Book");
    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/view/create.jsp");
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
            case "delete":
                delete(request, response);
                break;
            case "update":
                update(request,response);
                break;
            default:
                break;
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int page = Integer.parseInt(request.getParameter("page"));
        String author = request.getParameter("author");
        int category = Integer.parseInt(request.getParameter("category"));

        Book book=new Book(id,title,page,author,category);

        serviceBook.update(id,book);
        response.sendRedirect("/Book");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
//        Integer id = Integer.parseInt(request.getParameter("id"));
//        for (int i = 0; i < serviceBook.findAll().size(); i++) {
//            if (id == serviceBook.findAll().get(i).getId()){
//                serviceBook.findAll().remove(i);
//            }
//        }


//        int id = Integer.parseInt(request.getParameter("id"));
//        Book book = serviceBook.findById(id);
//
//        if (book == null) {
//            try {
//                response.sendRedirect("/view/error404.jsp");
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
//        } else {
//            serviceBook.delete(book);
//            try {
//                response.sendRedirect("/Book");
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
//        }
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
