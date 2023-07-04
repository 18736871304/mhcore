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
	initDataGrid20($('#userwxlist'));

	inputList = [
	 			$('#mobile'),
	 			$('#usercode')
	 	];

	 checkList = [
	 			$('#mobile'),
	 			$('#usercode')
	 	];

	disComBox($('#qstate'),"wxstate",null);
	$('#qstate').combobox('setValue','02');
	
	disComBox($('#state'),"wxstate",null);
	$('#state').combobox('setValue','01');
	
	dlgUserInit();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

function saveSuss()
{
	clearCarData();
	$('#userwxlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function userwxquery()
{
	var tturl = "userwx/getUserwxList.do";

	var tParam = new Object();

	tParam.wxno = $('#qwxno').val();
	tParam.mobile = $('#qmobile').val();
	tParam.state = $('#qstate').combobox('getValue');
	tParam.userid = $('#quserid').val();

	displayDataGrid20($('#userwxlist'), tParam, tturl);
}

function setUser()
{
	var row = $('#userwxlist').datagrid('getSelected');
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
	tparam.wxserialno = row.wxserialno;
	tparam.userid = $('#userkey').val();
	tparam.state = '01';
	
	ajaxdeal("userwx/setUser.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common" hidden = "">
		<tr>
			<td class = "title">
				微信号
			</td>
			<td class = "common">
				<input class = "txt" name="qwxno" id="qwxno">
			</td>
			<td class = "title">
				绑定手机号
			</td>
			<td class = "common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="quername" id="quername" readonly onclick = "disuUserDlg($('#qusercode'),$('#quserid'),$('#quername'));">
				<input class = "txt" type = "hidden" name="qusercode" id="qusercode">
				<input class = "txt" type = "hidden" name="quserid" id="quserid">
			</td>
		</tr>
	</table>
	<br>
	<table id="userwxlist" class="easyui-datagrid" title="微信号信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'wxno',width:110">微信号</th>
				<th data-options="field:'password',width:90">密码</th>
				<th data-options="field:'paypassword',width:90">支付密码</th>
				<th data-options="field:'mobile',width:90">绑定手机号</th>
				<th data-options="field:'statename',width:90">状态</th>
				<th data-options="field:'oldusercode',width:90">原使用人编码</th>
				<th data-options="field:'oldusername',width:90">原使用人姓名</th>
				<th data-options="field:'oldorganname',width:90">原所属事业部</th>
				<th data-options="field:'oldagentcom',width:90">原所属分公司</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="state" id="state" readonly notnull = "状态">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "title">
				新绑定手机号
			</td>
			<td class = "common">
				<input class = "txt" name="mobile" id="mobile"notnull = "绑定手机号">
			</td>
			<td class = "title">
				新使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="username" id="username" notnull = "新使用人姓名" readonly onclick = "disuUserDlg($('#usercode'),$('#userkey'),$('#username'));">
				<input type = 'hidden' id = 'userkey'>
				<input class = "txt" type = 'hidden' id = 'usercode' notnull = "新使用人姓名">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "userwxquery()">微信号查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "setUser" onclick = "setUser()">分配微信号</a>
</div>
</body>
</html>
