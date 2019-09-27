<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
    <link href="js/bstable/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="js/bstable/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="js/bstable/zTreeStyle.css" rel="stylesheet" type="text/css"/>
    <link href="js/bstable/table.css" rel="stylesheet" type="text/css"/>
</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto;">
<div class="news_main">

    <div class="l_left news_left">

        <h6>部门目录</h6>
        <div class="tree_left_top">
            <div class=" order_ztree l_left organize_ztree" style="width: 100%">
                <p>
                <ul id="treeDemo" class="ztree" style=" overflow:auto;margin-left: 20px"></ul>
                </p>
            </div>
        </div>
    </div>
    <div class="l_left news_right">
        <h6>部门管理</h6>

        <div class="notice_check">

            <div class="l_left">
                <input type="text" class="find_input" style="width: 500px;">

            </div>
            <div class="notice_nav r_right">
                <a id="xzwj" style="margin-left: 350px;" class="btn btn-default" r="" onclick="add_departments(0)"><span
                        class="glyphicon glyphicon-plus"></span>新增文件夹</a>
                <a id="xz" style="margin-left: 20px;" class="btn btn-default" r="" onclick="add_department(0)"><span
                        class="glyphicon glyphicon-plus"></span>新增文件</a>
            </div>
            <div class="clear"></div>
        </div>
        <ul class="news_table department_table">
            <li>
                <table id="table" class="table_style" style="margin: 0 auto"></table>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
    <input type="hidden" id="id" value="">
</div>
<script src="js/bstable/jQuery-2.2.0.min.js"></script>
<script src="js/bstable/bootstrap.min.js"></script>
<script src="js/bstable/bootstrap-table.js"></script>
<script src="js/bstable/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/bstable/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/bstable/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/bstable/jquery.ztree.exedit-3.5.js"></script>
<script src="js/bstable/layer.js"></script>


<script>
    $(function () {
        table();
        nav();
    });

    function add_departments(s) {
        //alert($("#xz").attr("r"));
        var ss = $('#id').val();
        layer.open({
            type: 2,
            title: '文件夹',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn: 1,
            area: ['700px', '400px'],
            content: 'department_tails/' + s + '/' + ss + '.do'
        });
    }

    function add_department(s) {

        var ss = $('#id').val();
        layer.open({
            type: 2,
            title: '文件属性',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn: 1,
            area: ['800px', '600px'],
            content: 'department_tail/' + s + '/' + ss + '.do'
        });
    }

    function nav() {
        $(".news_nav li").each(function (index) {
            $(this).click(function () {
                $(".news_nav li").removeClass("nav_active");
                $(this).addClass("nav_active");
                $(".news_table>li").eq(index).show().siblings("li").stop().hide();
            })

        })
    }


    function table() {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [


                {
                    title: "",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '名称',
                    field: 'title',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '类型',
                    field: 'person',
                    align: 'center',
                    valign: 'middle'
                },

                {
                    title: '备注',
                    field: 'type',
                    align: 'center'
                },
                {
                    title: '所有者',
                    field: 'date',
                    align: 'center'
                },
                {
                    title: '创建日期',
                    field: 'oper',
                    align: 'center'
                },
                {
                    title: '',
                    field: 'result',
                    align: 'center',
                },
                {
                    title: '',
                    field: 'results',
                    align: 'center',
                }

            ]
        });
    }

    function del(id) {
        layer.open({
            type: 2,
            title: '清空登录日志',
            shade: 0.5,
            skin: 'layui-layer-rim',
            area: ['40%', '200px'],
            shadeClose: true,
            closeBtn: 1,
            content: 'log_tail.html'
        })
    }

    var ss = eval("(" + '${ss}' + ")");
    var userinfo = '${userinfo.username}';
    var userinfoid = '${userinfo.roleid}';
</script>
<script src="js/bstable/organize.js"></script>
</body>
</html>
