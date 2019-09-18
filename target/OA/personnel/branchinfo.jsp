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

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>


<div style="width: 100%;">
    <div class="row" style="width: 100%;margin-left: 0px;">
        <div class="col-lg-12" style="width: 100%;">
            <h3 class="page-header"><i class="fa fa-laptop"></i>机构管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                <li><i class="fa fa-undo"></i><a href="">机构管理</a></li>
            </ol>
        </div>
    </div>
    <div>
        <div class="col-lg-6" style="width: 100%;">
            <div class="panel-body"  style="">
                <form id="myform" class="form-horizontal" role="form" method="post" action="branchinfo.do">
                    <div style="position: relative;width: 100%;">
                        <div style="float:left;width:520px;">
                            <span>Name:</span>
                            <input type="hidden" name="branchid">
                            <input type="hidden" name="pageNumber" value="${page.pageNo}">
                            <input id="b1" style="width: 400px;" name="branchname" class="form-control"
                                   value="${page.t.branchname}" placeholder="请填写机构名称">
                        </div>
                        <div style="float:left;width:520px;">
                            <label>ShortName:</label>
                            <input id="b2" style="width: 400px;" name="branchshortname" class="form-control"
                                   value="${page.t.branchshortname}" placeholder="请填写机构简称:">
                        </div>
                        <button name="branchinfo.do" type="submit" class="btn btn-danger">
                            <i class="icon_search"></i>
                        </button>
                        <button disabled="disabled" name="branchinfoUpdate.do" type="submit" class="btn btn-danger">
                            <i class="icon_check_alt2"></i>
                        </button>
                        <button name="branchinfoAdd.do" type="submit" class="btn btn-danger">
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
                        <th><i class="icon_profile"></i>机构名称</th>
                        <th><i class="icon_calendar"></i>机构简称</th>
                        <th><i class="icon_cogs"></i>修改</th>
                        <th><i class="icon_cogs"></i>删除</th>
                    </tr>
                    <c:forEach items="${page.list}" var="l">
                        <td>${l.branchname}</td>
                        <td>${l.branchshortname}</td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-danger" name="${l.branchid}" name1="${l.branchname}" name2="${l.branchshortname}" onclick="update(this)"><i class="icon_ icon_pencil"></i></a>
                            </div>
                        </td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-danger" href="branchinfoDel/${l.branchid}.do"><i class="icon_close_alt2"></i></a>
                            </div>
                        </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4">
                            <div id="Paginator" style="text-align: center"> <ul id="pageLimit"></ul> </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
                return "branchinfo.do?pageNo="+page+"&branchname="+$('#b1').val()+"&branchshortname="+$('#b2').val();
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
        //修改赋值操作
        function  update(arg) {
            $('#b1').val($(arg).attr("name1"));
            $('#b2').val($(arg).attr("name2"));

            $('button[type=submit]').each(function (i,s) {
                if(i==0 || i==2){
                    $(this).prop("disabled",true);
                }else{
                    $(this).prop("disabled",false);
                    $('input[name=branchid]').val($(arg).attr("name"));
                }
            })

        }

        //动态改变action的值
        $('button[type=submit]').mouseenter(function () {
            var ref=$(this).attr("name");
            $('#myform').attr("action",ref);
        })

    </script>
</body>
</html>
