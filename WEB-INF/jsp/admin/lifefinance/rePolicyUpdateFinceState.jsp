<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#policyList'));
	
	inputList = [
		 			$('#fincestate'),
		 			$('#invoicemonth'),
		 	];
		
	checkList = [
		 			$('#fincestate')
		 	];
	
	disComBox($('#fincestate'),"fincestate",null);
	$('#qstate').combobox('setValue','40');
	$('#fincestate').combobox('setValue','01');
	
	initRenewQuery('01');
	policyDetailDlgInit();
	
	var tturl = "policy/getInvoiceMonth.do";
	displayCombox($('#invoicemonth'),null,tturl,"dd_key","dd_value");
	
	$('#invoicemonth').combobox('setValue',getCurrentMonth());
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="fincestate")
	{
		if(comboxid.combobox('getValues')=='01')
		{
			$('.fincestate01').show();
		}
		else
		{
			$('.fincestate01').hide();
			$('#invoicemonth').combobox('setValue','');
		}
	}
	else
	{
		qRenewAftercodeselect(comboxid);
	}
}

function selectone()
{
	var rows = $('#policyList').datagrid('getSelections');
	
	var policycount = 0;
	var sumprem = 0;
	var sumfyp20 = 0;
	
	for(var i=0;i<rows.length;i++)
	{	
		if(rows[i].insuyear>1&&(rows[i].insuyearflag=='Y'||rows[i].insuyearflag=='A'))
		{
			policycount++;
		}
		
		sumprem = Number(sumprem) + Number(rows[i].prem);
		sumfyp20 = Number(sumfyp20) + Number(rows[i].fyp20);
	}
	
	$('#policycount').val(policycount);
	$('#sumprem').val(sumprem.toFixed(2));
	$('#sumfyp20').val(sumfyp20.toFixed(2));
}

function policyUpdateFinceState()
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
		orderStr = orderStr + "'" + rows[i].renewserialno + "'";
		
		if(i!=rows.length-1)
		{
			orderStr = orderStr + ",";
		}
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	if($('#fincestate').combobox('getValue')=='01')
	{
		if($('#invoicemonth').combobox('getValue')==""||$('#invoicemonth').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','请输入开票月！','error');
			return;
		}
	}
	
	var tparam = prepareparam(inputList);
	
	if(tparam.fincestate!='01')
	{
		tparam.invoicemonth = null;
	}

	tparam.renewserialno = orderStr;
	
	ajaxdeal("policy/renewUpdateFinceStace.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	$('#policyList').datagrid('reload');
}

function queryPolicyInfo(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>'; 
}

function openDlg(index)
{
	var rows=$('#policyList').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	dispolicyDetailDlg(row);
}

function displaysumdata(data) 
{
	if (data == null || data == "") {
		$('#collect_sumprem').val("");
		$('#collect_policycount').val("");
		$('#collect_sumfyp20').val("");
	} else {
		$('#collect_sumprem').val(data.sumreprem);
		$('#collect_policycount').val(data.policycount);
		$('#collect_sumfyp20').val(data.sumfyp20);
	}
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<%@ include file="/WEB-INF/common/query/renew/renewFinceQuery.jsp"%>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "renewPolicyquery()">查询</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,pagination:true,onSelect: selectone,
													  onUnselect: selectone,
													  onSelectAll: selectone,
													  onUnselectAll: selectone" >
		<thead>
			<tr>
				<th field="ck" checkbox="true"></th>
				<%@ include file="/WEB-INF/common/column/renew/renewFinceList.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "dstitle" style="height:25px">
		      	操作信息
		    </td>
		</tr>
		<tr>
			<td class = "reprot_title_4">
				单数合计
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="policycount" name="policycount" readonly>
			</td>
			
			<td class = "reprot_title_4">
				保费合计
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="sumprem" name="sumprem" readonly>
			</td>
			
			<td class = "reprot_title_4">
				标保合计
			</td>
			<td class = "report_common_4">
				<input class = "txt" id="sumfyp20" name="sumfyp20" readonly>
			</td>
			<td style="width:9%"></td><td style="width:15%"></td>
		</tr>
		<tr>
			<td class = "reprot_title_4">
				结算状态
			</td>
			<td class = "report_common_4">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="fincestate" id="fincestate" notnull = "结算状态">
				</select>
			</td>
			
			<td class = "reprot_title_4 fincestate01">
				开票年月
			</td>
			<td class = "report_common_4 fincestate01">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="invoicemonth" id="invoicemonth" notnull = "结算月">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "policyUpdateFinceState" onclick = "policyUpdateFinceState()">结算</a>
	<br>
	<br>
	<table class="common">
		<tr>
			<td class = "dstitle" style="height:25px">
	      		汇总信息
	    	</td>
		</tr>
		<tr>
			<td class="reprot_title_4">
				单数合计
			</td>
			<td class="report_common_4">
				<input class="txt" id="collect_policycount" name="collect_policycount" readonly>
			</td>
			<td class="reprot_title_4">
				保费合计
			</td>
			<td class="report_common_4">
				<input class="txt" id="collect_sumprem" name="collect_sumprem" readonly>
			</td>
			<td class="reprot_title_4">
				标保合计
			</td>
			<td class="report_common_4">
				<input class="txt" id="collect_sumfyp20" name="collect_sumfyp20" readonly>
			</td>
			<td style="width:9%"></td><td style="width:15%"></td>
		</tr>
	</table>
</div>
</body>
</html>