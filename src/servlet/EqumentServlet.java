package servlet;

import bean.equment;
import dao.equmentdao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/admin/EqumentServlet")
public class EqumentServlet extends HttpServlet {
    private String uri="equlist.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String act=request.getParameter("act");
        equmentdao dao=new equmentdao();
        if(act.equals("save"))
        {
            String equnumber=request.getParameter("equnumber");
            String equname=request.getParameter("equname");
            String equtype=request.getParameter("equtype");
            String equxh=request.getParameter("equxh");
            String equdw=request.getParameter("equdw");
            String id=request.getParameter("id");
            equment e=new equment();
            e.setEqunumber(equnumber);
            e.setEquname(equname);
            e.setEqutype(equtype);
            e.setEqudw(equdw);
            e.setEquxh(equxh);
            if(id!=null&&id!="")
            {
                e.setId(Integer.parseInt(id));
                try {
                    dao.update(e);
                    request.setAttribute("msg","信息修改成功！");
                    request.getRequestDispatcher(uri).forward(request,response);
                } catch (IllegalAccessException illegalAccessException) {
                    illegalAccessException.printStackTrace();
                } catch (InstantiationException instantiationException) {
                    instantiationException.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            else {
                try {
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    e.setCreatetime(sdf.format(new Date()));
                    dao.add(e);
                    request.setAttribute("msg","添加成功！");
                    request.getRequestDispatcher(uri).forward(request,response);
                } catch (IllegalAccessException illegalAccessException) {
                    illegalAccessException.printStackTrace();
                } catch (InstantiationException instantiationException) {
                    instantiationException.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        else  if(act.equals("del"))
        {
            String id=request.getParameter("id");

            try {
                dao.del(id);
                request.setAttribute("msg","删除成功！");
                request.getRequestDispatcher(uri).forward(request,response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }
}
