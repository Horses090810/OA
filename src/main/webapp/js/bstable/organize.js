/**
 * Created by Administrator on 2016/8/4.
 */
var setting = {
    view: {
        dblClickExpand: false
    },
    check: {
        enable: true
    },
    callback: {
        onRightClick: OnRightClick,
        onClick: OnClick
    }
};
var zNodes = ss;

function OnRightClick(event, treeId, treeNode) {
    if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
        zTree.cancelSelectedNode();
        //showRMenu("root", event.clientX, event.clientY);
    } else if (treeNode && !treeNode.noR) {
        zTree.selectNode(treeNode);
        //showRMenu("node", event.clientX, event.clientY);
    }
}

function showRMenu(type, x, y) {
    $("#rMenu ul").show();
    if (type == "root") {
        $("#m_del").hide();
        $("#m_check").hide();
        $("#m_unCheck").hide();
    } else {
        $("#m_del").show();
        $("#m_check").show();
        $("#m_unCheck").show();
    }
    rMenu.css({"top": y + "px", "left": x + "px", "visibility": "visible"});

    $("body").bind("mousedown", onBodyMouseDown);
}

function hideRMenu() {
    if (rMenu) rMenu.css({"visibility": "hidden"});
    $("body").unbind("mousedown", onBodyMouseDown);
}

function onBodyMouseDown(event) {
    if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
        rMenu.css({"visibility": "hidden"});
    }
}

var addCount = 1;

//添加事件
function addTreeNode(names) {
    hideRMenu();
    var newNode = {name: names + (addCount++)};
    if (zTree.getSelectedNodes()[0]) {
        newNode.checked = zTree.getSelectedNodes()[0].checked;
        zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
    } else {
        zTree.addNodes(null, newNode);
    }
}

function removeTreeNode() {
    hideRMenu();
    var nodes = zTree.getSelectedNodes();
    if (nodes && nodes.length > 0) {
        if (nodes[0].children && nodes[0].children.length > 0) {
            var msg = "要删除的节点是父节点，如果删除将连同子节点一起删掉。\n\n请确认！";
            if (confirm(msg) == true) {
                zTree.removeNode(nodes[0]);
            }
        } else {
            zTree.removeNode(nodes[0]);
        }
    }
}

function checkTreeNode(checked) {
    var nodes = zTree.getSelectedNodes();
    if (nodes && nodes.length > 0) {
        zTree.checkNode(nodes[0], checked, true);
    }
    hideRMenu();
}

function resetTree() {
    hideRMenu();
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
}

function OnClick(event, treeId, treeNode) {
    $(".dropdown_select").val(treeNode.name);
    $('#xz').attr("r", treeNode.fileid);
    $('#id').val(treeNode.fileid);
    $('.find_input').val(treeNode.filepath + "\\" + treeNode.name);
    wjzjff(treeNode.fileid);


}

function scff(s) {
    alert(s);
    location.href = "scffss/" + s + ".do";
}

function tjff() {
    alert("权限不足，请联系管理员或者所有者！！！");
}

function wjzjff(id) {
    $.post("findWjId.do", {"id": id}, function (data) {

        $('.table tbody').html("");
        if (data.length == 0) {
            $('.table tbody').html('<tr class="no-records-found"><td colspan="8">没有找到匹配的记录</td></tr>');
        }
        //'<tr class="no-records-found"><td>s</td><td>d</td> <td>s</td></tr>'
        $.each(data, function (i, g) {
            $('.table tbody').append('<tr data-index="' + i + '"><td style="text-align: center; vertical-align: middle; "><img src="/OA/img/' + g.filetypeimage + '" style="width: 30px;height: 30px" alt="">'
                + '</td style="text-align: center; vertical-align: middle; "> <td style="text-align: center; vertical-align: middle; ">' + g.filename + '</td><td style="text-align: center; vertical-align: middle; ">' + g.filetypename + '</td>' +
                '<td style="text-align: center; vertical-align: middle; ">' + g.remark + '</td><td style="text-align: center; vertical-align: middle; ">' + g.fileowner + '</td></td><td>' + g.createdate + '</td>' +
                '<td style="text-align: center; vertical-align: middle; "><a class="btn btn-default" onclick="return ' + (g.filetype == 1 ? "add_departments(" + g.fileid + ")" : "add_department(" + g.fileid + ")") + '"><span ' + (g.filetype == 1 ? "class=\"glyphicon glyphicon-folder-open\"" : "class=\"glyphicon glyphicon-list\"") + ' ></span></a></td>' +
                '<td style="text-align: center; vertical-align: middle; "><a class="btn btn-default"' + (userinfoid == 1 ? "onclick=\"scff(" + g.fileid + ")\"" : userinfo == g.fileowner ? "onclick=\"scff(" + g.fileid + ")\"" : "onclick=\"tjff()\"") + '><span class="glyphicon glyphicon-remove" ></span></a></td>' +
                '</tr>');
        })
    })

}


function xqff(s) {
    alert(s);
    return false;
}

var zTree, rMenu;
$(document).ready(function () {
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    $.fn.zTree.init($("#treeDemo1"), setting, zNodes);
    $.fn.zTree.init($("#treeDemo2"), setting, zNodes);
    $.fn.zTree.init($("#treeDemo3"), setting, zNodes);
    zTree = $.fn.zTree.getZTreeObj("treeDemo");
    rMenu = $("#rMenu");
});