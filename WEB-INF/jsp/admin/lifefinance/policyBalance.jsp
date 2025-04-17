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
	initDataGrid($('#policybalancelist'));

	inputList = [
			$('#contno'),
			$('#basecomm'),
			$('#activitycomm'),
			$('#deductcomm')
	 	];

	 checkList = [
			$('#contno')
	 	];
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#policybalancelist').datagrid('getSelected');

	$('#contno').val(row.contno);
	$('#basecomm').val(row.basecomm);
	$('#activitycomm').val(row.activitycomm);
	$('#deductcomm').val(row.deductcomm);
}

function saveSuss()
{
	$('#policybalancelist').datagrid('reload');
	clearBalanceData();
}

function clearBalanceData() 
{
	cleardata(inputList);
}

function balancequery()
{
	var tturl = "balanceMan/getBalanceList.do";

	var tParam = new Object();

	tParam.organcode = $('#qcontno').val();
	
	tParam.balancetype = '01';
		
	displayDataGrid($('#policybalancelist'), tParam, tturl);

	clearBalanceData();
}

function balanceInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}
	
	var tparam = prepareparam(inputList);
	tparam.balancetype = '01';
	
	ajaxdeal("balanceMan/balanceInsert.do",tparam,null,null,saveSuss);
}

function balanceUpdate()
{
	var row = $('#policybalancelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	/*
	if($('#zd_answer_userid').val()==null||$('#zd_answer_userid').val()=="")
	{
		$.messager.alert('操作提示','指定回答人不能为空！','error');
		return;
	}
	*/
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.balanceserialno = row.balanceserialno;
	tparam.zd_answer_userid = $('#zd_answer_userid').val();

	ajaxdeal("balanceMan/balanceUpdate.do",tparam,null,null,saveSuss);
}

function balanceDelete()
{
	var row = $('#policybalancelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.balanceid = row.balanceserialno;

	ajaxdeal("balanceMan/balanceDelete.do",tparam,null,null,saveSuss);
}

function FileUpload()
{
	var tparam = prepareparam(inputList);
	
	ajaxFileUpload('filename','balanceMan/balanceUpload.do',tparam,null,null,saveSuss);
	//上传完毕之后，把浏览框中的文本清除。
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				保单号
			</td>
			<td class = "report_common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "balancequery" onclick = "balancequery()">查询</a>
	<br>
	<br>
	<table id="policybalancelist" class="easyui-datagrid" title="结算信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'contno',width:120">保单号</th>
				<th data-options="field:'basecomm',width:120">基础佣金</th>
				<th data-options="field:'activitycomm',width:120">活动补贴</th>
				<th data-options="field:'deductcomm',width:120">扣佣</th>
				<th data-options="field:'oprname',width:120">操作人</th>
				<th data-options="field:'makedatestr',width:150">操作时间</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class="common">
		<tr>
			<td class="reprot_title_4">
				保单号
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="contno" name="contno" notnull = "保单号">
			</td>
			<td class="reprot_title_4">
				基础佣金
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="basecomm" name="basecomm">
			</td>
			<td class="reprot_title_4">
				活动补贴
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="activitycomm" name="activitycomm">
			</td>
			<td class="reprot_title_4">
				扣佣
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="deductcomm" name="deductcomm">
			</td>
		</tr>
	
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "balanceInsert" onclick = "balanceInsert()">保存</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "balanceUpdate" onclick = "balanceUpdate()">修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "balanceDelete" onclick = "balanceDelete()">删除</a>
	<br>
	<br>
	<div class="upload-box">
		<input type='text' name='textfield' id='textfield' class='upload-txt' />  
	 	<button id = "file-view" class="smsbutton">浏览...</button> 	
	 	<input type="file" name="myfiles" class="upload-file" id="filename" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" /> 	
	 	<button id = "file-upload" class="smsbutton" onclick = "FileUpload()">上传</button>
	</div>
	<br>
</div>
</body>
</html>