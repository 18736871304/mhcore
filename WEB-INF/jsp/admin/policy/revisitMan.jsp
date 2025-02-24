<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#policyList'));
	
	inputList = [
		 			$('#revisitstate'),
		 			
		 	];
	
	checkList = [
		 			$('#revisitstate'),
		 	];
	
	policyDetailDlgInit();
	init02Org();
	
	disComBox($('#qrisktype'),"risktype",null);
	disComBox($('#qstate'),"policyquery",null);
	disComBox($('#qrevisitstate'),"revisitstate",null);
	disComBox($('#revisitstate'),"revisitstate",null);
	
	$('#qstate').combobox('setValue','40');
	$('#qrevisitstate').combobox('setValue','01');
	$('#revisitstate').combobox('setValue','02');
	$('#qrisktype').combobox('setValue','03');
	
	$('#qacceptStartDate').datebox('setValue',getLastMonthOneFormatDate());
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
	teamAfterSelect(comboxid);
}

function selectone()
{

}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	tParam.agentflag = '02';
	tParam.risktype = $('#qrisktype').combobox('getValue');
    tParam.state = $('#qstate').combobox('getValue');
    tParam.revisitstate = $('#qrevisitstate').combobox('getValue');
    
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	tParam.contno = $('#qcontno').val();
	tParam.reusername = $('#qusername').val();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	
	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";

	q04orgStr = q04org_codes.join(","); 
    // for(var i=0;i<q04org_codes.length;i++)
    // {
    //     if (q04orgStr != "") 
    //     {
    //     	q04orgStr += "','";
    //     }
    //     q04orgStr += q04org_codes[i];
    // }
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#policyList'), tParam, tturl);
}

function queryPolicyInfo(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>'; 
}

function openDlg(index)
{
	var rows=$('#policyList').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	//alert(row.agentcom);
	
	dispolicyDetailDlg(row);
}

function revisitState()
{
	var rows = $('#policyList').datagrid('getSelections');
	
	if(rows.length <= 0)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var orderStr = "";
	
	for(var i=0;i<rows.length;i++)
	{
		orderStr = orderStr +"'"+ rows[i].orderid +"'";
		
		if(i!=rows.length-1)
		{
			orderStr = orderStr + ",";
		}
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	var tparam = prepareparam(inputList);
	
	tparam.orderStr = orderStr;
	
	ajaxdeal("policy/updateReVisitState.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	$('#policyList').datagrid('reload');
	$('#revisitstate').combobox('setValue','02');
}

function getLastMonthOneFormatDate()
{
	var date = new Date();
    
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth();
    
    if(month==0)
    {
    	year = year - 1;
    	month = 12;
    }

    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }

    var currentdate = year + seperator1 + month + seperator1 + "01";
    return currentdate;
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				出单起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate" name="qacceptStartDate" notnull = "出单起期">
			</td>
			<td class = "title">
				出单止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" placeholder="" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
			</td>
			<td>(算头不算尾)</td>
			
		</tr>
		
		
		<tr>
			<td class = "title">
				出单业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qusername" id="qusername">
			</td>
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
			<td class = "title">
				险种类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
				</select>
			</td>
			
			<td class = "title">
				保单状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			
			<td class = "title">
				回访状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrevisitstate" id="qrevisitstate">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/organ/organQuery.jsp"%>
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">查询</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,pagination:true,onClickRow: selectone" >
		<%@ include file="/WEB-INF/jsp/admin/policy/include/policyRevisitList.jsp"%>
	</table>
	<br>
	<table class = "common" style="width:24.5%;">
		<tr>
			<td class = "title">
				回访状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="revisitstate" id="revisitstate" notnull = "保单状态">
				</select>
			</td>
		
		</tr>		
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "policyUpdateState" onclick = "revisitState()">回访状态修改</a>
</div>
</body>
</html>