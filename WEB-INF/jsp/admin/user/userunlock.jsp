<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>
<head>    
   <title>用户解锁</title>  
   <link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

window.onload = function()
{	
	initDataGrid20($('#userlist'));
	
}

function aftercodeselect(comboxid)
{
	
}

function userlockquery()
{
	var tturl = "userMan/getUserLockList.do";

	var tParam = new Object();
	
	tParam.usercode = $('#qusercode').val();
	tParam.lockip = $('#qlockip').val();
	
	displayDataGrid20($('#userlist'), tParam, tturl);
}

function unlock()
{	
	var row = $('#userlist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	var tParam = new Object();
	tParam.lockuserid = row.userid;
	
	ajaxdeal("userMan/userUnLock.do",tParam,null,null,saveSuss);
}

function saveSuss()
{
	$('#userlist').datagrid('reload');
}

</script>

</head>
<body>
<div style="margin-left:0%">

	<table class = "common">
		<tr>
 			<td class = "title">
 				用户编码
 			</td>
 			<td class = "common">
 				<input class = "txt" name="qusercode" id="qusercode">
 			</td>
 					
 			<td class = "title">
 				IP地址
 			</td>
 			<td class = "common">
 				<input class = "txt" name="qlockip" id="qlockip">
 			</td>
			
			<td></td><td></td>
 		</tr>
 	</table>
 	<br>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userlockquery" onclick = "userlockquery()">查询</a>
 	<br>
 	<br>
 	
 	<table id="userlist" class="easyui-datagrid" title="用户信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'organ02name',width:70">所属省公司</th>
				<th data-options="field:'organ03name',width:70">所属分公司</th>
				<th data-options="field:'organname',width:70">所属营业部</th>
				<th data-options="field:'usercode',width:70">用户编码</th>
				<th data-options="field:'username',width:70">用户姓名</th>
				<th data-options="field:'islockname',width:70">锁定状态</th>
				<th data-options="field:'lockip',width:95">锁定IP</th>
				<th data-options="field:'locktime',width:130">锁定时间</th>
				<th data-options="field:'unlockusername',width:70">解锁人</th>
				<th data-options="field:'unlocktime',width:130">解锁时间</th>
			</tr>
		</thead>
	</table>
	<br>
 	<br>
 	
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "unlock" onclick = "unlock()">解锁</a>
</div>
</body>
</html>