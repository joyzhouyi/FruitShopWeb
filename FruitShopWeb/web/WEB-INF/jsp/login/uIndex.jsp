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
    <meta charset="utf-8">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
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
<body>



<%@include file="/common/utop.jsp" %>

<div class="container1" style="width: 100%;height: auto">

    <div class="container-header" style="width: 100%;">
        <div class="top" style="width: 100%; background-color: #DB4547;">
            <div class="layui-main layui-row" style="width: 70%; height: 60px; ">
                <div class="layui-col-md4 "
                     style="height: 100%; text-align: left;line-height: 60px; color: white;padding-left: 20px;">
                    <i class="layui-icon layui-icon-spread-left" style="font-size: 15px; color: white;"></i> 分类
                </div>
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
    <div class="center">
        <div class="top" style="width: 100%; background-color: white;">
            <div class="layui-main layui-row" style="width: 80%; height: 400px; ">
                <div class="layui-col-md3 "
                     style="height: 100%;   text-align: left;line-height: 100px;overflow: hidden; background-color: #DB4547 ;">

                    <div class="layui-collapse" lay-accordion="" style="" style="background-color:#DB4547 ;">

                        <c:forEach items="${lbs}" var="data" varStatus="1">


                            <div class="layui-colla-item" style="background-color:#DB4547 ;">
                                <h2 class="layui-colla-title"
                                    style="background-color:#DB4547 ;color: #ffffff;">${data.father.name}</h2>
                                <c:if test="${data.childrens.size()!=0}">
                                    <div class="layui-colla-content  " style="background-color:#DB4547 ;color: #ffffff;">
                                        <c:forEach items="${data.childrens}" var="child" varStatus="1">
                                            <h2 class="layui-colla-title"
                                                style="background-color:#DB4547 ;"
                                                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/item/shopList?categoryIdTwo=${child.id}'"> ${child.name} </h2>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-col-md9" style=" background-color: white;">
                    <div class="layui-carousel" id="test10">
                        <div carousel-item="">
                            <div style="height: 100%;"><img src="${pageContext.request.contextPath}/pic/a.webp"></div>
                            <div style="height: 100%;"><img src="${pageContext.request.contextPath}/pic/b.webp"></div>
                            <div style="height: 100%;"><img src="${pageContext.request.contextPath}/pic/c.webp"></div>
                            <div style="height: 100%;"><img src="${pageContext.request.contextPath}/pic/d.webp"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>


</div>


<div class="container2">
    <div class="layui-main " style="width: 80%;margin-top: 40px">
        <hr class="layui-bg-gray">
        <label style="font-weight: bolder;margin-left: 0px">折扣大促销</label>
        <br/>
        <hr class="layui-bg-red">
    </div>
    <div class="top" style="width: 100%; background-color: white;">
        <div class="layui-main layui-row" style=" width: 80%; height: 500px;color: red ;background: #f4f4f4 ">
            <div class="layui-row">

                <c:forEach items="${zks}" var="data" varStatus="1">

                    <div class="layui-col-sm2"
                         style="margin-right: 10px;margin-left: 15px;margin-top: 10px;cursor:pointer;"
                         onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/item/view?id=${data.id}'">

                        <div class="layui-card">
                            <div class="layui-card-header">${data.name} </div>
                            <div class="layui-card-header"><span
                                    style="font-size: 15px;color: red"> ${data.price} ￥</span></div>
                            <div class="layui-card-body">
                                <img src="${pageContext.request.contextPath}/${data.url1}" width="100%" height="120px">
                            </div>
                        </div>

                    </div>
                </c:forEach>


            </div>
        </div>
    </div>
</div>
<div class="container3">
    <div class="layui-main " style="width: 80%;margin-top: 20px">
        <label style="font-weight: bolder;margin-left: 0px">热门商品</label>
        <br/>
        <hr class="layui-bg-red">
    </div>
    <div class="top" style="width: 100%; background-color: white;">
        <div class="layui-main layui-row" style=" width: 80%; height: 500px;color: red ;background: #f4f4f4 ">
            <div class="layui-row">

                <c:forEach items="${rxs}" var="data" varStatus="1">

                    <div class="layui-col-sm2"
                         style="margin-right: 10px;margin-left: 15px;margin-top: 10px;cursor:pointer;"
                         onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/item/view?id=${data.id}'">

                        <div class="layui-card">
                            <div class="layui-card-header">${data.name} </div>
                            <div class="layui-card-header"><span
                                    style="font-size: 15px;color: red"> ${data.price} ￥</span></div>
                            <div class="layui-card-body">
                                <img src="${pageContext.request.contextPath}/${data.url1}" width="100%" height="120px">
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['element', 'layer'], function () {
        var element = layui.element;
        var layer = layui.layer;

        //监听折叠
        element.on('collapse(test)', function (data) {
            layer.msg('展开状态：' + data.show);
        });
    });
</script>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            , arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            , interval: 1800
            , anim: 'fade'
            , height: '120px'
        });

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            , width: '800px'
            , height: '400px'
            , interval: 5000
        });

        //事件
        carousel.on('change(test4)', function (res) {
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function (othis) {
                var THIS = 'layui-bg-normal'
                    , key = othis.data('key')
                    , options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function () {
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function () {
            var value = this.value
                , options = {};
            if (!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<%@include file="/common/ufooter.jsp" %>
<body>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>

</html>