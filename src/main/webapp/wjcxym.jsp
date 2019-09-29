<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songshiwen
  Date: 2019/9/26
  Time: 15:43
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
<script>
</script>
<body style="margin: 0px">
<form action="sstjff.do" method="post">
    <table width="100%" style="margin-bottom: 20px;height: 90%"
           class="table table-bordered table-condensed table-no-bordered table-responsive table-striped">
        <tr style="height: 10%">
            <td colspan="2" style="text-align: center;">
                <h1>文件搜索</h1>
            </td>
        </tr>
        <tr>
            <td class="col-md-2">
                <div style="width: 100%; height: 100%;">

                    <span style="font-size: 20px;float: left" class="glyphicon glyphicon-zoom-in">文件搜索</span>
                    <br><br><br>
                    <p style="font-size: 15px;text-align: left;margin-left: 20px;">要搜索的文件名：</p><br>
                    <input name="name" value="${map.name}" class="find_input" type="text" style="width: 200px"/><br><br>
                    <p style="font-size: 15px;text-align: left;margin-left: 20px;">附件包含的字：</p><br>
                    <input name="fj" value="${map.fj}" class="find_input" type="text" style="width: 200px"/><br><br>
                    <p style="font-size: 15px;text-align: left;margin-left: 20px;">创建者姓名：</p><br>
                    <input name="xm" value="${map.xm}" class="find_input" type="text" style="width: 200px"/><br><br>
                    <input class="find_input" type="submit" value="立即搜索"/>
                    <input class="find_input" type="button" onclick="location.href='/bwym.do'" value="退出"><br><br>
                    <p style="font-size: 15px;text-align: left;margin-left: 20px;" onclick="djff()">搜索选项>>></p>
                    <div <c:if
                            test="${(map.xsj==null or map.xsj=='') and (map.dsj==null or map.dsj=='')}"> hidden="hidden"</c:if>
                            id="div"
                            style="border: 1px solid;width: 100%;padding-bottom: 20px;">
                        <br>
                        介于：<input name="xsj" value="${map.xsj}" class="find_input" type="date"><br>-------------<br>
                        <input name="dsj" value="${map.dsj}" class="find_input" type="date">

                    </div>

                </div>
            </td>
            <td id="ssd" class="col-md-8" style="width: 100%;height: 100%;">
                <c:if test="${list!=null and list!='[]'}">
                    <table width="100%" style="margin-bottom: 50px;"
                           class="table table-bordered table-condensed table-no-bordered table-responsive table-striped">
                        <tr>
                            <td>文件名称</td>
                            <td>所在文件夹</td>
                            <td>类型</td>
                            <td>所有者</td>
                            <td>创建日期</td>
                        </tr>
                        <c:forEach items="${list}" var="s">
                            <tr>
                                <td>
                                    <input id="dz" type="hidden" name="filepath" value="${s.parentid}">
                                    <a onclick="
                                    <c:if test='${s.filetype==1}'>add_departments(${s.fileid})</c:if>
                                    <c:if test='${s.filetype!=1}'>add_department(${s.fileid})</c:if>">${s.filename}</a>
                                </td>

                                <td>${s.filepath}</td>
                                <td><img src="img/${s.filetypeimage}" style="width: 30px;height: 30px" alt=""></td>
                                <td>${s.fileowner}</td>
                                <td>${s.createdate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script src="js/bstable/jQuery-2.2.0.min.js"></script>
<script src="js/bstable/bootstrap.min.js"></script>
<script src="js/bstable/bootstrap-table.js"></script>
<script src="js/bstable/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bstable/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/bstable/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/bstable/jquery.ztree.exedit-3.5.js"></script>
<script src="js/bstable/layer.js"></script>
<script>

    function djff() {
        if ($('#div').attr("hidden") == "hidden") {
            $('#div').removeAttr("hidden");
        } else {
            $('#div').attr("hidden", "hidden");
            $('#div input:eq(0)').val("");
            $('#div input:eq(1)').val("");
        }
    }

    function add_departments(s) {
        //alert($("#xz").attr("r"));
        var ss = $('#dz').val();
        layer.open({
            type: 2,
            title: '文件夹',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn: 1,
            area: ['700px', '400px'],
            content: 'department_tails/' + s + '/' + ss + '.do'
        });
        return false;
    }

    function add_department(s) {
        var ss = $('#dz').val();
        layer.open({
            type: 2,
            title: '文件属性',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn: 1,
            area: ['800px', '600px'],
            content: 'department_tail/' + s + '/' + ss + '.do'
        });
        return false;
    }

    $("#ssd").on('contextmenu', 'a', function () {
        alert("sss")
        location.href = "file://C:/Windows/Web/Wallpaper/Windows/img0.jpg";
        return false;
    })

    function click() {

    }
</script>
