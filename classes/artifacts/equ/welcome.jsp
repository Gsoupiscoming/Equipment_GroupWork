
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">
                        欢迎登录：
                        <jsp:useBean id="now" class="java.util.Date" scope="page"/>

                        <span class="x-red">${u.role}-${u.username}</span>！当前时间:<fmt:formatDate value="${now}" pattern="yyyy年MM月dd日" />
                    </blockquote>
                </div>
            </div>
        </div>

        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>xxx版本</th>
                            <td>1.0.180420</td>
                        </tr>
                        <tr>
                            <th>服务器地址</th>
                            <td>x.xuebingsi.com</td>
                        </tr>
                        <tr>
                            <th>操作系统</th>
                            <td>WIN</td>
                        </tr>
                        <tr>
                            <th>运行环境</th>
                            <td>Tomcat</td>
                        </tr>
                        <tr>
                            <th>Java版本</th>
                            <td>8</td>
                        </tr>

                        <tr>
                            <th>MYSQL版本</th>
                            <td>5.x</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <style id="welcome_style"></style>

    </div>
</div>

</body>
</html>