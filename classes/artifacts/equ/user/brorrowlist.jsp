<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="util.DBUtil" %>
<%@ page import="java.util.Map" %>
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
    int uid=0;
    if(session.getAttribute("u")!=null) {
        sysuser u= (sysuser) session.getAttribute("u");
        uid=u.getId();
    }
    request.setAttribute("url","brorrowlist.jsp");
    String pageNo=request.getParameter("pageNo");
    String key=request.getParameter("key");
    if(pageNo==null) pageNo="1";
    int pageSize=12;
    String sql="select b.*,d.datanumber,d.dataname,d.counts from brorrow b left join data d on b.dataid=d.id  where b.sysuerid="+uid;
    String where="";
    if(key!=null&&key!="")
    {
        sql+=" and d.dataname like '%"+key+"%'";

    }
    List<Map> list1= DBUtil.executeQuery(sql);
    int total=list1.size();
    sql+=" order by b.id desc limit "+pageSize*(Integer.parseInt(pageNo)-1)+","+pageSize;
    List<Map> list= DBUtil.executeQuery(sql);

    pageContext.setAttribute("total", total);
%>

<div class="layui-row">

    <div class="layui-card">
        <pg:pager items="${total}" url="${url}" maxPageItems = "<%=pageSize %>" maxIndexPages="<%=pageSize %>" export="offset,currentPageNumber=pageNumber" isOffset="false"  index="center"  >
            <%--  <pg:param name="m" value="findSysparams" />
             <pg:param name="pagesize"  value="2" /> --%>
            <div class="layui-card-header">
                <form class="layui-form" action="${pageContext.request.contextPath}/user/${url}" method="get">
                    <input type="text" placeholder="输入要查找的资料名称" value="<%=key==null?"":key%>" name="key" class="layui-input" style="display: inline;width: 200px">
                    <button class="layui-btn layui-btn-primary">提交</button>

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

                        <th>资料编号</th>
                        <th>资料名称</th>
                        <th>借阅人</th>
                        <th>借阅日期</th>
                        <th>状态</th>
                        <th>批准人</th>
                        <th>数量</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%

                        sysuserdao udao=new sysuserdao();
                        for(Map model:list)
                        {
                            sysuser u=udao.Get(model.get("sysuerid").toString());
                            String ckuser="";
                            sysuser u1=udao.Get((String)model.get("ckuserid").toString());
                            if(u1!=null)
                            ckuser=u1.getUsername();
                    %>
                    <tr>
                        <td><%=model.get("datanumber") %></td>
                        <td><%=model.get("dataname") %></td>
                        <td><%=u.getUsername() %></td>
                        <td><%=model.get("brorrowdate") %></td>
                        <td><%=model.get("state") %></td>
                        <td><%=ckuser %></td>
                         <td><%=model.get("counts") %></td>



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
