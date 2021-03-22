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
<!DOCTYPE html>
<html>

<head>
    <title>修改一级类目</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            height: 100%;
            overflow: hidden;
        }
    </style>
</head>
<script src="layui/layui.js"></script>

<body>
<div style="border: gray solid 1px;width: 98%;margin: 5px;padding: 5px;">
    <div><i class="layui-icon layui-icon-add-circle-fine" style="font-size: 20px; color: #010202;"></i><span
            style="font-size: 20px;">&nbsp;&nbsp;新增类目</span></div>

    <div class="layui-row" style="margin-top: 20px;">
        <div class="layui-col-sm5">
            <form class="layui-form" action="itemCategory/exUpdate" method="post">
                <input type="hidden" value="${obj.id}" name="id">
                <input type="hidden" value="${obj.isDelete}" name="isDelete">
                <input type="hidden" value="${obj.pid}" name="pid">


                <div class="layui-form-item">
                    <label class="layui-form-label">类目名称：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${obj.name}" name="name" required lay-verify="required" placeholder="请输入类目名称"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</body>

</html>