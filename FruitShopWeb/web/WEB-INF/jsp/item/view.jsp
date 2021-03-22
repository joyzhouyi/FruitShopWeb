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

    .ul1 {
        list-style: none;
        overflow: hidden;
        margin-top: 20px;
    }

    .ul1 li {
        float: left;
        margin-left: 6px;
        border: #ffffff solid 1px;
        margin-top: 3px;
    }

    .ul1 li.active {
        border-color: #af2d2d;
    }
</style>
<script>

    window.onload = function () {
        var bigImage = document.getElementById("bigImg");

        var smallImgs = document.getElementsByClassName("smallImage");

        let images = [String(document.getElementById('url1Value').value), String(document.getElementById('url2Value').value), String(document.getElementById('url3Value').value), String(document.getElementById('url4Value').value), String(document.getElementById('url5Value').value)];

        for (let i = 0; i < smallImgs.length; i++) {
            smallImgs[i].addEventListener("mouseover", function () {
                for (let i = 0; i < smallImgs.length; i++) {
                    smallImgs[i].parentNode.setAttribute("class", "");
                }
                this.parentNode.setAttribute("class", "active");

                let temp =String(document.getElementById('PagePathValue').value) +"/"+images[i];
                bigImage.setAttribute("src", temp);
            });
        }
        let btnReduce = document.getElementById('reduce');
        let numValue = document.getElementById('numValue');
        let btnIncrease = document.getElementById('increase');
        let btnAddCar = document.getElementById('addCar');
        let userIdValue = document.getElementById('userIdValue');
        let btnAddSc=document.getElementById("addSc");
        btnReduce.onclick = function () {
            if (numValue.innerText - 0 > 1) {
                numValue.innerText -= 1;
            }
        }
        btnIncrease.onclick = function () {
            if (numValue.innerText < 100) {
                numValue.innerText = parseInt(numValue.innerText) + 1;
            }
        }
        btnAddCar.onclick = function () {

            if (!userIdValue.value) {
                window.location.href = '${pageContext.request.contextPath}/login/uLogin';
            } else {
                let id=${obj.id}+0;
                let num=0+document.getElementById('numValue').innerText;
                window.location.href = '${pageContext.request.contextPath}/car/exAdd?itemId='+id+"&num="+num;
            }

        }
       btnAddSc.onclick=function (){

           if (!userIdValue.value) {
               window.location.href = '${pageContext.request.contextPath}/login/uLogin';
           } else {


               window.location.href = '${pageContext.request.contextPath}/sc/exAdd?itemId=${obj.id}';
           }

       }

    };
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

    当前位置：首页>商品列表>详情

</div>


<div class="layui-main layui-row" style="width: 60%;">
    <div class="layui-col-md5">
        <img id="bigImg" src="${pageContext.request.contextPath}/${obj.url1}" width="250px" height="250px"/>
        <ul class="ul1">
            <li class="active"><img class="smallImage" src="${pageContext.request.contextPath}/${obj.url1}" alt=""
                                    style="width: 40px;height: 40px;"/>
            </li>
            <li><img class="smallImage" src="${pageContext.request.contextPath}/${obj.url2}" alt=""
                     style="width: 40px;height: 40px;"/></li>
            <li><img class="smallImage" src="${pageContext.request.contextPath}/${obj.url3}" alt=""
                     style="width: 40px;height: 40px;"/></li>
            <li><img class="smallImage" src="${pageContext.request.contextPath}/${obj.url4}" alt=""
                     style="width: 40px;height: 40px;"/></li>
            <li><img class="smallImage" src="${pageContext.request.contextPath}/${obj.url5}" alt=""
                     style="width: 40px;height: 40px;"/></li>
        </ul>
    </div>
    <div class="layui-col-md7">
        <div class="kong" style="width: 100%; margin-top: 30px;"></div>
        <div class="title" style="font-size: 20px;font-weight: bolder;">${obj.name}</div>
        <div class="price" style="font-size: 15px;margin-top: 10px;">价格：&nbsp;&nbsp;<span
                style="color: red;font-size: 20px;">￥${obj.price}</span></div>

        <div class="price" style="font-size: 15px;margin-top: 10px;">促销：&nbsp;&nbsp;<span
                style="color: red;">${obj.zk}折</span></div>
        <div class="price" style="font-size: 15px;margin-top: 10px;">数量:&nbsp;&nbsp;


            <button type="button" id="reduce" class="layui-btn layui-btn-xs layui-btn-primary">
                <i class="layui-icon">&#xe67e;</i>
            </button>
            <span class="layui-bg-gray" id="numValue">1</span>
            <button id="increase" type="button" class="layui-btn layui-btn-xs layui-btn-primary">
                <i class="layui-icon">&#xe624;</i>
            </button>


        </div>
        <div class="layui-btn-container" style="margin-top: 60px
            ;">
            <button id="addSc" type="button" class="layui-btn"
                    style="background-color: #D5201F;margin-right: 40px;">&nbsp;&nbsp;&nbsp;收藏&nbsp;&nbsp;&nbsp;
            </button>
            <input id="userIdValue" type="hidden" value="${sessionScope.get("userId")}">
            <input id="url1Value" type="hidden" value="${obj.url1}">
            <input id="url2Value" type="hidden" value="${obj.url2}">
            <input id="url3Value" type="hidden" value="${obj.url3}">
            <input id="url4Value" type="hidden" value="${obj.url4}">
            <input id="url5Value" type="hidden" value="${obj.url5}">
            <input id="PagePathValue" type="hidden" value="${pageContext.request.contextPath}">
            <button type="button" id="addCar" class="layui-btn  layui-btn-danger">加入购物车</button>

        </div>
    </div>
</div>
<div class="layui-main" style="width: 80%">

    <div class="" style="width: 100%;background: #f4f4f4;margin-top: 40px;">
        <div class="layui-tab" style="">
            <ul class="layui-tab-title">
                <li class="layui-this" style="color: #0f0f0f;font-weight: bold" >商品详情</li>
                <li style="color: #0f0f0f;font-weight: bold"  >商品评价</li>

            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show" style="padding: 20px">${obj.ms}</div>
                <div class="layui-tab-item">内容2</div>

            </div>
        </div>

        <script>
            //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
            layui.use('element', function(){
                var element = layui.element;


            });
        </script>



    </div>



</div>

<%@include file="/common/ufooter.jsp" %>


</body>
</html>