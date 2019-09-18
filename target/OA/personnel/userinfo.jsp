<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

</head>

<body>
<div style="width: 100%;">
    <div class="row" style="width: 100%;margin-left: 0px;">
        <div class="col-lg-12" style="width: 100%;">
            <h3 class="page-header"><i class="fa fa-laptop"></i>员工管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                <li><i class="fa fa-undo"></i><a href="">员工管理</a></li>
            </ol>
        </div>
    </div>
    <div>
        <div class="col-lg-6" style="width: 100%;">
            <div class="panel-body"  style="">
                <form id="myform" class="form-horizontal" role="form" method="post" action="employee.do">
                    <div style="position: relative;width: 100%;">
                        <div style="float:left;width:520px;">
                            <span>Name:</span>
<%--                            <input type="hidden" name="pageNumber" value="${page.pageNo}">--%>
                            <input id="b1" style="width: 400px;" name="username" class="form-control"
                                   value="${page.t.username}" placeholder="请填写用户名称">
                        </div>
                        <button type="submit" class="btn btn-danger">
                            <i class="icon_search"></i>
                        </button>
                        <button type="button" class="btn btn-danger" onclick="location.href='details.do'">
                            <i class="icon_plus_alt2"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div>
            <div>
                <table class="table table-striped table-advance table-hover">
                    <tbody>
                    <tr>
                        <th><i class="icon_profile"></i>用户ID</th>
                        <th><i class="icon_calendar"></i>姓名</th>
                        <th><i class="icon_calendar"></i>密码</th>
                        <th><i class="icon_calendar"></i>角色</th>
                        <th><i class="icon_calendar"></i>用户详情</th>
                        <th><i class="icon_cogs"></i>修改</th>
                        <th><i class="icon_cogs"></i>删除</th>
                    </tr>
                    <c:forEach items="${page.list}" var="l">
                        <td>${l.userid}</td>
                        <td>${l.username}</td>
                        <td>${l.password}</td>
                        <td>${l.rolename}</td>
                        <td><a onclick="show(this);" userid="${l.userid}" username="${l.username}" rolename="${l.rolename}" departname="${l.departname}" gender="${l.gender}" userstate="${l.userstate}" data-toggle="modal" data-target="#myModal">详情</a></td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-danger" href="details.do?userid=${l.userid}&gender=${l.gender}&username=${l.username}&password=${l.password}&roleid=${l.roleid}&departid=${l.departid}&userstate=${l.userstate}&pageNumber=${page.pageNo}">
                                    <i class="icon_ icon_pencil"></i></a>
                            </div>
                        </td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-danger" href="userinfoDel/${l.userid}/${l.username}.do"><i class="icon_close_alt2"></i></a>
                            </div>
                        </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="8">
                            <div id="Paginator" style="text-align: center"> <ul id="pageLimit"></ul> </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div style="margin-left: 400px;margin-top: 10px;height: 500px;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-header" style="width: 100%;height: 100%;">
        <div style="background-color: darkseagreen;font-size: 20px;width: 100%;height: 50px;text-align: center;line-height: 50px;">
            用户详细信息
        </div>
        <div style="border: 1px solid;width: 150px;height: 120px;margin-top: 100px;">
            <img class="head" src="" alt="" style="width: 100%;height: 100%;">
        </div>
        <table style="font-size: 18px;float: right;width: 40%;margin-top: -180px;margin-right: 50px;">
            <tr>
                <td>用户ID</td>
                <td class="userid"></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td class="username"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td>******</td>
            </tr>
            <tr>
                <td>部门</td>
                <td class="departname"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td class="gender"></td>
            </tr>
            <tr>
                <td>角色</td>
                <td class="rolename"></td>
            </tr>
            <tr>
                <td>用户状态</td>
                <td class="userstate"></td>
            </tr>
        </table>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<script>
    $('#pageLimit').bootstrapPaginator({
        currentPage: ${page.pageNo},
        totalPages: ${page.pageCount},
        size:"normal",
        bootstrapMajorVersion: 3,
        alignment:"right",
        numberOfPages:5,
        pageUrl:function(type,page,current){
            return "employee.do?pageNo="+page+"&username="+$('#b1').val()+"&gender="+$('#b2').val();
        },
        itemTexts: function (type, page, current) {
            switch (type) {
                case "first": return "首页";
                case "prev": return "上一页";
                case "next": return "下一页";
                case "last": return "末页";
                case "page": return page;
            }
        }
    });
    function show(obj) {
        $('.userid').html($(obj).attr('userid'));
        $('.username').html($(obj).attr('username'));
        $('.departname').html($(obj).attr('departname'));
        $('.gender').html($(obj).attr('gender')==1?'男':'女');
        $('.rolename').html($(obj).attr('rolename'));
        $('.userstate').html($(obj).attr('userstate')==1?'可用状态':'屏蔽状态');
        $('.head').attr('src','${pageContext.request.contextPath}/upload/'+$(obj).attr('username')+'.jpg')
    }
</script>
</body>
</html>
