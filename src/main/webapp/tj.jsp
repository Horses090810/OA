<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/23
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>
    </title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <style>
        table tr th td{
            text-align: center;
        }
    </style>
</head>
<body>
<h3>你当前的位置是：记录调查</h3><br><br><br>
<table  id="mytab" width="60%" class="layui-table" lay-filter="test">

</table>
</div>
<script>
    layui.use(['table','util'],  function () {
        var table = layui.table;
        var form= layui.form;
        var util=layui.util;

        table.render({
            elem: '#mytab'
            , url: '${pageContext.request.contextPath}/show.do'
            , type: 'post'
            , cols: [[
                    {field: 'signid', title: "编号", width: 200}
                , {field: 'username', title: "名称", width: 200}
                , {field: 'signtime', width: 200, title: '打卡时间',templet:function(d) {return util.toDateString(d.signtime,"HH:mm:ss");}}
                , {field: 'signtag', width: 200, title: '标记'}
                , {field: 'signdesc', width: 200, title: '备注'}
                , {field: 'departname', width: 200, title: '部门'}
                , {field: 'branchshortname',width: 150,title: '机构'}
            ]]   ,done: function(res, curr, count) {
                $("[data-field='signtag']").children().each(function () {
                    if ($(this).text() == 1) {
                        $(this).text("签到")
                    }
                    else if ($(this).text() == 2) {
                        $(this).text("签退")
                    }
                });
            }
            , page: true
            , id: 'table'
            ,limits: [3,6, 9 ]
            ,limit:3
            ,response: {
                code: 'code',// 对应 code
                count: 'count', // 对应 count
            }
        });

        var active = {
            reload: function () {
                //执行重载
                table.reload('table', {
                    url:
                        '${pageContext.request.contextPath}/show.do',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
            }
        };
    });
</script>
</body>
</html>

