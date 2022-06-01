package servlet;

import bean.repair;
import dao.repairdao;

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

@WebServlet("/admin/RepairServlet")
public class RepairServlet extends HttpServlet {
    private String uri="repairlist.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String act=request.getParameter("act");
        repairdao dao=new repairdao();
        if(act.equals("save"))
        {
            String equnumber=request.getParameter("equnumber");
            String equname=request.getParameter("equname");
            String subdate=request.getParameter("subdate");
            String leader=request.getParameter("leader");
            String repaircompany=request.getParameter("repaircompany");
            String fee=request.getParameter("fee");
            String reason=request.getParameter("reason");
            String state=request.getParameter("state");

            String id=request.getParameter("id");
            repair e=new repair();
            e.setEqunumber(equnumber);
            e.setEquname(equname);
            e.setSubdate(subdate);
            e.setFee(new BigDecimal(fee));
            e.setLeader(leader);
            e.setReason(reason);
            e.setRepaircompany(repaircompany);
            e.setState(state);

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
