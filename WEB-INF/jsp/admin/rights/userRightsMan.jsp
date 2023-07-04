<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#userrightslist'));
	initDataGrid($('#rightstracelist'));
	
	inputList = [
			$('#level'),
	 	];

	 checkList = [
			$('#level'),	
	 	];
	 
	 disComBox($('#level'),"user_right",null);
	 
	 $('#remark').val("");
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#userrightslist').datagrid('getSelected');
	
	var tturl = "rightsMan/getUserRightsTraceList.do";
	
	var tParam = new Object();
	tParam.rightserialno = row.rightserialno;

	displayDataGrid($('#rightstracelist'), tParam, tturl);
}

function saveSuss()
{
	$('#remark').val("");
	cleardata(inputList);
	$('#userrightslist').datagrid('reload');
	$('#rightstracelist').datagrid('reload');
}

function userRightsQuery()
{
	var tturl = "rightsMan/getUserRightsList.do";

	var tParam = new Object();
	
	tParam.mobile = $('#qmobile').val();

	displayDataGrid($('#userrightslist'), tParam, tturl);
}

function levelUpdate()
{
	var row = $('#userrightslist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.remark = $('#remark').val();
	tparam.rightserialno = row.rightserialno;
	tparam.userid = row.userid;
	tparam.fromlevel = row.level;
	tparam.tolevel = tparam.level;
	tparam.curlevel = tparam.level;
	
	ajaxdeal("rightsMan/levelUpdate.do",tparam,null,null,saveSuss);
}

</script>
</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				手机号码
			</td>
			<td class = "report_common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userRightsQuery" onclick = "userRightsQuery()">查询</a>
	<br>
	<br>
	<table id="userrightslist" class="easyui-datagrid" title="用户权限列表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'userid',width:125">手机号码</th>
				<th data-options="field:'levelname',width:125">权益等级</th>
				<th data-options="field:'points',width:125">积分</th>
			</tr>
		</thead>
	</table>
	<br>
	<br>
	<table id="rightstracelist" class="easyui-datagrid" title="用户权限轨迹" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'fromlevelname',width:125">变更前等级</th>
				<th data-options="field:'tolevelname',width:125">变更后等级</th>
				<th data-options="field:'remark',width:200">备注</th>
				<th data-options="field:'makedate',width:125">变更时间</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title_4">
				变更后的等级
			</td>
			<td class = "report_common_4">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="level" id="level" notnull = "变更后的等级">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "reprot_title_4">
				备注
			</td>
			<td class="report_common_4"  colspan="3">
				<textarea notnull = "备注" class="txt" style="width: 600px;height: 75px;" id="remark" name="remark">
				</textarea>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "levelUpdate" onclick = "levelUpdate()">等级调整</a>
<br>
</div>
</body>
</html>