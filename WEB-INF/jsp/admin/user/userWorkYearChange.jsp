<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid($('#userList'));
	
	inputList = [
	 			$('#userid'),
	 			$('#workyears')
	 	];

	 checkList = [
	 			$('#workyears')
	 	];
	
	OrganInit();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#userList').datagrid('getSelected');
	$('#userid').val(row.userid);
	$('#workyears').val(row.workyears);
}

function userquery()
{
	var tturl = "user/getUserList.do";
	var tParam = new Object();
	tParam.usercode = $('#qusercode').val();
	tParam.realname = $('#qrealname').val();
	tParam.mobilenumber = $('#qmobilenumber').val();
	tParam.organcode = $('#qorgancode').val();
	tParam.typeStr = "'02'"; 
	
	displayDataGrid($('#userList'), tParam, tturl);
	clearCarData();
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

function userworkyearchange()
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
	tparam.usertype = row.typecode;

	ajaxdeal("user/userworkyearchange.do",tparam,null,null,saveSuss);
	userquery();
}
</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/organ/OrganInfoDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				员工编号
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			<td class = "title">
				员工姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qrealname" id="qrealname">
			</td>
			<td class = "title">
				手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qmobilenumber" id="qmobilenumber">
			</td>
		</tr>
		<tr>
			<td class = "title">
				机构编码
			</td>
			<td class = "common">
				<input class = "txt" name="qorgancode" id="qorgancode"
				readonly  onclick = "disorgan($('#qorgancode'),'none');">
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">员工查询</a>
	<br>
	<br>
	<table id="userList" class="easyui-datagrid" title="员工信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				 <th hidden data-options="field:'userid',width:120">员工编码</th>
				<th data-options="field:'usercode',width:120">员工编号</th>
				<th data-options="field:'realname',width:120">员工姓名</th>
				<th data-options="field:'cardno',width:150">身份证号码</th>
				<th data-options="field:'mobilenumber',width:120">手机号码</th>
				<th data-options="field:'usertype',width:120">员工状态</th>
				<th hidden data-options="field:'typecode',width:150">状态编码</th>
				<th data-options="field:'usergradename',width:120">员工级别</th>
				
				<th data-options="field:'organname',width:130">所属机构</th>
				<th data-options="field:'workyears',width:120">司龄</th>
				<th data-options="field:'registertime',width:160">注册日期</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<input class = "txt" hidden name="userid" readonly id="userid" notnull = "员工编码">
			<input class = "txt" hidden name="usertype" readonly id="usertype" notnull = "状态编码">
			<td class = "title">
				员工司龄
			</td>
			<td class = "common">
				<input class = "txt" name="workyears" maxlength="10" id="workyears" notnull = "司龄">
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "useredit" onclick = "userworkyearchange()">司龄修改</a>
</div>
</body>
</html>