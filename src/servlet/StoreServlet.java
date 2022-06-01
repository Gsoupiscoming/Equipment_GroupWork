package servlet;

import bean.equment;
import bean.store;
import dao.equmentdao;
import dao.storedao;

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

@WebServlet("/admin/StoreServlet")
public class StoreServlet extends HttpServlet {
    private String uri="storelist.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String act=request.getParameter("act");
        storedao dao=new storedao();
        if(act.equals("save"))
        {
            String equnumber=request.getParameter("equnumber");
            String equname=request.getParameter("equname");
            String producedate=request.getParameter("producedate");
            String indate=request.getParameter("indate");
            String counts=request.getParameter("counts");
            String price=request.getParameter("price");
            String optor=request.getParameter("optor");
            String equtype=request.getParameter("equtype");
            String id=request.getParameter("id");
            store e=new store();
            e.setEqunumber(equnumber);
            e.setEquname(equname);
            e.setCounts(Integer.parseInt(counts));
            e.setPrice(new BigDecimal(price));
            e.setProducedate(producedate);
            e.setIndate(indate);
            e.setOptor(optor);
            e.setEqutype(equtype);

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
