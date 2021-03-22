<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouyi
  Date: 2021/3/1
  Time: 19:33
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
<div style="height: 5px;width: 100%;"></div>
<div class="header" style="border: gray 1px solid;padding: 5px;">
    <div class="layui-fluid">
        <div class="layui-row">
            <div class="layui-col-sm5">
                <div class="grid-demo grid-demo-bg1">
                    <div class="layui-row">

                        <form class="layui-form" action="message/findBySql">


                            <div class="layui-col-sm6">
                                <div class="layui-input-block">

                                    <input type="text" name="name" value="${obj.name}"
                                           placeholder="请输入公告名称" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-sm3">
                                <button class="layui-btn" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe615;</i>
                                </button>

                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="center" style="margin: 5px;">
    <table class="layui-table" lay-size="sm">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>姓名</th>
            <th>手机号</th>
            <th>留言内容</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
            <tr>
                <td>${data.name}</td>

                <td>${data.phone}</td>
                <td>${data.context}</td>


                <td>
                    <div class="layui-btn-group ">


                        <button type="button" class="layui-btn layui-btn-danger"
                                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/message/delete?id=${data.id}'">
                            <i class="layui-icon">&#xe640;</i>删除
                        </button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="layui-row">
                    <div class="layui-col-md4">&nbsp;</div>
                    <div class="pagelist layui-col-md4">
                        <%--分页开始--%>

                        <pg:pager url="message/findBySql" maxIndexPages="5" items="${pagers.total}"
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
<div class="footer"></div>
</body>

</html>
