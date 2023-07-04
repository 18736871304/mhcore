<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#policyRenewallist'));

	inputList = [
			$('#renewalserialno'),
			$('#insorgancode'),
			$('#contno'),
			$('#prem'),
			$('#amnt'),
			$('#payendyear'),
			$('#policyyear'),
			$('#effecttime'),
			$('#seruserid'),
			$('#reuserid'),
			$('#state'),
			$('#makedate'),
			$('#modifydate'),
	];

	checkList = [
			$('#renewalserialno'),
			$('#insorgancode'),
			$('#contno'),
			$('#prem'),
			$('#amnt'),
			$('#payendyear'),
			$('#policyyear'),
			$('#effecttime'),
			$('#seruserid'),
			$('#reuserid'),
			$('#state'),
			$('#makedate'),
			$('#modifydate'),
	];

}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#policyRenewallist').datagrid('getSelected');

	$('#renewalserialno').val(row.renewalserialno);
	$('#insorgancode').val(row.insorgancode);
	$('#contno').val(row.contno);
	$('#prem').val(row.prem);
	$('#amnt').val(row.amnt);
	$('#payendyear').val(row.payendyear);
	$('#policyyear').val(row.policyyear);
	$('#effecttime').datebox('setValue',row.effecttime);
	$('#seruserid').val(row.seruserid);
	$('#reuserid').val(row.reuserid);
	$('#state').val(row.state);
	$('#makedate').datebox('setValue',row.makedate);
	$('#modifydate').datebox('setValue',row.modifydate);
}

function saveSuss()
{
	clearCarData();
	$('#policyRenewallist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function policyRenewalInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("PolicyRenewalCtl/PolicyRenewalCtlInsert.do",tparam,null,null,saveSuss);
}

function policyRenewalUpdate()
{
	var row = $('#policyRenewallist').datagrid('getSelected');
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
	tparam.toserialnoserialno = row.toserialnoserialno;

	ajaxdeal("PolicyRenewalCtl/PolicyRenewalCtlUpdate.do",tparam,null,null,saveSuss);
}

function policyRenewalDelete()
{
	var row = $('#policyRenewallist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.toserialnoserialno = row.toserialnoserialno;

	ajaxdeal("PolicyRenewalCtl/PolicyRenewalCtlDelete.do",tparam,null,null,saveSuss);
}

function policyRenewalquery()
{
	var tturl = "PolicyRenewalCtl/getPolicyRenewalCtlList.do";

	var tParam = new Object();

	tParam.renewalserialno = $('#qrenewalserialno').val();
	tParam.insorgancode = $('#qinsorgancode').val();
	tParam.contno = $('#qcontno').val();
	tParam.prem = $('#qprem').val();
	tParam.amnt = $('#qamnt').val();
	tParam.payendyear = $('#qpayendyear').val();
	tParam.policyyear = $('#qpolicyyear').val();
	tParam.effecttime = $('#qeffecttime').val();
	tParam.seruserid = $('#qseruserid').val();
	tParam.reuserid = $('#qreuserid').val();
	tParam.state = $('#qstate').val();
	tParam.makedate = $('#qmakedate').val();
	tParam.modifydate = $('#qmodifydate').val();

	displayDataGrid($('#policyRenewallist'), tParam, tturl);

	clearCarData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				流水号
			</td>
			<td class = "common">
				<input class = "txt" name="qrenewalserialno" id="qrenewalserialno">
			</td>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class = "txt" name="qinsorgancode" id="qinsorgancode">
			</td>
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
		</tr>
		<tr>
			<td class = "title">
				应缴保费
			</td>
			<td class = "common">
				<input class = "txt" name="qprem" id="qprem">
			</td>
			<td class = "title">
				保额
			</td>
			<td class = "common">
				<input class = "txt" name="qamnt" id="qamnt">
			</td>
			<td class = "title">
				缴费期间
			</td>
			<td class = "common">
				<input class = "txt" name="qpayendyear" id="qpayendyear">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保单年度
			</td>
			<td class = "common">
				<input class = "txt" name="qpolicyyear" id="qpolicyyear">
			</td>
			<td class = "title">
				生效时间
			</td>
			<td class = "common">
				<input class = "txt" name="qeffecttime" id="qeffecttime">
			</td>
			<td class = "title">
				保单服务业务员编码
			</td>
			<td class = "common">
				<input class = "txt" name="qseruserid" id="qseruserid">
			</td>
		</tr>
		<tr>
			<td class = "title">
				出单业务员编码
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid">
			</td>
			<td class = "title">
				核对状态
			</td>
			<td class = "common">
				<input class = "txt" name="qstate" id="qstate">
			</td>
			<td class = "title">
				创建时间
			</td>
			<td class = "common">
				<input class = "txt" name="qmakedate" id="qmakedate">
			</td>
		</tr>
		<tr>
			<td class = "title">
				修改时间
			</td>
			<td class = "common">
				<input class = "txt" name="qmodifydate" id="qmodifydate">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "policyRenewalquery" onclick = "policyRenewalquery()">续期查询</a>
	<br>
	<br>
	<table id="policyRenewallist" class="easyui-datagrid" title="续期信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'insorgancode',width:120">保险公司</th>
				<th data-options="field:'contno',width:120">保单号</th>
				<th data-options="field:'prem',width:120">应缴保费</th>
				<th data-options="field:'amnt',width:120">保额</th>
				<th data-options="field:'payendyear',width:120">缴费期间</th>
				<th data-options="field:'policyyear',width:120">保单年度</th>
				<th data-options="field:'effecttime',width:120">生效时间</th>
				<th data-options="field:'seruserid',width:120">保单服务业务员编码</th>
				<th data-options="field:'reuserid',width:120">出单业务员编码</th>
				<th data-options="field:'state',width:120">核对状态</th>
				<th data-options="field:'makedate',width:120">创建时间</th>
				<th data-options="field:'modifydate',width:120">修改时间</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				流水号
			</td>
			<td class = "common">
				<input class = "txt" name="renewalserialno" id="renewalserialno"notnull = "流水号">
			</td>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class = "txt" name="insorgancode" id="insorgancode"notnull = "保险公司">
			</td>
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="contno" id="contno"notnull = "保单号">
			</td>
		</tr>
		<tr>
			<td class = "title">
				应缴保费
			</td>
			<td class = "common">
				<input class = "txt" name="prem" id="prem"notnull = "应缴保费">
			</td>
			<td class = "title">
				保额
			</td>
			<td class = "common">
				<input class = "txt" name="amnt" id="amnt"notnull = "保额">
			</td>
			<td class = "title">
				缴费期间
			</td>
			<td class = "common">
				<input class = "txt" name="payendyear" id="payendyear"notnull = "缴费期间">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保单年度
			</td>
			<td class = "common">
				<input class = "txt" name="policyyear" id="policyyear"notnull = "保单年度">
			</td>
			<td class = "title">
				生效时间
			</td>
			<td class = "common">
				<input class = "txt" name="effecttime" id="effecttime"notnull = "生效时间">
			</td>
			<td class = "title">
				保单服务业务员编码
			</td>
			<td class = "common">
				<input class = "txt" name="seruserid" id="seruserid"notnull = "保单服务业务员编码">
			</td>
		</tr>
		<tr>
			<td class = "title">
				出单业务员编码
			</td>
			<td class = "common">
				<input class = "txt" name="reuserid" id="reuserid"notnull = "出单业务员编码">
			</td>
			<td class = "title">
				核对状态
			</td>
			<td class = "common">
				<input class = "txt" name="state" id="state"notnull = "核对状态">
			</td>
			<td class = "title">
				创建时间
			</td>
			<td class = "common">
				<input class = "txt" name="makedate" id="makedate"notnull = "创建时间">
			</td>
		</tr>
		<tr>
			<td class = "title">
				修改时间
			</td>
			<td class = "common">
				<input class = "txt" name="modifydate" id="modifydate"notnull = "修改时间">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "policyRenewalInsert" onclick = "policyRenewalInsert()">续期录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "policyRenewalUpdate" onclick = "policyRenewalUpdate()">续期修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "policyRenewalDelete" onclick = "policyRenewalDelete()">续期删除</a>
</div>
</body>
</html>
