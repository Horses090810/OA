<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/24
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
</head>
<body>

<div class="layui-card">
    <div class="layui-card-header">签到,签退</div>
    <div class="layui-card-body">

        签到日期:  <% Timestamp time =  new Timestamp(System.currentTimeMillis()); out.println(time.toString()); %>

        <input type="button" onclick="window.location.href='cn'">
        <%--        --%>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">签到备注</label>
            <input type="button" value="签到" onclick="window.location.href('qd.do')">
            <input type="button" value="签退" onclick="window.location.href('.do')">
            <div class="layui-input-block">
                <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function gettime(){
        var d = new Date();
        document.getElementById("time").innerHTML=d.toLocaleDateString();
        window.setTimeout("gettime()",1000);
    }
    window.οnlοad=gettime;
</script>                   

<head>
</body>
</html>
