package controller.web;

import model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "WebServlet", urlPatterns = {"/WebServlet"})
public class WebServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel userModel = new UserModel();
        userModel.setFullName("tôi là webServlet đẩy từ model");
//        -------------------đẩy dữ liệu model ra ngoài view-------------------------
        request.setAttribute("model",userModel);
//        -------------------------> biến trả ra view có tên là "model", chính là gán cho userModel--------------------
        RequestDispatcher rd = request.getRequestDispatcher("/view/web/homeWeb.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
