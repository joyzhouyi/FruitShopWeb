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

    当前位置：首页>商品列表

</div>
<div class="layui-main" style="width: 80%; ">

    <div class="order">

        <ul class="layui-nav" lay-filter="" style="background-color: silver;color: #000;">
            <li class="layui-nav-item"><a href="item/shopList?categoryIdTwo=${obj.categoryIdTwo}" style="color: black;">默认</a>
            </li>
            <li class="layui-nav-item  "><a href="item/shopList?price=1&categoryIdTwo=${obj.categoryIdTwo}"
                                            style="color: black;">价格<i class="layui-icon layui-icon-top"
                                                                       style="font-size: 20px; color: #101111;  font-weight: bold;"></i>
            </a></li>
            <li class="layui-nav-item  "><a href="item/shopList?guNum=1&categoryIdTwo=${obj.categoryIdTwo}"
                                            style="color: black;">销量<i class="layui-icon layui-icon-top"
                                                                       style="font-size: 20px; color: #101111; font-weight: bold;"></i>
            </a></li>
        </ul>
    </div>
</div>
<div class="layui-main" style="width: 80%; margin-top: 10px;">
    <c:forEach items="${pagers.datas}" varStatus="1" var="data">

        <div style="float: left;width: 18%; border: solid #f4f4f4 2px;box-shadow:5px 5px 10px gray; margin:5px;">
            <a href="${pageContext.request.contextPath}/item/view?id=${data.id}" >
            <img src="${pageContext.request.contextPath}/${data.url1}" style="width: 100%; "></a>
            <p style="height: 70px">
                    ${data.name}
            </p>
            <div class="price-zk layui-row" style="color: red;margin-bottom: 20px;margin-top: 5px;">
                <div class="layui-col-md10">
                    ￥${data.price}
                </div>
                <div class="layui-col-md2">
                        ${data.zk}折
                </div>
            </div>


            <div class="layui-btn-group" style="width: 100%;position: relative;z-index: 99;cursor: pointer;">

                <button type="button" class="layui-btn "
                        style="width: 40%;background-color: white;color: rgb(49, 47, 47);border: solid 1px rgb(197, 188, 188);cursor: pointer;"
                      onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/sc/exAdd?itemId=${data.id}'">
                    <i class="layui-icon layui-icon-rate
                            " style="font-size: 20px; color: rgb(49, 47, 47);"></i>
                    收藏
                </button>

                <button type="button" class="layui-btn "
                        style="width: 60%;background-color: white;color: rgb(49, 47, 47);border: solid 1px rgb(197, 188, 188);"
                        onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/car/exAdd?itemId=${data.id}'">
                    <i class="layui-icon layui-icon-cart-simple
                            " style="font-size: 20px; color: rgb(49, 47, 47);"></i>
                    加入购物车
                </button>

            </div>
        </div>
    </c:forEach>

</div>
<br/>
<br/>
<div class="layui-row" style="width: 80%;margin-top: 30px;">
    <div class="layui-col-md5">&nbsp</div>
    <div class="pagelist layui-col-md4">
        <%--分页开始--%>

        <pg:pager url="item/shopList" maxIndexPages="5" items="${pagers.total}"
                  maxPageItems="15"
                  export="curPage=pageNumber">
            <pg:param name="categoryIdTwo" value="${obj.categoryIdTwo}"/>
            <pg:param name="price" value="${obj.price}"/>
            <pg:param name="gmNum" value="${obj.gmNum}"/>
            <pg:param name="condition" value="${condition}"/>

            <pg:last>
                共${pagers.datas.size()}记录,共${pageNumber}页，
            </pg:last>
            当前第${curPage}页
            <pg:first>
                <a href="${pageUrl}">首页</a>
            </pg:first>
            <pg:prev>
                <a href="${pageUrl}">上一页</a>
            </pg:prev>
            <pg:next>
                <a href="${pageUrl}">下一页</a>
            </pg:next>
            <pg:pages>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <span style="color: red">[${pageNumber}]</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </pg:pages>
            <pg:last>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <span style="color: red">尾页</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">尾页</a>
                    </c:otherwise>
                </c:choose>
            </pg:last>

        </pg:pager>
    </div>

    <div class="layui-col-md4">&nbsp;</div>
</div>
</td>

<%@include file="/common/ufooter.jsp" %>


</body>
</html>