<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;
var doubleList;

var checkList01;

var insorgancode;

var amntType;
var minamnt;
var maxamnt;

window.onload = function()
{
	query_table.style.display="none";
	$('#selectAmnt').next(".combo").hide();
	
	policyDetailDlgInit();
	
	initDataGrid20($('#policyList'));
	
	inputList = [
	 			$('#riskcode'),
	 			$('#prem'),
	 			//$('#amnt'),
	 			//$('#payintv'),
	 			//$('#payendyearflag'),
	 			//$('#payendyear'),
	 			
	 			//$('#insuyearflag'),
	 			//$('#insuyear')
	 	];
	
	checkList = [
	 			$('#riskcode'),
	 			$('#prem'),
	 			//$('#amnt'),
	 			//$('#payintv'),
	 			//$('#payendyearflag'),
	 			//$('#payendyear'),
	 			
	 			//$('#insuyearflag'),
	 			//$('#insuyear')
	 	];
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	
	//disComBox($('#payintv'),"payintv",null);
	//disComBox($('#payendyearflag'),"payendyearflag",null);
	//disComBox($('#insuyearflag'),"insuyearflag",null);
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	policyUrlDlgInit();
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
	else if(comboxid.attr("id")=="riskcode")
	{
		dealRiskCode();
	}
	/*
	else if(comboxid.attr("id")=="payintv")
	{
		if(comboxid.combobox('getValue')=='0')
		{
			$('#payendyearflag').combobox('setValue','Y');
			$('#payendyear').val('1000');
			
			payyear.style.display="none";
		}
		else
		{
			$('#payendyearflag').combobox('setValue','');
			$('#payendyear').val('');
			
			payyear.style.display="";
		}
	}
	*/
}

function dealRiskCode()
{
	var tParam = new Object();
	tParam.insorgancode = insorgancode;
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	ajaxdeal("supplier/getRiskAmntType.do",tParam,getRiskAmntType,null);
	
	getPayIntv();
	getPayendyear();
	getInsureyear();
}

function getRiskAmntType(data)
{
	amntType = data.amnttype
	
	if(amntType=="01")
	{
		numAmnt.style.display="";
		$('#selectAmnt').next(".combo").hide();
		
		minamnt = data.minAmnt;
		maxamnt = data.maxAmnt;
	}
	else if(amntType=="02")
	{
		numAmnt.style.display="none";
		$('#selectAmnt').next(".combo").show();
		
		var tParam = new Object();
		tParam.amntid = data.amntId;
		
		var tturl1 = "supplier/getAmntList.do";
		
		displayCombox($('#selectAmnt'),tParam,tturl1,"dd_key","dd_value");
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
}

function getPayIntv()
{
	var tParam = new Object();
	tParam.insorgancode = insorgancode;
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getPayintv.do";
	
	displayCombox($('#payintv'),tParam,tturl1,"dd_key","dd_value");
}

function getPayendyear()
{
	var tParam = new Object();
	tParam.insorgancode = insorgancode;
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getPayendyear.do";
	
	displayCombox($('#payendyear'),tParam,tturl1,"dd_key","dd_value");
}

function getInsureyear()
{
	var tParam = new Object();
	tParam.insorgancode = insorgancode;
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getInsureyear.do";
	
	displayCombox($('#insuyear'),tParam,tturl1,"dd_key","dd_value");
}

function dealSelectRiskCode()
{
	var tParam = new Object();
	tParam.insorgancode = insorgancode;
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	ajaxdeal("supplier/getRiskAmntType.do",tParam,getSelectRiskAmntType,null);
	
	getPayIntv();
	getPayendyear();
	getInsureyear();
}

function getSelectRiskAmntType(data)
{	
	amntType = data.amnttype
	var row = $('#policyList').datagrid('getSelected');
	
	if(amntType=="01")
	{
		numAmnt.style.display="";
		$('#selectAmnt').next(".combo").hide();
		
		minamnt = data.minAmnt;
		maxamnt = data.maxAmnt;
		
		$('#numAmnt').val(row.amnt);
	}
	else if(amntType=="02")
	{
		numAmnt.style.display="none";
		$('#selectAmnt').next(".combo").show();
		
		var tParam = new Object();
		tParam.amntid = data.amntId;
		
		var tturl1 = "supplier/getAmntList.do";
		displayCombox($('#selectAmnt'),tParam,tturl1,"dd_key","dd_value");
		
		//alert(row.amnt);
		$('#selectAmnt').combobox('setValue',row.amnt);
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
}

function selectone()
{
	var row = $('#policyList').datagrid('getSelected');
	
	insorgancode = row.insorgancode;
	
	var tParam = new Object();
	tParam.insorgancode = row.insorgancode;
	tParam.mainriskcode = row.mainriskcode;
	var tturl1 = "policy/getSubRiskList.do";
	displayCombox($('#riskcode'),tParam,tturl1,"dd_key","dd_value");
	
	if(row.mainriskcode!=row.riskcode)
	{
		$('#riskcode').combobox('setValue',row.riskcode);
		
		dealSelectRiskCode();
		$('#prem').val(row.prem);
		
		$('#payintv').combobox('setValue',row.payintv);
		$('#payendyear').combobox('setValue',row.payendyearkey);
		$('#insuyear').combobox('setValue',row.insuyearkey);
	}
	else
	{
		$('#riskcode').combobox('setValue','');
		
		$('#numAmnt').val('');
		$('#selectAmnt').combobox('setValue','');
		$('#prem').val('');
		
		$('#payintv').combobox('setValue','');
		$('#payendyear').combobox('setValue','');
		$('#insuyear').combobox('setValue','');
	}
	
	/*
	$('#amnt').val(row.amnt);
	
	$('#payendyearflag').combobox('setValue',row.payendyearflag);
	$('#payendyear').val(row.payendyear);
	
	$('#insuyearflag').combobox('setValue',row.insuyearflag);
	$('#insuyear').val(row.insuyear);
	*/
}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.appname = $('#qappname').val();
	tParam.reuserid = $('#qreuserid').val();
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.state = "80','82";
	tParam.agentflag = '02';
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = $('#q04org').combobox('getValue');
	//tParam.querytype = 'articletype';
	
	displayDataGrid20($('#policyList'), tParam, tturl);

	clearCarData();
}

function subriskinsert()
{
	var row = $('#policyList').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	
	if(amntType=="01")
	{
		if($('#numAmnt').val()==""||$('#numAmnt').val()==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		if((tparam.amnt-minamnt)>0||(tparam.amnt-maxamnt)>0)
		{
			$.messager.alert('操作提示','保额范围，需要在'+minamnt+'~'+maxamnt+'，请重新输入！','error');
			return;
		}
		
		tparam.amnt = $('#numAmnt').val();
	}
	else if(amntType=="02")
	{
		if($('#selectAmnt').combobox('getValue')==""||$('#selectAmnt').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		tparam.amnt = $('#selectAmnt').combobox('getValue');
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
	
	if($('#payintv').combobox('getValue')==""||$('#payintv').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payintv = $('#payintv').combobox('getValue');
	
	if($('#payendyear').combobox('getValue')==""||$('#payendyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payendyear = $('#payendyear').combobox('getValue');
	
	if($('#insuyear').combobox('getValue')==""||$('#insuyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','保险期间不能为空！','error');
		return;
	}
	tparam.insuyear = $('#insuyear').combobox('getValue');
	
	tparam.riskname = $('#riskcode').combobox('getText');
	tparam.orderid = row.orderid;
	
	tparam.mainriskcode = row.riskcode;
	tparam.insorgancode = row.insorgancode;
	
	ajaxdeal("policy/subRiskInsert.do",tparam,null,null,saveSuss);
}

function subriskUpdate()
{
	var row = $('#policyList').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(row.mainriskcode == row.riskcode)
	{
		$.messager.alert('操作提示','只能进行附加险的修改！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	
	if(amntType=="01")
	{
		if($('#numAmnt').val()==""||$('#numAmnt').val()==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		if((tparam.amnt-minamnt)>0||(tparam.amnt-maxamnt)>0)
		{
			$.messager.alert('操作提示','保额范围，需要在'+minamnt+'~'+maxamnt+'，请重新输入！','error');
			return;
		}
		
		tparam.amnt = $('#numAmnt').val();
	}
	else if(amntType=="02")
	{
		if($('#selectAmnt').combobox('getValue')==""||$('#selectAmnt').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		tparam.amnt = $('#selectAmnt').combobox('getValue');
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
	
	if($('#payintv').combobox('getValue')==""||$('#payintv').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payintv = $('#payintv').combobox('getValue');
	
	if($('#payendyear').combobox('getValue')==""||$('#payendyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payendyear = $('#payendyear').combobox('getValue');
	
	if($('#insuyear').combobox('getValue')==""||$('#insuyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','保险期间不能为空！','error');
		return;
	}
	tparam.insuyear = $('#insuyear').combobox('getValue');
	
	tparam.riskname = $('#riskcode').combobox('getText');
	tparam.orderid = row.orderid;
	
	tparam.mainriskcode = row.mainriskcode;
	tparam.insorgancode = row.insorgancode;
	tparam.riskid = row.riskserialno;
	
	ajaxdeal("policy/subRiskUpdate.do",tparam,null,null,saveSuss);
}

function deleteSuss()
{
	$('#policyList').datagrid('reload');
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

function subriskdelete()
{
	var row = $('#policyList').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	//alert(row.riskcode == row.mainriskcode);
	//alert(row.riskcode);
	//alert(row.mainriskcode);
	
	if(row.riskcode == row.mainriskcode)
	{
		$.messager.alert('操作提示','此产品是主险，不能在附加险进行操作！','error');
		return;
	}
	
	var tparam = new Object();
	
	tparam.orderid = row.orderid;
	tparam.riskcode = row.riskcode;
	
	ajaxdeal("policy/subRiskDelete.do",tparam,null,null,saveSuss);
}

function policyExam(state)
{
	var row = $('#policyList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var tparam = new Object();
	
	tparam.orderid = row.orderid;
	tparam.state = state;
	
	ajaxdeal("policy/policyUpdateStace.do",tparam,null,null,saveSuss);
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

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/dilog/policyUrlDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<table class = "common" id="query_table">
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
				业务员工号
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title" style="display:none">
				保单状态
			</td>
			<td class = "common" style="display:none">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<td class = "title">
				事业部
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org">
				</select>
			</td>
		</tr>
	</table>
	<br>
	
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/jsp/admin/policy/include/policyListItem.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "dstitle" style="height:25px">
	        	附加险信息
	        </td>
		</tr>
		<tr>
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="riskcode" id="riskcode" notnull = "险种">
				</select>
			</td>
			
			<td class = "title">
				保险金额
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="selectAmnt" id="selectAmnt">
				</select>
				<input class = "txt" name="numAmnt" id="numAmnt">
			</td>
			
			<td class = "title">
				缴费方式
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="payintv" id="payintv" notnull = "缴费方式">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				缴费年期
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="payendyear" id="payendyear">
				</select>
			</td>
			
			<td class = "title">
				保障期限
			</td>
			<td class = "common">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="insuyear" id="insuyear">
				</select>
			</td>
			
			<td class = "title">
				保费
			</td>
			<td class = "common">
				<input class = "txt" name="prem" id="prem" notnull = "保费">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "policyquery" onclick = "policyquery()">保单查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "subriskinsert" onclick = "subriskinsert()">附加险录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "subriskUpdate" onclick = "subriskUpdate()">附加险修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "subriskdelete" onclick = "subriskdelete()">附加险删除</a>
	<!-- 
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "policyExam" onclick = "policyExam('81')">申请审核</a>
	 -->
</div>
</body>
</html>