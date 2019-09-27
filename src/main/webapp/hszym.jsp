<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songshiwen
  Date: 2019/9/26
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="js/bstable/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="js/bstable/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="js/bstable/zTreeStyle.css" rel="stylesheet" type="text/css"/>
    <link href="js/bstable/table.css" rel="stylesheet" type="text/css"/>
</head>
<body style="margin: 0px">
<table width="100%" style="margin-bottom: 50px;"
       class="table table-bordered table-condensed table-no-bordered table-responsive table-striped">
    <tr>
        <td colspan="7">
            <h1>回收站</h1>
            <hr>
        </td>
    </tr>
    <tr style="background-color: #1c94c4">
        <td>文件名称</td>
        <td>所在文件夹</td>
        <td>类型</td>
        <td>操作者</td>
        <td>创建日期</td>
        <td>还原</td>
        <td>永久删除</td>
    </tr>
    <c:forEach var="s" items="${list}">
        <tr>
            <td>${s.filename}</td>
            <td>${s.filepath}</td>
            <td><img src="/img/${s.filetypeimage}" alt="" style="width: 30px;height: 30px"></td>
            <td>${s.fileowner}</td>
            <td>${s.createdate}</td>
            <td>
                <a style="margin-left: 20px;" class="btn btn-default" r=""
                   onclick="location.href='/hyId/${s.fileid}.do'"><span
                        class="glyphicon glyphicon-share"></span></a>
            </td>
            <td>
                <a style="margin-left: 20px;" class="btn btn-default" r=""
                   onclick="location.href='/scId/${s.fileid}.do'"><span
                        class="glyphicon glyphicon-remove"></span></a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
