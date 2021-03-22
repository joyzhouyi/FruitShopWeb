<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouyi
  Date: 2021/3/4
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>



<div class="header" style="width: 100%;">
    <div class="top" style="width: 100%; background-color: #F0F0F2;">
        <div class="layui-main layui-row" style="width: 70%; height: 60px; ">
            <div class="layui-col-md6 "
                 style="height: 100%; text-align: left;line-height: 60px;font-size: 20px; color: #000000;font-weight: bolder">
                欢迎到水果商城
            </div>
            <div class="layui-col-md6" style="height: 100%;">
                <ul class="layui-nav" style="height: 100%;background-color: #F0F0F2; color: black;">
                    <c:if test="${userId!=null}">
                        <li class="layui-nav-item">
                            <!-- <a href="">登录<span class="layui-badge">9</span></a> -->
                            <a href="" style="color: black;">欢迎您：${username}</a>
                        </li>

                        <li class="layui-nav-item">
                            <a href="login/uTui" style="color: black;">退出 </a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="car/findBySql" style="color: black;">我的购物车</a>

                        </li>
                        <li class="layui-nav-item">
                            <a href="user/view" style="color: black;">个人中心</a>

                        </li>
                    </c:if>
                    <c:if test="${userId==null}">
                        <li class="layui-nav-item">
                            <!-- <a href="">登录<span class="layui-badge">9</span></a> -->
                            <a href="login/uLogin" style="color: black;">登录&nbsp;&nbsp;&nbsp;|</a>
                        </li>

                        <li class="layui-nav-item">
                            <a href="login/res" style="color: black;"> 注册&nbsp;&nbsp;&nbsp;| </a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="user/view" style="color: black;">个人中心</a>

                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="center">
    <div class="top" style="width: 100%; background-color: white;">
        <div class="layui-main layui-row" style="width: 70%; height: 100px; ">
            <div class="layui-col-md6 " style="height: 100%;   text-align: left;line-height: 100px;">
                <img src="${pageContext.request.contextPath}/pic/logo2.png" style="height: 100px;width: 100px;"/>
            </div>
            <div class="layui-col-md6" style="height: 100%;">
                <div class="layui-row" style="margin-top: 30px;">

                    <form class="layui-form" action="item/shopList">


                        <div class="layui-col-sm6">
                            <div class="layui-input-block">

                                <input type="text" name="condition" placeholder="关键字查询" autocomplete="off"
                                       class="layui-input" style="border: solid #DF4545 2px;" value="${condition}">
                            </div>
                        </div>
                        <div class="layui-col-sm3">
                            <button class="layui-btn" lay-submit lay-filter="formDemo"
                                    style="background-color:#DF4545 ;"><i class="layui-icon">&#xe615;</i>
                            </button>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
