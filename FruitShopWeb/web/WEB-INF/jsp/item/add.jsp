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
            /*overflow: hidden;*/
        }
    </style>
</head>
<script src="layui/layui.js"></script>
<%--<script src="${pageContext.request.contextPath}/test1_war_exploded/resource/js/jquery.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/test1_war_exploded/resource/js/pintuer.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/est1_war_exploded/resource/ueditor/ueditor.config.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/test1_war_exploded/resource/ueditor/ueditor.all.min.js"></script>--%>


<body>
<div style="border: gray solid 1px;width: 98%;margin: 5px;padding: 5px;">
    <div><i class="layui-icon layui-icon-add-circle" style="font-size: 20px; color: #010202;"></i><span
            style="font-size: 20px;">&nbsp;&nbsp;新增商品</span></div>

    <div class="layui-row" style="margin-top: 20px;">
        <div class="layui-col-sm5">
            <form class="layui-form" action="item/exAdd" method="post" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">商品名称：</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required lay-verify="required" placeholder="请输入商品名称"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品价格：</label>
                    <div class="layui-input-block">
                        <input type="text" name="price" required lay-verify="required" placeholder="请输入商品价格"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品折扣：</label>
                    <div class="layui-input-block">
                        <input type="text" name="zk" required lay-verify="required" placeholder="请输入商品折扣"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品类别：</label>
                    <div class="layui-input-block">
                        <select name="categoryIdTwo" lay-verify="required">
                            <c:forEach items="${types}" var="data" varStatus="1">
                                <option value="${data.id}">${data.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品主图：</label>
                    <div class="layui-input-block">
                        <input type="file" class="" name="file">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品副图1：</label>
                    <div class="layui-input-block">
                        <input type="file" class="" name="file">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品副图2：</label>
                    <div class="layui-input-block">
                        <input type="file" class="" name="file">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品副图3：</label>
                    <div class="layui-input-block">
                        <input type="file" class="" name="file">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品副图4：</label>
                    <div class="layui-input-block">
                        <input type="file" class="" name="file">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">商品描述：</label>
                    <div class="layui-input-block">
                        <textarea name="ms" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <%--                <div class="layui-form-item layui-form-text">--%>
                <%--                    <label class="layui-form-label">描述：</label>--%>
                <%--                    <script type="text/plain" id="remark_txt_1" name="ms" style="width: 100%;height: 300px;"></script>--%>
                <%--                    <script type="text/javascript">--%>
                <%--                        var editor = UE.getEditor("remark_txt_1");--%>
                <%--                        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;--%>
                <%--                        UE.Editor.prototype.getActionUrl = function (action) {--%>
                <%--                            if (action == "uploadimge" || action == 'uploadscrawl' || action == 'uploadvideo') {--%>
                <%--                                return '${pageContext.request.contextPath}/ueditor/saveFile';--%>
                <%--                            } else {--%>
                <%--                                return this._bkGetActionUrl.call(this, action);--%>
                <%--                            }--%>


                <%--                        }--%>

                <%--                    </script>--%>
                <%--                </div>--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    </div>
                </div>
            </form>
        </div>

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
</body>

</html>