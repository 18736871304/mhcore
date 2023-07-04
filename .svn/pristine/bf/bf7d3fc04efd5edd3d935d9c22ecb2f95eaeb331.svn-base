<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid($('#activitylist'));
	
	disComBox($('#qchannel'),"source",null);
	disComBox($('#qfollowupstep'),"followupstep",null);
	disComBox($('#followupstep'),"followupstep",null);
	
	dlgUserInit();
	
	inputList = [
		 			$('#name'),
	             	$('#followupstep'),
	             	$('#remark')
		 	];
	
	checkList = [
	             	$('#name')
		 	];
	
	$('#remark').val("");
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#activitylist').datagrid('getSelected');

	$('#remark').val(row.remark);
	$('#name').val(row.name);
	
	
	$('#followupstep').combobox('setValue',row.followupstep);
}

function activityquery()
{
	var tturl = "activity/getActivity20190824List.do";

	var tParam = new Object();
	
	//tParam.name = $('#qname').val();
	
	tParam.mobile = $('#qmobile').val();
	tParam.channel = $('#qchannel').combobox('getValue');
	
	tParam.queryflag = '01';
	
	tParam.hotlineStartDate = $('#qstartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qenddate').datebox("getValue");
	
	tParam.followupstep = $('#qfollowupstep').combobox('getValue');
	
	displayDataGrid($('#activitylist'), tParam, tturl);
}

function activityremark()
{
	var row = $('#activitylist').datagrid('getSelected');
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
	tparam.activityserialno = row.activityserialno;
	
	ajaxdeal("activity/activityremark.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	cleardata(inputList);
	$('#activitylist').datagrid('reload');
}

function dispageurl(val,row,index)
{
	return '<a href="#" onclick="openpageurl(\''+row.channel+'\',\''+row.pagetype+'\',\''+row.planid+'\')">'+row.pagename+'</a>';
}

function openpageurl(channel,pagetype,planid)
{
	if(channel=='0004'&&pagetype=='1yuango/0001')
	{
		window.open('http://insure.meihualife.com/life/activity/oneyuangodis.do',
		'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
	}
	else
	{
		window.open('http://insure.meihualife.com/life/activity/channelActivity.do?channelCode='+channel+'&pageType='+pagetype+'&planId='+planid,
		'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');	
	}
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				注册手机号
			</td>
			<td class = "common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			<td class = "title">
				渠道类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				热线起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qstartdate" name="qstartdate">
			</td>
			<td class = "title">
				热线止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qenddate" name="qenddate">
				(算头不算尾)
			</td>
			<td class = "title">
				跟进步骤
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qfollowupstep" id="qfollowupstep">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "activityquery()">注册客户查询</a>
	<br>
	<br>
	<table id="activitylist" class="easyui-datagrid" title="注册客户查询" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'makedate',width:135" sortable="true">注册时间</th>
				<th data-options="field:'name',width:90" sortable="true">注册姓名</th>
				<th data-options="field:'followupstepname',width:70" sortable="true">跟进步骤</th>
				<th data-options="field:'mobilestr',width:90">注册手机号</th>
				<th data-options="field:'sex',width:50">性别</th>
				<th data-options="field:'age',width:70">年龄</th>
				<th data-options="field:'channelname',width:60">渠道类型</th>
				<th data-options="field:'planname',width:190">计划名称</th>
				<th data-options="field:'pagename',width:190,formatter:dispageurl">页面名称</th>
				<th data-options="field:'remark',width:560">备注</th>
				<th data-options="field:'usercode',width:70">业务员编码</th>
				<th data-options="field:'username',width:70">业务员姓名</th>
				<th data-options="field:'organname',width:70">所属分公司</th>
				<th data-options="field:'agentcom',width:80">所属事业部</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				注册姓名
			</td>
			<td class = "common">
				<input class = "txt" name="name" id="name" notnull = "注册姓名">
			</td>
			<td class = "title">
				跟进步骤
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="followupstep" id="followupstep" notnull = "跟进步骤">
				</select>
			</td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "title">
				备注
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "备注" class="txt" style="width: 600px;height: 150px;" id="remark" name="remark">
				</textarea>
			</td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "activityremark" onclick = "activityremark()">保存</a>
</div>
</body>
</html>
