package com.example.ss9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

import static java.lang.System.out;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String u = request.getParameter("user");
        String p = request.getParameter("pass");

        if (u.equals("admin") && p.equals("123abc")){
//            String date = String.valueOf(new Date());
//            request.setAttribute("date",date);
                    request.getRequestDispatcher("success.jsp").forward(request,response);
        }else {
            String messenger= "Tên đăng nhập hoặc mật khẩu không đúng";
            request.setAttribute("messlogin",messenger);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
