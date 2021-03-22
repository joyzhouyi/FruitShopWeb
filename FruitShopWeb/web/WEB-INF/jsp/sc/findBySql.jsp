<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
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
    <meta charset="utf-8">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <%--    <script src="${pageContext.request.contextPath}/test1_war_exploded/resource/js/jquery-1.8.3.min.js"></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/test1_war_exploded/resource/user/js/jquery.luara.0.0.1.min.js"></script>--%>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
    }


    body,
    html {
        width: 100%;
    }
</style>
<script>
    window.onload = function () {


    }


</script>
<body>


<%@include file="/common/utop.jsp" %>

<div class="container1" style="width: 100%;height: auto">

    <div class="container-header" style="width: 100%;">
        <div class="top" style="width: 100%; background-color: #DB4547;">
            <div class="layui-main layui-row" style="width: 70%; height: 60px; ">

                <div class="layui-col-md8" style="height: 100%;">
                    <ul class="layui-nav" style="height: 100%;background-color: #DB4547; color: black;">

                        <li class="layui-nav-item">
                            <!-- <a href="">登录<span class="layui-badge">9</span></a> -->
                            <a href="login/uIndex" style="color: white;">首页</a>
                        </li>

                        <li class="layui-nav-item">
                            <a href="news/list" style="color: white;">公告</a> </a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="message/add" style="color: white;">留言</a>

                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="layui-main" style="width: 80%;margin-top: 10px;margin-bottom: 30px;padding-left: 40px;">

    当前位置：首页>个人中心>商品收藏
</div>

<div class="layui-main layui-row" style="width: 80%; ">
    <div class="layui-col-md4">
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg "
                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/user/view'">个人信息
        </button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg"
                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/itemOrder/my'">我的订单
        </button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg redColor">商品收藏</button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">修改密码</button>
    </div>


    <div class="layui-col-md8">&nbsp;
        <p style="margin: 20px;font-weight: bold;font-size: 20px">最近收藏</p>
        <c:forEach items="${pagers.datas}" var="item" varStatus="1">
            <div class="layui-main layui-row" style="width: 100%;border: solid #ada9a9 1px;margin-top: 5px;padding: 10px;">
                <div class="layui-col-md3">
                    <img src="${pageContext.request.contextPath}/${item.item.url1}" width="100px" height="100px">
                </div>
                <div class="layui-col-md4">
                    <p>${item.item.name}</p>
                    <p style="color: red; margin-top: 10px;">￥${item.item.price}</p>

                </div>
                <div class="layui-col-md4">
                    <button type="button" class="layui-btn layui-btn-primary"
                            style="margin-top: 20px;margin-left: 20px;"
                    onclick="javascript:window.location.href='${pageContext.request.contextPath}/sc/delete?id=${item.id}'"
                    >取消收藏</button>
                </div>

            </div>
        </c:forEach>


    </div>


</div>
<script>

    window.onload = function () {
        let layuiBtnLg = document.getElementsByClassName('layui-btn-lg');
        let redColor = document.getElementsByClassName('redColor')[0];
        redColor.style.background = "#DB4547";
        redColor.style.color = "#ffffff";
        for (let i = 0; i < layuiBtnLg.length; i++) {
            layuiBtnLg[i].onclick = function () {
                if (i == 0) {
                    window.location.href = "${pageContext.request.contextPath}/user/view";
                } else if (i == 1) {
                    window.location.href = "${pageContext.request.contextPath}/itemOrder/my";

                } else if (i == 2) {
                    window.location.href = "${pageContext.request.contextPath}/sc/findBySql";
                } else if (i == 3) {
                    window.location.href = "${pageContext.request.contextPath}/login/pass";
                }
                for (let i = 0; i < layuiBtnLg.length; i++) {
                    layuiBtnLg[i].style.background = '#ffffff';
                    layuiBtnLg[i].style.color = '#000000';

                }


                this.style.background = "#DB4547";
                this.style.color = "#ffffff";
            }
        }


    }

</script>


<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return true;
        });
    });
</script>
<%@include file="/common/ufooter.jsp" %>


</body>
</html>