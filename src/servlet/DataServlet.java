package servlet;

import bean.data;
import dao.datadao;

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

@WebServlet("/admin/dataServlet")
public class DataServlet extends HttpServlet {
    private String uri="datalist.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String act=request.getParameter("act");
        datadao dao=new datadao();
        if(act.equals("save"))
        {
            String datanumber=request.getParameter("datanumber");
            String datatype=request.getParameter("datatype");
            String dataname=request.getParameter("dataname");
            String regdate=request.getParameter("regdate");
            String counts=request.getParameter("counts");
            String price=request.getParameter("price");

            String id=request.getParameter("id");
            data e=new data();

            e.setCounts(Integer.parseInt(counts));
            e.setPrice(new BigDecimal(price));
            e.setDataname(dataname);
            e.setDatanumber(datanumber);
            e.setDatatype(datatype);
            e.setRegdate(regdate);

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
