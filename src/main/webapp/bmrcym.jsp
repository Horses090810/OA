
<%--
  Created by IntelliJ IDEA.
  User: songshiwen
  Date: 2019/9/23
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="js/bstable/jQuery-2.2.0.min.js"></script>
<script src="js/jquery.js"></script>
<script>
    function  ff() {
        $.ajax({url:'/tjbmrym.do',
            type:'post'
            ,success:function (data) {
                $('select:eq(0)').html("<option value='0'>全部</option>");
                $.each(data, function (i, g) {
                    $('select:eq(0)').append("<option value='" + g.branchid + "'>" + g.branchname + "</option>");
                });
                ffs(0);
            }
        });
    }
    function  ffs(s) {
        $.post('/tjbmryms/'+s+".do",function (data) {
            $('select:eq(1)').html("<option value='0'>全部</option>");
            $.each(data,function (i,g) {
                $('select:eq(1)').append("<option value='"+g.branchid+"'>"+g.departname+"</option>");
            });
        });
    }

    ff();

function fff(s) {
    ffs($(s).val());
}
function cx() {
    $.post('/cx.do',{"xm":$('[type="date"]').val(),'jg':$('select:eq(0)').val(),'bm':$('select:eq(1)').val()
        ,'xm':$('[type="text"]').val()},function (data) {
        alert(data)
    });
}
</script>
<body>
<h3 style="text-align: center">部门日程</h3>
<hr>
<div style="text-align: center">
    选择机构--： <select style="width: 200px;height: 30px;" onchange="fff(this)"><option>sdf</option></select>
    选择部门--：<select style="width: 200px;height: 30px;"><option>sdfdfdf</option></select>
    姓名：<input type="text" style="height: 30px;"><br><br>
日期---- <input type="date"style="height: 30px;"/> <input style="margin-right: 500px;width: 100px;" type="button" value="搜索" onclick="cx()">
</div>
    <table style="border: 1px solid;margin-left: 300px;">
    <tr>
        <td colspan="8" style="text-align: center;">
            <samp></samp>
        </td>
    </tr>
    <c:forEach items="${list}" var="s">
        <%--<tr>--%>
            <%--<td>${s.}</td>--%>
            <%--<td><a href=""><c:if test="${s}">${s}</c:if></a></td>--%>
            <%--<td></td>--%>
            <%--<td></td>--%>
            <%--<td></td>--%>
            <%--<td></td>--%>
            <%--<td></td>--%>
            <%--<td></td>--%>
        <%--</tr>--%>
    </c:forEach>
</table>



<div style="margin-left: 400px;margin-top: -60px;height: 700px;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-header" style="width: 100%;height: 100%;">
        <div class="panel-body">
            <form action="addCalendar.do" id="myform" method="post" class="form-horizontal" role="form">
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
                        <button id="delCalentar" disabled type="button" class="btn btn-danger" onclick="deleteCalentar();">删除</button>
                        <button onclick="closeModal();" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
