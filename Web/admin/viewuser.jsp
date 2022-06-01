<%@ page import="bean.sysuser" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.sysuserdao" %>
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
    if(session.getAttribute("u")==null)
    {
        response.sendRedirect("login.jsp");
        return;
    }


%>

<div class="layui-row">

    <div class="layui-card">
            <div class="layui-card-header">
                编辑用户信息
            </div>
            <div class="layui-card-body">
                <form class="layui-form" action="" method="">
                    <input type="hidden" name="id" value="${u.id}">
                    <div class="layui-form-item">
                        <label class="layui-form-label">编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="number" value="${u.number}" placeholder="" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="truename" value="${u.truename}" placeholder="" lay-verify="required" class="layui-input" />
                        </div>

                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">部门</label>
                        <div class="layui-input-inline">
                            <input type="text" name="dept" placeholder="" value="${u.dept}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">等级</label>
                        <div class="layui-input-inline">
                            <input type="text" name="role" placeholder="" value="${u.role}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                </form>
            </div>



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
