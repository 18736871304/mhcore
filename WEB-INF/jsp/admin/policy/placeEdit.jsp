<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#policyList'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);

	disComBox($('#qstate'),"policyquery",null);
	
	$('#qstate').combobox('setValue','40');
	
	inputList = 
		[
			$('#appprovince'),
			$('#appcity'),
			$('#appcountry'),
			$('#appaddress'),
		 		
			$('#insprovince'),
			$('#inscity'),
			$('#inscountry'),
			$('#insaddress')
		];
	
	checkList = 
		[
	 		$('#appprovince'),
	 		$('#appcity'),
	 		$('#appcountry'),
	 		$('#appaddress'),
	 		
	 		$('#insprovince'),
	 		$('#inscity'),
	 		$('#inscountry'),
	 		$('#insaddress')
	 	];
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	disComBox($('#appprovince'),"province",null);
	disComBox($('#insprovince'),"province",null);
	disComBox($('#qappprovince'),"province",null);
	
	dlgUserInit();
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
	else if(comboxid.attr("id")=="appprovince")
	{
		disappcity(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="insprovince")
	{
		disinscity(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="appcity")
	{
		disappcountry(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="inscity")
	{
		disinscountry(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="qappprovince")
	{
		var tParam = new Object();
		tParam.province = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCity.do";
		
		displayCombox($('#qappcity'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="qappcity")
	{
		var tParam = new Object();
		tParam.city = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCountry.do";
		
		displayCombox($('#qappcountry'),tParam,tturl1,"dd_key","dd_value");
	}
}

function disappcity(provinceStr)
{
	var tParam = new Object();
	tParam.province = provinceStr;
	
	var tturl1 = "policy/getCity.do";
	
	displayCombox($('#appcity'),tParam,tturl1,"dd_key","dd_value");
}

function disappcountry(cityStr)
{
	var tParam = new Object();
	tParam.city = cityStr;
	
	var tturl1 = "policy/getCountry.do";
	
	displayCombox($('#appcountry'),tParam,tturl1,"dd_key","dd_value");
}

function disinscity(provinceStr)
{
	var tParam = new Object();
	tParam.province = provinceStr;
	
	var tturl1 = "policy/getCity.do";
	
	displayCombox($('#inscity'),tParam,tturl1,"dd_key","dd_value");
}

function disinscountry(cityStr)
{
	var tParam = new Object();
	tParam.city = cityStr;
	
	var tturl1 = "policy/getCountry.do";
	
	displayCombox($('#inscountry'),tParam,tturl1,"dd_key","dd_value");
}

function selectone()
{
	var row = $('#policyList').datagrid('getSelected');
	
	$('#appprovince').combobox('setValue',row.appprovince);
	
	disappcity(row.appprovince);
	$('#appcity').combobox('setValue',row.appcity);
	
	disappcountry(row.appcity);
	$('#appcountry').combobox('setValue',row.appcountry);
	
	$('#appaddress').val(row.appaddress);
	
	$('#insprovince').combobox('setValue',row.insprovince);
	
	disinscity(row.insprovince);
	$('#inscity').combobox('setValue',row.inscity);
	
	disinscountry(row.inscity);
	$('#inscountry').combobox('setValue',row.inscountry);
	
	$('#insaddress').val(row.insaddress);
}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.appname = $('#qappname').val();
	tParam.reuserid = $('#qreuserid').val();
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.state = $('#qstate').combobox('getValue');
	tParam.agentflag = '02';
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = $('#q04org').combobox('getValue');
	//tParam.querytype = 'articletype';
	
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	tParam.appprovince = $('#qappprovince').combobox('getValue');
	tParam.appcity = $('#qappcity').combobox('getValue');
	tParam.appcountry = $('#qappcountry').combobox('getValue');
	
	displayDataGrid20($('#policyList'), tParam, tturl);
	
	clearCarData();
}

function updateaddress()
{
	var row = $('#policyList').datagrid('getSelected');
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
	tparam.appntserialno = row.appntserialno;
	tparam.insuredserialno = row.insuredserialno;
	
	ajaxdeal("policy/addressUpdate.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	clearLifeData();
	$('#policyList').datagrid('reload');
}

function clearLifeData() 
{
	cleardata(inputList);
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
			<td class = "title">
				投保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qappname" id="qappname">
			</td>
			<td class = "title">
				业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid" readonly onclick = "disuUserDlg($('#qreuserid'));">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title">
				保单状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
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
			<td class = "title">
				事业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				投保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappprovince" id="qappprovince">
				</select>
			</td>
			<td class = "title">
				投保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappcity" id="qappcity">
				</select>
			</td>
			<td class = "title">
				投保人所在县
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappcountry" id="qappcountry">
				</select>
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">保单查询</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'accepttime',width:140">出单日期</th>
				<th data-options="field:'organname',width:90">出单分公司</th>
				<th data-options="field:'agentcom',width:120">出单事业部</th>
				<th data-options="field:'reusername',width:70">出单员</th>
				
				<th data-options="field:'contno',width:140">保单号</th>
				<th data-options="field:'statename',width:90">保单状态</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskname',width:190">险种</th>
				
				<th data-options="field:'amnt',width:90">保额</th>
				<th data-options="field:'prem',width:90">保费</th>
				<th data-options="field:'payendyear',width:70">缴费年期</th>
				<th data-options="field:'payendyearflag',width:80">缴费年期单位</th>
				
				<th data-options="field:'fyp20',width:60">标保</th>
				
				<th data-options="field:'appname',width:70">投保人姓名</th>
				<th data-options="field:'appsexname',width:70">投保人性别</th>
				<th data-options="field:'appbirthday',width:70">投保人生日</th>
				<th data-options="field:'appprovincename',width:90">投保人所在省</th>
				<th data-options="field:'appcityname',width:90">投保人所在市</th>
				<th data-options="field:'appcountryname',width:90">投保人所在县</th>
				<th data-options="field:'appaddress',width:150">投保人地址</th>
				
				<th data-options="field:'relaname',width:100">投被保人关系</th>
				
				<th data-options="field:'insname',width:70">被保人姓名</th>
				<th data-options="field:'inssexname',width:70">被保人性别</th>
				<th data-options="field:'insbirthday',width:70">被保人生日</th>
				<th data-options="field:'insprovincename',width:90">被保人所在省</th>
				<th data-options="field:'inscityname',width:90">被保人所在市</th>
				<th data-options="field:'inscountryname',width:90">被保人所在县</th>
				<th data-options="field:'insaddress',width:150">被保人地址</th>
				
				<th data-options="field:'cvalidate',width:140">保单生效日期</th>
				
				<th data-options="field:'freelookperiod',width:70">犹豫期天数</th>
				<th data-options="field:'accountdate',width:140">保单核算日期</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
	
		<tr>
			<td class = "dstitle" style="height:25px">
	        	投保人信息
	        </td>
		</tr>
	
		<tr>
			<td class = "title">
				投保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="appprovince" id="appprovince" notnull = "投保人所在省">
				</select>
			</td>
			<td class = "title">
				投保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="appcity" id="appcity" notnull = "投保人所在市">
				</select>
			</td>
			<td class = "title">
				投保人所在县
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="appcountry" id="appcountry" notnull = "投保人所在县">
				</select>
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				投保人详细地址
			</td>
			<td class = "common">
				<input class = "txt" name="appaddress" id="appaddress" notnull = "投保人详细地址">
			</td>
		</tr>
		
		<tr>
			<td class = "dstitle" style="height:25px">
	        	被保人信息
	        </td>
		</tr>
		
		<tr>
			<td class = "title">
				被保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="insprovince" id="insprovince" notnull = "被保人所在省">
				</select>
			</td>
			<td class = "title">
				被保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="inscity" id="inscity" notnull = "被保人所在市">
				</select>
			</td>
			<td class = "title">
				被保人所在县
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="inscountry" id="inscountry" notnull = "被保人所在县">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				被保人详细地址
			</td>
			<td class = "common">
				<input class = "txt" name="insaddress" id="insaddress" notnull = "被保人详细地址">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "updateaddress" onclick = "updateaddress()">修改地址</a>
</div>
</body>
</html>