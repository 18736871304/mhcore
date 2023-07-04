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
	initDataGrid($('#protocollist'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	
	disComBox($('#qprotocoltype'),"protocoltype",null);
	
	disComBox($('#qprotocolstate'),"protocolstate",null);
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
	//$('#protocollist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function protocolquery()
{
	var tturl = "supplier/getProtocolList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.protocoltype = $('#qprotocoltype').combobox('getValue');
	
	tParam.protocolstate = $('#qprotocolstate').combobox('getValue');

	displayDataGrid($('#protocollist'), tParam, tturl);

	clearCarData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title">
				协议分类
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qprotocoltype" id="qprotocoltype">
				</select>
			</td>
			<td class = "title">
				协议状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qprotocolstate" id="qprotocolstate">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "protocolquery" onclick = "protocolquery()">查询</a>
	<br>
	<br>
	<table id="protocollist" class="easyui-datagrid" title="协议信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				
				<th data-options="field:'insorganname',width:80">保险公司</th>
				<th data-options="field:'protocolname',width:80">协议名称</th>
				<th data-options="field:'protocoltypename',width:80">协议分类</th>
				<th data-options="field:'startdate',width:80">协议起期</th>
				<th data-options="field:'enddate',width:80">协议止期</th>
				<th data-options="field:'protocolstatename',width:80">协议状态</th>
				<th data-options="field:'linkman',width:80">对接人</th>
				<th data-options="field:'linkmobile',width:80">联系电话</th>
				<th data-options="field:'invoiceinfo',width:200">开票信息</th>
				
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>