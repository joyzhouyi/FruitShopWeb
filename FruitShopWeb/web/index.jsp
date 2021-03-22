<%--
  Created by IntelliJ IDEA.
  User: zhouyi
  Date: 2021/2/27
  Time: 9:48
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
<meta http-equiv="refresh" content="0;url=login/uIndex"/>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  </body>
</html>
