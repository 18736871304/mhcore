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
	];

	checkList = [
	];
	
	disComBox($('#qbuz_flow'),"buzflow",null);
	disComBox($('#qstate'),"qastate",null);
	
	$('#qstate').combobox('setValue','03');
	
	qaViewDlgInit();
	dlgUserInit();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
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

function qaquery()
{
	var tturl = "qa/getQaList.do";

	var tParam = new Object();
	
	if($('#qbuz_flow').combobox('getValue')!=null&&$('#qbuz_flow').combobox('getValue')!="")
	{
		tParam.buz_flow = $('#qbuz_flow').combobox('getValue')+"','05";
	}
	
	tParam.question = $('#qquestion').val();
	
	tParam.state = $('#qstate').combobox('getValue');
	tParam.answer_userid = $('#qanswer_userid').val();
	tParam.optimize_userid = $('#qoptimize_userid').val();
	
	//tParam.state = "01','02','03";

	displayDataGrid($('#qalist'), tParam, tturl);

	//clearCarData();
}

function disQaInfo(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>'; 
}

function openDlg(index)
{
	var rows=$('#qalist').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	//alert(row.agentcom);
	
	disqaViewDlg(row);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/qa/qaViewDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				问题（关键字搜索）
			</td>
			<td class = "common">
				<input class = "txt" name="qquestion" id="qquestion">
			</td>
			<td class = "title">
				所在流程
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qbuz_flow" id="qbuz_flow">
				</select>
			</td>
			<td class = "title">
				问题状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				回答人
			</td>
			<td class = "common">
				<input class = "txt" name="qanswer_username" id="qanswer_username" readonly onclick = "disuUserDlg($('#qanswer_usercode'),$('#qanswer_userid'),$('#qanswer_username'));">
				<input hidden = "" name="qanswer_userid" id="qanswer_userid">
				<input hidden = "" name="qanswer_usercode" id="qanswer_usercode">
			</td>
			<td class = "title">
				优化人
			</td>
			<td class = "common">
				<input class = "txt" name="qoptimize_username" id="qoptimize_username" readonly onclick = "disuUserDlg($('#qoptimize_usercode'),$('#qoptimize_userid'),$('#qoptimize_username'));">
				<input hidden = "" name="qoptimize_userid" id="qoptimize_userid">
				<input hidden = "" name="qoptimize_usercode" id="qoptimize_usercode">
			</td>
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
				
				<th data-options="field:'_operate',width:70,formatter:disQaInfo">解决方案</th>
				
				<th data-options="field:'answer_username',width:90">回答人</th>
				<th data-options="field:'answer_date',width:130">回答时间</th>
				
				<th data-options="field:'optimize_username',width:90">优化人</th>
				<th data-options="field:'optimize_date',width:130">优化时间</th>
				
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
