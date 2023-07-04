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

	inputList = [
			$('#protocoltype'),
			$('#insorgancode'),
			$('#protocolname'),
			$('#startdate'),
			$('#enddate'),
			$('#linkman'),
			$('#linkmobile'),
			$('#invoiceinfo'),
	];

	checkList = [
			$('#protocoltype'),
			$('#insorgancode'),
			$('#protocolname'),
			$('#startdate'),
			$('#enddate'),
			$('#linkman'),
			$('#linkmobile'),
			$('#invoiceinfo'),
	];
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#insorgancode'),"insorgancode",null);
	
	disComBox($('#qprotocoltype'),"protocoltype",null);
	disComBox($('#protocoltype'),"protocoltype",null);
	
	disComBox($('#qprotocolstate'),"protocolstate",null);
	
	$('#invoiceinfo').val("");
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#protocollist').datagrid('getSelected');

	$('#protocoltype').combobox('setValue',row.protocoltype);
	$('#insorgancode').combobox('setValue',row.insorgancode);
	
	$('#protocolname').val(row.protocolname);
	$('#startdate').datebox('setValue',row.startdate);
	$('#enddate').datebox('setValue',row.enddate);
	$('#linkman').val(row.linkman);
	$('#linkmobile').val(row.linkmobile);
	$('#invoiceinfo').val(row.invoiceinfo);
}

function saveSuss()
{
	clearCarData();
	$('#protocollist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function protocolInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("supplier/protocolInsert.do",tparam,null,null,saveSuss);
}

function protocolUpdate()
{
	var row = $('#protocollist').datagrid('getSelected');
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
	tparam.protocolserialno = row.protocolserialno;

	ajaxdeal("supplier/protocolUpdate.do",tparam,null,null,saveSuss);
}

function protocolDelete()
{
	var row = $('#protocollist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.protocolserialno = row.protocolserialno;

	ajaxdeal("supplier/protocolDelete.do",tparam,null,null,saveSuss);
}

function protocolquery()
{
	var tturl = "supplier/getProtocolList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.protocoltype = $('#qprotocoltype').combobox('getValue');
	
	tParam.protocolstate = $('#qprotocolstate').val();

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
	<table class = "common">
		<tr>
			<td class = "title">
				协议分类
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="protocoltype" id="protocoltype" notnull = "协议分类">
				</select>
			</td>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="insorgancode" id="insorgancode" notnull = "保险公司">
				</select>
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
				<input class="easyui-datebox" style="width:160%" name="startdate" id="startdate"notnull = "协议起期">
			</td>
			<td class = "title">
				协议止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="enddate" id="enddate"notnull = "协议止期">
			</td>
		</tr>
		<tr>
			<td class = "title">
				对接人
			</td>
			<td class = "common">
				<input class = "txt" name="linkman" id="linkman"notnull = "对接人">
			</td>
			<td class = "title">
				联系电话
			</td>
			<td class = "common">
				<input class = "txt" name="linkmobile" id="linkmobile"notnull = "联系电话">
			</td>
		</tr>
		<tr>
			<td class = "title">
				开票信息
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "开票信息" class="txt" style="width: 600px;height: auto;" id="invoiceinfo" name="invoiceinfo">
				</textarea>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "protocolInsert" onclick = "protocolInsert()">协议录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "protocolUpdate" onclick = "protocolUpdate()">协议修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "protocolDelete" onclick = "protocolDelete()">协议删除</a>
</div>
</body>
</html>
