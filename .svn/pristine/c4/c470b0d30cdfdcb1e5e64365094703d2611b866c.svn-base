<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>
var inputList;
var checkList;
var doubleList;

window.onload = function () 
{
	initDataGrid20($('#aiqaList'));
	initDataGrid20($('#aiqaContentList'));
	
	inputList = [
			];

	checkList = [
			];
}

function aftercodeselect(comboxid) 
{
	
}

function selectone() 
{
	var row = $('#aiqaList').datagrid('getSelected');
	
	var tturl = "/qa/getQaContentList.do";

	var tParam = new Object();

	tParam.sessionid = row.id;

	displayDataGrid20($('#aiqaContentList'), tParam, tturl);
}

function selectonecontent(){
	
}

function saveSuss() 
{
}

function clearInputData() 
{
	
}

function aiqaQuery()
{
	var tturl = "/qa/getQaTitleList.do";

	var tParam = new Object();

	tParam.startdate = $('#qstartdate').datebox("getValue");
	tParam.enddate = $('#qenddate').datebox("getValue");

	displayDataGrid20($('#aiqaList'), tParam, tturl);
}

function getusername(val, row, index) {
	if(row.role=='system'){
		return 'AI';
	}else{
		return row.username;
	}
}
	
</script>
</head>
<body>
	<div style="margin-left:0%">
		<table class="common">
			<tr>
				<td class="reprot_title">
					问答起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
				</td>
				
				<td class="reprot_title">
					问答止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
				</td>
			
				<td></td><td></td>
				<td></td><td></td>
				<td></td><td></td>
				<td></td><td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="aiqaQuery" onclick="aiqaQuery()">查询</a>
		<br>
		<br>
		<table id="aiqaList" class="easyui-datagrid" title="AI问答查询" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'username',width:60">姓名</th>
					<th data-options="field:'title',width:1500">第一条问题</th>
					<th data-options="field:'makedate',width:125">问答时间</th>
				</tr>
			</thead>
		</table>
		<br>
		
		<table id="aiqaContentList" class="easyui-datagrid" title="AI问答内容" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonecontent">
			<thead>
				<tr>
					<th data-options="field:'_username',width:60,formatter:getusername">姓名</th>
					<th data-options="field:'content',width:1500">问答内容</th>
					<th data-options="field:'makedate',width:125">问答时间</th>
				</tr>
			</thead>
		</table>
	</div>
</body>

</html>