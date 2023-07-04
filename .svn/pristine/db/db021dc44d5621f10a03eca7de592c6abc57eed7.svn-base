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
	initDataGrid($('#userwxchangelist'));
	
	disComBox($('#qstate'),"wxstate",null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{

}

function saveSuss()
{
}

function userwxchangequery()
{
	var tturl = "userwx/getUserWxChangeList.do";

	var tParam = new Object();
	
	tParam.wxno = $('#qwxno').val();
	tParam.usercode = $('#qusercode').val();
	tParam.username = $('#qusername').val();
	
	tParam.state = $('#qstate').combobox('getValue');
	tParam.startdate = $('#qstartdate').datebox("getValue");
	tParam.enddate = $('#qenddate').datebox("getValue");
	
	displayDataGrid($('#userwxchangelist'), tParam, tturl);
}

</script>
</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				微信号
			</td>
			<td class = "common">
				<input class = "txt" name="qwxno" id="qwxno">
			</td>
			
			<td class = "title">
				使用人编码
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qusername" id="qusername">
			</td>
		</tr>
		<tr>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			
			<td class = "title">
				状态起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qstartdate" name="qstartdate">
			</td>
			
			<td class = "title">
				状态止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qenddate" name="qenddate">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxchangequery" onclick = "userwxchangequery()">微信号变更查询</a>
	<br>
	<br>
	<table id="userwxchangelist" class="easyui-datagrid" title="微信号变更查询" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'wxno',width:120">微信号</th>
				<th data-options="field:'statename',width:80">状态</th>
				<th data-options="field:'startdate',width:100">状态起期</th>
				<th data-options="field:'enddate',width:100">状态止期</th>
				
				<th data-options="field:'usercode',width:90">使用人编码</th>
				<th data-options="field:'username',width:90">使用人姓名</th>
				
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:120">所属团队</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
