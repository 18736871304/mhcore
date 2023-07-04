<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid($('#userList'));
	
	inputList = [
	 	];

	 checkList = [
	 	];
	
	 $('#menudisplaydlg').dialog('close');
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

function userquery()
{
	var tturl = "user/getUserList.do";

	var tParam = new Object();

	tParam.usercode = $('#qusercode').val();
	tParam.realname = $('#qrealname').val();
	tParam.mobilenumber = $('#qmobilenumber').val();

	//tParam.organcode = $('#qorgancode').val();
	tParam.organcode = $('#departmentId').val();
	
	tParam.usertype = '01';
	
	displayDataGrid($('#userList'), tParam, tturl);

	clearCarData();
}

function saveSuss()
{
	$('#userList').datagrid('reload');
}

function clearCarData()
{
}

function userDelete()
{
	var row = $('#userList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}

	var tparam = new Object();
	
	tparam.userid = row.userid;
	tparam.usercode = row.usercode;
	tparam.organcode = row.organcode;
	  $.messager.alert('操作提示','确认要执行此操作吗？','question',function(){
		ajaxdeal("user/userDelete.do",tparam,null,null,saveSuss);
		  
	  }); 
}

function getChecked(){
    var nodes = $('#userauthtree').tree('getChecked');
    var s = '';
    var s2 = '';
    for(var i=0; i<nodes.length; i++){
        if (s != '') s += '\',\'';
        if (s2 != '') s2 += ',';
        s += nodes[i].id;
        s2 += nodes[i].text;
    }
    $('#departmentId').val(s);
    $('#departmentName').val(s2);

    $('#menudisplaydlg').dialog('close');
}

function userMenuDis()
{
    $("#userauthtree").tree(
        {
            url:'combox/departmentList.do'
        });
    $('#menudisplaydlg').dialog('open');
}

</script>

</head>
<body>
	<input type="text" hidden="hidden" id="departmentId">
	<div id="menudisplaydlg" class="easyui-dialog" title="机构查询"
		 style="width:300px;height:500px;padding:10px"
		 data-options="iconCls: 'icon-save'">
		<div style="margin-left:15%">
			<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
		</div>
		<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
	</div>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				员工编号
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			<td class = "title">
				员工姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qrealname" id="qrealname">
			</td>
			<td class = "title">
				手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qmobilenumber" id="qmobilenumber">
			</td>
		</tr>
		<tr>
			<td class = "title">
				员工机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">员工查询</a>
	<br>
	<br>
	<table id="userList" class="easyui-datagrid" title="员工信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'organ03name',width:100">所属分公司</th>
				<th data-options="field:'organname',width:100">所属事业部</th>
				<th data-options="field:'usercode',width:80">员工编号</th>
				<th data-options="field:'realname',width:100">员工姓名</th>
				<th data-options="field:'mobilenumber',width:90">手机号码</th>
				<th data-options="field:'cardno',width:150">身份证号码</th>
				<th data-options="field:'usertype',width:80">员工状态</th>
				<th data-options="field:'usergradename',width:110">员工级别</th>
				<th data-options="field:'workyears',width:70">司龄（月）</th>
			</tr>
		</thead>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "userDelete" onclick = "userDelete()">员工删除</a>
</div>
</body>
</html>