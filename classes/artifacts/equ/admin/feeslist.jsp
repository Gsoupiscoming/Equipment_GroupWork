<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="pg" uri="../WEB-INF/lib/pager-taglib-2.0.jar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%
    request.setAttribute("url","feeslist.jsp");
    String pageNo=request.getParameter("pageNo");
    String key=request.getParameter("key");
    if(pageNo==null) pageNo="1";
    int pageSize=12;
    String where="";
    if(key!=null&&key!="")
    {
        where+=" and details like'%"+key+"%'";

    }
    feesdao dao=new feesdao();
    List<fees> list=dao.GetList(where, Integer.parseInt(pageNo), pageSize);
    int total=dao.GetCount(where);
    pageContext.setAttribute("total", total);
%>
<div class="layui-row">

    <div class="layui-card">
        <pg:pager items="${total}" url="${url}" maxPageItems = "<%=pageSize %>" maxIndexPages="<%=pageSize %>" export="offset,currentPageNumber=pageNumber" isOffset="false"  index="center"  >
            <%--  <pg:param name="m" value="findSysparams" />
             <pg:param name="pagesize"  value="2" /> --%>
            <div class="layui-card-header">
                <form class="layui-form" action="${pageContext.request.contextPath}/admin/${url}" method="get">
                    <input type="text" placeholder="输入要查找的明细" value="<%=key==null?"":key%>" name="key" class="layui-input" style="display: inline;width: 200px">
                    <button class="layui-btn layui-btn-primary">提交</button>
                    <a href="${pageContext.request.contextPath}/admin/editfees.jsp" class="layui-btn layui-btn-normal">添加</a>
                </form>
            </div>
            <div class="layui-card-body">
                <table class="layui-table" lay-size="sm">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>

                        <th>经费来源</th>
                        <th>金额</th >
                        <th>入账时间</th>
                        <th>部门名称</th>
                        <th>经办人</th>
                        <th>项目明细</th>

                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%


                        for(fees model:list)
                        {
                    %>
                    <tr>
                        <td><%=model.getSource() %></td>
                        <td><%=model.getPrice() %></td>
                        <td><%=model.getIndate().replace("T"," ") %></td>
                        <td><%=model.getDeptname() %></td>
                        <td><%=model.getOptor() %></td>
                        <td><%=model.getDetails() %></td>

                        <td>
                            <a href="${pageContext.request.contextPath}/admin/editfees.jsp?id=<%=model.getId() %>" class="layui-btn  layui-btn-xs"> 编辑</a> |
                            <a href="${pageContext.request.contextPath}/admin/FeesServlet?act=del&id=<%=model.getId() %>" class="layui-btn  layui-btn-xs"> 删除</a> |
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
