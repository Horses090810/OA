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

    <script>
        $(function () {
            $("#example-advanced").treetable({
                expandable: true,
                index:20
            });
        })

        function check(args) {
            $('input[name=principalusername]').val($(args).children('span').html());
            $('input[name=principaluser]').val($(args).attr("name"));
        }
    </script>

</head>
<body>
<div>
    <div class="row" style="width: 100%;margin-left: 0px;">
        <div class="col-lg-12" style="width: 100%;">
            <h3 class="page-header"><i class="fa fa-laptop"></i>部门管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                <li><i class="fa fa-undo"></i><a href="">部门管理</a></li>
                <c:if test="${empty msg}">
                    <li><i class="fa fa-undo"></i><a href="">部门添加</a></li>
                </c:if>
                <c:if test="${not empty msg}">
                    <li><i class="fa fa-undo"></i><a href="">部门修改</a></li>
                </c:if>
            </ol>
        </div>
    </div>
    <div>
        <section class="panel">
            <c:if test="${empty msg}">
                部门添加
            </c:if>
            <c:if test="${not empty msg}">
                部门修改
            </c:if>
            <div class="panel-body">
                <c:if test="${empty msg}">
                    <form class="form-horizontal" role="form" method="post" action="departAdd.do">
                </c:if>
                <c:if test="${not empty msg}">
                    <form class="form-horizontal" role="form" method="post" action="departUpdate.do">
                </c:if>
                    <input type="hidden" name="departid" value="${msg.departid}">
                    <input type="hidden" name="principaluser" value="${msg.userid}">
                    <div class="form-group">
                        <label class="col-lg-2 control-label">部门名称</label>
                        <div class="col-lg-10">
                            <input value="${msg.departname}" name="departname" class="form-control" placeholder="请填写部门名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">所属机构</label>
                        <div class="col-lg-10">
                            <select class="form-control m-bot15" name="branchid">
                                <c:forEach items="${branchinfos}" var="b">
                                    <c:if test="${msg.branchname == b.branchname}">
                                        <option selected value="${b.branchid}">${b.branchname}</option>
                                    </c:if>
                                    <option value="${b.branchid}">${b.branchname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">部门负责人</label>
                        <div class="col-lg-10" style="width: 600px;">
                            <input value="${msg.principaluser}" name="principalusername" style="width: 500px;" class="form-control" placeholder="请填写部门负责人">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                <i class="icon_box-checked"></i>
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">联系电话</label>
                        <div class="col-lg-10">
                            <input name="connecttelno" class="form-control" placeholder="请填写联系电话" value="${msg.connecttelno}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">移动电话</label>
                        <div class="col-lg-10">
                            <input value="${msg.connectmobiletelno}" name="connectmobiletelno" class="form-control" placeholder="请填写移动电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">传真</label>
                        <div class="col-lg-10">
                            <input value="${msg.faxes}" name="faxes" class="form-control" placeholder="请填写传真">
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
<div style="margin-left: 400px;margin-top: -70px;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-header" style="width: 100%;height: 100%;">
        <table id="example-advanced" style="border:1px solid;font-size: 15px;">
            <caption>
                <a href="#" onclick="jQuery('#example-advanced').treetable('expandAll'); return false;">Expand all</a>
                <a href="#" onclick="jQuery('#example-advanced').treetable('collapseAll'); return false;">Collapse all</a>
            </caption>
            <thead>
            <tr>
                <th>Name</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${map}" var="m">
                    <tr data-tt-id="${m.key}">
                        <td><span class="folder">${m.key}</span></td>
                    </tr>
                    <c:forEach items="${m.value}" var="m2">
                        <tr data-tt-id="${m2.key}" data-tt-parent-id="${m.key}">
                            <td><span><i class="icon_archive"></i>${m2.key}</span></td>
                        </tr>
                        <c:forEach items="${m2.value}" var="m3">
                            <tr data-tt-id="${m3.username}" data-tt-parent-id="${m2.key}">
                                <td><span name="${m3.userid}" onclick="check(this);" data-dismiss="modal"><i class="icon-user"></i><span>${m3.username}</span></span></td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
