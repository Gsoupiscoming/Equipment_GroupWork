<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>


</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message"><h1>登录| <a style="font-size: 15px" href="register.jsp">注册</a></h1> </div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" action="${pageContext.request.contextPath}/LoginServlet?act=login">
       账号： <input type="text" name="username" id="username" placeholder="请输入用户名" lay-verify="required" class="layui-input" />
        <hr class="hr15">
       密码： <input type="password" name="userpwd" id="userpwd" placeholder="八个字母、数字、字符组成" lay-verify="required" class="layui-input"/>
        <hr class="hr15">
       类型： <select class="layui-inline" name="role" lay-verify="required">
            <option value="">请选择登录类型</option>
            <option>管理员</option>
            <option>用户</option>

        </select>

        <hr class="hr15">
        <div style="text-align: center"><button type="submit" lay-submit lay-filter="login" style="width:50%;height:45px;line-height:45px;" class="layui-btn">点击登录</button></div>
        <hr class="hr20">
        <div style="float: right"> <<a href="index.jsp">返回主页</a></div>
    </form>
</div>
<script>$(function  () {
    layui.use('form', function(){
        var form = layui.form;
        var layer = layui.layer;

        <c:if test="${not empty msg}">

        layer.msg("${msg}");

        </c:if>
        // layer.msg('玩命卖萌中', function(){
        //   //关闭后的操作
        //   });
        //监听提交
        form.on('submit(login)', function(data){
            //1.定义正则
            var reg = /^[a-zA-Z0-9_-]{8}$/;

            //2.获取输入的用户名的内容(获取标签的value值)
            var userpwd=$("#userpwd").val();

            //3.进行校验
            if (!reg.test(userpwd)) {
                layer.msg("密码是8位字母或者数字")
                return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }
            return true;
        });

    });
})</script>
<!-- 底部结束 -->

</body>
</html>
