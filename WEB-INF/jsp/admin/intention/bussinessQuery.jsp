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
	initDataGrid($('#userintentionlist'));
	
	disComBox($('#qsource'),"source",null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

function saveSuss()
{
}

function clearCarData() 
{
}

function userintentionquery()
{
	var tturl = "policy/getUserintentionList2.do";

	var tParam = new Object();

	tParam.startdate = $('#qStartDate').datebox("getValue");
	tParam.enddate = $('#qEndDate').datebox("getValue");
	
	//tParam.agentflag = '01';
	
	tParam.source = $('#qsource').combobox('getValue');
	tParam.visitname = $('#qvisitname').val();
	tParam.mobile = $('#qmobile').val();
	tParam.wx = $('#qwx').val();
	tParam.remark = $('#qremark').val();
	tParam.workerno = $('#qworkerno').val();

	displayDataGrid($('#userintentionlist'), tParam, tturl);

	clearCarData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				申请起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qStartDate" name="qStartDate" notnull = "申请起期">
			</td>
			<td class = "title">
				申请止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qEndDate" name="qEndDate" notnull = "申请止期">
			</td>
			<td class = "title">
				渠道
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qsource" id="qsource">
				</select>
			</td>
		</tr>
		<tr>
			<td class="title">
				手机号
			</td>
			<td class="common">
				<input class="txt" name="qmobile" id="qmobile">
			</td>
			<td class="title">
				姓名
			</td>
			<td class="common">
				<input class="txt" name="qvisitname" id="qvisitname">
			</td>
			<td class="title">
				微信号
			</td>
			<td class="common">
				<input class="txt" name="qwx" id="qwx">
			</td>

		</tr>
		<tr>
			<td class="title">
				备注
			</td>
			<td class="common">
				<input class="txt" name="qremark" id="qremark">
			</td>
			<td class="title">
				员工号
			</td>
			<td class="common">
				<input class="txt" name="qworkerno" id="qworkerno">
			</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userintentionquery" onclick = "userintentionquery()">用户意向查询</a>
	<br>
	<br>
	<table id="userintentionlist" class="easyui-datagrid" title="用户意向信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				
				<th data-options="field:'makedate',width:120">申请日期</th>
				<th data-options="field:'sourcename',width:60">渠道</th>
				<th data-options="field:'workerno',width:60">提交工号</th>
				<th data-options="field:'visitname',width:60">客户姓名</th>
				<th data-options="field:'mobile',width:80">手机号码</th>
				<th data-options="field:'wx',width:80">微信</th>
				<th data-options="field:'ispass',width:80">是否加上微信</th>
				<th data-options="field:'isingroup',width:60">是否进群</th>
				<th data-options="field:'remark',width:360">备注</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
