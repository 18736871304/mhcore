<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

window.onload = function()
{
	initDataGrid20($('#renewList'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#qriskchannel'),"channel",null);
	
	$('#qpolicyyear').val('2');
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="q02org")
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
	}
	else if(comboxid.attr("id")=="qinsorgancode")
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

function renewquery()
{
	var tturl = "policy/getReReport.do";

	var tParam = new Object();

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
    
    tParam.agentflag = '02';
	tParam.renewflag = 'Y';
	
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
	
	tParam.repayintv = '12';
	
	tParam.policyyear = $('#qpolicyyear').val();
	
	tParam.riskchannel = $('#qriskchannel').combobox('getValue');
	
	displayDataGrid20($('#renewList'), tParam, tturl);
}

function calrenewrate(val,row,index)
{
	if((row.sumreprem-0)==0||row.sumreprem==""||row.sumreprem==null)
	{
		return '';	
	}
	else
	{
		var renewrate = Number(row.sumrepayprem)/Number(row.sumreprem)*100;
		
		return renewrate.toFixed(2)+'%';
	}
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#policycount').val("");
		$('#sumreprem').val("");
		$('#paypolicycount').val("");
		$('#sumrepayprem').val("");
		$('#renewrate').val("");
	}
	else
	{
		$('#policycount').val(data.policycount);
		$('#sumreprem').val(data.sumreprem);
		$('#paypolicycount').val(data.paypolicycount);
		$('#sumrepayprem').val(data.sumrepayprem);
		
		if($('#sumreprem').val()==""&&$('#sumrepayprem').val()=="0.00")
		{
			$('#sumrepayprem').val("");
		}
		
		if(($('#sumreprem').val()-0)==0||$('#sumreprem').val()==""||$('#sumreprem').val()==null)
		{
			$('#renewrate').val("");
		}
		else
		{
			var renewrate = Number($('#sumrepayprem').val())/Number($('#sumreprem').val())*100;
			
			$('#renewrate').val(renewrate.toFixed(2)+'%');
		}
	}
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
	
		<tr>
			<td class = "title">
				签约渠道
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qriskchannel" id="qriskchannel">
				</select>
			</td>
		</tr>
	
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
			
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
			
			<td class = "title">
				保单年度
			</td>
			<td class = "common">
				<input class = "txt" name="qpolicyyear" id="qpolicyyear">
			</td>
		<!-- </tr>
		
		<tr> -->
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
			<td class = "title">
				事业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org" data-options="multiple:true">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "renewquery()">查询</a>
	<br>
	<br>
	<table id="renewList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'renewmonth',width:90">应收月</th>
				<th data-options="field:'policycount',width:90">应收单数</th>
				<th data-options="field:'sumreprem',width:90">应收保费</th>
				<th data-options="field:'paypolicycount',width:90">实收单数</th>
				<th data-options="field:'sumrepayprem',width:90">实收保费</th>
				<th data-options="field:'renewrate',width:90,formatter:calrenewrate">续保率</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>