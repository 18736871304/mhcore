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
	initDataGrid($('#usermobilelist'));

	inputList = [
			$('#brand'),
			$('#type'),
			$('#meid'),
			$('#buytime'),
			$('#buyprice'),
			$('#state'),
			$('#userid'),
			$('#wxno1'),
			$('#wxno2'),
	];

	checkList = [
			$('#brand'),
			$('#type'),
			$('#meid'),
			$('#buytime'),
			$('#buyprice'),
			$('#state'),
			//$('#wxno1'),
			//$('#wxno2'),
	];
	
	disComBox($('#qstate'),"mobilestate",null);
	disComBox($('#state'),"mobilestate",null);
	disComBox($('#wxno1'),"wxno",null);
	disComBox($('#wxno2'),"wxno",null);
	
	init02Org();
	dlgUserInit();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
	teamAfterSelect(comboxid);
}

function selectone()
{
	var row = $('#usermobilelist').datagrid('getSelected');

	$('#brand').val(row.brand);
	$('#type').val(row.type);
	$('#meid').val(row.meid);
	$('#buytime').datebox('setValue',row.buytime);
	$('#buyprice').val(row.buyprice);
	$('#state').combobox('setValue',row.state);
	$('#userid').val(row.userid);
	$('#usercode').val(row.usercode);
	$('#username').val(row.username);
	$('#wxno1').combobox('setValue',row.wxno1);
	$('#wxno2').combobox('setValue',row.wxno2);
}

function saveSuss()
{
	clearCarData();
	$('#usermobilelist').datagrid('reload');
	
	disComBox($('#wxno1'),"wxno",null);
	disComBox($('#wxno2'),"wxno",null);
}

function clearCarData() 
{
	cleardata(inputList);
	$('#usercode').val("");
	$('#username').val("");
}

function usermobilequery()
{
	var tturl = "userwx/getUserMobileList.do";

	var tParam = new Object();

	tParam.type = $('#qtype').val();
	tParam.meid = $('#qmeid').val();
	tParam.state = $('#qstate').combobox('getValue');
	
	tParam.usercode = $('#qusercode').val();
	tParam.username = $('#qusername').val();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid($('#usermobilelist'), tParam, tturl);

	clearCarData();
}

function usermobileInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	
	ajaxdeal("userwx/userMobileInsert.do",tparam,null,null,saveSuss);
}

function usermobileUpdate()
{
	var row = $('#usermobilelist').datagrid('getSelected');
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
	
	tparam.mobileserialno = row.mobileserialno;

	ajaxdeal("userwx/userMobileUpdate.do",tparam,null,null,saveSuss);
}

function usermobileDelete()
{
	var row = $('#usermobilelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.mobileserialno = row.mobileserialno;

	ajaxdeal("userwx/userMobileDelete.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				手机型号
			</td>
			<td class = "common">
				<input class = "txt" name="qtype" id="qtype">
			</td>
			<td class = "title">
				MEID识别码
			</td>
			<td class = "common">
				<input class = "txt" name="qmeid" id="qmeid">
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
				使用人编码
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qusername" id="qusername">
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/organ/organQuery.jsp"%>
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "usermobilequery" onclick = "usermobilequery()">手机查询</a>
	<br>
	<br>
	<table id="usermobilelist" class="easyui-datagrid" title="手机信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'brand',width:80">手机品名</th>
				<th data-options="field:'type',width:80">手机型号</th>
				<th data-options="field:'meid',width:110">MEID识别码</th>
				<th data-options="field:'buytime',width:80">购买时间</th>
				<th data-options="field:'buyprice',width:80">购买金额</th>
				<th data-options="field:'statename',width:80">状态</th>
				<th data-options="field:'usercode',width:90">使用人编码</th>
				<th data-options="field:'username',width:90">使用人姓名</th>
				
				<th data-options="field:'teamname',width:90">所属团队</th>
				<th data-options="field:'organname',width:90">所属营业部</th>
				<th data-options="field:'organ03name',width:90">所属分公司</th>
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				
				<th data-options="field:'wxno1',width:110">微信号1</th>
				<th data-options="field:'wxno2',width:110">微信号2</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				手机品名
			</td>
			<td class = "common">
				<input class = "txt" name="brand" id="brand"notnull = "手机品名">
			</td>
			<td class = "title">
				手机型号
			</td>
			<td class = "common">
				<input class = "txt" name="type" id="type"notnull = "手机型号">
			</td>
			<td class = "title">
				MEID识别码
			</td>
			<td class = "common">
				<input class = "txt" name="meid" id="meid"notnull = "MEID识别码">
			</td>
		</tr>
		<tr>
			<td class = "title">
				购买时间
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="buytime" name="buytime" notnull = "购买时间">
			</td>
			<td class = "title">
				购买金额
			</td>
			<td class = "common">
				<input class = "txt" name="buyprice" id="buyprice"notnull = "购买金额">
			</td>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="state" id="state" notnull = "状态">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="username" id="username" notnull = "使用人姓名" readonly onclick = "disuUserDlg($('#usercode'),$('#userid'),$('#username'));">
				<input class = "txt" name="usercode" id="usercode" notnull = "使用人姓名" hidden>
				<input class = "txt" name="userid" id="userid" notnull = "使用人姓名" hidden>
			</td>
			<td class = "title">
				微信号1
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="wxno1" id="wxno1" notnull = "微信号1">
				</select>
			</td>
			<td class = "title">
				微信号2
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="wxno2" id="wxno2" notnull = "微信号2">
				</select>
			</td>
		</tr>
		<tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "usermobileInsert" onclick = "usermobileInsert()">手机录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "usermobileUpdate" onclick = "usermobileUpdate()">手机修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "usermobileDelete" onclick = "usermobileDelete()">手机删除</a>
</div>
</body>
</html>
