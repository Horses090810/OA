<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songshiwen
  Date: 2019/9/23
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function scff(s) {
        location.href = "/scff/" + s + ".do";
    }
</script>
<head>
    <title>Title</title>
</head>
<body>
<h3 style="text-align: right;margin-right: 40px;">个人便签设置</h3>
<hr/>
<form action="/bwxqym.do" method="post">
    <table width="600px" style="text-align: center;margin-left: 300px;"
           class="table table-responsive table-no-bordered">

        <tr>
            <td style="text-align: left" colspan="2">便签标题：</td>
        </tr>
        <tr>
            <td colspan="2"><input type="text" style="width: 600px;height: 30px;" name="notetitle"
                                   value="${list.notetitle}"/></td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="2">便签内容：</td>
        </tr>
        <tr>
            <td colspan="2">
                    <textarea cols="81" rows="15" name="notecontent">
                        ${list.notecontent}
                    </textarea>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">创建人：<samp>${list.username==""?list.username:userinfo.username}</samp></td>
            <td style="text-align: right">创建时间：<samp>${list.createtime}</samp></td>
        </tr>
        <tr>
            <td><input name="noteid" type="hidden" value="${list.noteid}"><input type="submit" value="保存"></td>
            <td><input type="button"<c:if test="${list!=null}"> onclick="scff(${list.noteid})" </c:if>value="删除当前便签">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
