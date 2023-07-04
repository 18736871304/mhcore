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
	initDataGrid($('#pointslist'));
	
	inputList = [
			$('#points'),
	 	];

	 checkList = [
			$('#points'),	
	 	];
	 
	 $('#remark').val("");
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#userrightslist').datagrid('getSelected');
	
	var tturl = "rightsMan/getUserPointsList.do";
	
	var tParam = new Object();
	tParam.userid = row.userid;

	displayDataGrid($('#pointslist'), tParam, tturl);
}

function saveSuss()
{
	$('#remark').val("");
	cleardata(inputList);
	$('#userrightslist').datagrid('reload');
	$('#pointslist').datagrid('reload');
}

function userRightsQuery()
{
	var tturl = "rightsMan/getUserRightsList.do";

	var tParam = new Object();
	
	tParam.mobile = $('#qmobile').val();

	displayDataGrid($('#userrightslist'), tParam, tturl);
}

function pointsUpdate()
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
	tparam.userid = row.userid;
	
	ajaxdeal("rightsMan/pointsUpdate.do",tparam,null,null,saveSuss);
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
	<table id="pointslist" class="easyui-datagrid" title="用户积分轨迹" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'pointtypename',width:125">积分类型</th>
				<th data-options="field:'points',width:125">变更积分</th>
				<th data-options="field:'remark',width:200">备注</th>
				<th data-options="field:'makedate',width:125">变更时间</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title_4">
				积分变更
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="points" id="points" notnull = "积分变更">
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "pointsUpdate" onclick = "pointsUpdate()">积分变更</a>
<br>
</div>
</body>
</html>