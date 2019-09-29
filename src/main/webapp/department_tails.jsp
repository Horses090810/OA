<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songshiwen
  Date: 2019/9/25
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/OA/wjjtj.do" method="post">
    <table style="height: 300px;">
        <tr>
            <td><img src="/OA/img/文件夹.jpg" style="width: 30px;height: 30px" alt=""></td>
            <td><input type="text" name="filename" style="width: 600px;" value="${list.filename}"></td>
        </tr>
        <tr>
            <td>位置：</td>
            <td>${list.filepath}<input type="hidden" name="filepath" value="${list.filepath}"></td>
        </tr>
        <tr>
            <td>备注：</td>
            <td><textarea rows="5" cols="80" name="remark">
                ${list.remark}
            </textarea></td>
        </tr>
        <tr>
            <td colspan="2">创建时间：<samp style="text-align: left">${list.createdate}</samp>
                <d style="float: right">所有者：<samp><c:if test="${list.fileid==null}">${userinfo.username}</c:if>
                    <c:if test="${list.fileid!=null}">${list.fileowner}</c:if></samp></d>
            </td>
        </tr>
    </table>
    <hr>
    <input type="hidden" value="${list.parentid}" name="parentid">
    <input type="hidden" name="fileid" value="${list.fileid}">
    <input type="submit" onclick="Cancels()" value="保存退出" style="margin-left: 200px;margin-right: 50px;">
    <input type="button" onclick="Cancel()" value="退出">
</form>
</body>
</html>
<script src="js/bstable/jQuery-2.2.0.min.js"></script>
<script src="js/jquery.js"></script>
<script>
    function Cancel() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }


</script>
