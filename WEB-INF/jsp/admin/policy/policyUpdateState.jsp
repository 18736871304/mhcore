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
	policyDetailDlgInit();
	
	initDataGrid20($('#policyList'));
	
	inputList = [
		 			$('#state')
		 	];
		
	checkList = [
		 			$('#state')
		 	];
	
	initPolicyQuery('riskchannel');
	
	disComBox($('#state'),"updatestate",null);
	$('#state').combobox('setValue','70');
	
	init02Org();
	policyUrlDlgInit();
}

function aftercodeselect(comboxid)
{
	qPolicyAftercodeselect(comboxid);
}

function selectone()
{

}

function saveSuss()
{
	$('#policyList').datagrid('reload');
}

function policyUpdateState()
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
	
	tparam.orderid = row.orderid;
	tparam.oldstate = row.state;
	
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
	row.queryinsured = 'Y';
	dispolicyDetailDlg(row);
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/dilog/policyUrlDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<%@ include file="/WEB-INF/common/query/policy/policyModifyQuery_New.jsp"%>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">查询</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/jsp/admin/policy/include/policyUpdateListItem.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title" style="width: 6%;">
				保单状态
			</td>
			<td class = "common" style="width: 12%;">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="state" id="state" notnull = "保单状态">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>		
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "policyUpdateState" onclick = "policyUpdateState()">修改</a>
</div>
</body>
</html>