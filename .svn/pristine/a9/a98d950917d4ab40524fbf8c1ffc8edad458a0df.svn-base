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
	initDataGrid($('#clickCountslist'));
 
	inputList = [
			
	];
	/*
	checkList = [
			$('#clickserialno'),
			$('#source'),
			$('#riskcode'),
			$('#ip'),
			$('#createtime'),
	]; */

	var tturl = "clickCounts/getSource.do";
	displayCombox($('#qsource'),null,tturl,"dd_key","dd_value");
	
	var tturl = "clickCounts/getRiskCodeList.do";
	displayCombox($('#qriskcode'),null,tturl,"dd_value","dd_value");
	
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	/* var row = $('#clickCountslist').datagrid('getSelected');

	$('#clickserialno').val(row.clickserialno);
	$('#source').val(row.source);
	$('#riskcode').val(row.riskcode);
	$('#ip').val(row.ip);
	$('#createtime').datebox('setValue',row.createtime); */
}

function saveSuss()
{
	clearCarData();
	$('#clickCountslist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function clickCountsInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("clickCounts/clickCountsInsert.do",tparam,null,null,saveSuss);
}

function clickCountsUpdate()
{
	var row = $('#clickCountslist').datagrid('getSelected');
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
	tparam.clickserialnoserialno = row.clickserialnoserialno;

	ajaxdeal("clickCounts/clickCountsUpdate.do",tparam,null,null,saveSuss);
}

function clickCountsDelete()
{
	var row = $('#clickCountslist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.clickserialnoserialno = row.clickserialnoserialno;

	ajaxdeal("clickCounts/clickCountsDelete.do",tparam,null,null,saveSuss);
}

function clickCountsquery()
{
	var tturl = "clickCounts/getClickCountsList.do";

	var tParam = new Object();

	tParam.source = $('#qsource').combobox('getValue');
	tParam.ip = $('#qip').val();
	tParam.createtime = $('#qcreatetime').datebox("getValue");
	tParam.endtime = $('#qendtime').datebox("getValue");

	displayDataGrid($('#clickCountslist'), tParam, tturl);

	clearCarData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			
			<td class = "title">
				来源
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qsource" id="qsource">
				</select>
			</td>
			<td class = "title">
				IP值
			</td>
			<td class = "common">
				<input class = "txt" name="qip" id="qip">
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
		
			<td class = "title">
				开始时间
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qcreatetime" name="qcreatetime" notnull = "开始时间">
			</td>
			<td class = "title">
				结束时间
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qendtime" name="qendtime" notnull = "结束时间">
			</td>
			<!-- <td class = "title">
				开始时间
			</td>
			<td class = "common">
				<input class = "easyui-datebox" style="width:160%" panelHeight="auto" name="qcreatetime" id="qcreatetime">
			</td>
			<td class = "title">
				结束时间
			</td>
			<td class = "common">
				<input class = "easyui-datebox" style="width:160%" panelHeight="auto" name="qendtime" id="qendtime">
			</td> -->
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "clickCountsquery" onclick = "clickCountsquery()">客户点击记录查询</a>
	<br>
	<br>
	<table id="clickCountslist" class="easyui-datagrid" title="客户点击信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'source',width:120">来源</th>
				<th data-options="field:'ip',width:120">IP值</th>
				<th data-options="field:'createtime',width:180">生成时间</th>
			</tr>
		</thead>
	</table>
	<br>
	<!-- <table class = "common">
		<tr>
			<td class = "title">
				流水号
			</td>
			<td class = "common">
				<input class = "txt" name="clickserialno" id="clickserialno"notnull = "流水号">
			</td>
			<td class = "title">
				来源
			</td>
			<td class = "common">
				<input class = "txt" name="source" id="source"notnull = "来源">
			</td>
			<td class = "title">
				险种
			</td>
			<td class = "common">
				<input class = "txt" name="riskcode" id="riskcode"notnull = "险种">
			</td>
		</tr>
		<tr>
			<td class = "title">
				IP值
			</td>
			<td class = "common">
				<input class = "txt" name="ip" id="ip"notnull = "IP值">
			</td>
			<td class = "title">
				生成时间
			</td>
			<td class = "common">
				<input class = "txt" name="createtime" id="createtime"notnull = "生成时间">
			</td>
		</tr>
	</table> -->
	<br>
	<!-- <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "clickCountsInsert" onclick = "clickCountsInsert()">轨迹录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "clickCountsUpdate" onclick = "clickCountsUpdate()">轨迹修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "clickCountsDelete" onclick = "clickCountsDelete()">轨迹删除</a> -->
</div>
</body>
</html>
