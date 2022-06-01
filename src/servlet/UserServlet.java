package servlet;

import bean.sysuser;
import dao.sysuserdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/admin/UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
            String act=request.getParameter("act");
        sysuserdao dao=new sysuserdao();
        if(act.equals("update"))
            {
                String id=request.getParameter("id");
                String number=request.getParameter("number");
                String truename=request.getParameter("truename");
                String dept=request.getParameter("dept");
                sysuser u= null;
                try {
                    u = dao.Get(id);
                    u.setTruename(truename);
                    u.setNumber(number);
                    u.setDept(dept);
                    dao.update(u);
                    request.setAttribute("msg","资料修改成功！");
                    request.getRequestDispatcher("/admin/userlist.jsp").forward(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }




            }
            else  if(act.equals("del"))
            {
                String id=request.getParameter("id");

                try {
                    dao.del(id);
                    request.setAttribute("msg","删除成功！");
                    request.getRequestDispatcher("/admin/userlist.jsp").forward(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }

            else  if(act.equals("check"))
            {
                String id=request.getParameter("id");
                sysuser u= null;
                try {
                    u = dao.Get(id);
                    u.setStatus(true);
                    dao.update(u);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                request.setAttribute("msg","审核成功！");
                request.getRequestDispatcher("/admin/usercklist.jsp").forward(request,response);
            }
            else  if(act.equals("reset"))
            {
                String id=request.getParameter("id");
                sysuser u= null;
                try {
                    u = dao.Get(id);
                    u.setUserpwd("12345678");
                    dao.update(u);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                request.setAttribute("msg","重置成功！密码已经重置为12345678！");
                request.getRequestDispatcher("/admin/userlist.jsp").forward(request,response);
            }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
