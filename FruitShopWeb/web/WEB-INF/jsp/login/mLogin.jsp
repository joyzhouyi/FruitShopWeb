<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>

<body style="background-image: linear-gradient(87deg, #009bc4, #87ac99, #babf6a, #e2d223)">
<div class="layui-main layui-bg-black" style="width: 600px; margin-top: 50px;padding:50px">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md4">

        </div>
        <div class="layui-col-md4" style="text-align: center;font-size: larger;">
            管理员登录
        </div>
        <div class="layui-col-md4">

        </div>
    </div>
    <form class="layui-form" action="${pageContext.request.contextPath}/login/toLogin" method="post">
        <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
        <div class="layui-form-item" style="margin-right: 100px; margin-top: 70px;">
            <label class="layui-form-label">姓名：</label>

            <div class="layui-input-block">
                <input type="text" value="admin" name="userName" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="margin-right: 100px; margin-top: 50px;">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-block">
                <input type="text" value="123456" name="password" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <br />
        <br />
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="*" style="width: 200px; margin-left: 100px;">登录</button>

            </div>
        </div>

    </form>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>

</html>