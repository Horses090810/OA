<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/28
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <div align="center;">
            <div class="form-group">
                <span style="float: left;line-height: 33px;">角色名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <div class="col-lg-10" style="width: 435px">
                    <input name="rolename" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <span style="float: left;line-height: 33px;">角色说明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <div class="col-lg-10">
                    <textarea style="width: 405px;height: 80px;" name="roledesc" class="form-control" cols="6" rows="10"></textarea>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
