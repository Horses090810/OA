<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/16
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
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
        .fc-border-separate{background-color: palegreen;font-weight: bold;}
        #precontract li{display: inline-block;width: 300px;}
    </style>

    <script>
        var flag=false;
        $(function () {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,day',
                },
                dayClick:function(event,jsEvent,view){
                    $('.fc-border-separate td').attr("data-toggle","modal").attr("data-target","#myModal");
                    var year=event.getFullYear();
                    var month=event.getMonth()+1;
                    var day=event.getDate();
                    var starttime;
                    if(month>=10){
                        starttime=year+"-"+month+"-"+day+" "+00+":"+00+":"+00;
                    }else{
                        starttime=year+"-0"+month+"-"+day+" "+00+":"+00+":"+00;
                    }
                    $('#start').val(starttime);


                },
                firstDay:1,
                editable: true,
                timeFormat: 'H:mm',
                axisFormat: 'H:mm',
                events: function (start,end,callback) {
                    $.post("findMyCalendar.do",{},function (data) {
                        var events = [];
                        $.each(data,function (i,s) {
                            events.push({
                                groupId: s.groupId,
                                title:s.title,
                                start:s.start,
                                end:s.end,
                                color:s.color
                            })
                        });
                        console.log(events);
                        callback(events);
                    },'JSON');
                },
                eventClick:function(event,jsEvent,view){
                    var groupId=event.groupId;
                    $('.fc-event-inner').attr("data-toggle","modal").attr("data-target","#myModal");

                    $.post("detailsCalendar.do",'groupId='+groupId,function (data) {
                        console.log(data);
                        $('input[name=scheduleid]').val(data.scheduleid);
                        $('input[name=title]').val(data.title);
                        $('textarea[name=schcontent]').val(data.schcontent);
                        $('input[name=begintime]').val(data.bigintime);
                        $('input[name=endtime]').val(data.endtime);
                        $('input[name=address]').val(data.address);
                        $('#meetingid').val(data.meetingid);
                        if(data.ifprivate==1){
                            $('input[name=ifprivate]').prop('checked',true);
                        }

                        $.each(data.precontracts,function (i,s) {
                            var input='<input onclick="delperson(this);" ' +
                                'value="'+s.departname+"-"+s.username+'" type="text" name="" ' +
                                'style="font-size: 15px;width: 200px;cursor: pointer;height: 20px;' +
                                'background-color: transparent;border: 0px;">' +
                                '<input type="hidden" name="userid-'+s.userid+'" value="'+s.userid+'">';

                            $('#person').append(input);
                        })

                        flag=true;

                        $('button[type=submit]').html('保存退出');
                    },'JSON')
                }
            });

            $("#example-advanced").treetable({
                expandable: true,
                index:20
            });

            //默认删除树形图
            $('#show').click();

            //绑定时间控件
            layui.use('laydate',function () {
                var laydate = layui.laydate;
                laydate.render({
                    elem:"#start",
                    type:'datetime'
                });
                laydate.render({
                    elem:"#end",
                    type:'datetime'
                });
            })
        })

        function check(args) {
            var username=$(args).children('span').html();
            var userid=$(args).attr('name');
            var parentid=$(args).parent().parent().attr("data-tt-parent-id");
            var departname=$('tr[data-tt-id='+parentid+']').children().children().children('span').html();
            
            if(flag){
                var scheduleid=$('input[name=scheduleid]').val();
                $.post("addperson.do",'userid='+userid+"&scheduleid="+scheduleid,function (data) {
                    console.log(data);
                })
            }
            var input='<input onclick="delperson(this);" ' +
                'value="'+departname+"-"+username+'" type="text" name="'+userid+'" ' +
                'style="font-size: 15px;width: 200px;cursor: pointer;height: 20px;' +
                'background-color: transparent;border: 0px;">' +
                '<input type="hidden" name="userid-'+userid+'" value="'+userid+'">';

            $('#person').append(input);
        }

        function delperson(obj) {
            $(obj).css('background-color','white');
        }

        function del() {
            $('#person input').each(function () {
                if($(this).css('background-color')=='rgb(255, 255, 255)'){
                    var userid = $(this).attr('name')
                    if(flag){
                        $.post("delperson.do",'userid='+userid+"&scheduleid="+scheduleid,function (data) {
                            console.log(data);
                        })
                    }
                    $(this).remove();
                }
            })
        }
        function close() {
            $('#person input').each(function () {
                $(this).remove();
            });
        }
    </script>
</head>
<body>
    <div>
        <div class="row" style="width: 100%;margin-left: 0px;">
            <div class="col-lg-12" style="width: 100%;">
                <h3 class="page-header"><i class="fa fa-laptop"></i>日程管理</h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                    <li><i class="fa fa-undo"></i><a href="">我的日程</a></li>
                </ol>
            </div>
        </div>
        <div id="calendar" style="width:720px;margin: auto;"></div>
    </div>
    <div style="margin-left: 400px;margin-top: -60px;height: 700px;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">

        <div class="modal-header" style="width: 100%;height: 100%;">
            <div class="panel-body">
                <form action="addCalendar.do" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <span style="float: left;line-height: 33px;">主题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <div class="col-lg-10" style="width: 435px">
                            <input type="hidden" name="scheduleid">
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
                        <span style="cursor: pointer;" data-toggle="modal" data-target="#myModal02">预约他人 <i class="icon-user"></i></span>
                        <div id="person" style="background-color: #a0ebad;width: 200px;height: 150px;overflow: hidden;">

                        </div>
                        <div onclick="del();" style="cursor: pointer;float: right;margin-top: -100px;">删除选中预约人</div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                           <div class="checkbox">
                               <label><input type="checkbox" name="ifprivate" value="1">是否公开</label>
                               &nbsp;&nbsp;&nbsp;<label>创建者:${userinfo.username}
                               <input type="hidden" name="createuser" value="${userinfo.userid}"></label>
                               &nbsp;&nbsp;&nbsp;<label>创建时间:<%
                                Date date = new Date();
                                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                String s = df.format(date);
                                out.print(s);
                           %></label>
                           </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" class="btn btn-danger">提交</button>
                            <button type="button" class="btn btn-danger">删除</button>
                            <button onclick="close();" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div style="margin-left: 400px;margin-top: -70px;" class="modal fade" id="myModal02" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">

        <div class="modal-header" style="width: 100%;height: 100%;">
            <table id="example-advanced" style="border:1px solid;font-size: 15px;">
                <caption>
                    <a href="#" id="show" onclick="jQuery('#example-advanced').treetable('expandAll'); return false;">Expand all</a>
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
                            <td><span><i class="icon_archive"></i><span>${m2.key}</span></span></td>
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
