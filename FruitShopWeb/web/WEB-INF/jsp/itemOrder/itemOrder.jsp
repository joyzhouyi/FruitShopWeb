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
                        <div class="layui-col-sm3">

                        </div>
                        <form class="layui-form" action="itemOrder/findBySql">


                            <div class="layui-col-sm6">
                                <div class="layui-input-block">

                                    <input type="text" name="code" value="${obj.code}"
                                           placeholder="请输入订单号" autocomplete="off" class="layui-input">
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
    <div class="center" style="margin: 5px;">
        <table class="layui-table" lay-size="sm">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>订单号</th>
                <th>下单时间</th>
                <th>总金额</th>
                <th>下单人</th>
                <th>订单状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pagers.datas}" var="data" varStatus="l">
                <tr>
                    <td>${data.code}</td>
                    <td><fm:formatDate value="${data.addTime}" pattern="yyyy-MM--dd HH:mm:ss"></fm:formatDate></td>
                    <td>${data.total}</td>
                    <td>${data.user.userName}</td>
                    <td style="color: red">
                        <c:if test="${data.status==0}">代发货</c:if>
                        <c:if test="${data.status==1}">已取消</c:if>
                        <c:if test="${data.status==2}">代收货</c:if>
                        <c:if test="${data.status==3}">已收货</c:if>
                    </td>

                    <td>
                        <div class="layui-btn-group ">

                            <button type="button" class="layui-btn"
                                    onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/orderDetail/ulist?orderId=${data.id}'">
                                <i class="layui-icon">&#xe642;</i>查看购买的商品
                            </button>
                            <c:if test="${data.status==0}">
                                <button type="button" class="layui-btn layui-btn-danger"
                                        onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/itemOder/?id=${data.id}'">
                                    <i class="layui-icon">&#xe640;</i>去发货
                                </button>
                            </c:if>

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

                            <pg:pager url="itemOrder/findBySql" maxIndexPages="5" items="${pagers.total}"
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
