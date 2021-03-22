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
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg "
                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/user/view'">个人信息
        </button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg"
                onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/itemOrder/my'">我的订单
        </button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg">商品收藏</button>
        <br/>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-lg redColor" style="color:#ffffff;background: #DB4547; ">修改密码</button>
    </div>


    <div class="layui-col-md8">&nbsp;

        <span id="msg" style="color:red; font-weight: bold">&nbsp;${msg}</span>
        <form class="layui-form" action="login/upass" style="position: relative;z-index: 999;">
            <input id="oldPassword1" type="hidden" value="${obj.passWord}">
            <div class="layui-form-item">
                <label class="layui-form-label"><span style="color: red;">*</span>旧密码</label>
                <div class="layui-input-block">
                    <input id="oldPassword2" type="password" name="title" required lay-verify="required" placeholder="请输入旧密码"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span style="color: red;">*</span>新密码</label>
                <div class="layui-input-inline">
                    <input id="password1" type="password" id="password1" name="password" required lay-verify="required"
                           placeholder="请输入新密码"
                           autocomplete="off" class="layui-input">
                </div>


            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span style="color: red;">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password2" name="password1" required lay-verify="required"
                           placeholder="请确认新密码"
                           autocomplete="off" class="layui-input">
                </div>


            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="submit" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>


    </div>
    <script>

        window.onload = function () {
            let layuiBtnLg = document.getElementsByClassName('layui-btn-lg');
            let redColor = document.getElementsByClassName('redColor')[0];

            for (let i = 0; i < layuiBtnLg.length; i++) {
                layuiBtnLg[i].onclick = function () {
                    if (i == 0) {
                        window.location.href = "${pageContext.request.contextPath}/user/view";
                    } else if (i == 1) {
                        window.location.href = "${pageContext.request.contextPath}/itemOrder/my";

                    } else if (i == 2) {
                        window.location.href = "${pageContext.request.contextPath}/sc/findBySql";
                    } else if (i == 3) {
                        window.location.href = "${pageContext.request.contextPath}/login/pass";
                    }

                }
            }

        }

    </script>


    <script>
        //Demo
      window.onload=function (){

       let submitBtn=document.getElementById('submit');
       let passWord1=document.getElementById('password1');
       let passWord2=document.getElementById('password2');
       let oldPassword1=document.getElementById('oldPassword1');
       let oldPassword2=document.getElementById('oldPassword2');

       let msg=document.getElementById('msg');
       submitBtn.onclick=function (){
           if (passWord1.value!=passWord2.value){
               msg.innerText='两次输入的新密码不一致！';
               return false;
           }
           if (oldPassword1.value!=oldPassword2.value){
               msg.innerText='输入的旧密码不正确！';
               return false;
           }

           return true;

       }





      }


    </script>
    <%@include file="/common/ufooter.jsp" %>


</body>
</html>