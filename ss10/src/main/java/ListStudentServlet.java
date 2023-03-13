import model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListStudentServlet", value = "/listS")
public class ListStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> list = new ArrayList<>();
        list.add(new Student("Nguyễn Văn A",1,44.8));
        list.add(new Student("Nguyễn Văn B",0,65.8));
        list.add(new Student("Nguyễn Văn C",1,100.0));
        list.add(new Student("Nguyễn Văn D",0,80.0));
        list.add(new Student("Nguyễn Văn E",1,90.0));
        list.add(new Student("Nguyễn Văn F",0,70.0));
        request.setAttribute("list",list);
        if(list.size()==0){
            request.setAttribute("msg","Danh sách rỗng");
        }
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
