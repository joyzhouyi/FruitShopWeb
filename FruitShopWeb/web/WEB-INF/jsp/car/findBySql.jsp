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

    当前位置：首页>我的购物车
</div>


<div class="layui-main" style="width: 80%;margin-top: 10px;margin-bottom: 30px;padding-left: 40px;">

    <span style="font-weight: bold;font-size: 30px">全部商品<span style="color: red;">(${list.size()})</span></span>
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th style="text-align: center">选择</th>
            <th style="text-align: center">商品</th>
            <th style="text-align: center">价格</th>
            <th style="text-align: center">数量</th>
            <th style="text-align: center">折扣</th>
            <th style="text-align: center">小计</th>
            <th style="text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="item" varStatus="1">

            <tr>
                <td style="text-align: center">
                    <input class="checked1" data-id="${item.id}" style="width: 20px;height: 20px;" type="checkbox"
                           name="select1" title="">
                </td>
                <td style="text-align: center">
                    <div class="layui-row" style="width: 300px;">
                        <div class="layui-col-md6">
                            <img src="${pageContext.request.contextPath}/${item.item.url1}" height="100px"
                                 width="100px">
                        </div>
                        <div class="layui-col-md4">
                                ${item.item.name}</div>
                    </div>
                </td>
                <td style="text-align: center">￥<span>${item.item.price}</span></td>

                <td style="text-align: center">
                    <button type="button" class="layui-btn layui-btn-xs layui-btn-primary reduceBtn">
                        <i class="layui-icon">&#xe67e;</i>
                    </button>
                    <span class="layui-bg-gray" id="numValue">${item.num}</span>
                    <button type="button" class="layui-btn layui-btn-xs layui-btn-primary increaseBtn">
                        <i class="layui-icon">&#xe624;</i>
                    </button>
                </td>
                <td style="text-align: center"><span>${item.item.zk}</span>折</td>
                <td style="text-align: center;color: red;">￥<span>${item.total}</span></td>
                <td style="text-align: center">
                    <div class="layui-btn-group">
                        <button type="button" class="layui-btn deletes"
                                onclick="javascript:window.location.href='${pageContext.request.contextPath}/car/delete?id=${item.id}'"
                        >删除
                        </button>
                    </div>
                </td>

            </tr>

        </c:forEach>
        <tr>
            <td colspan="1" style="text-align: center">
                <input id="checkedAll" style="width: 20px;height: 20px;" type="checkbox" name="select1" title="">全选
            </td>
            <td colspan="2">&nbsp;</td>
            <td colspan="1">
                已选商品(<span id="selectedNum" style="color: red;">0</span>)
            </td>
            <td colspan="2">
                合计(不含运费)：￥<span id="totalValue" style="color: red;">0</span>
            </td>
            <td style="text-align: center">
                <div class="layui-btn-group">
                    <button type="button " class="layui-btn layui-btn-danger" id="all">结算
                    </button>
                </div>
            </td>
        </tr>

        </tbody>
    </table>


</div>


<script>
    //Demo
    layui.use('form', function () {
        let form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return true;
        });
    });
    window.onload = function () {


        let reduceBtns = document.getElementsByClassName('reduceBtn');
        let increaseBtns = document.getElementsByClassName('increaseBtn');
        let checkedNodes = document.getElementsByClassName('checked1');
        let selectedNumNodes = document.getElementById('selectedNum');
        let totalValueNode = document.getElementById('totalValue');
        let checkedAllNode = document.getElementById('checkedAll')
        for (let i = 0; i < reduceBtns.length; i++) {
            reduceBtns[i].onclick = function () {
                let numNode = this.nextElementSibling;
                let totalNode = this.parentElement.nextElementSibling.nextElementSibling.firstElementChild;
                let singleNode = this.parentElement.previousElementSibling.firstElementChild;
                let zkNode = this.parentElement.nextElementSibling.firstElementChild;
                if (numNode.innerText > 1) {
                    numNode.innerText -= 1;
                    // alert(totalNode.innerHTML);
                    // alert(singleNode.innerHTML);
                    // alert(zkNode.innerHTML);
                    totalNode.innerHTML = Number(singleNode.innerHTML) * Number(numNode.innerText) * Number(zkNode.innerHTML) / 10;

                    let totalV = 0;
                    let checkedNum = 0;
                    for (let j = 0; j < checkedNodes.length; j++) {

                        if (checkedNodes[j].checked == true) {
                            let totalPartBtn = checkedNodes[j].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;
                            checkedNum += 1;
                            totalV = Number(totalV) + Number(totalPartBtn.innerHTML);
                        }
                    }
                    if (checkedNum == checkedNodes.length) {
                        checkedAllNode.checked = 'checked';
                    } else {
                        checkedAllNode.checked = false;
                    }
                    selectedNumNodes.innerText = checkedNum;
                    totalValueNode.innerText = totalV;


                }
            }
        }
        for (let i = 0; i < increaseBtns.length; i++) {
            increaseBtns[i].onclick = function () {
                let numNode = this.previousElementSibling;
                let totalNode = this.parentElement.nextElementSibling.nextElementSibling.firstElementChild;
                let singleNode = this.parentElement.previousElementSibling.firstElementChild;
                let zkNode = this.parentElement.nextElementSibling.firstElementChild;
                if (numNode.innerText < 100) {
                    numNode.innerText = Number(numNode.innerText) + 1;
                    totalNode.innerHTML = Number(singleNode.innerHTML) * Number(numNode.innerText) * Number(zkNode.innerHTML) / 10;

                    let totalV = 0;
                    let checkedNum = 0;
                    for (let j = 0; j < checkedNodes.length; j++) {

                        if (checkedNodes[j].checked == true) {
                            let totalPartBtn = checkedNodes[j].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;
                            checkedNum += 1;
                            totalV = Number(totalV) + Number(totalPartBtn.innerHTML);
                        }
                    }
                    if (checkedNum == checkedNodes.length) {
                        checkedAllNode.checked = 'checked';
                    } else {
                        checkedAllNode.checked = false;
                    }
                    selectedNumNodes.innerText = checkedNum;
                    totalValueNode.innerText = totalV;
                }
            }
        }


        for (let i = 0; i < checkedNodes.length; i++) {
            checkedNodes[i].onclick = function () {
                let totalV = 0;
                let checkedNum = 0;
                for (let j = 0; j < checkedNodes.length; j++) {

                    if (checkedNodes[j].checked == true) {
                        let totalPartBtn = checkedNodes[j].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;
                        checkedNum += 1;
                        totalV = Number(totalV) + Number(totalPartBtn.innerHTML);
                    }
                }
                if (checkedNum == checkedNodes.length) {
                    checkedAllNode.checked = 'checked';
                } else {
                    checkedAllNode.checked = false;
                }
                selectedNumNodes.innerText = checkedNum;
                totalValueNode.innerText = totalV;
            }
        }
        checkedAllNode.onclick = function () {
            let key;
            if (checkedAllNode.checked == false) {
                key = false;
            } else {
                key = true;
            }

            let totalV = 0;
            let checkedNum = 0;
            for (let j = 0; j < checkedNodes.length; j++) {
                checkedNodes[j].checked = key
                if (checkedNodes[j].checked == true) {
                    let totalPartBtn = checkedNodes[j].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild;
                    checkedNum += 1;
                    totalV = Number(totalV) + Number(totalPartBtn.innerHTML);
                }
            }
            if (checkedNum == checkedNodes.length) {
                checkedAllNode.checked = 'checked';
            }
            selectedNumNodes.innerText = checkedNum;
            totalValueNode.innerText = totalV;
        }

        let allBtn = document.getElementById('all');
        allBtn.onclick = function () {
            let arr = new Array();
            for (let j = 0; j < checkedNodes.length; j++) {

                if (checkedNodes[j].checked == true) {

                    let $id = this.getAttribute('data-id');
                    let numNode = checkedNodes[j].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;
                     let obj =new Object();
                     obj.id=$id;
                     obj.num=numNode.innerHTML;
                     arr.push(obj);



                }
            }
            if (arr.length==0){
                alert("请至少选择一个商品进行结算！");
                return false;
            }
            alert("正在前往结算页面！已选择商品数为："+selectedNumNodes.innerText+" 总金额为："+totalValueNode.innerText);

        }


    }
</script>


<%@include file="/common/ufooter.jsp" %>


</body>
</html>