<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202302">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#userList'));
	
	inputList = [
		 			$('#contracttype'),
		 			$('#changedate'),
		 			$('#contractenddate'),
		 		]
	
	checkList = [
		 			$('#contracttype'),
		 			$('#changedate'),
		 			$('#contractenddate'),
		 		]
	
	disComBox($('#contracttype'),"contracttype",null);
	initUserQuery("('02')")
	userDetailDlgInit();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function selectone()
{
}

function saveSuss()
{
	clearCarData();
	$('#userList').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function usercontractchange()
{
	var row = $('#userList').datagrid('getSelected');
	
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
	tparam.userid = row.userid;
	tparam.oldcontracttype = row.contracttype;
	tparam.oldcontracttypename = row.contracttypename;
	tparam.newcontracttype = tparam.contracttype;
	tparam.newcontracttypename = $('#contracttype').combobox('getText');
	
	ajaxdeal("userMan/userContractChange.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/user/userDetailDlg.jsp"%>
<div style="margin-left:0%">
	<%@ include file="/WEB-INF/common/query/user/userCommonQuery.jsp"%>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userListQuery" onclick = "userListQuery()">查询</a>
	<br>
	<br>
	<table id="userList" class="easyui-datagrid" title="人员信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/common/column/organ/organList.jsp"%>
				<%@ include file="/WEB-INF/common/column/user/userListNotDetail.jsp"%>
				<th data-options="field:'newcontracttypename',width:70">新合同类型</th>
				<th data-options="field:'changedate',width:100">新合同类型起期</th>
				<%@ include file="/WEB-INF/common/column/user/userDetail.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title_4">
				新合同类型 
			</td>
			<td class = "report_common_4">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="contracttype" id="contracttype" notnull = "合同类型 ">
				</select>
			</td>
			
			<td class = "reprot_title_4">
				新合同类型起期
			</td>
			<td class = "report_common_4">
				<input class="easyui-datebox" style="width: 160%" id="changedate" name="changedate" notnull = "新合同类型 起期">
			</td>
			
			<td class = "reprot_title_4">
				合同到期日
			</td>
			<td class = "report_common_4">
				<input class="easyui-datebox" style="width: 160%" id="contractenddate" name="contractenddate" notnull = "合同到期日">
			</td>

			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "usergradechange" onclick = "usercontractchange()">合同类型修改</a>
</div>
</body>
</html>