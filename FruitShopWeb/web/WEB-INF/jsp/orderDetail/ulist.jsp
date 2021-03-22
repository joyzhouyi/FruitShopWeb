<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
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
            <div class="layui-col-sm12">
                <div class="grid-demo grid-demo-bg1">
                    <div class="layui-row">
                        <div class="layui-col-sm3">
                            <div><i class="layui-icon layui-icon-list"
                                    style="font-size: 30px; color: #010202;"></i><span
                                    style="font-size: 20px;">&nbsp;&nbsp;该订单的详细清单</span></div>
                        </div>

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
            <th>商品名称</th>
            <th>商品主图</th>
            <th>商品单价</th>
            <th>商品购买数量</th>
            <th>小计</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
            <tr>
                <td>${data.item.name}</td>
                <td><img src="${pageContext.request.contextPath}/${data.item.url1}" alt=""
                         style="width: 100px;height: 100px"></td>
                <td>${data.item.price}</td>
                <td>${data.num}</td>
                <td>${data.total}</td>
                <td>
                    <c:if test="${data.status==0}">
                        未退货
                    </c:if>
                    <c:if test="${data.status==1}">已退货
                    </c:if>

                </td>

            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="layui-row">
                    <div class="layui-col-md4">&nbsp;</div>
                    <div class="pagelist layui-col-md4">
                        <%--分页开始--%>

                        <pg:pager url="orderDetail/ulist?orderId=${obj.orderId}" maxIndexPages="5"
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


<div class="footer"></div>
</body>

</html>
