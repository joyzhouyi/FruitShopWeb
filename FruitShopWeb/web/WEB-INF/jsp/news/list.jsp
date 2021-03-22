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

<div class="layui-main" style="width: 60%;margin-top: 10px;margin-bottom: 30px;padding-left: 40px;">

    当前位置：公告
</div>

<div class="layui-main layui-row" style="width: 60%; ">
    <div style="background: #ffffff;color: black;font-weight: bold;">
        公告列表
    </div>
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>

        <tbody>


        <c:forEach items="${pagers.datas}" var="item" varStatus="1">
            <tr>
                <th><a href="news/view?id=${item.id}">${item.name}</a></th>
                <th><fmt:formatDate value="${item.addTime}"></fmt:formatDate></th>

            </tr>


        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="layui-row">
                    <div class="layui-col-md4">&nbsp;</div>
                    <div class="pagelist layui-col-md4">
                        <%--分页开始--%>

                        <pg:pager url="news/list" maxIndexPages="5"
                                  items="${pagers.total}"
                                  maxPageItems="15"
                                  export="curPage=pageNumber">

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

        </tr>
        </tbody>
    </table>
</div>


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