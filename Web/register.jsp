<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.all.js" charset="utf-8"></script>

</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message"><h1>注册 | <a style="font-size: 15px" href="login.jsp">登录</a></h1>  </div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" action="${pageContext.request.contextPath}/LoginServlet?act=add">
        账号：<input type="text" name="username" placeholder="请输入用户名" lay-verify="required" class="layui-input" />
        <hr class="hr15">
        密码：<input type="password" name="userpwd" id="userpwd" placeholder="八个字母、数字、字符组成" lay-verify="required" class="layui-input"/>
        <hr class="hr15">
        编号：<input type="text" name="number" placeholder="请输入编号" lay-verify="required" class="layui-input" />
        <hr class="hr15">
        名称：<input type="text" name="truename" placeholder="请输入名称" lay-verify="required" class="layui-input" />
        <hr class="hr15">
        部门：<input type="text" name="dept" placeholder="请输入部门" lay-verify="required" class="layui-input" />
        <hr class="hr15">

        <hr class="hr15">
       <div style="text-align: center"> <button type="submit" lay-submit lay-filter="login" style="width:50%;height:45px;line-height:45px;" class="layui-btn">注册</button></div>


        <hr class="hr20">
        <div style="text-align: center">注册后需要等待管理员审核后才可登录</div>
        <hr class="hr20">
        <div style="float: right"> <<a href="index.jsp">返回主页</a></div>


    </form>
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
