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
    <link href="js/bstable/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="js/bstable/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="js/bstable/zTreeStyle.css" rel="stylesheet" type="text/css"/>
    <link href="js/bstable/table.css" rel="stylesheet" type="text/css"/>
</head>
<body>
当前位置：我的便签
<h3 style="text-align: center">我的便签</h3>
<hr>
<a style="float: right;margin-right: 30px;" class="btn btn-default" href="/bwymId/0.do"><span
        class="glyphicon glyphicon-plus"></span>新增</a>
<table style="margin-left: 30px;"
       class="table table-condensed table-striped table-responsive table-bordered">

    <c:forEach items="${list}" var="s" varStatus="d">
        <c:if test="${d.count%4==0 or d.count==1}">
            <tr>
        </c:if>
        <td>

            <a style="font-size: 16px;" href="/bwymId/${s.noteid}.do">${s.notetitle}</a>

        </td>
        <c:if test="${d.count%3==0 }">
            </tr>
        </c:if>
    </c:forEach>

</table>
</body>
</html>
