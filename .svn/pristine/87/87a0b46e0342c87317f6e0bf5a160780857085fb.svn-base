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
	initDataGrid20($('#lifebalancelist'));
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#insorgancode'),"insorgancode",null);
	
	inputList = [
		$('#insorgancode'),
		$('#startdate'),
		$('#enddate')
	 ];

	 checkList = [
		$('#insorgancode'),
		$('#startdate'),
		$('#enddate')
	 ];
	 
}

function aftercodeselect(comboxid)
{
}


function saveSuss()
{
	$('#lifebalancelist').datagrid('reload');
}

function clearLifeData() 
{
	cleardata(inputList);
}

function lifeBanlancequery()
{
	var tturl = "lifefinance/getLifepolicybalanceList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.organcode = $('#qorgancode').combobox('getValue');
	
	tParam.startdate = $('#jsStartDate').datebox("getValue");
	tParam.enddate = $('#jsEndDate').datebox("getValue");

	displayDataGrid($('#lifebalancelist'), tParam, tturl);

	clearLifeData();
}

function creatbatchno()
{
	if(!checknotnull(checkList))
	{
		return;
	}
	var tparam = prepareparam(inputList);
	
	ajaxdeal("lifefinance/creatbatchno.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title" style="display: none;">
				代理公司
			</td>
			<td class = "common" style="display: none;">
				<input class = "easyui-combobox" style="width:160%" name="qorgancode" id="qorgancode" value="meihua">
			</td>
			
			<td class = "title">
				结算起期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="jsStartDate" name="jsStartDate" notnull = "生效起期">
			</td>
			<td class = "title">
				结算止期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="jsEndDate" name="jsEndDate" notnull = "生效止期">
				(算头不算尾)
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "lifeBanlancequery" onclick = "lifeBanlancequery()">查询</a>
	<br>
	<br>
	<table id="lifebalancelist" class="easyui-datagrid" title="结算数据" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'policyno',width:120">保单号</th>
				<th data-options="field:'balancebatchno',width:150">批次号</th>
				<th data-options="field:'riskcode',width:120">险种编码</th>
				<th data-options="field:'riskname',width:200">险种名称</th>
				<th data-options="field:'prem',width:80">保费</th>
				<th data-options="field:'fyp',width:80">fyp</th>
				<th data-options="field:'rate',width:80">费率</th>
				<th data-options="field:'fee',width:80">手续费</th>
				<th data-options="field:'amnt',width:80">保额</th>
				<th data-options="field:'caldate',width:125">结算日期</th>
				<th data-options="field:'agentrate',width:125">业务员费率</th>
				<th data-options="field:'agentfee',width:125">业务员费用</th>
				
				<th data-options="field:'payintv',width:80">交费频率</th>
				<th data-options="field:'payendyearflag',width:80">交费期间标志</th>
				<th data-options="field:'payendyear',width:80">交费期间</th>
				<th data-options="field:'insuyearflag',width:80">保险期间标志</th>
				<th data-options="field:'insuyear',width:80">保险期间</th>
				<th data-options="field:'getintv',width:80">领取频率</th>
				<th data-options="field:'getyearflag',width:80">领取年期标志</th>
				<th data-options="field:'getyear',width:80">领取年龄</th>
			</tr>
		</thead>
	</table>
	<br>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="insorgancode" id="insorgancode" notnull = "保险公司">
				</select>
			</td>
			<td class = "title">
				结算起期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="startdate" name="startdate" notnull = "结算起期">
			</td>
			<td class = "title">
				结算止期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="enddate" name="startdate" notnull = "结算止期">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "creatbatchno" onclick = "creatbatchno()">生成结算批次</a>
</div>
</body>
</html>