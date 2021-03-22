<%--
  Created by IntelliJ IDEA.
  User: zhouyi
  Date: 2021/3/1
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://" + request.getServerName()
            + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!--写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>

<head>
    <title>管理员后台</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            height: 100%;
            /* overflow: hidden; */
        }
    </style>
</head>
<script src="layui/layui.js"></script>

<body>
<div class="container" style="height: 100%;">

    <div class="header layui-row layui-bg-black layui-row-space10" style="height: 10%;">
        <div style="width: 100%;height: 10px;"></div>
        <div class="layui-col-md1" style="font-size: 20px; text-align: center;padding-top:5px ;">
            <span class=""> 管理员后台</span>
        </div>
        <div class="layui-col-md4  ">
            <div class="layui-btn-group ">
                <button type="button" class="layui-btn" onclick="javascript:window.location.href='${pageContext.request.contextPath}/login/toMIndex'"

                ><i class="layui-icon">&#xe68e;</i>前台首页
                </button>
                <button type="button" class="layui-btn layui-btn-danger"
                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/login/mTuiChu'"
                ><i class="layui-icon">&#xe682;</i>退出登录
                </button>
            </div>
        </div>

    </div>
    <div class="center" style="height: 88%;width: 98%">
        <div class="layui-row" style="height: 100%;">
            <div class="layui-col-md1" style="height: 100%;">


                <div style="height:8%;background: #d92700">
                    <button type="button" class="layui-btn layui-btn-danger"
                            style="height: 100%;width: 100%;"><i class="layui-icon">&#xe66b;</i>所有管理
                    </button>
                </div>
                <div class="layui-bg-black" style="height: 84%;">

                    <ul class="layui-nav layui-nav-tree" lay-filter="test" style="width: 100%;">
                        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                        <li class="layui-nav-item layui-nav-itemed">
                            <a target="right" href="itemCategory/findBySql">类目管理</a>
                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a target="right" href="user/findBySql">用户管理</a>

                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a target="right" href="item/findBySql">商品管理</a>

                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a target="right" href="itemOrder/findBySql">订单管理</a>

                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a target="right" href="news/findBySql">公告管理</a>

                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a target="right" href="message/findBySql">留言管理</a>

                        </li>
                    </ul>
                </div>


            </div>

            <div class="layui-col-md11 " style="height: 100%;">

                <div class="bread" style="height:10%;border-left: solid 2px #908b8b">
                    <ul class="layui-nav layui-bg-gray" lay-filter="">
                        <li class=" layui-nav-item "><a href="" style="color: black;">首页</a></li>
                        <li class="layui-nav-item "><a href="" style="color: black;">网站信息</a></li>
                        <li class="layui-nav-item layui-this">

                        </li>

                    </ul>
                    <!-- <div style="">
                        <b>当前语言：</b>
                        <span style="color: red;">中文</span>&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a
                            href="#">中文</a>&nbsp;&nbsp;<a href="#">English</a>

                    </div> -->
                </div>

                <div class="admin" style="height: 90%;">
                    <iframe name="right" scolling="auto" width="100%" height="100%"></iframe>
                </div>
            </div>


        </div>
        <div class="footer">

        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate', 'element', 'jquery'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            $ = layui.jquery;

        $(document).on('click', '#btn', function () {
            layer.msg('hello');

        });

    });

</script>


</body>

</html>