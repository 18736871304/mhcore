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
	initDataGrid20($('#filelist'));
	
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
	disFileList();
}

function selectonefile()
{
	
}

function signdownload(val,row,index)
{
	return '<a href="https://insure.meihualife.com/filedownload.do?fileid='+row.fileid+'">下载</a>';
}

function disFileList()
{
	var row = $('#userList').datagrid('getSelected');
	if(row==null)
	{
		return;
	}
	
	var tturl = "userMan/getFileList.do";
	
	var tparam = new Object();
	tparam.buzid = row.userid;
	
	displayDataGrid($('#filelist'), tparam, tturl);
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
	<br>
	<table id="filelist" class="easyui-datagrid" title="附件信息" style="width:560px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonefile">
		<thead>
			<tr>
				<th data-options="field:'filename',width:450">文件名称</th>
				<th data-options="field:'_signdownload',width:60,formatter:signdownload">操作</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>