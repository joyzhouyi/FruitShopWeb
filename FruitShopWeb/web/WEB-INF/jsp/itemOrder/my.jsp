<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    当前位置：首页>个人中心>我的订单
</div>

<div class="layui-main layui-row" style="width: 80%; ">
    <div class="layui-col-md4">
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">个人信息</button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg redColor">我的订单</button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">商品收藏</button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">修改密码</button>
    </div>


    <div class="layui-col-md8">&nbsp;
        <ul class="layui-nav" style="width: 100%;background: #f4f4f4;color: black; ">
            <li class="layui-nav-item">
                <a href="#" class="orderGetBtn"><span class="text1"
                                                      style="color: #FF4700;font-weight: bold"> 全部订单</span><span
                        class="layui-badge">${all.size()}</span></a>
            </li>
            <li class="layui-nav-item  ">
                <a href="#" class="orderGetBtn"><span class="text1"
                                                      style="color: black;font-weight: bold"> 已取消</span><span
                        class="layui-badge">${yqx.size()}</span></a>
            </li>
            <li class="layui-nav-item  ">
                <a href="#" class="orderGetBtn"><span class="text1"
                                                      style="color: black;font-weight: bold"> 代发货</span><span
                        class="layui-badge">${dfh.size()}</span></a>
            </li>
            <li class="layui-nav-item  ">
                <a href="#" class="orderGetBtn"><span class="text1"
                                                      style="color: black;font-weight: bold"> 已发货</span><span
                        class="layui-badge">${yfh.size()}</span></a>
            </li>
            <li class="layui-nav-item  ">
                <a href="#" class="orderGetBtn"><span class="text1"
                                                      style="color:black;font-weight: bold"> 已收货</span><span
                        class="layui-badge">${ysh.size()}</span></a>
            </li>
        </ul>
        <br/>
        <div class="right" style="width: 100%;">
            <table class="layui-table">
                <tbody>


                <%--全部订单--%>
                <c:forEach items="${all}" var="data" varStatus="1">
                <tr class="qb">
                    <td>
                        <fmt:formatDate value="${data.addTime}"/>&nbsp;&nbsp;&nbsp;订单号:${data.code}&nbsp;&nbsp;&nbsp;
                        <c:if test="${data.status==0}">代发货</c:if>
                        <c:if test="${data.status==1}">已取消</c:if>
                        <c:if test="${data.status==2}">待收货</c:if>
                        <c:if test="${data.status==3}">已收货</c:if>
                    </td>
                </tr>


                <c:forEach items="${data.details}" var="chil" varStatus="1">
                <tr class="qb">
                    <td>
                        <div class=" layui-row" style="width: 60%">
                            <div class="layui-col-md2" style="width: 40%">
                                <img src="${pageContext.request.contextPath}/${chil.item.url1}" width="120px"
                                     height="120px">
                            </div>
                            <div class="layui-col-md4" style="width: 40%">
                                    ${chil.item.name}<br/><br/>
                                折扣： ${chil.item.zk}<br/><br/>
                                ￥ ${chil.item.price}<br/>

                            </div>
                            <div class="layui-col-md2" style="width: 20%; padding-top: 40px">
                                <button class="layui-btn layui-btn-dange"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/itemOrder/pj?id=${chil.itemId}'"
                                >去评价
                                </button>
                            </div>


                        </div>


                    </td>
                </tr>
                </c:forEach>
                <tr class="qb">
                    <td style="font-weight: bold">总金额：<span style="color: red;">￥${data.total}</span>
                        <c:if test="${data.status==0}">

                            <a href="${pageContext.request.contextPath}/itemOrder/qx?id=${data.id}"
                               style="color: black;margin-left: 100px;">取消订单</a>


                        </c:if>
                        <c:if test="${data.status==1}">

                            <a href="#"
                               style="color: black;margin-left: 100px;">已取消</a>


                        </c:if>
                        <c:if test="${data.status==2}">

                            <a href="${pageContext.request.contextPath}/itemOrder/sh?id=${data.id}"
                               style="color: black;margin-left: 100px;">去收货</a>
                        </c:if>
                        <c:if test="${data.status==3}">

                            <a href="#" style="color: black;margin-left: 100px;">已收货</a>
                        </c:if>
                    </td>
                </tr>
                <tr class="qb">
                    <td>&nbsp;</td>
                </tr>
                </c:forEach>
                <%-----------------%>
                <%--已取消--%>
                <c:forEach items="${yqx}" var="data" varStatus="1">
                <tr class="yqx">
                    <td>
                        <fmt:formatDate value="${data.addTime}"/>&nbsp;&nbsp;&nbsp;订单号:${data.code}&nbsp;&nbsp;&nbsp;
                        <c:if test="${data.status==0}">代发货</c:if>
                        <c:if test="${data.status==1}">已取消</c:if>
                        <c:if test="${data.status==2}">待收货</c:if>
                        <c:if test="${data.status==3}">已收货</c:if>
                    </td>
                </tr>


                <c:forEach items="${data.details}" var="chil" varStatus="1">
                <tr class="yqx">
                    <td>
                        <div class=" layui-row" style="width: 60%">
                            <div class="layui-col-md2" style="width: 40%">
                                <img src="${pageContext.request.contextPath}/${chil.item.url1}" width="120px"
                                     height="120px">
                            </div>
                            <div class="layui-col-md4" style="width: 40%">
                                    ${chil.item.name}<br/><br/>
                                折扣： ${chil.item.zk}<br/><br/>
                                ￥ ${chil.item.price}<br/>

                            </div>
                            <div class="layui-col-md2" style="width: 20%; padding-top: 40px">
                                <button class="layui-btn layui-btn-dange"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/itemOrder/pj?id=${chil.itemId}'"
                                >去评价
                                </button>
                            </div>


                        </div>


                    </td>
                </tr>
                </c:forEach>
                <tr class="yqx">
                    <td style="font-weight: bold">总金额：<span style="color: red;">￥${data.total}</span>
                        <c:if test="${data.status==0}">

                            <a href="${pageContext.request.contextPath}/itemOrder/qx?id=${data.id}"
                               style="color: black;margin-left: 100px;">取消订单</a>


                        </c:if>
                        <c:if test="${data.status==1}">

                            <a href="#"
                               style="color: black;margin-left: 100px;">已取消</a>


                        </c:if>
                        <c:if test="${data.status==2}">

                            <a href="${pageContext.request.contextPath}/itemOrder/sh?id=${data.id}"
                               style="color: black;margin-left: 100px;">去收货</a>
                        </c:if>
                        <c:if test="${data.status==3}">

                            <a href="#" style="color: black;margin-left: 100px;">已收货</a>
                        </c:if>
                    </td>
                </tr>
                <tr class="yqx">
                    <td>&nbsp;</td>
                </tr>
                </c:forEach>
                <%------------------%>
                <%--代发货--%>
                <c:forEach items="${dfh}" var="data" varStatus="1">
                <tr class="dfh">
                    <td>
                        <fmt:formatDate value="${data.addTime}"/>&nbsp;&nbsp;&nbsp;订单号:${data.code}&nbsp;&nbsp;&nbsp;
                        <c:if test="${data.status==0}">代发货</c:if>
                        <c:if test="${data.status==1}">已取消</c:if>
                        <c:if test="${data.status==2}">待收货</c:if>
                        <c:if test="${data.status==3}">已收货</c:if>
                    </td>
                </tr>


                <c:forEach items="${data.details}" var="chil" varStatus="1">
                <tr class="dfh">
                    <td>
                        <div class=" layui-row" style="width: 60%">
                            <div class="layui-col-md2" style="width: 40%">
                                <img src="${pageContext.request.contextPath}/${chil.item.url1}" width="120px"
                                     height="120px">
                            </div>
                            <div class="layui-col-md4" style="width: 40%">
                                    ${chil.item.name}<br/><br/>
                                折扣： ${chil.item.zk}<br/><br/>
                                ￥ ${chil.item.price}<br/>

                            </div>
                            <div class="layui-col-md2" style="width: 20%; padding-top: 40px">
                                <button class="layui-btn layui-btn-dange"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/itemOrder/pj?id=${chil.itemId}'"
                                >去评价
                                </button>
                            </div>


                        </div>


                    </td>
                </tr>
                </c:forEach>
                <tr class="dfh">
                    <td style="font-weight: bold">总金额：<span style="color: red;">￥${data.total}</span>
                        <c:if test="${data.status==0}">

                            <a href="${pageContext.request.contextPath}/itemOrder/qx?id=${data.id}"
                               style="color: black;margin-left: 100px;">取消订单</a>


                        </c:if>
                        <c:if test="${data.status==1}">

                            <a href="#"
                               style="color: black;margin-left: 100px;">已取消</a>


                        </c:if>
                        <c:if test="${data.status==2}">

                            <a href="${pageContext.request.contextPath}/itemOrder/sh?id=${data.id}"
                               style="color: black;margin-left: 100px;">去收货</a>
                        </c:if>
                        <c:if test="${data.status==3}">

                            <a href="#" style="color: black;margin-left: 100px;">已收货</a>
                        </c:if>
                    </td>
                </tr>
                <tr class="dfh">
                    <td>&nbsp;</td>
                </tr>
                </c:forEach>

                <%--已发货--%>
                <c:forEach items="${yfh}" var="data" varStatus="1">
                <tr class="yfh">
                    <td>
                        <fmt:formatDate value="${data.addTime}"/>&nbsp;&nbsp;&nbsp;订单号:${data.code}&nbsp;&nbsp;&nbsp;
                        <c:if test="${data.status==0}">代发货</c:if>
                        <c:if test="${data.status==1}">已取消</c:if>
                        <c:if test="${data.status==2}">待收货</c:if>
                        <c:if test="${data.status==3}">已收货</c:if>
                    </td>
                </tr>


                <c:forEach items="${data.details}" var="chil" varStatus="1">
                <tr class="yfh">
                    <td>
                        <div class=" layui-row" style="width: 60%">
                            <div class="layui-col-md2" style="width: 40%">
                                <img src="${pageContext.request.contextPath}/${chil.item.url1}" width="120px"
                                     height="120px">
                            </div>
                            <div class="layui-col-md4" style="width: 40%">
                                    ${chil.item.name}<br/><br/>
                                折扣： ${chil.item.zk}<br/><br/>
                                ￥ ${chil.item.price}<br/>

                            </div>
                            <div class="layui-col-md2" style="width: 20%; padding-top: 40px">
                                <button class="layui-btn layui-btn-dange"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/itemOrder/pj?id=${chil.itemId}'"
                                >去评价
                                </button>
                            </div>


                        </div>


                    </td>
                </tr>
                </c:forEach>
                <tr class="yfh">
                    <td style="font-weight: bold">总金额：<span style="color: red;">￥${data.total}</span>
                        <c:if test="${data.status==0}">

                            <a href="${pageContext.request.contextPath}/itemOrder/qx?id=${data.id}"
                               style="color: black;margin-left: 100px;">取消订单</a>


                        </c:if>
                        <c:if test="${data.status==1}">

                            <a href="#"
                               style="color: black;margin-left: 100px;">已取消</a>


                        </c:if>
                        <c:if test="${data.status==2}">

                            <a href="${pageContext.request.contextPath}/itemOrder/sh?id=${data.id}"
                               style="color: black;margin-left: 100px;">去收货</a>
                        </c:if>
                        <c:if test="${data.status==3}">

                            <a href="#" style="color: black;margin-left: 100px;">已收货</a>
                        </c:if>
                    </td>
                </tr>
                <tr class="yfh">
                    <td>&nbsp;</td>
                </tr>
                </c:forEach>

                <%--已收货--%>
                <c:forEach items="${ysh}" var="data" varStatus="1">
                <tr class="ysh">
                    <td>
                        <fmt:formatDate value="${data.addTime}"/>&nbsp;&nbsp;&nbsp;订单号:${data.code}&nbsp;&nbsp;&nbsp;
                        <c:if test="${data.status==0}">代发货</c:if>
                        <c:if test="${data.status==1}">已取消</c:if>
                        <c:if test="${data.status==2}">待收货</c:if>
                        <c:if test="${data.status==3}">已收货</c:if>
                    </td>
                </tr>


                <c:forEach items="${data.details}" var="chil" varStatus="1">
                <tr class="ysh">
                    <td>
                        <div class=" layui-row" style="width: 60%">
                            <div class="layui-col-md2" style="width: 40%">
                                <img src="${pageContext.request.contextPath}/${chil.item.url1}" width="120px"
                                     height="120px">
                            </div>
                            <div class="layui-col-md4" style="width: 40%">
                                    ${chil.item.name}<br/><br/>
                                折扣： ${chil.item.zk}<br/><br/>
                                ￥ ${chil.item.price}<br/>

                            </div>
                            <div class="layui-col-md2" style="width: 20%; padding-top: 40px">
                                <button class="layui-btn layui-btn-dange"
                                        onclick="javascript:window.location.href='${pageContext.request.contextPath}/itemOrder/pj?id=${chil.itemId}'"
                                >去评价
                                </button>
                            </div>


                        </div>


                    </td>
                </tr>
                </c:forEach>
                <tr class="ysh">
                    <td style="font-weight: bold">总金额：<span style="color: red;">￥${data.total}</span>
                        <c:if test="${data.status==0}">

                            <a href="${pageContext.request.contextPath}/itemOrder/qx?id=${data.id}"
                               style="color: black;margin-left: 100px;">取消订单</a>


                        </c:if>
                        <c:if test="${data.status==1}">

                            <a href="#"
                               style="color: black;margin-left: 100px;">已取消</a>


                        </c:if>
                        <c:if test="${data.status==2}">

                            <a href="${pageContext.request.contextPath}/itemOrder/sh?id=${data.id}"
                               style="color: black;margin-left: 100px;">去收货</a>
                        </c:if>
                        <c:if test="${data.status==3}">

                            <a href="#" style="color: black;margin-left: 100px;">已收货</a>
                        </c:if>
                    </td>
                </tr>
                <tr class="ysh">
                    <td>&nbsp;</td>
                </tr>
                </c:forEach>
            </table>

        </div>
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
                    window.location.href = "${pageContext.request.contextPath}/user/view"
                } else if (i == 1) {
                    window.location.href = "${pageContext.request.contextPath}/itemOrder/my";

                } else if (i == 2) {
                    window.location.href = "${pageContext.request.contextPath}/sc/findBySql";
                } else if (i == 3) {
                    window.location.href = "${pageContext.request.contextPath}/login/pass";
                }
                for (let i = 0; i < layuiBtnLg.length; i++) {
                    layuiBtnLg[i].style.background = '#ffffff';
                    layuiBtnLg[i].style.color = '#000000'

                }
                this.style.background = "#DB4547";
                this.style.color = "#ffffff";
            }
        }
        let texts = document.getElementsByClassName('text1');
        for (let i = 0; i < texts.length; i++) {
            texts.onclick = function () {
                for (let i = 0; i < texts.length; i++) {
                    texts[i].style.color = '#000000'
                }
                this.style.color = "#FF4700";
            }
        }

        let qbs = document.getElementsByClassName('qb');
        let yqxs = document.getElementsByClassName('yqx');
        let dfhs = document.getElementsByClassName('dfh');
        let yfhs = document.getElementsByClassName('yfh');
        let yshs = document.getElementsByClassName('ysh');

        let btns = document.getElementsByClassName('orderGetBtn');
        for (let i = 0; i < btns.length; i++) {
            btns[i].onclick = function () {
                for (let j = 0; j < qbs.length; j++) {
                    if (i == 0) {
                        qbs[j].style.display = 'block';
                    } else {
                        qbs[j].style.display = 'none';
                    }
                }
                for (let j = 0; j < yqxs.length; j++) {
                    if (i == 1) {
                        yqxs[j].style.display = 'block';
                    } else {
                        yqxs[j].style.display = 'none';
                    }
                }
                for (let j = 0; j < dfhs.length; j++) {
                    if (i == 2) {
                        dfhs[j].style.display = 'block';
                    } else {
                        dfhs[j].style.display = 'none';
                    }

                }
                for (let j = 0; j < yfhs.length; j++) {

                    if (i == 3) {
                        yfhs[j].style.display = 'block';
                    } else {
                        yfhs[j].style.display = 'none';
                    }
                }

                for (let j = 0; j < yshs.length; j++) {
                    if (i == 4) {
                        yshs[j].style.display = 'block';
                    } else {
                        yshs[j].style.display = 'none';
                    }
                }


                return false;
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