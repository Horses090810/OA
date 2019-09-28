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
<%--名称：${userinfo.name}--%>
<div class="layui-card">
    <div class="layui-card-header">签到,签退</div>
    <div class="layui-card-body">

        签到日期:  <% Timestamp time =  new Timestamp(System.currentTimeMillis()); out.println(time.toString()); %>
        <input type="hidden" name="name" id="name" value="${userinfo.getUsername()}">
        <%--        --%>
        <div class="layui-form-item layui-form-text">
            <input type="button" value="签到" id="addqd" >
            <input type="button" value="签退" id="addqt" >
            <label class="layui-form-label">签到备注</label> <!-- onclick="window.location.href='/qt.do'-->
<%--            {pageContext.request.contextPath}/sel/{{d.emp_id}}.do--%>
            <div class="layui-input-block">
                <textarea name="bq" id="bq" placeholder="请输入内容" class="layui-textarea"></textarea>
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
    $(function () {
        $("#addqd").click(function () {
            $.ajax({

                url:
                    '${pageContext.request.contextPath}/addqd.do',
                type: 'POST',
                data:{name:$("#name").val(),bq:$("#bq").val()},
                success: function (data) {
                    if (data == '签到成功') {
                        alert(data);
                    }
                }
            });
        })
        ,$("#addqt").click(function () {
            $.ajax({

                url:
                    '${pageContext.request.contextPath}/addqt.do',
                type: 'POST',
                data:{name:$("#name").val(),bq:$("#bq").val()},
                success: function (data) {
                    if (data == '签退成功') {
                        alert(data);
                    }
                }
            });
        })

    })
</script>                   

<head>
</body>
</html>
