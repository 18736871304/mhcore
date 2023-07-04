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
	initDataGrid20($('#daydatalist'));
	
	disComBox($('#qstate'),"daydatarecordstate",null);
	
	$('#qrecorddateStart').datebox('setValue', getCurrentDate());
	
	$('#qstate').combobox('setValue','02');
	
	setRowsHeight(36);
}

function setRowsHeight(height)
{
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
	$('#daydatalist').datagrid('reload');
}

function clearCarData() 
{
	//cleardata(inputList);
}

function daydataquery()
{
	if($('#qrecorddateStart').datebox("getValue")==null||$('#qrecorddateStart').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','起始日期不能为空！','info');
		return
	}
	
	var tturl = "report/getDaydataList.do";

	var tParam = new Object();
	
	tParam.dataflag = "02";
	tParam.username = $('#qusername').val();
	tParam.state = $('#qstate').combobox('getValue');
	
	tParam.recorddateStart = $('#qrecorddateStart').datebox("getValue");
	tParam.recorddateEnd = $('#qrecorddateEnd').datebox("getValue");
	
	displayDataGrid20($('#daydatalist'), tParam, tturl);
	
	setRowsHeight(36);
	initDataGrid20($('#daydatalist'));
}

function daydataExam(state)
{
	var row = $('#daydatalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.daydataserialno = row.daydataserialno;
	tparam.state = state;

	ajaxdeal("report/daydataUpdateState.do",tparam,null,null,saveSuss);
}

</script>

<style>
	table.common {
		width: 100%;
	}

	.common .reprot_title {
		width: 6%;
	}

	.combo .combo-text {
		width: 80% !important;
	}

	.report_common .txt {
		width: 95%;
	}



	tr .report_common {
		width: 10%;
	}

	.combo {
		width: 95% !important;
	}



	/* .common .txt {
		width: 55%;
	} */
	.combo-p {
		width: 13% !important;
	}

	.combo-panel {
		width: 90% !important;
		height: auto !important;
	}

	.combo-arrow {
		float: right;
	}
</style>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				数据起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width:160%" name="qrecorddateStart" id="qrecorddateStart">
			</td>
			<td class = "reprot_title">
				数据止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width:160%" name="qrecorddateEnd" id="qrecorddateEnd">
			</td>
			
			<td class = "reprot_title">
				业务员姓名
			</td>
			<td class = "report_common">
				<input class = "txt" name="qusername" id="qusername">
			</td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr hidden>
			<td class = "reprot_title">
				数据状态
			</td>
			<td class = "report_common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "daydataquery" onclick = "daydataquery()">查询</a>
	<br>
	<br>
	<table id="daydatalist" class="easyui-datagrid" title="日数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'recorddate',width:76">数据日期</th>
				
				<th data-options="field:'agentcom',width:70">所属营业部</th>
				<th data-options="field:'teamname',width:100">所属团队</th>
				<th data-options="field:'username',width:70">业务员姓名</th>
				<th data-options="field:'hotlinecount',width:76">热线新增量</th>
				<th data-options="field:'callcount',width:76">电话外拨量</th>
				<th data-options="field:'connectcount',width:76">电话接通量</th>
				<th data-options="field:'connectrate',width:76">电话接通率</th>
				
				<th data-options="field:'cluecallcount',width:76">线索拨打量</th>
				
				<th data-options="field:'callcentertime',width:76">话务时长</th>
				<th data-options="field:'nocallcentertime',width:76">非话务时长</th>
				<th data-options="field:'sumtime',width:76">总时长</th>
				
				<th data-options="field:'wxcount',width:76">微信</th>
				<th data-options="field:'firstplancount',width:76">配置方案</th>
				<th data-options="field:'secondplancount',width:76">认清市场</th>
				<th data-options="field:'claimcount',width:76">渠道服务</th>
				<th data-options="field:'tdancount',width:76">促销T单</th>
			</tr>
		</thead>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "exam" onclick = "daydataExam('01')">冲正</a>
</div>
</body>
</html>
