<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/28
  Time: 16:47
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
        $(function () {
            layui.use('laydate',function () {
                var laydate = layui.laydate;
                laydate.render({
                    elem:"#time1",
                    type:'date'
                });
                laydate.render({
                    elem:"#time2",
                    type:'date'
                });
            })
        })

        function quxiao() {
            $('input[name=days]').prop("checked",false);
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
                    <li><i class="fa fa-undo"></i><a href="">登录日志</a></li>
                </ol>
            </div>
        </div>
        <div>
            <div align="center">
                <form action="selectLoginlog.do" method="post">
                    <span>输入时间段</span>
                    <input onchange="quxiao()" value="${map.time1}" style="margin-top: 7px" id="time1" type="text" name="time1">-----
                    <input onchange="quxiao()" value="${map.time2}" style="margin-top: 7px" id="time2" type="text" name="time2">
                    <input <c:if test="${map.days==1}">checked</c:if>
                            style="margin-bottom: 7px" type="radio" name="days" value="1">本日
                    <input <c:if test="${map.days==2}">checked</c:if>
                            style="margin-bottom: 7px" type="radio" name="days" value="2">本周
                    <input <c:if test="${map.days==3}">checked</c:if>
                            style="margin-bottom: 7px" type="radio" name="days" value="3">本月
                    <input class="btn btn-danger" type="submit" value="查询">
                </form>
            </div>
        </div>
        <div style="margin-top: 20px;">
            <table class="table table-striped table-advance table-hover">
                <tbody>
                    <tr>
                        <th><i class="icon_calendar"></i>登录者</th>
                        <th><i class="icon_cogs"></i>登录时间</th>
                        <th><i class="icon_cogs"></i>是否成功</th>
                        <th><i class="icon_cogs"></i>登录者IP</th>
                        <th><i class="icon_cogs"></i>登录描述</th>
                    </tr>
                    <c:forEach var="l" items="${loginlogAll}">
                        <tr>
                            <td>${l.userid}</td>
                            <td>${l.logintime}</td>
                            <td>${l.ifsuccess}</td>
                            <td>${l.loginuserip}</td>
                            <td>${l.logindesc}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6">
                            <div id="Paginator" style="text-align: center"> <ul id="pageLimit"></ul> </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
<script>
    $('#pageLimit').bootstrapPaginator({
        currentPage: ${page.pageNo},
        totalPages: ${page.pageCount},
        size:"normal",
        bootstrapMajorVersion: 3,
        alignment:"right",
        numberOfPages:5,
        pageUrl:function(type,page,current){
            var days='';
            $('input[name=days]').each(function () {
                if($(this).prop("checked")==true){
                    days=$(this).val();
                }
            });
            if(days!=''){
                return "selectLoginlog.do?pageNo="+page+"&time1="+$('#time1').val()+"&time2="+$('#time2').val()+"&days="+days;
            }else{
                return "selectLoginlog.do?pageNo="+page+"&time1="+$('#time1').val()+"&time2="+$('#time2').val()+"&days=";
            }

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
</script>
</html>
