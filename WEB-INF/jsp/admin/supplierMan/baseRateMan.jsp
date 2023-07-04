<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202004">
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#riskBaseRatelist'));

	inputList = [
			$('#insorgancode'),
			$('#riskcode'),
			$('#mainriskcode'),
			$('#payendyear'),
			$('#insuyear'),
			$('#rate01'),
			$('#rate02'),
			$('#rate03'),
			$('#rate04'),
			$('#rate05'),
	];

	checkList = [
			$('#insorgancode'),
			$('#riskcode'),
			$('#rate01'),
			//$('#rate02'),
			//$('#rate03'),
			//$('#rate04'),
			//$('#rate05'),
	];

	disComBox($('#insorgancode'),"insorgancode",null);
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#qismain'),"ismain",null);
	disComBox($('#qchannel'),"channel",null);
	disComBox($('#qrisktype'),"risktype",null);
	disComBox($('#qisseal'),"isseal",null);
	
	$('#qisseal').combobox('setValue','01');
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="insorgancode")
	{
		dealInsOrgan();
	}
	else if(comboxid.attr("id")=="riskcode")
	{
		getMainRiskCode();
		getPayendyear();
		getInsureyear();
	}
}

function dealInsOrgan()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	
	var tturl1 = "policy/getMainRiskList.do";
	
	displayCombox($('#riskcode'),tParam,tturl1,"dd_key","dd_value");
}

function getMainRiskCode()
{
	var tParam = new Object();
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getMainRiskList.do";
	
	displayCombox($('#mainriskcode'),tParam,tturl1,"dd_key","dd_value");
}

function getPayendyear()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getPayendyear.do";
	
	displayCombox($('#payendyear'),tParam,tturl1,"dd_key","dd_value");
}

function getInsureyear()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getInsureyear.do";
	
	displayCombox($('#insuyear'),tParam,tturl1,"dd_key","dd_value");
}

function selectone()
{
	var row = $('#riskBaseRatelist').datagrid('getSelected');

	$('#insorgancode').combobox('setValue',row.insorgancode);
	dealInsOrgan();
	$('#riskcode').combobox('setValue',row.riskcode);
	getMainRiskCode();
	getPayendyear();
	getInsureyear();
	
	$('#mainriskcode').combobox('setValue',row.mainriskcode);
	$('#payendyear').combobox('setValue',row.payendyear);
	$('#insuyear').combobox('setValue',row.insuyear);
	
	$('#rate01').val(row.rate01);
	$('#rate02').val(row.rate02);
	$('#rate03').val(row.rate03);
	$('#rate04').val(row.rate04);
	$('#rate05').val(row.rate05);
}

function saveSuss()
{
	clearCarData();
	$('#riskBaseRatelist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function riskBaseRateUpdate()
{	
	var row = $('#riskBaseRatelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	if(!checkPercentage($('#rate01').val()))
	{
		$.messager.alert('操作提示','首年推广费比例不是百分比，请修改！','error');
		return;
	}
	
	if($('#rate02').val()!=null&&$('#rate02').val()!="")
	{
		if(!checkPercentage($('#rate02').val()))
		{
			$.messager.alert('操作提示','第二年推广费比例不是百分比，请修改！','error');
			return;
		}	
	}
	
	if($('#rate03').val()!=null&&$('#rate03').val()!="")
	{
		if(!checkPercentage($('#rate03').val()))
		{
			$.messager.alert('操作提示','第三年推广费比例不是百分比，请修改！','error');
			return;
		}	
	}
	
	if($('#rate04').val()!=null&&$('#rate04').val()!="")
	{
		if(!checkPercentage($('#rate04').val()))
		{
			$.messager.alert('操作提示','第四年推广费比例不是百分比，请修改！','error');
			return;
		}
	}
	
	if($('#rate05').val()!=null&&$('#rate05').val()!="")
	{
		if(!checkPercentage($('#rate05').val()))
		{
			$.messager.alert('操作提示','第五年推广费比例不是百分比，请修改！','error');
			return;
		}	
	}
	
	var tparam = prepareparam(inputList);
	tparam.rateid = row.rateid;

	ajaxdeal("supplier/baseRateUpdate.do",tparam,null,null,saveSuss);
}

function riskBaseRatequery()
{
	var tturl = "supplier/getBaseRateList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.riskname = $('#qriskname').val();
	tParam.ismain = $('#qismain').combobox('getValue');
	
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.risktype = $('#qrisktype').combobox('getValue');
	tParam.isseal = $('#qisseal').combobox('getValue');

	displayDataGrid($('#riskBaseRatelist'), tParam, tturl);

	clearCarData();
}

function creatBaseRate()
{
	ajaxdeal("supplier/creatBaseRate.do",null,null,null,saveSuss);
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				保险公司
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "reprot_title">
				险种名称
			</td>
			<td class = "report_common">
				<input class = "txt" name="qriskname" id="qriskname">
			</td>
			<td class = "reprot_title">
				是否主险
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qismain" id="qismain">
				</select>
			</td>

			<td class = "reprot_title">
				签约渠道
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
			<td class = "reprot_title">
				险种类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
				</select>
			</td>
			<td class = "reprot_title">
				是否在售
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qisseal" id="qisseal">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "riskBaseRatequery" onclick = "riskBaseRatequery()">查询</a>
	<br>
	<br>
	<table id="riskBaseRatelist" class="easyui-datagrid" title="信息信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskname',width:320">险种名称</th>
				<th data-options="field:'ismainname',width:70">是否主险</th>
				<th data-options="field:'mainriskname',width:320">主险名称</th>
				<th data-options="field:'channelname',width:80">签约渠道</th>
				<th data-options="field:'risktypename',width:80">险种类型</th>
				
				<th data-options="field:'insuyearvalue',width:80">保障期限</th>
				<th data-options="field:'payendyearvalue',width:80">缴费年期</th>
				
				<th data-options="field:'rate01',width:110">首年推广费比例</th>
				<th data-options="field:'rate02',width:110">第二年推广费比例</th>
				<th data-options="field:'rate03',width:110">第三年推广费比例</th>
				<th data-options="field:'rate04',width:110">第四年推广费比例</th>
				<th data-options="field:'rate05',width:110">第五年推广费比例</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr hidden>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" name="insorgancode" id="insorgancode" notnull = "保险公司">
				</select>
			</td>
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="riskcode" id="riskcode" notnull = "险种">
				</select>
			</td>
			<td class = "title">
				主险名称
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="mainriskcode" id="mainriskcode">
				</select>
			</td>
		</tr>
		<tr hidden>
			<td class = "title">
				缴费年期
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="payendyear" id="payendyear">
				</select>
			</td>
			<td class = "title">
				保障期限
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="insuyear" id="insuyear">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title_4">
				首年推广费比例
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="rate01" id="rate01"notnull = "首年推广费比例">
			</td>
			<td class = "reprot_title_4">
				第二年推广费比例
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="rate02" id="rate02"notnull = "第二年推广费比例">
			</td>
			<td class = "reprot_title_4">
				第三年推广费比例
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="rate03" id="rate03"notnull = "第三年推广费比例">
			</td>
			<td class = "reprot_title_4">
				第四年推广费比例
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="rate04" id="rate04"notnull = "第四年推广费比例">
			</td>
		</tr>
		<tr>
			<td class = "reprot_title_4">
				第五年推广费比例
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="rate05" id="rate05"notnull = "第五年推广费比例">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "riskBaseRateUpdate" onclick = "riskBaseRateUpdate()">信息修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "creatBaseRate" onclick = "creatBaseRate()">生成费率</a>
</div>
</body>
</html>
