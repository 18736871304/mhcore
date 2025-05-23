<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

window.onload = function()
{
	initDataGrid20($('#userList'));

	var tturl = "user/getUsertype.do";
	var tParam = new Object();
	tParam.typeStr = "04";
	displayCombox($('#qusertype'),tParam,tturl,"dd_key","dd_value");
	
	disComBox($('#qdegree'),"degree",null);
	disComBox($('#qinjobyears'),"injobyears",null);
	
	$('#qusertype').combobox('setValue','04');
	
	init02Org();
	userDetailDlgInit();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
	teamAfterSelect(comboxid);
}

function selectone()
{
}

function userquery()
{
	var tturl = "user/get04UserList20.do";

	var tParam = new Object();

	//tParam.userid = $('#quserid').val();
	tParam.usercode = $('#qusercode').val();
	tParam.realname = $('#qrealname').val();
	
	tParam.usertype = $('#qusertype').combobox('getValue');
	tParam.typeStr = "04";
	
	tParam.leavestartdate = $('#qleavestartdate').datebox("getValue");
	tParam.leaveenddate = $('#qleaveenddate').datebox("getValue");
	
	var injobyears_codes = $('#qinjobyears').combobox('getValues');
	var injobyears_Str = "";
	injobyears_Str = injobyears_codes.join(","); 
	// for(var i=0;i<injobyears_codes.length;i++)
    // {
	// 	if (injobyears_Str != "") 
    //     {
	// 		injobyears_Str += ",";
    //     }
		
	// 	injobyears_Str = injobyears_Str + injobyears_codes[i];
    // }
	
	tParam.injobyears = injobyears_Str;
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#userList'), tParam, tturl);

	//clearCarData();
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

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/user/userDetailDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				人员编号
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			
			<td class = "title">
				人员姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qrealname" id="qrealname">
			</td>
			
			<td class = "title">
				人员状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusertype" id="qusertype">
				</select>
			</td>
		<!-- </tr>
		
		<tr> -->
			<td class = "title">
				离职起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qleavestartdate" name="qleavestartdate">
			</td>
			
			<td class = "title">
				离职止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" placeholder="(算头不算尾)" style="width: 160%" id="qleaveenddate" name="qleaveenddate">
				
			</td>
			
			<td class = "title"  style="width: 8%;">
				在职时间（月）
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qinjobyears" id="qinjobyears" data-options="multiple:true">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/organ/organQuery.jsp"%>
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">查询</a>
	<br>
	<br>
	<table id="userList" class="easyui-datagrid" title="人员信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/common/column/user/replaceUserName.jsp"%>
				<%@ include file="/WEB-INF/common/column/organ/organList.jsp"%>
				<%@ include file="/WEB-INF/common/column/user/userList.jsp"%>
				
				<th data-options="field:'dimissiondate',width:80">离职日期</th>
				<th data-options="field:'injobyears',width:80">在职时间</th>
				<th data-options="field:'reason',width:200">离职原因</th>
			</tr>
		</thead>
	</table>
</div>
</body>
</html>