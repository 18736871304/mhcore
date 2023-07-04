<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202004">
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#riskdefinelist'));
	initDataGrid($('#insureyearlist'));
	
	inputList = [
	 			$('#insureyear'),
	 			$('#insureyearflag'),
	 			$('#insureyearvalue'),
	 			$('#orderid'),
	 	];

	 checkList = [
	 			$('#insureyear'),
	 			$('#insureyearflag'),
	 			$('#insureyearvalue'),
	 			$('#orderid'),
	 	];
	 
	 disComBox($('#insureyearflag'),"insuyearflag",null);
	 
	 disComBox($('#qinsorgancode'),"insorgancode",null);
	 disComBox($('#qismain'),"ismain",null);
	 disComBox($('#qchannel'),"channel",null);
	 disComBox($('#qrisktype'),"risktype",null);
	 disComBox($('#qisseal'),"isseal",null);
	 disComBox($('#qjointype'),"jointype",null);
	 
	 $('#qisseal').combobox('setValue','01');
	 $('#qismain').combobox('setValue','Y');
}

function aftercodeselect(comboxid)
{

}


function selectone()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	
	var tturl = "supplier/getInsureyearList.do";

	var tParam = new Object();

	tParam.insorgancode = row.insorgancode;
	tParam.riskcode = row.riskcode;

	displayDataGrid($('#insureyearlist'), tParam, tturl);
}

function selectoneInsureyear()
{
	var rowinsureyear = $('#insureyearlist').datagrid('getSelected');

	$('#insureyear').val(rowinsureyear.insureyear);
	$('#insureyearflag').combobox('setValue',rowinsureyear.insureyearflag);
	$('#insureyearvalue').val(rowinsureyear.insureyearvalue);
	$('#orderid').val(rowinsureyear.orderid);
}

function riskdefinequery()
{
	var tturl = "supplier/getRiskdefineList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.riskname = $('#qriskname').val();
	tParam.ismain = $('#qismain').combobox('getValue');
	
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.risktype = $('#qrisktype').combobox('getValue');
	tParam.isseal = $('#qisseal').combobox('getValue');
	tParam.jointype = $('#qjointype').combobox('getValue');

	displayDataGrid($('#riskdefinelist'), tParam, tturl);
	
	clearCarData();
}

function saveSuss()
{
	clearCarData();
	$('#insureyearlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function insureyearInsert()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中险种数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	
	tparam.insorgancode = row.insorgancode;
	tparam.riskcode = row.riskcode;

	ajaxdeal("supplier/insureyearInsert.do",tparam,null,null,saveSuss);
}

function insureyearUpdate()
{
	var rowinsureyear = $('#insureyearlist').datagrid('getSelected');
	if(rowinsureyear==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.insureyearserialno = rowinsureyear.insureyearserialno;

	ajaxdeal("supplier/insureyearUpdate.do",tparam,null,null,saveSuss);
}

function insureyearDelete()
{
	var rowinsureyear = $('#insureyearlist').datagrid('getSelected');
	if(rowinsureyear==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.insureyearserialno = rowinsureyear.insureyearserialno;

	ajaxdeal("supplier/insureyearDelete.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				签约渠道
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
			
			<td class = "reprot_title">
				险种类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
				</select>
			</td>
			
			<td class = "reprot_title">
				保险公司
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "reprot_title">
				险种名称
			</td>
			<td class = "report_common">
				<input class = "txt" name="qriskname" id="qriskname">
			</td>
			
			<td class = "reprot_title" hidden>
				是否主险
			</td>
			<td class = "report_common" hidden>
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qismain" id="qismain">
				</select>
			</td>
			
			<td class = "reprot_title">
				产品属性
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qjointype" id="qjointype">
				</select>
			</td>
			
			<td class = "reprot_title">
				是否在售
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qisseal" id="qisseal">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "riskdefinequery" onclick = "riskdefinequery()">查询</a>
	<br>
	<br>
	<table id="riskdefinelist" class="easyui-datagrid" title="保障期限管理" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'groupcode',width:90">保险产品编码</th>
				<th data-options="field:'channelname',width:80">签约渠道</th>
				<th data-options="field:'risktypename',width:80">险种类型</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskname',width:320">险种名称</th>
				<th data-options="field:'jointypename',width:80">产品属性</th>
				<th data-options="field:'issealname',width:80">是否在售</th>
			</tr>
		</thead>
	</table>
	<br>
	<table id="insureyearlist" class="easyui-datagrid" title="保障期限信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectoneInsureyear" >
		<thead>
			<tr>
				<th data-options="field:'insureyear',width:120">保障期限</th>
				<th data-options="field:'insureyearname',width:120">保障期限单位</th>
				<th data-options="field:'insureyearvalue',width:120">显示名称</th>
				<th data-options="field:'orderid',width:120">排序</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title_4">
				保障期限
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="insureyear" id="insureyear"notnull = "保障期限">
			</td>
			
			<td class = "reprot_title_4">
				保障期限单位
			</td>
			<td class = "report_common_4">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="insureyearflag" id="insureyearflag" notnull = "保障期限单位">
				</select>
			</td>
			
			<td class = "reprot_title_4">
				显示名称
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="insureyearvalue" id="insureyearvalue"notnull = "显示名称">
			</td>
			<td class = "reprot_title_4">
				排序
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="orderid" id="orderid"notnull = "排序">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "insureyearInsert" onclick = "insureyearInsert()">保障期限录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "insureyearUpdate" onclick = "insureyearUpdate()">保障期限修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "insureyearDelete" onclick = "insureyearDelete()">保障期限删除</a>
</div>
</body>
</html>
