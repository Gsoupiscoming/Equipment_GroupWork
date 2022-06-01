<%@ page import="bean.sysuser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>装备管理系统后台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">

    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>

    <script>// 是否开启刷新记忆tab功能
    // var is_remember = false;</script>
</head>
<body class="index">
<%
    if(session.getAttribute("u")==null)
    {
        response.sendRedirect("login.jsp");
        return;
    }

%>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="#">装备管理系统</a>
    </div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">你的角色：${u.role}，欢迎登录，</a>

        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${u.role}-${u.username}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->

                <dd>
                    <a href="${pageContext.request.contextPath}/LoginServlet?act=logout">退出</a>
                </dd>
            </dl>
        </li>

        <li class="layui-nav-item to-index">
        <a href="/">前台首页</a>
    </li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="个人信息管理">&#xe723;</i>
                    <cite>个人信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('个人信息管理', 'admin/viewuser.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>个人信息管理</cite>
                        </a>
                    </li>

                </ul>
            </li>
            <%
                if(session.getAttribute("u")!=null)
                {
                    sysuser u=(sysuser)session.getAttribute("u");
                    if(u.getRole().equals("管理员"))
                    {
                        
               
            %>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="基本信息管理">&#xe723;</i>
                    <cite>基本信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('装备基本信息管理', 'admin/equlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备基本信息管理</cite>
                        </a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备库存信息管理">&#xe723;</i>
                    <cite>装备库存信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备入库信息管理','admin/storelist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备入库信息管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备维修信息管理">&#xe723;</i>
                    <cite>装备维修信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备维修信息管理','admin/repairlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备维修信息管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备经费信息管理">&#xe723;</i>
                    <cite>装备经费信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备经费信息管理','admin/feeslist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备经费信息管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备资料信息管理">&#xe723;</i>
                    <cite>装备资料信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备资料信息管理','admin/datalist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备资料信息管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备资料借阅信息管理">&#xe723;</i>
                    <cite>装备资料借阅信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备资料借阅信息管理','admin/brorrowlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备资料借阅信息管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="用户管理">&#xe723;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('用户审核', 'admin/usercklist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户审核</cite>
                        </a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('用户信息','admin/userlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户信息</cite>
                        </a>
                    </li>
                </ul>
            </li>

<%
        }

                else 
        {
            
       
%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="基本信息查看">&#xe723;</i>
                    <cite>基本信息查看</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('装备基本信息查看', 'user/equlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备基本信息查看</cite>
                        </a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备库存信息查看">&#xe723;</i>
                    <cite>装备库存信息查看</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备入库信息查看','user/storelist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备入库信息查看</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备维修信息查看">&#xe723;</i>
                    <cite>装备维修信息查看</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备维修信息查看','user/repairlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备维修信息查看</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备经费信息查看">&#xe723;</i>
                    <cite>装备经费信息查看</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备经费信息查看','user/feeslist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备经费信息查看</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备资料信息查看">&#xe723;</i>
                    <cite>装备资料信息查看</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备资料信息查看','user/datalist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备资料信息查看</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="装备资料借阅信息查看">&#xe723;</i>
                    <cite>装备资料借阅信息查看</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('装备资料借阅信息查看','user/brorrowlist.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>装备资料借阅信息查看</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <%
                }
                }
            %>


        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>

</body>
</html>