package servlet;

import bean.fees;
import dao.feesdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/admin/FeesServlet")
public class FeesServlet extends HttpServlet {
    private String uri="feeslist.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String act=request.getParameter("act");
        feesdao dao=new feesdao();
        if(act.equals("save"))
        {
            String source=request.getParameter("source");
            String indate=request.getParameter("indate");
            String deptname=request.getParameter("deptname");
            String optor=request.getParameter("optor");
            String details=request.getParameter("details");
            String price=request.getParameter("price");


            String id=request.getParameter("id");
            fees e=new fees();

            e.setPrice(new BigDecimal(price));
              e.setSource(source);
              e.setIndate(indate);
              e.setDeptname(deptname);
              e.setOptor(optor);
              e.setDetails(details);


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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
