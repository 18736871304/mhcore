<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

window.onload = function()
{
	initDataGrid20($('#orderPolicyList'));
	
	$('#qmakestartdate').datebox('setValue',getMonthOneFormatDate());

	disComBox($('#qinsorgancode'),"insorgancode",null);
	displayCombox($('#qauthstate'),null,"/jsondata/order/authstate.json","dd_key","dd_value");
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qinsorgancode")
	{
		var tParam = new Object();
		var codes = comboxid.combobox('getValues');
        var ic = "";
		ic = codes.join(","); 
        // for(var i=0;i<codes.length;i++){
        //     if (ic != "") ic += "\',\'";
		// 	ic += codes[i];
		// }
        tParam.insorgancode = ic;
		var tturl1 = "policy/getRiskListin.do";
		
		displayCombox($('#qriskcode'),tParam,tturl1,"dd_key","dd_value");
	}
}

function selectone()
{

}

function orderquery()
{
	var tturl = "orderPolicy/getAuthPollicyList.do";

	var tParam = new Object();
	
	tParam.makestartdate = $('#qmakestartdate').datebox("getValue");
	tParam.makeenddate = $('#qmakeenddate').datebox("getValue");
	tParam.authid = $('#qauthid').val();
	tParam.authstate = $('#qauthstate').combobox('getValue');
	
	var codes = $('#qinsorgancode').combobox('getValues');
    var ic = "";

	ic = codes.join(","); 
    // for(var i=0;i<codes.length;i++){
    //     if (ic != "") ic += "\',\'";
    //     ic += codes[i];
    // }
    tParam.insorgancode = ic;
    
    var codess = $('#qriskcode').combobox('getValues');
    var icc = "";
	icc = codess.join(",");

    // for(var j=0;j<codess.length;j++){
    //     if (icc != "") icc += "\',\'";
    //     icc += codess[j];
    // }
    tParam.riskcode = icc;
	
	tParam.authname = $('#qauthname').val();
	
	displayDataGrid20($('#orderPolicyList'), tParam, tturl);

	clearCarData();
}

function saveSuss()
{
	$('#orderPolicyList').datagrid('reload');
}

function dis_authlink(val,row,index)
{
	if(row.authstate == '02')
	{
		return row.authlink;
	}
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				生成起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qmakestartdate" name="qmakestartdate">
			</td>
			
			<td class = "reprot_title">
				生成止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qmakeenddate" name="qmakeenddate">
			</td>
			
			<td class = "reprot_title">
				认证单号
			</td>
			<td class = "report_common">
				<input class = "txt" name="qauthid" id="qauthid">
			</td>
			
			<td class = "reprot_title">
				认证状态
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qauthstate" id="qauthstate">
				</select>
			</td>
			
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "reprot_title">
				保险公司
			</td>
			<td class = "report_common">
				<input class="easyui-combobox" id="qinsorgancode" style="width:90%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true">
			</td>
			
			<td class = "reprot_title">
				险种名称
			</td>
			<td class = "report_common">
				<input class="easyui-combobox" id="qriskcode" style="width:90%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true">
			</td>
		
			<td class = "reprot_title">
				客户姓名
			</td>
			<td class = "report_common">
				<input class = "txt" name="qauthname" id="qauthname">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "orderquery" onclick = "orderquery()">查询</a>
	<br>
	<br>
	<table id="orderPolicyList" class="easyui-datagrid" title="认证信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
		<tr>
			<th data-options="field:'makedate',width:125">生成时间</th>
			<th data-options="field:'modifydate',width:125">更新时间</th>
			<th data-options="field:'authBuyId',width:75">认证单号</th>
			<th data-options="field:'insorganname',width:80">保险公司</th>
			<th data-options="field:'riskname',width:160">险种名称</th>
			<th data-options="field:'auth_entity_type',width:70">客户类型</th>
			<th data-options="field:'entity_cname',width:70">客户姓名</th>
			<th data-options="field:'payFee',width:60">保费</th>
			<th data-options="field:'authstatename',width:70">认证状态</th>
			<th data-options="field:'disauthlink',width:970,formatter:dis_authlink">认证链接</th>
		</tr>
		</thead>
	</table>
	<br>
	<br>
</div>
</body>
</html>