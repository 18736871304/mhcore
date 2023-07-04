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
	initDataGrid($('#lifeprotocollist'));
	initDataGrid($('#ratelist'));
	initDataGrid($('#policylist'));

	inputList = [
	 	];

	 checkList = [
	 	];
	 
	disComBox($('#qinsorgancode'),"insorgancode",null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{

	var row = $('#lifeprotocollist').datagrid('getSelected');
	
	var tturl = "lifefinance/getBalancerateList.do";

	var tParam = new Object();

	tParam.protocolserialno = row.lifeprotocolserialno;
	tParam.balancebatchno = row.balancebatchno;

	displayDataGrid($('#ratelist'), tParam, tturl);
	
	//计算结果的展示
	var balanceurl = "lifefinance/getLifebalanceList.do";
	
	var balanceParam = new Object();
	
	balanceParam.balancebatchno = row.balancebatchno;
	
	displayDataGrid($('#policylist'), balanceParam, balanceurl);
	
	clearCarData();
	
}

function saveSuss()
{
	$('#lifeprotocollist').datagrid('reload');
	$('#ratelist').datagrid('loadData',{total:0,rows:[]});
	$('#policylist').datagrid('loadData',{total:0,rows:[]});
}

function clearLifeData() 
{
	cleardata(inputList);
}

function lifeprotocolquery()
{
	var tturl = "lifefinance/getBalanceprotocolList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.organcode = $('#qorgancode').combobox('getValue');
	
	tParam.protocolno = $('#qprotocolno').val();
	tParam.protocolname = $('#qprotocolname').val();
	
	tParam.state = "'01','02'";

	//alert(tParam.insorgancode);
	
	displayDataGrid($('#lifeprotocollist'), tParam, tturl);

	clearLifeData();
}

function balancedelete()
{
	var row = $('#lifeprotocollist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的计算数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.balancebatchno = row.balancebatchno;
	
	ajaxdeal("lifefinance/balancedelete.do",tparam,null,null,saveSuss);
}


</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				保险公司编码
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
			</td>
			<td class = "title">
				协议编码
			</td>
			<td class = "common">
				<input class = "txt" name="qprotocolno" id="qprotocolno">
			</td>
			<td class = "title">
				协议名称
			</td>
			<td class = "common">
				<input class = "txt" name="qprotocolname" id="qprotocolname">
			</td>
		</tr>
		<tr>
			<td class = "title" style="display:none">
				机构编码
			</td>
			<td class = "common" style="display:none">
				<input class = "easyui-combobox" style="width:160%" name="qorgancode" id="qorgancode">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "lifeprotocolquery" onclick = "lifeprotocolquery()">协议查询</a>
	<br>
	<br>
	<table id="lifeprotocollist" class="easyui-datagrid" title="协议信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'insorganname',width:120">保险公司</th>
				<th data-options="field:'protocolno',width:120">协议编码</th>
				<th data-options="field:'protocolname',width:120">协议名称</th>
				<th data-options="field:'startdate',width:120">协议起期</th>
				<th data-options="field:'enddate',width:120">协议止期</th>
				<th data-options="field:'statename',width:120">协议状态</th>
			</tr>
		</thead>
	</table>
	<br>
	<br>
	<table id="ratelist" class="easyui-datagrid" title="费率信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'riskname',width:200">险种名称</th>
				<th data-options="field:'policyyear',width:120">保单年度</th>
				<th data-options="field:'rate',width:120">费率</th>
				<th data-options="field:'payintvname',width:120">交费频率</th>
				<th data-options="field:'payendyearname',width:120">交费期间标志</th>
				<th data-options="field:'payendyear',width:120">交费期间</th>
				<th data-options="field:'insuyearname',width:120">保险期间标志</th>
				<th data-options="field:'insuyear',width:120">保险期间</th>
				
				<th data-options="field:'getintvname',width:120">领取频率</th>
				<th data-options="field:'getyearname',width:120">领取年期标志</th>
				<th data-options="field:'getyear',width:120">领取年龄</th>
				
				<th data-options="field:'operator',width:120">操作员</th>
				<th data-options="field:'makedate',width:120">生成日期</th>
			</tr>
		</thead>
	</table>
	<br>
	
	<br>
	<table id="policylist" class="easyui-datagrid" title="协议保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'policyno',width:120">保单号</th>
				<th data-options="field:'riskcode',width:120">险种编码</th>
				<th data-options="field:'riskname',width:200">险种名称</th>
				<th data-options="field:'prem',width:80">保费</th>
				<th data-options="field:'rate',width:80">费率</th>
				<th data-options="field:'fee',width:80">手续费</th>
				<th data-options="field:'amnt',width:80">保额</th>
				<th data-options="field:'cvalidate',width:125">生效日期</th>
				
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "balancedelete" onclick = "balancedelete()">协议删除</a>
	
</div>
</body>
</html>