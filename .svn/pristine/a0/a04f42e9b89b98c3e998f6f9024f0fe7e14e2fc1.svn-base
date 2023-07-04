<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var balanbatchno;
window.onload = function()
{
	initDataGrid20($('#lifepolicyBalanceList'));
	initDataGrid20($('#lifebalancelist'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);

	$('#qstate').combobox('setValue','80');
	
	var tturl = "combox/disComBox.do?comboxType=checktype";
	displayCombox($('#qstate'),null,tturl,"dd_key","dd_value");
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
}

function lifebalancequery()
{
	var tturl = "lifefinance/getLifebalanceList.do";
	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.startdates = $('#startdates').datebox("getValue");
	tParam.enddatee = $('#enddatee').datebox("getValue");
	tParam.startdates = $('#startdates').datebox("getValue");
	tParam.enddatee = $('#enddatee').datebox("getValue");
	
	displayDataGrid20($('#lifebalancelist'), tParam, tturl);

}

function selectone()
{
	var row = $('#lifebalancelist').datagrid('getSelected');
	var tturl = "lifefinance/getLpblist.do";
	var tParam = new Object();

	balanbatchno = row.balanbatchno;
	tParam.balanbatchno=balanbatchno;
	displayDataGrid($('#lifepolicyBalanceList'), tParam, tturl);
}

/* function lifepolicyBalanceQuery()
{
	var checkresult = $('#qstate').combobox('getValue');
	if(checkresult == null || checkresult == ""){
		$.messager.alert('操作提示', '请选择状态！');
		return;
	}
	var startdate = $('#jsStartdate').datebox("getValue");
	if(startdate != null && startdate != ""){
		var enddate = $('#jsEnddate').datebox("getValue");
		var fromDate = new Date(startdate.replace(/-/g, "/"));
		var toDate = new Date(enddate.replace(/-/g, "/"));
		if (Date.parse(fromDate) > Date.parse(toDate)) {//时间戳对比
			$.messager.alert('操作提示','起期应早于止期！','error');  
			return ;
		} 
	}
	var tParam = new Object();
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.state = $('#qstate').combobox('getValue');
	tParam.startdate = startdate;
	tParam.enddate = $('#jsEnddate').datebox("getValue");
	var tturl = "lifefinance/getLpblist.do";
	displayDataGrid20($('#lifepolicyBalanceList'), tParam, tturl);
} */

function saveSuss()
{
	$('#lifepolicyBalanceList').datagrid('reload');
}

function policyExam(state)
{
	var row = $('#lifepolicyBalanceList').datagrid('getSelected');
	
	if(balanbatchno==null || "" ==balanbatchno)
	{
		$.messager.alert('操作提示','请选中要操作的批次号！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.balanbatchno=balanbatchno;
	/* tparam.contno = row.policyno; */
	tparam.state = state;
	$.messager.alert('操作提示','确定要操作吗？','question',function(){
		ajaxdeal("lifefinance/updateState.do",tparam,null,null,saveSuss);
	});
}
</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common" >
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title">
				结算日期起期开始
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="startdates" id="startdates">
			</td>
			<td class = "title">
				结算日期起期结束
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="startdatee" id="startdate">
			</td>
		</tr>
		<tr>
			<td class = "title">
				结算日期止期开始
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="enddates" id="enddates">
			</td>
			<td class = "title">
				结算日期止期结束
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="enddatee" id="enddatee">
			</td>
		</tr>	
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "lifebalancequery()">查询</a>
	<br>
	<br>
	<table id="lifebalancelist" class="easyui-datagrid" title="结算数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'balanbatchno',width:120">结算批次号</th>
				<th data-options="field:'insorgancode',width:120">保险公司</th>
				<th data-options="field:'startdate',width:120">结算开始日期</th>
				<th data-options="field:'enddate',width:120">结算结束日期</th>
				<th data-options="field:'state',width:120">状态</th>
				<th data-options="field:'operator',width:120">操作员</th>
				<th data-options="field:'makedate',width:120">生成日期</th>
			</tr>
		</thead>
	</table>
	<br>
	<br>
	<table id="lifepolicyBalanceList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'policyno',width:140">保单号</th>
				<th data-options="field:'balancebatchno',width:140">保单号</th>
				<th data-options="field:'insorgancode',width:100">保险公司</th>
				<th data-options="field:'riskcode',width:100">险种编码</th>
				<th data-options="field:'riskname',width:120">险种名称</th>
				<th data-options="field:'prem',width:100">保费</th>
				<th data-options="field:'fyp',width:100">FYP</th>
				<th data-options="field:'amnt',width:100">保额</th>
				<th data-options="field:'rate',width:100">保险公司结算费率</th>
				<th data-options="field:'fee',width:100">保险公司结算费用</th>
				<th data-options="field:'agentrate',width:100">业务员费率</th>
				<th data-options="field:'agentfee',width:100">业务员费用</th>
				<!-- <th data-options="field:'payintv',width:100">缴费方式</th>
				<th data-options="field:'payendyear',width:120">缴费期间</th> -->
				<th data-options="field:'caldate',width:120">结算时间</th>
				<th data-options="field:'state',width:120">核对结果</th>
				<th data-options="field:'remark',width:260">差异信息</th>
			</tr>
		</thead>
	</table>
	<br>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "policyExam3" onclick = "policyExam('30')">审批</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "policyExam4" onclick = "policyExam('40')">已开发票</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "policyExam5" onclick = "policyExam('50')">已结清</a>
</div>
</body>
</html>