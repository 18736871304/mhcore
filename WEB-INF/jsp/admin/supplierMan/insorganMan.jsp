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
	dis_insorgancode.style.display="none";
	
	initDataGrid20($('#insorganlist'));

	inputList = [
			$('#insorgancode'),
			$('#fullname'),
			$('#shortname'),
			$('#insorgantype'),
			$('#orderid'),
	];

	checkList = [
			//$('#insorgancode'),
			$('#fullname'),
			$('#shortname'),
			$('#insorgantype'),
			$('#orderid'),
	];
	
	disComBox($('#qinsorgantype'),"insorgantype",null);
	disComBox($('#insorgantype'),"insorgantype",null);
	
	disComBox($('#qinsorgancode'), "insorgancode", null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#insorganlist').datagrid('getSelected');

	$('#insorgancode').val(row.insorgancode);
	$('#fullname').val(row.fullname);
	$('#shortname').val(row.shortname);
	$('#insorgantype').combobox('setValue',row.insorgantype);
	
	$('#orderid').val(row.orderid);
}

function saveSuss()
{
	clearCarData();
	$('#insorganlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function insorganInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("supplier/insorganInsert.do",tparam,null,null,saveSuss);
}

function insorganUpdate()
{
	var row = $('#insorganlist').datagrid('getSelected');
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
	tparam.insorganserialno = row.insorganserialno;
	tparam.old_insorgancode = row.insorgancode;

	ajaxdeal("supplier/insorganUpdate.do",tparam,null,null,saveSuss);
}

function insorganDelete()
{
	var row = $('#insorganlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.insorganserialno = row.insorganserialno;

	ajaxdeal("supplier/insorganDelete.do",tparam,null,null,saveSuss);
}

function insorganquery()
{
	var tturl = "supplier/getInsorganList.do";

	var tParam = new Object();

	//tParam.fullname = $('#qfullname').val();
	tParam.insorgantype = $('#qinsorgantype').combobox('getValue');

	var codes = $('#qinsorgancode').combobox('getValues');
	var ic = "";
	for (var i = 0; i < codes.length; i++) {
		if (ic != "") ic += "\',\'";
		ic += codes[i];
	}
	tParam.insorgancode = ic;
	
	displayDataGrid20($('#insorganlist'), tParam, tturl);

	clearCarData();
}

function disinslogo(val,row,index)
{
	if(row.inslogourl!=null&&row.inslogourl!='')
	{
		return '<a href="'+row.inslogourl+'" target = "_blank">下载</a>';	
	}
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				保险公司
			</td>
			<td class = "report_common">
				<input class="easyui-combobox" style="width:90%" id="qinsorgancode" name="qinsorgancode"
				data-options="valueField:'id',textField:'text',multiple:true">
			</td>
			<td class = "reprot_title" style="width: 7.5%;">
				保险公司类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" name="qinsorgantype" id="qinsorgantype">
				</select>
			</td>
			
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "insorganquery" onclick = "insorganquery()">查询</a>
	<br>
	<br>
	<table id="insorganlist" class="easyui-datagrid" title="保险公司管理" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'discode',width:90">保险公司编码</th>
				<th data-options="field:'fullname',width:190">保险公司全称</th>
				<th data-options="field:'shortname',width:90">保险公司简称</th>
				<th data-options="field:'inslogo',width:90,formatter:disinslogo">保险公司LOGO</th>
				<th data-options="field:'insorgantypename',width:90">保险公司类型</th>
				<th data-options="field:'link_mobile',width:110">保险公司联系电话</th>
				<!-- 
				<th data-options="field:'orderid',width:50">排序</th>
				 -->
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common" hidden>
		
		<tr id = "dis_insorgancode">
			<td class = "title">
				保险公司编码
			</td>
			<td class = "common">
				<input class = "txt" name="insorgancode" id="insorgancode"notnull = "保险公司编码">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				保险公司全称
			</td>
			<td class = "common">
				<input class = "txt" name="fullname" id="fullname"notnull = "保险公司全称">
			</td>
			<td class = "title">
				保险公司简称
			</td>
			<td class = "common">
				<input class = "txt" name="shortname" id="shortname"notnull = "保险公司简称">
			</td>
			<td class = "title">
				保险公司类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="insorgantype" id="insorgantype" notnull = "保险公司类型">
				</select>
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				排序
			</td>
			<td class = "common">
				<input class = "txt" name="orderid" id="orderid"notnull = "排序">
			</td>
		</tr>
	</table>
	<br>
	<!-- 
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "insorganInsert" onclick = "insorganInsert()">保险公司录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "insorganUpdate" onclick = "insorganUpdate()">保险公司修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "insorganDelete" onclick = "insorganDelete()">保险公司删除</a>
	 -->
</div>
</body>
</html>
