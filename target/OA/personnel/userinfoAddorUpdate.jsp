<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/8
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
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
    <link href="${pageContext.request.contextPath}/treeTable/stylesheets/jquery.treetable.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/treeTable/stylesheets/jquery.treetable.theme.default.css" rel="stylesheet"/>



    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/treeTable/javascripts/src/jquery.treetable.js"></script>
    <script src="${pageContext.request.contextPath}/js/ajaxfileupload%20.js" type="text/javascript"></script>

    <script>
            function checkFile() {
                $('#file').click();
            }

            function ajaxFileUpload() {
                $.ajaxFileUpload({
                    url:'ajaxFileUpload.do?uname='+$('input[name=username]').val(),
                    type:'post',
                    secureuri:false,
                    fileElementId:'file',
                    dataType:'text',
                    success:function(data){
                        console.log(data);
                        $('#head').attr('src','${pageContext.request.contextPath}/upload/'+data);
                    }
                })
            }
    </script>

</head>
<body>
<div>
    <div class="row" style="width: 100%;margin-left: 0px;">
        <div class="col-lg-12" style="width: 100%;">
            <h3 class="page-header"><i class="fa fa-laptop"></i>员工管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                <li><i class="fa fa-undo"></i><a href="">员工管理</a></li>
                <c:if test="${empty msg}">
                    <li><i class="fa fa-undo"></i><a href="">员工添加</a></li>
                </c:if>
                <c:if test="${not empty msg}">
                    <li><i class="fa fa-undo"></i><a href="">员工修改</a></li>
                </c:if>
            </ol>
        </div>
    </div>
    <div>
        <section class="panel">
            <c:if test="${empty msg}">
                员工添加
            </c:if>
            <c:if test="${not empty msg}">
                员工修改
            </c:if>
            <div class="panel-body">
                <c:if test="${empty msg}">
                <form class="form-horizontal" role="form" method="post" action="userinfoAdd.do">
                    </c:if>
                    <c:if test="${not empty msg}">
                    <form class="form-horizontal" role="form" method="post" action="userinfoUpdate.do">
                        </c:if>
                        <input type="hidden" name="userid" value="${msg.userid}">
                            <input type="hidden" name="pwd" value="${msg.password}">
                        <div class="form-group">
                            <label class="col-lg-2 control-label">用户名称</label>
                            <div class="col-lg-10">
                                <input value="${msg.username}" name="username" class="form-control" placeholder="请填写用户名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">密码</label>
                            <div class="col-lg-10">
                                <c:if test="${empty msg}">
                                    <input name="password" class="form-control" placeholder="请填写密码">
                                </c:if>
                                <c:if test="${not empty msg}">
                                    <input value="******" readonly name="password" class="form-control" placeholder="请填写密码">
                                </c:if>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">所在部门</label>
                            <div class="col-lg-10">
                                <select class="form-control m-bot15" name="departid">
                                    <c:forEach items="${departinfos}" var="d">
                                        <c:if test="${msg.departid == d.departid}">
                                            <option selected value="${d.departid}">${d.departname}</option>
                                        </c:if>
                                        <option value="${d.departid}">${d.departname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">性别</label>
                            <div class="col-lg-10">
                                <select class="form-control m-bot15" name="gender">
                                    <option value="">请选择</option>
                                    <option value="1"
                                            <c:if test="${msg.gender == 1}">
                                                selected
                                            </c:if>
                                    >男</option>
                                    <option value="0"
                                            <c:if test="${msg.gender == 0}">
                                                selected
                                            </c:if>
                                    >女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">头像</label>
                            <div style="display: inline-block;width: 80px;height: 70px;float: left;margin-left: 10px;">
                                <c:if test="${empty msg}">
                                    <img id="head" src="${pageContext.request.contextPath}/upload/defalt.jpg" onclick="checkFile();"  style="margin-left: 10px;display: inline-block;width: 100%;height: 100%;">
                                </c:if>
                                <c:if test="${not empty msg}">
                                    <img id="head" src="${pageContext.request.contextPath}/upload/${msg.username}.jpg" onclick="checkFile();"  style="margin-left: 10px;display: inline-block;width: 100%;height: 100%;">
                                </c:if>
                            </div>
                            <div class="col-lg-10">
                                <input style="display: none;" onchange="ajaxFileUpload();" name="file" id="file" type="file" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">角色</label>
                            <div class="col-lg-10">
                                <select class="form-control m-bot15" name="roleid">
                                    <option value="">请选择</option>
                                    <option value="1"
                                            <c:if test="${msg.roleid == 1}">
                                                selected
                                            </c:if>
                                    >超级管理员</option>
                                    <option value="2"
                                            <c:if test="${msg.roleid == 2}">
                                                selected
                                            </c:if>
                                    >普通用户</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">当前状态</label>
                            <div class="col-lg-10">
                                <select class="form-control m-bot15" name="userstate">
                                    <option value="">请选择</option>
                                    <option value="1"
                                            <c:if test="${msg.userstate == 1}">
                                                selected
                                            </c:if>
                                    >正常状态</option>
                                    <option value="0"
                                            <c:if test="${msg.userstate == 0}">
                                                selected
                                            </c:if>
                                    >屏蔽状态</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn btn-danger">提交</button>
                                <button type="reset" class="btn btn-danger">重置</button>
                            </div>
                        </div>
                    </form>
            </div>
        </section>
    </div>
</div>
</body>
</html>
