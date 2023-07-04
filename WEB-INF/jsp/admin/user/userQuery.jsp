<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202004">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#userList'));
	
	inputList = [
	 	];

	 checkList = [
	 	];
	
	initUserQuery("('00','01','0001','02','0201','03','04','05')")
	userDetailDlgInit();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function selectone()
{
}

function clearCarData()
{
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
				<%@ include file="/WEB-INF/common/column/user/userList.jsp"%>
			</tr>
		</thead>
	</table>
</div>
</body>
</html>