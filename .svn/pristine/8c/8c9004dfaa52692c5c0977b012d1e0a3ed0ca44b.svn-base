<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#qalist'));

	inputList = [
			$('#question'),
			$('#buz_flow'),
	];

	checkList = [
			$('#question'),
			$('#buz_flow'),
	];

	disComBox($('#qbuz_flow'),"buzflow",null);
	disComBox($('#buz_flow'),"buzflow",null);
	
	$('#question').val("");
	
	dlgUserInit();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#qalist').datagrid('getSelected');

	$('#question').val(row.question);
	$('#buz_flow').combobox('setValue',row.buz_flow);
	
	$('#zd_answer_userid').val(row.zd_answer_userid);
	$('#zd_answer_usercode').val(row.zd_answer_usercode);
	$('#zd_answer_username').val(row.zd_answer_username);
}

function saveSuss()
{
	clearCarData();
	$('#qalist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function qaInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	/*
	if($('#zd_answer_userid').val()==null||$('#zd_answer_userid').val()=="")
	{
		$.messager.alert('操作提示','指定回答人不能为空！','error');
		return;
	}
	*/
	
	var tparam = prepareparam(inputList);
	tparam.zd_answer_userid = $('#zd_answer_userid').val();
	
	ajaxdeal("qa/qaInsert.do",tparam,null,null,saveSuss);
}

function qaUpdate()
{
	var row = $('#qalist').datagrid('getSelected');
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
	tparam.qaserialno = row.qaserialno;
	tparam.zd_answer_userid = $('#zd_answer_userid').val();

	ajaxdeal("qa/qaUpdate.do",tparam,null,null,saveSuss);
}

function qaDelete()
{
	var row = $('#qalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.qaserialno = row.qaserialno;

	ajaxdeal("qa/qaDelete.do",tparam,null,null,saveSuss);
}

function qaquery()
{
	var tturl = "qa/getQaList.do";

	var tParam = new Object();

	if($('#qbuz_flow').combobox('getValue')!=null&&$('#qbuz_flow').combobox('getValue')!="")
	{
		tParam.buz_flow = $('#qbuz_flow').combobox('getValue')+"','05";
	}
	
	tParam.state = '01';

	displayDataGrid($('#qalist'), tParam, tturl);

	clearCarData();
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				所在流程
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qbuz_flow" id="qbuz_flow">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "qaquery" onclick = "qaquery()">问题查询</a>
	<br>
	<br>
	<table id="qalist" class="easyui-datagrid" title="问题信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'question_date',width:130">日期</th>
				<th data-options="field:'question',width:300">问题</th>
				<th data-options="field:'buz_flowname',width:90">所在流程</th>
				<th data-options="field:'statename',width:90">问题状态</th>
				
				<th data-options="field:'zd_answer_username',width:90">指定回答人</th>
				
				<th data-options="field:'username',width:90">业务员姓名</th>
				<th data-options="field:'organname',width:90">所属事业部</th>
				<th data-options="field:'agentcom',width:90">所属分公司</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				所在流程
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="buz_flow" id="buz_flow" notnull = "所在流程">
				</select>
			</td>
			<td class = "title">
				指定回答人
			</td>
			<td class = "common">
				<input class = "txt" name="zd_answer_username" id="zd_answer_username" notnull = "指定回答人"  readonly onclick = "disuUserDlg($('#zd_answer_usercode'),$('#zd_answer_userid'),$('#zd_answer_username'));">
				<input hidden = "" name="zd_answer_userid" id="zd_answer_userid">
				<input hidden = "" name="zd_answer_usercode" id="zd_answer_usercode">
			</td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "title">
				问题
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "问题" class="txt" style="width: 600px;height: 150px;" id="question" name="question">
				</textarea>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "qaInsert" onclick = "qaInsert()">问题录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "qaUpdate" onclick = "qaUpdate()">问题修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "qaDelete" onclick = "qaDelete()">问题删除</a>
</div>
</body>
</html>
