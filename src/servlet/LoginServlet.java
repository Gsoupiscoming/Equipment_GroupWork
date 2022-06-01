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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
            String act=request.getParameter("act");
        sysuserdao dao=new sysuserdao();
            if(act.equals("add"))
            {
                String username=request.getParameter("username");
                String userpwd=request.getParameter("userpwd");
                String number=request.getParameter("number");
                String truename=request.getParameter("truename");
                String dept=request.getParameter("dept");
                sysuser u=new sysuser();
                u.setUserpwd(userpwd);
                u.setUsername(username);
                u.setTruename(truename);
                u.setNumber(number);
                u.setDept(dept);
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
                u.setCreatetime(sdf.format(new Date()));

                try {
                    int r=dao.add(u);
                    if(r==-1)
                    {
                        request.setAttribute("msg","用户名已存在");
                        request.getRequestDispatcher("register.jsp").forward(request,response);
                    }
                    else
                    {
                        request.setAttribute("msg","注册成功，请联系管理员审核后再登录！");
                        request.getRequestDispatcher("login.jsp").forward(request,response);

                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }

            else if(act.equals("login"))
            {
                String username=request.getParameter("username");
                String userpwd=request.getParameter("userpwd");
                String role=request.getParameter("role");

                try {
                    sysuser u=dao.Login(username,userpwd,role);
                    if(u==null)
                    {
                        request.setAttribute("msg","用户名或者密码错误");
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                    }	
                    else
                    {
                        if(u.getStatus()==false)
                        {
                            request.setAttribute("msg","你的账号还未通过审核，请审核后再登录");
                            request.getRequestDispatcher("login.jsp").forward(request,response);
                        }
                        else
                        {
                            request.getSession().setAttribute("u",u);
                            response.sendRedirect("main.jsp");
                        }
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }

            else  if(act.equals("logout"))
            {
                request.getSession().removeAttribute("u");
                response.sendRedirect("login.jsp");
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
