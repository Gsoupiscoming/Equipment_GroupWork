
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>

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