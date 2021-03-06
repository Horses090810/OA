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
    <title></title>
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
<h3>你当前的位置是：历史调查</h3><br><br><br>

<div class="demoTable">
    名称：
    <div class="layui-inline">
        <input class="layui-input" name="name" id="name" autocomplete="off">
    </div>
    部门：
    <div class="layui-inline">
        <input  class="layui-input" id="depid" name="depid">
        </input>
    </div>
    机构：
    <div class="layui-inline">
        <input class="layui-input"  id="sex" name="geender">
        </input>
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table  id="mytab" width="60%" class="layui-table" lay-filter="test">

</table>
</div>
<script>
    layui.use(['table','util'],  function () {
        var table = layui.table;
        var util=layui.util;

        table.render({
            elem: '#mytab'
            , url: '${pageContext.request.contextPath}/show1.do'
            , type: 'post'
            , cols: [[
                {field: 'signid', title: "编号", width: 160}
                , {field: 'username', title: "名称", width: 160}
                , {field: 'signtime', width: 160, title: '出勤率',templet:function(d) {return util.toDateString(d.signtime,"HH:mm:ss");}}
                , {field: 'signtag', width: 160, title: '迟到'}
                , {field: 'signdesc', width: 160, title: '早退'}
                , {field: 'signdesc', width: 160, title: '旷工'}
                , {field: 'departname', width: 160, title: '部门'}
                , {field: 'branchshortname',width: 160,title: '机构'}
            ]]
            , page: true
            , id: 'table'
            ,limits: [3,6,9]
            ,limit:3
            ,response: {
                code: 'code',// 对应 code
                count: 'count', // 对应 count
            }
        });

        var $ = layui.$, active = {
            reload: function(){
                var name = $('#name');
                var depid=$('#depid');
                var geender=$('#sex');
                //执行重载
                table.reload('table', {
                    url: '${pageContext.request.contextPath}/inquire1.do'
                    ,page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name: name.val()
                        ,depid: depid.val()
                        ,geender: geender.val()
                    }
                });
            }
        }


        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>

