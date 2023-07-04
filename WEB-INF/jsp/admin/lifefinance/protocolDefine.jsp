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
	initDataGrid($('#lifeprotocollist'));

	inputList = [
			$('#insorgancode'),
			$('#organcode'),
			$('#protocolno'),
			$('#protocolname'),
			$('#startdate'),
			$('#enddate')
	];

	checkList = [
			$('#insorgancode'),
			$('#organcode'),
			$('#protocolno'),
			$('#protocolname'),
			$('#startdate'),
			$('#enddate')
	];

	disComBox($('#insorgancode'),"insorgancode",null);
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#organcode'),"balanceorgan",null);
	//disComBox($('#qorgancode'),"balanceorgan",null);
	
	$('#organcode').combobox('setValue','100000000');
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#lifeprotocollist').datagrid('getSelected');

	$('#insorgancode').combobox('setValue',row.insorgancode);
	$('#organcode').combobox('setValue',row.organcode);
	
	$('#protocolno').val(row.protocolno);
	$('#protocolname').val(row.protocolname);
	$('#startdate').datebox('setValue',row.startdate);
	$('#enddate').datebox('setValue',row.enddate);
}

function saveSuss()
{
	clearLifeData();
	$('#lifeprotocollist').datagrid('reload');
}

function clearLifeData() 
{
	cleardata(inputList);
}

function lifeprotocolInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("lifefinance/lifeprotocolInsert.do",tparam,null,null,saveSuss);
}

function lifeprotocolUpdate()
{
	var row = $('#lifeprotocollist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.lifeprotocolserialno = row.lifeprotocolserialno;

	ajaxdeal("lifefinance/lifeprotocolUpdate.do",tparam,null,null,saveSuss);
}

function lifeprotocolDelete()
{
	var row = $('#lifeprotocollist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.lifeprotocolserialno = row.lifeprotocolserialno;

	ajaxdeal("lifefinance/lifeprotocolDelete.do",tparam,null,null,saveSuss);
}

function lifeprotocolquery()
{
	var tturl = "lifefinance/getLifeprotocolList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.organcode = $('#qorgancode').combobox('getValue');
	
	tParam.protocolno = $('#qprotocolno').val();
	tParam.protocolname = $('#qprotocolname').val();
	
	tParam.state = "'00','01'";

	//alert(tParam.insorgancode);
	
	displayDataGrid($('#lifeprotocollist'), tParam, tturl);

	clearLifeData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				保险公司编码
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
			</td>
			<td class = "title">
				协议编码
			</td>
			<td class = "common">
				<input class = "txt" name="qprotocolno" id="qprotocolno">
			</td>
			<td class = "title">
				协议名称
			</td>
			<td class = "common">
				<input class = "txt" name="qprotocolname" id="qprotocolname">
			</td>
		</tr>
		<tr>
			<td class = "title" style="display:none">
				机构编码
			</td>
			<td class = "common" style="display:none">
				<input class = "easyui-combobox" style="width:160%" name="qorgancode" id="qorgancode">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "lifeprotocolquery" onclick = "lifeprotocolquery()">协议查询</a>
	<br>
	<br>
	<table id="lifeprotocollist" class="easyui-datagrid" title="协议信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'insorganname',width:120">保险公司</th>
				<th data-options="field:'organname',width:120">机构名称</th>
				<th data-options="field:'protocolno',width:120">协议编码</th>
				<th data-options="field:'protocolname',width:120">协议名称</th>
				<th data-options="field:'startdate',width:120">协议起期</th>
				<th data-options="field:'enddate',width:120">协议止期</th>
				<th data-options="field:'statename',width:120">协议状态</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%"  name="insorgancode" id="insorgancode" notnull = "保险公司">
			</td>
			
			<td class = "title">
				机构
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%"  name="organcode" id="organcode" notnull = "机构">
			</td>
			<td></td><td></td>
		</tr>
		<tr>	
			<td class = "title">
				协议编码
			</td>
			<td class = "common">
				<input class = "txt" name="protocolno" id="protocolno"notnull = "协议编码">
			</td>
			
			<td class = "title">
				协议名称
			</td>
			<td class = "common">
				<input class = "txt" name="protocolname" id="protocolname"notnull = "协议名称">
			</td>
		</tr>
		<tr>
			<td class = "title">
				协议起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="startdate" name="startdate" notnull = "协议起期">
			</td>
			<td class = "title">
				协议止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="enddate" name="enddate" notnull = "协议止期">
			</td>
		</tr>
		<tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "lifeprotocolInsert" onclick = "lifeprotocolInsert()">协议录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "lifeprotocolUpdate" onclick = "lifeprotocolUpdate()">协议修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "lifeprotocolDelete" onclick = "lifeprotocolDelete()">协议删除</a>
</div>
</body>
</html>