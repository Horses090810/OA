<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/28
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Basic Table | Creative - Bootstrap 3 Responsive Admin Template</title>
    <link href="${pageContext.request.contextPath}/bootstrap-paginator-master/css/bootstrap.css" rel="stylesheet"/>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="${pageContext.request.contextPath}/css/elegant-icons-style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Custom styles -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">


    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>

    <script>

        function update(obj) {
            var rolename=$(obj).attr("rolename");
            var roledesc=$(obj).attr("roledesc");
            var roleid=$(obj).attr("roleid");
            $('input[name=roleid]').val(roleid);
            $('input[name=rolename]').val(rolename);
            $('textarea[name=roledesc]').val(roledesc);
            $('#add').prop("disabled",true);
            $('#update').prop("disabled",false);
            $('#myform').attr("action","roleinfoupdate.do")
        }
        
        function role(obj) {
            $('#roleid').val($(obj).attr("roleid"))
        }

    </script>

</head>
<body>
    <div>
        <div class="row" style="width: 100%;margin-left: 0px;">
            <div class="col-lg-12" style="width: 100%;">
                <h3 class="page-header"><i class="fa fa-laptop"></i>系统管理</h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                    <li><i class="fa fa-undo"></i><a href="">角色管理</a></li>
                </ol>
            </div>
        </div>
        <div align="center">
            <form id="myform" class="form-horizontal" role="form" method="post" action="roleinfoadd.do">
                <div style="width: 400px;">
                    <p align="left">角色名称:</p>
                    <input type="hidden" name="roleid">
                    <input class="form-control" type="text" name="rolename">
                </div>
                <div style="width: 400px;">
                    <p align="left">角色说明:</p>
                    <textarea class="form-control" name="roledesc" cols="50" rows="4"></textarea>
                </div>
                <br>
                <div style="width: 400px;" align="left">
                    <input id="add" class="btn btn-danger" type="submit" value="添加">
                    <input id="update" disabled style="background-color: dodgerblue;" class="btn btn-danger" type="submit" value="保存修改">
                </div>
            </form>
        </div>
        <div style="margin-top: 20px;">
            <table class="table table-striped table-advance table-hover">
                <tbody>
                <tr>
                    <th><i class="icon_profile"></i>角色名称</th>
                    <th><i class="icon_calendar"></i>角色说明</th>
                    <th><i class="icon_cogs"></i>修改</th>
                    <th><i class="icon_cogs"></i>删除</th>
                    <th><i class="icon_cogs"></i>分配权限</th>
                </tr>
                <c:forEach items="${roleAll}" var="r">
                    <tr>
                        <td>${r.rolename}</td>
                        <td>${r.roledesc}</td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-danger" roleid="${r.roleid}" rolename="${r.rolename}" roledesc="${r.roledesc}" onclick="update(this);"><i class="icon_ icon_pencil"></i></a>
                            </div>
                        </td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-danger" href="roleinfodel/${r.roleid}.do"><i class="icon_close_alt2"></i></a>
                            </div>
                        </td>
                        <td><a roleid="${r.roleid}" onclick="role(this);" style="color: dodgerblue;" data-toggle="modal" data-target="#myModal">分配权限</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div style="margin-left: 400px;margin-top: 10px;height: 300px;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
            <h2 style="margin-left: 150px;margin-top: 30px;">请选择权限:</h2>
        <form action="addroleright.do" method="post">
            <input type="hidden" name="roleid" id="roleid">
            <div>
                <div style="margin-left: 220px;">
                    <div class="checkbox">
                        <label style="font-size: 18px;"><input type="checkbox" name="nodeid" value="1">人事管理</label>
                    </div>
                    <div class="checkbox">
                        <label style="font-size: 18px;" ><input type="checkbox" name="nodeid" value="2">日程管理</label>
                    </div>
                    <div class="checkbox">
                        <label style="font-size: 18px;" ><input type="checkbox" name="nodeid" value="3">文档管理</label>
                    </div>
                    <div class="checkbox">
                        <label style="font-size: 18px;" ><input type="checkbox" name="nodeid" value="4">消息传递</label>
                    </div>
                    <div class="checkbox">
                        <label style="font-size: 18px;" ><input type="checkbox" name="nodeid" value="5">系统管理</label>
                    </div>
                    <div class="checkbox">
                        <label style="font-size: 18px;" ><input type="checkbox" name="nodeid" value="6">考勤管理</label>
                    </div>
                    <div class="checkbox">
                        <label style="font-size: 18px;" ><input type="checkbox" name="nodeid" value="24">签到签退</label>
                    </div>
            </div>
        </div>
            <input style="margin-left: 350px;"  type="submit" value="确定" class="btn btn-danger">
        </form>
    </div>
</body>
</html>
