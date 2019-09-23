<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songshiwen
  Date: 2019/9/23
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="js/bstable/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="js/bstable/bootstrap-table.css" rel="stylesheet" type="text/css">
<html>
<script>
    function ff(s) {
        alert(s);
        return false;
    }
</script>
<head>
    <title></title>
</head>
<body>
    当前位置：我的便签
        <h3 style="text-align: center">我的便签</h3>
    <hr>
    <a style="float: right;margin-right: 30px;" class="btn btn-default" href="/bwymId/0.do"><span class="glyphicon glyphicon-plus"></span>新增</a>
    <div style="border: 1px solid;margin-left: 30px;width: 95%;margin-top: 10px;float: left;padding-left: 2px;">
        <c:forEach items="${list}" var="s">
            <div style="width: 33.3%;float: left;margin: 0px;background-color: #9B859D;border-bottom: 1px solid;">
                <a style="font-size: 16px;" href="/bwymId/${s.noteid}.do" >${s.notetitle}</a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
