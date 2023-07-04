<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>
var inputList;
var checkList;
var doubleList;

window.onload = function () 
{
	initDataGrid20($('#carPolicyList'));
	
	inputList = [
			];

			checkList = [
			];
			
	disComBox($('#qinsorgancode'), "insorgancode", null);
	
	$('#qstartdate').datebox('setValue', getMonthOneFormatDate());
	
	carPolicyDetailDlgInit();
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

function clearInputData() 
{
	
}

function queryPolicyInfo(val, row, index) {
	return '<a href="#" onclick="openDlg(' + index + ')">查看详情</a>';
}

function openDlg(index) 
{
	var rows = $('#carPolicyList').datagrid('getRows'); //获取所有当前加载的数据行
	var row = rows[index];

	disCarPolicyDetailDlg(row);
}

function carPolicyQuery()
{
	var tturl = "carpolicy/getPolicyList.do";
	
	var tParam = new Object();
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.startdate = $('#qstartdate').combobox('getValue');
	tParam.enddate = $('#qenddate').combobox('getValue');
	
	displayDataGrid20($('#carPolicyList'), tParam, tturl);
	
	var sumurl = "carpolicy/getPolicySum.do";

	ajaxdeal(sumurl, tParam, displaysumdata, null);
}

function displaysumdata(data) 
{
	if (data == null || data == "") 
	{
		$('#sumprem').val("");
		$('#policycount').val("");
	} 
	else 
	{
		$('#sumprem').val(data.sumprem);
		$('#policycount').val(data.policycount);
	}
}
	
</script>
</head>
<%@ include file="/WEB-INF/jsp/admin/car/carPolicyDetailDlg.jsp"%>
<body>
	<div style="margin-left:0%">
		<table class="common">
			<tr>
				<td class="reprot_title">
					出单起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
				</td>
				
				<td class="reprot_title">
					出单止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
				</td>
				
				<td class="reprot_title">
					保险公司
				</td>
				<td class="report_common">
					<input class="easyui-combobox" id="qinsorgancode" name="qinsorgancode" style="width:90%"
						data-options="valueField:'id',textField:'text',multiple:true">
				</td>

				<td></td><td></td>
				<td></td><td></td>
				<td></td><td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="carPolicyQuery" onclick="carPolicyQuery()">查询</a>
		<br>
		<br>
		<table id="carPolicyList" class="easyui-datagrid" title="车险保单查询" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'signdate',width:120">出单日期</th>
					<th data-options="field:'area',width:60">承保区域</th>
					<th data-options="field:'policyno',width:155">保单号</th>
					<th data-options="field:'insorganname',width:60">保险公司</th>
					<th data-options="field:'riskkindname',width:80">险种类别</th>
					<th data-options="field:'riskname',width:130">险种名称</th>
					
					<th data-options="field:'plateno',width:70">车牌号</th>
					<th data-options="field:'startdate',width:120">保险起期</th>
					<th data-options="field:'prem',width:60">保费</th>
					<th data-options="field:'tax',width:60">车船税</th>
					
					<th data-options="field:'appntname',width:70">投保人姓名</th>
					<th data-options="field:'insurename',width:70">被保人姓名</th>
					<th data-options="field:'carownername',width:70">车主姓名</th>
					
					<th data-options="field:'firstdate',width:80">初登日期</th>
					
					<th data-options="field:'usenaturename',width:90">车辆使用性质</th>
					<th data-options="field:'buyprice',width:100">新车购置价（元）</th>
					
					<th data-options="field:'seatcount',width:60">核定座位</th>
					<th data-options="field:'energytypename',width:83">能源种类</th>
					<th data-options="field:'_operate',width:60,formatter:queryPolicyInfo">查看详情</th>
				</tr>
			</thead>
		</table>
		<br>
		
		<table class="common">
			<tr>
				<td class="reprot_title_4">
					单数合计
				</td>
				<td class="report_common_4">
					<input class = "txt" name="policycount" id="policycount">
				</td>
				
				<td class="reprot_title_4">
					保费合计
				</td>
				<td class="report_common_4">
					<input class = "txt" name="sumprem" id="sumprem">
				</td>
				
				<td></td><td></td>
				<td></td><td></td>
			</tr>
		</table>
	</div>
</body>

</html>