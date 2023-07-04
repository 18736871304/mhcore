<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

window.onload = function()
{
	initDataGrid20($('#riskcategoryPrem'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	/* disComBox($('#riskcatagoryOne'),"riskcatagoryOne",null);
	disComBox($('#riskcatagoryTwo'),"riskcatagoryTwo",null); 
	disComBox($('#qstate'),"policyquery",null);
	disComBox($('#qappprovince'),"province",null);
	
	$('#qstate').combobox('setValue','40');*/
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	dlgUserInit();
}

function aftercodeselect(comboxid)
{
	
	/* if(comboxid.attr("id")=="riskcatagoryOne")
	{
		var tParam = new Object();
		tParam.riskcatagoryOne = comboxid.combobox('getValue');
		
		var tturl1 = "CIRC/getRiskCategoryTwo.do";
		console.log(tParam)
		displayCombox($('#riskcatagoryTwo'),tParam,tturl1,"dd_key","dd_value");
	}
	
	else if(comboxid.attr("id")=="riskcatagoryTwo")
	{
		console.log(111)
		var tParam = new Object();
		tParam.riskcatagoryTwo = comboxid.combobox('getValue');
		
		var tturl1 = "CIRC/getRiskCategoryThree.do";
		console.log(tParam)
		displayCombox($('#riskcatagoryThree'),tParam,tturl1,"dd_key","dd_value");
	} else*/
	
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
	}else if(comboxid.attr("id")=="q02org")
	{	
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get03Org.do";
		
		displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="q03org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get04Org.do";
		
		displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
	}else{
	}
}

function selectone()
{

}

function getriskcategoryPrem()
{
	var tturl = "CIRC/getriskcategoryPrem02.do";
	
	var tParam = new Object();
	tParam.agentflag = '02';
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	/* tParam.q04org = $('#q04org').combobox('getValue'); */
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	var codes = $('#qinsorgancode').combobox('getValues');
    var ic = "";
    for(var i=0;i<codes.length;i++){
        if (ic != "") ic += "\',\'";
        ic += codes[i];
    }
    tParam.insorgancode = ic;
  	//险种编码多选
    var codess = $('#qriskcode').combobox('getValues');
    var icc = "";
    for(var j=0;j<codess.length;j++){
        if (icc != "") icc += "\',\'";
        icc += codess[j];
    }
    tParam.mainriskcode = icc;
	displayDataGrid20($('#riskcategoryPrem'), tParam, tturl);

	/* var sumurl = "policy/getPolicySum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
	
	clearCarData(); */
}

function displaysumdata(data)
{
	$('#sumprem').val(data.sumprem);
	$('#policycount').val(data.policycount);
	$('#sumfyp').val(data.sumfyp);
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<!-- <td class = "title">
				事业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org">
				</select>
			</td> -->
		</tr>
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
			<td class = "title">
				险种编码
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
		</tr>
		<tr>
			<td class = "title">
				出单起期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate" name="qacceptStartDate" notnull = "出单起期">
			</td>
			<td class = "title">
				出单止期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
				(算头不算尾)
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "getriskcategoryPrem" onclick = "getriskcategoryPrem()">查询</a>
	<br>
	<br>
	<table id="riskcategoryPrem" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'categoryname',width:170">名称</th>
				<th data-options="field:'hindex',width:90">行次</th>
				<th data-options="field:'sumprem',width:90">累计保费</th>
				<th data-options="field:'sumcharge',width:90">累计手续费</th>
			</tr>
		</thead>
	</table>
	<br>
	<!-- <table class = "common">
		<tr>
			<td class = "title">
				保单合计：
			</td>
			<td class = "common">
				<input class = "txt" id="policycount" name="policycount" readonly>
			</td>
			<td class = "title">
				保费合计：
			</td>
			<td class = "common">
				<input class = "txt" id="sumprem" name="sumprem" readonly>
			</td>
			<td class = "title">
				FYP合计：
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyp" name="sumfyp" readonly>
			</td>
		</tr>
	</table> -->
</div>
</body>
</html>