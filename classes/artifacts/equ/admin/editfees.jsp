<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="pg" uri="../WEB-INF/lib/pager-taglib-2.0.jar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>装备库存信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%

    String id=request.getParameter("id");
    feesdao dao=new feesdao();
    fees t=dao.Get(id);

    pageContext.setAttribute("t", t);
%>

<div class="layui-row">

    <div class="layui-card">
            <div class="layui-card-header">
                经费信息
            </div>
            <div class="layui-card-body">
                <form class="layui-form" action="${pageContext.request.contextPath}/admin/FeesServlet?act=save" method="post">
                    <input type="hidden" name="id" value="${t.id}">
                    <div class="layui-form-item">
                        <label class="layui-form-label">经费来源</label>
                        <div class="layui-input-inline">
                            <input type="text" name="source" value="${t.source}"  lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">金额</label>
                        <div class="layui-input-inline">
                            <input type="number" name="price"  value="${t.price}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">入账日期</label>
                        <div class="layui-input-inline">
                            <input type="datetime-local" name="indate" value="${t.indate}"  lay-verify="required" class="layui-input" />
                        </div>

                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">部门名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="deptname"  value="${t.deptname}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">经办人</label>
                        <div class="layui-input-inline">
                            <input type="text" name="optor"  value="${t.optor}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">项目明细</label>
                        <div class="layui-input-inline">
                           <textarea name="details" class="layui-textarea" lay-verify="required">${t.details}</textarea>
                        </div>
                    </div>




                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
