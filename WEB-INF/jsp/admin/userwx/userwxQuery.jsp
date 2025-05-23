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
	initDataGrid($('#userwxlist'));

	disComBox($('#qstate'),"wxstate",null);
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
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
	else
	{
		teamAfterSelect(comboxid);
	}
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
	var tturl = "userwx/getUserwxList10.do";

	var tParam = new Object();

	tParam.wxno = $('#qwxno').val();
	tParam.mobile = $('#qmobile').val();
	tParam.state = $('#qstate').combobox('getValue');
	
	tParam.usercode = $('#qusercode').val();
	tParam.username = $('#qusername').val();
	
	tParam.organcode = $('#departmentId').val();

	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');

	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";
	q04orgStr = q04org_codes.join(","); 
    // for(var i=0;i<q04org_codes.length;i++)
    // {
    //     if (q04orgStr != "") 
    //     {
    //     	q04orgStr += "','";
    //     }
    //     q04orgStr += q04org_codes[i];
    // }
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid($('#userwxlist'), tParam, tturl);
}
</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
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
		<tr hidden="hidden">	
			<td class = "title">
				出单机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<td class = "title">
				营业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org" data-options="multiple:true">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "userwxquery()">微信号查询</a>
	<br>
	<br>
	<table id="userwxlist" class="easyui-datagrid" title="微信号信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'wxno',width:110">微信号</th>
				<th data-options="field:'statename',width:90">状态</th>
				<th data-options="field:'meid',width:110">在挂手机</th>
				<th data-options="field:'mobile',width:110">绑定手机号</th>
				
				<th data-options="field:'password',width:110">微信密码</th>
				<th data-options="field:'paypassword',width:90">支付密码</th>
				
				<th data-options="field:'usercode',width:90">使用人编码</th>
				<th data-options="field:'username',width:90" sortable="true">使用人姓名</th>
				
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:90">所属团队</th>
				
				<th data-options="field:'oldusercode',width:90">原使用人编码</th>
				<th data-options="field:'oldusername',width:90">原使用人姓名</th>
				
				<th data-options="field:'oldorgan02name',width:90">原所属省公司</th>
				<th data-options="field:'oldorganname',width:90">原所属分公司</th>
				<th data-options="field:'oldagentcom',width:90">原所属营业部</th>
				<th data-options="field:'oldteamname',width:90">原所属团队</th>
				
				<th data-options="field:'remark',width:300">备注</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
