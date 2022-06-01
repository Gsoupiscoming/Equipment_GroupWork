<%@ page import="bean.sysuser" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.sysuserdao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="pg" uri="../WEB-INF/lib/pager-taglib-2.0.jar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户审核列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%
    request.setAttribute("url","usercklist.jsp");
    String pageNo=request.getParameter("pageNo");
    if(pageNo==null) pageNo="1";
    int pageSize=2;
    String where=" and role='用户' and status=0 ";
    sysuserdao dao=new sysuserdao();
    List<sysuser> list=dao.GetList(where, Integer.parseInt(pageNo), pageSize);
    int total=dao.GetCount(where);
    pageContext.setAttribute("total", total);
%>

    <div class="layui-row">

        <div class="layui-card">
            <pg:pager items="${total}" url="${url}" maxPageItems = "<%=pageSize %>" maxIndexPages="<%=pageSize %>" export="offset,currentPageNumber=pageNumber" isOffset="false"  index="center"  >
                <%--  <pg:param name="m" value="findSysparams" />
                 <pg:param name="pagesize"  value="2" /> --%>
                <div class="layui-card-header">用户注册审核</div>
                <div class="layui-card-body">
                    <table class="layui-table" lay-size="sm">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>

                            <th>用户编号</th>
                            <th>用户姓名</th >
                            <th>用户账号</th>
                            <th>用户密码</th>
                            <th>注册时间</th>

                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%


                            for(sysuser model:list)
                            {
                        %>
                        <tr>
                            <td><%=model.getId() %></td>
                            <td><%=model.getTruename() %></td>
                            <td><%=model.getUsername() %></td>
                            <td><%=model.getUserpwd() %></td>
                            <td><%=model.getCreatetime() %></td>

                            <td>
                                <a href="${pageContext.request.contextPath}/admin/UserServlet?act=check&id=<%=model.getId() %>" class="layui-btn  layui-btn-xs"> <i class="layui-icon">&#xe642;</i>审核通过</a>
                            </td>

                        </tr>
                        <%} %>
                        </tbody>
                    </table>

                </div>
                <div class="layui-elem-quote" style="border:0px;text-align:center">
                    <pg:index>
                        <pg:first>
                            <a class="layui-btn layui-btn-primary layui-btn-xs" href="<%=pageUrl%>&pageNo=<%=pageNumber%>">首页</a>
                        </pg:first>
                        <pg:prev>
                            <a class="layui-btn layui-btn-primary layui-btn-xs" href="<%=pageUrl%>&pageNo=<%=pageNumber%>">上一页</a>
                        </pg:prev>
                        <pg:pages>
                            <c:choose>
                                <c:when test="${pageNumber eq currentPageNumber}">
                                    <font color="red">[<%=pageNumber%>]</font>
                                </c:when>
                                <c:otherwise>
                                    <a href="<%=pageUrl%>&pageNo=<%=pageNumber%>"><%=pageNumber%></a>
                                </c:otherwise>
                            </c:choose>
                        </pg:pages>
                        <pg:next>
                            <a class="layui-btn layui-btn-primary layui-btn-xs"  href="<%=pageUrl%>&pageNo=<%=pageNumber%>">下一页</a>
                        </pg:next>
                        <pg:last>
                            <a class="layui-btn layui-btn-primary layui-btn-xs" href="<%=pageUrl%>&pageNo=<%=pageNumber%>">尾页</a>
                        </pg:last>
                        一共${total }条记录
                    </pg:index>
                </div>
            </pg:pager>

        </div>
    </div>
<script>$(function  () {
    layui.use('form', function(){
        var form = layui.form;
        <c:if test="${not empty msg}">

        layer.msg("${msg}");

        </c:if>
        // layer.msg('玩命卖萌中', function(){
        //   //关闭后的操作
        //   });
        //监听提交

    });
})</script>
</body>
</html>
