<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/tail.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style>
        .top select,.top input[type=text],.top input[type=password],.top input[type=email]{text-align: left;width: 347px;height:28px;border-radius: 4px;font-size: 12px;border: 1px #ccc solid}
        .top td textarea{width: 586px;height: 70px;resize: none;border-radius: 4px;border: 1px #ccc solid}
    </style>
</head>

<body style="border-radius: 8px;width: 680px;">
<form>
<div class="top">
    <div>
        <div class="top_out">
            <table class="table">
                <tbody>
                <tr>
                    <td>文件名</td>
                    <td colspan="4">
                    <input type="text" required>
                    </td>
                </tr>
                <tr>
                    <td>位置</td>
                    <td colspan="4"><input type="text"></td>
                </tr>
                <tr>
                    <td >创建时间</td>
                    <td colspan="4"><samp></samp><samp>所有者<samp></samp></samp></td>
                </tr>
                <tr>
                    <td>文件图标>></td>
                    <td colspan="4">


                    </td>
                </tr>
                </tbody>
                <tr style="background-color: #0D8BBD">
                    <td >名称</td>
                    <td >大小（KB）</td>
                    <td>类型</td>
                    <td>创建日期</td>
                    <td></td>
                </tr>
                <c:forEach items="${list}" var="s">
                    <tr>
                        <td>名称</td>
                        <td>大小（KB）</td>
                        <td>类型</td>
                        <td>创建日期</td>
                        <td></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4">
                        文件名：<input type="text" style="width: 220px;">
                    </td>
                    <td><input type="file" style="float: left"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="notice_bot">
        <div class="l_left"><input type="checkbox" checked="checked"/>保存并关闭窗口</div>
        <div class="r_right but_p"><button class="but_save">保存</button><button class="but_close" onclick="Cancel()">关闭</button></div>
    </div>
</div>
</form>
</body>
<script src="js/jquery-2.2.0.min.js"></script>
<script>
    function Cancel() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</html>
