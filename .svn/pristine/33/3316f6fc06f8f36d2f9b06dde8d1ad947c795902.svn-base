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
	 			$('#riskcode'),
	 			$('#payintv'),
	 			$('#payendyearflag'),
	 			$('#payendyear'),
	 			$('#policyyear'),
	 			$('#insuyearflag'),
	 			$('#insuyear'),
	 			$('#getintv'),
	 			$('#getyearflag'),
	 			$('#getyear'),
	 			$('#rate'),
	 			$('#agentrate'),
	 			$('#ratestartdate'),
	 			$('#rateenddate'),
	 	];

	 checkList = [
	 			$('#riskcode'),
	 			$('#rate'),
	 			$('#agentrate'),
	 			$('#ratestartdate'),
	 			$('#rateenddate'),
	 	];

	disComBox($('#insorgancode'),"insorgancode",null);
	disComBox($('#qinsorgancode'),"insorgancode",null);
	
	disComBox($('#payintv'),"payintv",null);
	disComBox($('#payendyearflag'),"payendyearflag",null);
	disComBox($('#insuyearflag'),"insuyearflag",null);
	disComBox($('#getintv'),"getintv",null);
	disComBox($('#getyearflag'),"getyearflag",null);
	
	//disComBox($('#organcode'),"balanceorgan",null);
	//disComBox($('#qorgancode'),"balanceorgan",null);
	
	//$('#organcode').combobox('setValue','100000000');
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
	
	$('#riskcode').combobox
	({
		url:'lifefinance/getrisklist.do?insorgancode='+row.insorgancode,
		valueField:'dd_key',
		textField:'dd_value',
		formatter: function(row)
		{
			var s = '<span >' + row.dd_key + '-</span>' +
			'<span style="color:#888">' + row.dd_value + '</span>';
			return s;
		}
	});
	
	clearCarData();
}

function onerate()
{
	var row = $('#ratelist').datagrid('getSelected');

	//$('#insrogancode').val(row.insrogancode);
	//$('#riskcode').val(row.riskcode);
	
	$('#riskcode').combobox('setValue',row.riskcode);
	$('#payintv').combobox('setValue',row.payintv);
	$('#payendyearflag').combobox('setValue',row.payendyearflag);
	$('#insuyearflag').combobox('setValue',row.insuyearflag);
	$('#getintv').combobox('setValue',row.getintv);
	$('#getyearflag').combobox('setValue',row.getyearflag);
	
	//$('#payintv').val(row.payintv);
	//$('#payendyearflag').val(row.payendyearflag);
	$('#payendyear').val(row.payendyear);
	//$('#insuyearflag').val(row.insuyearflag);
	$('#insuyear').val(row.insuyear);
	//$('#getintv').val(row.getintv);
	//$('#getyearflag').val(row.getyearflag);
	$('#getyear').val(row.getyear);
	
	$('#rate').val(row.rate);
	$('#agentrate').val(row.agentrate);
	
	$('#policyyear').val(row.policyyear);
	
	$('#ratestartdate').datebox('setValue',row.ratestartdate);
	$('#rateenddate').datebox('setValue',row.rateenddate);
}

function saveSuss()
{
	clearLifeData();
	$('#ratelist').datagrid('reload');
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
	
	tParam.state = "'00','01'";

	//alert(tParam.insorgancode);
	
	displayDataGrid($('#lifeprotocollist'), tParam, tturl);

	clearLifeData();
}

function rateInsert()
{
	var row = $('#lifeprotocollist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中协议数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.protocolserialno = row.lifeprotocolserialno;
	tparam.insorgancode = row.insorgancode;
	
	//alert(tparam.insorgancode);
	
	ajaxdeal("lifefinance/rateinsert.do",tparam,null,null,saveSuss);
}

function rateUpdate()
{
	var row = $('#lifeprotocollist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中协议数据！','error');
		return;
	}
	
	var row2 = $('#ratelist').datagrid('getSelected');
	
	if(row2==null)
	{
		$.messager.alert('操作提示','请选中要修改的费率数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	var tparam = prepareparam(inputList);
	tparam.protocolserialno = row.lifeprotocolserialno;
	tparam.insorgancode = row.insorgancode;
	tparam.rateserialno = row2.rateserialno;

	ajaxdeal("lifefinance/rateupdate.do",tparam,null,null,saveSuss);
}

function rateDelete()
{
	var row = $('#ratelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.rateserialno = row.rateserialno;

	ajaxdeal("lifefinance/ratedelete.do",tparam,null,null,saveSuss);
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
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: onerate" >
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
	<table class = "common">
		<tr>
			<td class = "title">
				险种编码
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="240" name="riskcode" id="riskcode" notnull = "险种编码">
			</td>
			
		</tr>
		<tr>
			<td class = "title">
				交费频率
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="payintv" id="payintv">
			</td>
			<td class = "title">
				交费期间标志
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="payendyearflag" id="payendyearflag">
			</td>
			<td class = "title">
				交费期间
			</td>
			<td class = "common">
				<input class = "txt" name="payendyear" id="payendyear">
			</td>
			
		</tr>
		<tr>
			<td class = "title">
				保险期间标志
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="insuyearflag" id="insuyearflag">
			</td>
			<td class = "title">
				保险期间
			</td>
			<td class = "common">
				<input class = "txt" name="insuyear" id="insuyear">
			</td>
			<td class = "title">
				保单年度
			</td>
			<td class = "common">
				<input class = "txt" name="policyyear" id="policyyear">
			</td>
		</tr>
		<tr>
			<td class = "title">
				领取频率
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="getintv" id="getintv">
			</td>
			<td class = "title">
				领取年期标志
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="getyearflag" id="getyearflag">
			</td>
			<td class = "title">
				领取年龄
			</td>
			<td class = "common">
				<input class = "txt" name="getyear" id="getyear">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保险公司结算费率
			</td>
			<td class = "common">
				<input class = "txt" name="rate" id="rate"notnull = "费率">
			</td>
			
			<td class = "title">
				业务员费率
			</td>
			<td class = "common">
				<input class = "txt" name="agentrate" id="agentrate"notnull = "业务员费率">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				费率起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="ratestartdate" name="ratestartdate" notnull = "费率起期">
			</td>
			
			<td class = "title">
				费率止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="rateenddate" name="rateenddate" notnull = "费率止期">
			</td>
		</tr>
		
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "rateInsert" onclick = "rateInsert()">费率录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "rateUpdate" onclick = "rateUpdate()">费率修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "rateDelete" onclick = "rateDelete()">费率删除</a>
	
</div>
</body>
</html>