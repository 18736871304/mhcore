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
	initDataGrid($('#sharelist'));
	initDataGrid($('#traceinfolist'));

	inputList = [
	];

	checkList = [
	];

	disComBox($('#qinsorgancode'),"insorgancode",null);
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qinsorgancode")
	{
		var tParam = new Object();
		tParam.insorgancode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getRiskList.do";
		
		displayCombox($('#qriskcode'),tParam,tturl1,"dd_key","dd_value");
	}
}

function selectone()
{
	var row = $('#sharelist').datagrid('getSelected');
	
	var tturl = "policy/getTraceinfoList.do";
	
	var tParam = new Object();

	tParam.shareserialno = row.shareserialno;

	displayDataGrid($('#traceinfolist'), tParam, tturl);
}

function saveSuss()
{
	clearCarData();
	$('#sharelist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function sharequery()
{
	var tturl = "policy/getShareList.do";

	var tParam = new Object();

	tParam.mobile = $('#qmobile').val();
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');;
	tParam.riskcode = $('#qriskcode').combobox('getValue');;
	tParam.operator = $('#qoperator').val();
	tParam.makedateStart = $('#qmakedateStart').datebox("getValue");
	tParam.makedateEnd = $('#qmakedateEnd').datebox("getValue");

	displayDataGrid($('#sharelist'), tParam, tturl);

	clearCarData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
			</td>
			<td class = "title">
				险种编码
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" name="qriskcode" id="qriskcode" panelWidth="200">
			</td>
		</tr>
		<tr>
			<td class = "title">
				操作员
			</td>
			<td class = "common">
				<input class = "txt" name="qoperator" id="qoperator">
			</td>
			<td class = "title">
				生成日期起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="qmakedateStart" id="qmakedateStart">
			</td>
			<td class = "title">
				生成日期止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="qmakedateEnd" id="qmakedateEnd">
			</td>
		</tr>
		<tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "sharequery" onclick = "sharequery()">分享查询</a>
	<br>
	<br>
	<table id="sharelist" class="easyui-datagrid" title="分享信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'mobile',width:120">手机号码</th>
				<th data-options="field:'insorganname',width:200">保险公司</th>
				<th data-options="field:'riskname',width:200">险种编码</th>
				<th data-options="field:'clickcount',width:150">点击数</th>
				<th data-options="field:'operator',width:120">操作员</th>
				<th data-options="field:'makedate',width:160">生成日期</th>
			</tr>
		</thead>
	</table>
	<br>
	<table id="traceinfolist" class="easyui-datagrid" title="轨迹信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'tracename',width:300">操作信息</th>
				<th data-options="field:'ip',width:150">操作IP</th>
				<th data-options="field:'makedate',width:200">操作日期</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
