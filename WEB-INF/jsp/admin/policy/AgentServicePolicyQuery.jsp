<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

window.onload = function()
{
	policyDetailDlgInit();
	
	initDataGrid20($('#policyList'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);

	disComBox($('#qstate'),"policyquery",null);
	
	$('#qstate').combobox('setValue','40');
	
	dlgUserInit();
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qinsorgancode")
	{
		var tParam = new Object();
		var codes = comboxid.combobox('getValues');
        var ic = "";
        for(var i=0;i<codes.length;i++){
            if (ic != "") ic += "\',\'";
			ic += codes[i];
		}
        tParam.insorgancode = ic;
		var tturl1 = "policy/getRiskListin.do";
		
		displayCombox($('#qriskcode'),tParam,tturl1,"dd_key","dd_value");
	}
}

function selectone()
{

}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.cusname = $('#qcusname').val();
	tParam.cusmobile = $('#qcusmobile').val();
	
	tParam.reusername = $('#qusername').val();
	
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	
	//险种编码多选
    var codess = $('#qriskcode').combobox('getValues');
    var icc = "";
    for(var j=0;j<codess.length;j++){
        if (icc != "") icc += "\',\'";
        icc += codess[j];
    }
    tParam.mainriskcode = icc;
	
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	tParam.state = $('#qstate').combobox('getValue');
	tParam.agentflag = '03';
	//tParam.querytype = 'articletype';
	
	displayDataGrid20($('#policyList'), tParam, tturl);
	
	var sumurl = "policy/getPolicySum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
	
	clearCarData();
}

function displaysumdata(data)
{
	$('#sumprem').val(data.sumprem);
	$('#policycount').val(data.policycount);
	$('#sumfyp').val(data.sumfyp);
	$('#sumfyp20').val(data.sumfyp20);
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
	
	dispolicyDetailDlg(row,'01');
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/agentServicePolicyDetailDlg.jsp"%>
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
				<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
				(算头不算尾)
			</td>
			
			<td class = "title">
				出单业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qusername" id="qusername">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
			
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保单状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			
			<td class = "title">
				客户姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qcusname" id="qcusname">
			</td>
			
			<td class = "title">
				客户手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qcusmobile" id="qcusmobile">
			</td>
		</tr>
		
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">保单查询</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<%@ include file="/WEB-INF/jsp/admin/policy/include/policyServiceList.jsp"%>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				单数合计
			</td>
			<td class = "common">
				<input class = "txt" id="policycount" name="policycount" readonly>
			</td>
			<td class = "title">
				保费合计
			</td>
			<td class = "common">
				<input class = "txt" id="sumprem" name="sumprem" readonly>
			</td>
			<td class = "title">
				标保合计
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyp20" name="sumfyp20" readonly>
			</td>
		</tr>
		<tr hidden="hidden">
			<td class = "title">
				10年FYP合计
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyp" name="sumfyp" readonly>
			</td>
		</tr>
	</table>
</div>
</body>
</html>