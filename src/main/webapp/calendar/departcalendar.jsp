<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/19
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fullcalendar/css/fullcalendar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fullcalendar/css/fancybox.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link href="${pageContext.request.contextPath}/treeTable/stylesheets/jquery.treetable.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/treeTable/stylesheets/jquery.treetable.theme.default.css" rel="stylesheet"/>


    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script src='${pageContext.request.contextPath}/fullcalendar/js/jquery-ui-1.10.3.min.js'></script>
    <script src='${pageContext.request.contextPath}/fullcalendar/js/fullcalendar.min.js'></script>
    <script src='${pageContext.request.contextPath}/fullcalendar/js/jquery.fancybox-1.3.1.pack.js'></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/treeTable/javascripts/src/jquery.treetable.js"></script>

    <style>
        #precontract li{display: inline-block;width: 300px;}
    </style>
</head>
<body>
    <div>
        <div class="row" style="width: 100%;margin-left: 0px;">
            <div class="col-lg-12" style="width: 100%;">
                <h3 class="page-header"><i class="fa fa-laptop"></i>日程管理</h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                    <li><i class="fa fa-undo"></i><a href="">部门日程</a></li>
                </ol>
            </div>
        </div>
        <div>
            <div>
                <form id="myform" class="form-horizontal" role="form" method="post" action="finddepartCalendar.do">
                    <div style="position: relative;width: 100%;">
                        <div style="float:left;width:280px;margin-left: 20px;">
                            <span>选择机构:</span>
                            <select onchange="checkBranchinfo(this);" id="b1" style="width: 200px" class="form-control m-bot15" name="branchid">
                                <option value="">请选择</option>
                                <c:forEach items="${branchinfos}" var="b">
                                    <c:if test="${page.t.branchid == b.branchid}">
                                        <option selected value="${b.branchid}">${b.branchname}</option>
                                    </c:if>
                                    <c:if test="${page.t.branchid != b.branchid}">
                                        <option value="${b.branchid}">${b.branchname}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="float:left;width:280px;">
                            <span>选择部门:</span>
                            <select id="b2" style="width: 200px" class="form-control m-bot15" name="departid">
                                <option value="">请选择</option>
                                <c:forEach items="${departAll}" var="b">
                                    <c:if test="${page.t.departid == b.departid}">
                                        <option selected value="${b.departid}">${b.departname}</option>
                                    </c:if>
                                    <c:if test="${page.t.departid != b.departid}">
                                        <option value="${b.departid}">${b.departname}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="float:left;width:280px;">
                            <span>Name:</span>
                            <input id="b3" style="width: 200px;" name="username" class="form-control"
                                value="${page.t.username}"   placeholder="请填写姓名">
                        </div>
                        <div style="float:left;width:280px;">
                            <label>Time:</label>
                            <input id="b4" style="width: 200px;" name="begintime" class="form-control"
                                 value="${page.t.begintime}"   placeholder="请填写时间:">
                        </div>
                        <button type="submit" class="btn btn-danger">
                            <i class="icon_search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div style="margin-top: 20px;">
                <table class="table table-striped table-advance table-hover">
                    <tbody>
                    <tr>
                        <th><i class="icon_profile"></i>人员名称</th>
                        <th><i class="icon_calendar"></i>标题</th>
                        <th><i class="icon_cogs"></i>开始时间</th>
                        <th><i class="icon_cogs"></i>结束时间</th>
                        <th><i class="icon_cogs"></i>详情</th>
                    </tr>
                    <c:forEach items="${page.list}" var="l">
                        <tr>
                            <td>${l.username}</td>
                            <td>${l.title}</td>
                            <td>${l.bigintime}</td>
                            <td>${l.endtime}</td>
                            <td><a data-toggle="modal" data-target="#myModal" style="color: #0e90d2;cursor: pointer;"
                                title="${l.title}" schcontent="${l.schcontent}" begintime="${l.bigintime}"
                                   endtime="${l.endtime}" createuser="${l.username}" createtime="${l.createtime}"
                                   ifprivate="${l.ifprivate}" address="${l.address}" meetingid="${l.meetingid}"
                                   scheduleid="${l.scheduleid}"
                            onclick="finddetails(this);" >查看详情</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5">
                            <div id="Paginator" style="text-align: center"> <ul id="pageLimit"></ul> </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="margin-left: 400px;margin-top: -60px;height: 700px;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">

        <div class="modal-header" style="width: 100%;height: 100%;">
            <div class="panel-body">
                <form action="addCalendar.do"  method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <span style="float: left;line-height: 33px;">主题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <div class="col-lg-10" style="width: 435px">
                            <input name="title" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="float: left;line-height: 33px;">内容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <div class="col-lg-10">
                            <textarea style="width: 405px;height: 80px;" name="schcontent" class="form-control" cols="6" rows="10"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="float: left;line-height: 33px;">开始时间</span>
                        <div class="col-lg-10" style="width: 188px">
                            <input id="start" name="begintime" class="form-control">
                        </div>
                        <span style="float: left;line-height: 33px;">结束时间</span>
                        <div class="col-lg-10" style="width: 188px">
                            <input id="end" name="endtime" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="float: left;line-height: 33px;">会议地址</span>
                        <div class="col-lg-10" style="width: 188px">
                            <input name="address" class="form-control">
                        </div>
                        <span style="float: left;line-height: 33px;">会议类型</span>
                        <div class="col-lg-10" style="width: 188px">
                            <select class="form-control m-bot15" id="meetingid" name="meetingid">
                                <option value="">请选择</option>
                                <option value="1">小组会议</option>
                                <option value="2">部门会议</option>
                                <option value="3">机构会议</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" style="width: 300px;">
                        <span style="cursor: pointer;">预约他人 <i class="icon-user"></i></span>
                        <div id="person" style="background-color: #a0ebad;width: 200px;height: 150px;overflow: hidden;">

                        </div>
                        <div onclick="del();" style="cursor: pointer;float: right;margin-top: -100px;">删除选中预约人</div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <div class="checkbox">
                                <label><input type="checkbox" name="ifprivate" value="1">是否公开</label>
                                &nbsp;&nbsp;&nbsp;<label>创建者: <span id="createuser"></span>
                                <input type="hidden" name="createuser" value=""></label>
                                &nbsp;&nbsp;&nbsp;<label>创建时间: <span id="createtime"></span></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button disabled type="submit" class="btn btn-danger">提交</button>
                            <button disabled type="button" class="btn btn-danger">删除</button>
                            <button onclick="closeModal();" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>







    <script>
        $('#pageLimit').bootstrapPaginator({
            currentPage: ${page.pageNo},
            totalPages: ${page.pageCount},
            size:"normal",
            bootstrapMajorVersion: 3,
            alignment:"right",
            numberOfPages:5,
            pageUrl:function(type,page,current){
                return "finddepartCalendar.do?pageNo="+page
                    +"&brachid="+$('#b1').val()+"&departid="+$('#b2').val()
                    +"&username="+$('#b3').val()+"&begintime="+$('#b4').val();
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

        function checkBranchinfo(obj) {
            var branchid=$(obj).val();
            if(branchid==''){
                branchid=0;
            }
            $.post("findDepartBybrachid.do","branchid="+branchid,function (data) {
                $('#b2').html('<option value="">请选择</option>');
                $.each(data,function (i,s) {
                    var option=$('<option value="'+s.departid+'">'+s.departname+'</option>');
                    $('#b2').append(option);
                })
            })
        }

        function finddetails(obj) {
            var o=$(obj);
            $('input[name=title]').val(o.attr('title'));
            $('textarea[name=schcontent]').val(o.attr('schcontent'));
            $('input[name=begintime]').val(o.attr('begintime'));
            $('input[name=endtime]').val(o.attr('endtime'));
            $('input[name=address]').val(o.attr('address'));
            $('#meetingid').val(o.attr('meetingid'));
            if(o.attr("ifprivate")==1){
                $('input[name=ifprivate]').prop('checked',true);
            }
            $('#createuser').html(o.attr('createuser'));
            $('#createtime').html(o.attr('createtime'));
            $.post("findPerson.do",'scheduleid='+o.attr("scheduleid"),function (data) {
                console.log(data);
                $.each(data,function (i,s) {
                    var input='<input ' +
                        'value="'+s.departname+"-"+s.username+'" type="text" name="" ' +
                        'style="font-size: 15px;width: 200px;cursor: pointer;height: 20px;' +
                        'background-color: transparent;border: 0px;">';

                    $('#person').append(input);
                })
            })
        }

        function closeModal() {
            $('#person input').each(function () {
                $(this).remove();
            });
            $(':input').val('');
        }
    </script>
</body>
</html>
