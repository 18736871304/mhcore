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
	
	var tturl = "lifefinance/getratelist.do";

	var tParam = new Object();

	tParam.protocolserialno = row.lifeprotocolserialno;

	displayDataGrid($('#ratelist'), tParam, tturl);
	
	clearCarData();
}

function saveSuss()
{
	clearLifeData();
	$('#lifeprotocollist').datagrid('reload');
	$('#ratelist').datagrid('loadData',{total:0,rows:[]});
}

function clearLifeData() 
{
	cleardata(inputList);
}

function lifeprotocolquery()
{
	var tturl = "lifefinance/getLifeprotocolList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.organcode = $('#qorgancode').combobox('getValue');
	
	tParam.protocolno = $('#qprotocolno').val();
	tParam.protocolname = $('#qprotocolname').val();
	
	//tParam.state = "'00','01'";

	//alert(tParam.insorgancode);
	
	displayDataGrid($('#lifeprotocollist'), tParam, tturl);

	clearLifeData();
}

function exam(state)
{
	var row = $('#lifeprotocollist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要审核的数据！','error');
		return;
	}
	
	if(row.state != '02'&&state == '01')
	{
		$.messager.alert('操作提示','只有审核状态的协议才能反审核！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.lifeprotocolserialno = row.lifeprotocolserialno;
	tparam.state = state;

	ajaxdeal("lifefinance/protocolExam.do",tparam,null,null,saveSuss);
	
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
				<th data-options="field:'lifeprotocolserialno',width:150">流水号</th>
				<th data-options="field:'insorganname',width:120">保险公司</th>
				<th data-options="field:'organname',width:120">机构名称</th>
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
				<th data-options="field:'riskname',width:140">险种名称</th>
				<th data-options="field:'policyyear',width:70">保单年度</th>
				
				<th data-options="field:'ratestartdate',width:120">费率起期</th>
				<th data-options="field:'rateenddate',width:120">费率止期</th>
				
				<th data-options="field:'rate',width:110">保险公司结算费率</th>
				<th data-options="field:'agentrate',width:90">业务员费率</th>
				
				<th data-options="field:'payintvname',width:90">交费频率</th>
				<th data-options="field:'payendyearname',width:120">交费期间标志</th>
				<th data-options="field:'payendyear',width:90">交费期间</th>
				<th data-options="field:'insuyearname',width:120">保险期间标志</th>
				<th data-options="field:'insuyear',width:90">保险期间</th>
				
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick = "exam('02')">审核通过</a>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick = "exam('10')">审核不通过</a>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick = "exam('01')">反审核</a>
	
</div>
</body>
</html>