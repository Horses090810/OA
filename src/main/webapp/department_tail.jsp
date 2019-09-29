<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<script>
</script>
<body style="border-radius: 8px;width: 650px;text-align: center;margin-left: 30px">
<form action="/OA/wjtj.do" id="from" method="post">
    <table class="table">
        <tr>
            <td>文件名：</td>
            <td><input style="width: 600px" type="text" value="${list.filename}" name="filename"/></td>
        </tr>
        <tr>
            <td>位置：</td>
            <td>${list.filepath}<input type="hidden" value="${list.filepath}" name="filepath"></td>
        </tr>
        <tr>
            <td>备注：</td>
            <td>
                <textarea cols="70" rows="10" name="remark">
                    ${list.remark}
                </textarea>
            </td>
        </tr>
    </table>
    <hr>
    <table class="table">
        <tr>
            <td>创建时间：${list.createdate}</td>
            <td style="text-align: right">所有者：
                <c:if test="${list.fileid==null}">${userinfo.username}</c:if>
                <c:if test="${list.fileid!=null}">${list.fileowner}</c:if></td>
        </tr>
        <tr>
            <td colspan="2"><samp style="float: left;font-size: 20px">类型:</samp>
                <c:forEach items="${map}" var="s">
                    <div style="width: 80px; height: 30px;float: left;margin-right: 20px;">
                        <input type="radio" name="filetype" value="${s.filetypeid}"
                               <c:if test="${s.filetypeid==list.filetype or (list.filetype==null and s.filetypeid==2)}">checked</c:if> /><img
                            src="/OA/img/${s.filetypeimage}" style="width: 30px;height: 30px;" alt="">
                    </div>
                </c:forEach>
            </td>
        </tr>
    </table>
    <table class="table table-bordered text-muted">
        <c:if test="${lists!=null}">
            <tr style="background-color: #3baae3">

                <td>名称</td>
                <td>大小（KB）</td>
                <td>类型</td>
                <td>创建时间</td>
                <td></td>
            </tr>
        </c:if>
        <c:forEach items="${lists}" var="s">
            <tr>
                <td>${s.accessoryname}</td>
                <td>${s.accessorysize}</td>
                <td>${s.filetypename}</td>
                <td>${s.createdate}</td>
                <td><input type="button" onclick="ff(${s.accessoryid})" value="删除"></td>
            </tr>
        </c:forEach>
    </table>
    <input type="hidden" value="${list.parentid}" name="parentid">
    <input type="hidden" name="fileid" value="${list.fileid}">
</form>
<form action="/OA/file.do" id="ss" method="post" enctype="multipart/form-data">
    <input type="hidden" name="ff" id="ff" value="0">
    <input type="hidden" value="${list.filepath}" name="filepath">
    <input type="hidden" name="fileid" value="${list.fileid}">
    <input type="hidden" value="${list.parentid}" name="parentid">
    <samp style="float: left;margin-top: 5px">文件名：</samp>
    <input type="text" id="te" STYLE="width: 300px;" class="file">
    <span class="btn btn-primary" onclick="$('#file').click();">
           <i class="glyphicon glyphicon-folder-open"></i>  
            Browse…
        </span>
    <input type="file" id="file" name="file" style="display: none;">
    <input type="submit" onclick="return g();" value="上传">
</form>
<hr>

<input type="submit" onclick="$('#from').submit()" value="保存退出">
<input type="button" onclick="Cancel()" value="退出">


</body>
</html>
<script src="/OA/js/jquery-2.2.0.min.js"></script>
<script src="/OA/js/jquery.js"></script>
<script>
    function ff(s) {
        alert(s + "/${list.filepath}/${list.fileid}");
        location.href = '/sc/' + s + '/${list.fileid}.do'
    }

    function g() {
        if ($('#te').val() == "") {
            return false;
        }
        return true;
    }

    $('#file').change(function () {
        var file = this.files[0];
        if (file == undefined) {

        } else {
            $('#te').val(file.name);
        }

    });

    function Cancel() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>