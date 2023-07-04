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
	];

	checkList = [
	];
	
	disComBox($('#qstate'),"mobilestate",null);
	
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

}

function saveSuss()
{
	clearCarData();
	$('#usermobilelist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
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

</script>
</head>
<body>
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
</div>
</body>
</html>
