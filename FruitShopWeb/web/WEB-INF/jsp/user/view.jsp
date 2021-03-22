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

    当前位置：首页>个人中心>个人信息
</div>

<div class="layui-main layui-row" style="width: 80%; ">
    <div class="layui-col-md4">
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg redColor"
                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/user/view'">个人信息
        </button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg"
                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/itemOrder/my'">我的订单
        </button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">商品收藏</button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">修改密码</button>
    </div>


    <div class="layui-col-md8">&nbsp;


        <form class="layui-form" action="user/exUpdate"
              style="border: solid 1px #f4f4f4;box-shadow: 2px 2px 2px #938a8a;position: relative;
z-index: 99;">
            <span style="font-weight: bolder;font-size: 20px;">基本信息</span>
            <br/>
            <br/>
            <br/>


            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名：</label>
                <div class="layui-input-block">
                    <input type="text" name="realName" required lay-verify="required" placeholder="请输入标题"
                           autocomplete="off" class="layui-input" value="${obj.realName}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <c:if test="${obj.sex=='女'}">
                <div class="layui-input-block">
                    <input type="radio" class="manBtn" name="sex" value="男" title="男"
                    >
                    <input type="radio" class="womanBtn" name="sex" value="女" title="女" checked="checked">

                    </c:if>
                    <c:if test="${obj.sex==null}">
                        <input type="radio" class="manBtn" name="sex" value="男" title=男" checked="checked">
                        <input type="radio" class="womanBtn" name="sex" value="女" title="女">

                    </c:if>
                    <c:if test="${obj.sex=='男'}">
                        <input type="radio" class="manBtn" name="sex" value="男" title=男" checked="checked">
                        <input type="radio" class="womanBtn" name="sex" value="女" title="女">

                    </c:if>

                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱：</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" required lay-verify="required" placeholder="请输入标题"
                               autocomplete="off" class="layui-input" value="${obj.email}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" required lay-verify="required" placeholder="请输入标题"
                               autocomplete="off" class="layui-input" value="${obj.phone}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required lay-verify="required" placeholder="请输入标题"
                               autocomplete="off" class="layui-input" value="${obj.address}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
        </form>


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
                    window.location.href = "${pageContext.request.contextPath}/user/view";
                }else if (i==1){
                    window.location.href = "${pageContext.request.contextPath}/itemOrder/my";

                }else if(i==2){
                    window.location.href = "${pageContext.request.contextPath}/sc/findBySql";
                }else if(i==3){
                    window.location.href = "${pageContext.request.contextPath}/login/pass";
                }
                for (let i = 0; i < layuiBtnLg.length; i++) {
                    layuiBtnLg[i].style.background = '#ffffff';
                    layuiBtnLg[i].style.color = '#000000';

                }


                this.style.background = "#DB4547";
                this.style.color = "#ffffff";
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