package controller;

import model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "WebServlet", value = "/WebServlet")
public class WebServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        --------sử dụng Model để đẩy dữ liệu ra view
        UserModel userModel = new UserModel();
        userModel.setFullName("tui là full name đẩy từ model nè");
//        dùng request.setAttribute("name đại diện cho cái abc",abc) để đẩy dữ liệu ra view
        request.setAttribute("name",userModel);
//        ----sử dụng request.getRequestDispatcher để gọi tới trang jsp mong muốn
//        request.getRequestDispatcher("/view/web/web.jsp").forward(request,response);
        request.getRequestDispatcher("/decorators/web.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
