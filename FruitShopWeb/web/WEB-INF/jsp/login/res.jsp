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
    <title>用户注册</title>
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


<div class="container" style="width: 100%">
    <div class="layui-main layui-row" style="margin-top: 60px">


        <div class="layui-col-sm3">&nbsp;</div>
        <div class="layui-col-sm6">
            <form class="layui-form" action="login/toRes">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                               lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">设置密码：</label>
                    <div class="layui-input-block">
                        <input type="text" name="passWord" lay-verify="required" lay-reqtext="密码是必填项，岂能为空？"
                               placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="required" lay-reqtext="手机号是必填项，岂能为空？"
                               placeholder="建议使用常用的手机" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电子邮箱：</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" lay-verify="required" lay-reqtext="电子邮箱是必填项，岂能为空？"
                               placeholder="请输入电子邮箱" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">

                    <div class="layui-input-block">
                        <input type="checkbox" name="switch" lay-skin="switch" >&nbsp;&nbsp;<span
                            style="font-size: 15px;margin-top: 2px"> 我已经阅读并同意<span style="color: red">《会员注册手册》</span>和<span
                            style="color: red">《隐私保护手册》</span>
                            </span></div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即注册</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

            </form>
        </div>

        <div class="layui-col-sm3">&nbsp;</div>


    </div>


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
<body>


</body>

</html>