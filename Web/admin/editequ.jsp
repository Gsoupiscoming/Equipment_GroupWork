<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="pg" uri="../WEB-INF/lib/pager-taglib-2.0.jar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>装备信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%

    String id=request.getParameter("id");
    equmentdao dao=new equmentdao();
    equment t=dao.Get(id);

    pageContext.setAttribute("t", t);
%>

<div class="layui-row">

    <div class="layui-card">
            <div class="layui-card-header">
                装备信息
            </div>
            <div class="layui-card-body">
                <form class="layui-form" action="${pageContext.request.contextPath}/admin/EqumentServlet?act=save" method="post">
                    <input type="hidden" name="id" value="${t.id}">
                    <div class="layui-form-item">
                        <label class="layui-form-label">装备编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="equnumber" value="${t.equnumber}"  lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="equname" value="${t.equname}"  lay-verify="required" class="layui-input" />
                        </div>

                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">类别</label>
                        <div class="layui-input-inline">
                            <input type="text" name="equtype"  value="${t.equtype}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">规格型号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="equxh"  value="${t.equxh}" lay-verify="required" class="layui-input" />
                        </div>
                    </div>

      <%--  <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">装备类别</label>
            <div class="layui-input-inline">
                <input type="text" name="equtype"  value="${t.equtype}" lay-verify="required" class="layui-input" />
            </div>
        </div>
    </div>--%>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">计量单位</label>
        <div class="layui-input-inline">
            <input type="text" name="equdw"  value="${t.equdw}" lay-verify="required" class="layui-input" />
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
