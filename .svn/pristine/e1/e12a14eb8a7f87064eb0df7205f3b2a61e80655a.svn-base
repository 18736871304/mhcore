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
	initDataGrid($('#riskdefinelist'));
	initDataGrid($('#riskdefinecoefficientlist'));

	inputList = [
		 			$('#coefficient'),
		 			$('#startdate'),
		 			$('#enddate')
		 	];
		
	checkList = [
		 			$('#coefficient'),
		 			$('#startdate'),
		 			$('#enddate')
		 	];
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#qrisktype'),"risktype",null);
	
	disComBox($('#qismain'),"ismain",null);
	disComBox($('#qchannel'),"channel",null);
	disComBox($('#qisseal'),"isseal",null);
	disComBox($('#qjointype'),"jointype",null);
	
	$('#qisseal').combobox('setValue','01');
	$('#qismain').combobox('setValue','Y');
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	
	var tturl = "supplier/getRiskCoefficientlistList.do";

	var tParam = new Object();

	tParam.insorgancode = row.insorgancode;
	tParam.riskcode = row.riskcode;
	tParam.mainriskcode = row.mainriskcode;
	
	displayDataGrid($('#riskdefinecoefficientlist'), tParam, tturl);
	
	var tturl1 = "supplier/getPayendyear.do";
	displayCombox($('#payendyear'),tParam,tturl1,"dd_key","dd_value");

	clearCarData();
}

function selectcoefficientone()
{
	var row = $('#riskdefinecoefficientlist').datagrid('getSelected');

	$('#startdate').datebox('setValue',row.startdate);
	$('#enddate').datebox('setValue',row.enddate);
	$('#coefficient').val(row.coefficient);
	$('#payendyear').combobox('setValue', row.payendyear+row.payendyearflag);	
}

function saveSuss()
{
	clearCarData();
	$('#riskdefinecoefficientlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
	$('#payendyear').combobox('setValue', "");
}

function riskdefinequery()
{
	//var tturl = "supplier/getRiskdefineShortList.do";
	var tturl = "supplier/getRiskdefineList.do";

	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.riskname = $('#qriskname').val();
	tParam.risktype = $('#qrisktype').combobox('getValue');

	tParam.ismain = $('#qismain').combobox('getValue');
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.isseal = $('#qisseal').combobox('getValue');
	tParam.jointype = $('#qjointype').combobox('getValue');
	
	displayDataGrid($('#riskdefinelist'), tParam, tturl);

	clearCarData();
}

function addcoefficient()
{	
	var row = $('#riskdefinelist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var testNum = $("#coefficient").val();
	
	if((testNum-1>0)||(testNum-0<0))
	{
		$.messager.alert('操作提示','请输入0-1之间的数字（小数点后最多两位），包含0，1！','error');
		return; 
	}
	
	if(testNum!="0"&&testNum!="1")
	{
		var reg = /^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^([^0][0-9]+|0)$/;;
		
		if (!reg.test(testNum)) 
		{
			$.messager.alert('操作提示','请输入0-1之间的数字（小数点后最多两位），包含0，1！','error');
			return; 
		}	
	}
	
	var tparam = prepareparam(inputList);
	
	tparam.insorgancode = row.insorgancode;
	tparam.riskcode = row.riskcode;
	tparam.mainriskcode = row.mainriskcode;
	tparam.startdate = $('#startdate').datebox("getValue")
	tparam.enddate = $('#enddate').datebox("getValue")
	tparam.payendyearstr = $('#payendyear').combobox('getValue');
	tparam.payendyearvalue = $('#payendyear').combobox('getText');
	
	ajaxdeal("supplier/riskdefineCoefficientInsert.do",tparam,null,null,saveSuss);
}

function editcoefficient()
{
	var row = $('#riskdefinecoefficientlist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var testNum = $("#coefficient").val();
	
	if((testNum-1>0)||(testNum-0<0))
	{
		$.messager.alert('操作提示','请输入0-1之间的数字（小数点后最多两位），包含0，1！','error');
		return; 
	}
	
	if(testNum!="0"&&testNum!="1")
	{
		var reg = /^(([^0][0-9]+|0)\.([0-9]{1,2})$)|^([^0][0-9]+|0)$/;;
		
		if (!reg.test(testNum)) 
		{
			$.messager.alert('操作提示','请输入0-1之间的数字（小数点后最多两位），包含0，1！','error');
			return; 
		}	
	}
	
	var tparam = prepareparam(inputList);
	
	tparam.coefficientserialno = row.coefficientserialno;
	tparam.insorgancode = row.insorgancode;
	tparam.riskcode = row.riskcode;
	tparam.mainriskcode = row.mainriskcode;
	tparam.startdate = $('#startdate').datebox("getValue")
	tparam.enddate = $('#enddate').datebox("getValue")
	tparam.payendyearstr = $('#payendyear').combobox('getValue');
	tparam.payendyearvalue = $('#payendyear').combobox('getText');
	
	ajaxdeal("supplier/riskdefineCoefficientUpdate.do",tparam,null,null,saveSuss);
}

function deletecoefficient()
{
	var row = $('#riskdefinecoefficientlist').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var tparam = new Object();
	
	tparam.coefficientserialno = row.coefficientserialno;
	
	ajaxdeal("supplier/riskdefineCoefficientDelete.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
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
			
			<td class = "reprot_title" hidden>
				是否主险
			</td>
			<td class = "report_common" hidden>
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qismain" id="qismain">
				</select>
			</td>
			
			<td class = "reprot_title">
				产品属性
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qjointype" id="qjointype">
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "riskdefinequery" onclick = "riskdefinequery()">查询</a>
	<br>
	<br>
	<table id="riskdefinelist" class="easyui-datagrid" title="产品系数管理" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'groupcode',width:90">保险产品编码</th>
				<th data-options="field:'channelname',width:80">签约渠道</th>
				<th data-options="field:'risktypename',width:80">险种类型</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskname',width:320">险种名称</th>
				<th data-options="field:'jointypename',width:80">产品属性</th>
				<th data-options="field:'issealname',width:80">是否在售</th>
				<th data-options="field:'freelookperiod',width:100">犹豫期天数</th>
				<th data-options="field:'coefficient',width:300">产品系数</th>
			</tr>
		</thead>
	</table>
	<br>
	<table id="riskdefinecoefficientlist" class="easyui-datagrid" title="产品系数信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectcoefficientone" >
		<thead>
			<tr>
				<th data-options="field:'payendyearvalue',width:60">缴费年期</th>
				<th data-options="field:'startdate',width:140">起始日期</th>
				<th data-options="field:'enddate',width:140">终止日期</th>
				<th data-options="field:'coefficient',width:80">产品系数</th>
			</tr>
		</thead>
	</table>
	<br>
	
	<table class = "common">
		<tr>
			<td class = "reprot_title_4">
				缴费年期
			</td>
			<td class = "report_common_4">
				<select editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="payendyear" id="payendyear" notnull="缴费年期">
				</select>
			</td>
			
			<td class = "reprot_title_4">
				起始日期
			</td>
			<td class = "report_common_4">
				<input class="easyui-datebox" style="width: 90%" id="startdate" name="startdate" notnull="起始起期">
			</td>
			
			<td class = "reprot_title_4">
				终止日期
			</td>
			<td class = "report_common_4">
				<input class="easyui-datebox" style="width: 90%" id="enddate" name="startdate" notnull="终止起期">
			</td>
			
			<td class = "reprot_title_4">
				产品系数
			</td>
			<td class = "report_common_4">
				<input class = "txt" name="coefficient" id="coefficient" notnull = "产品系数">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "addcoefficient" onclick = "addcoefficient()">增加</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "editcoefficient" onclick = "editcoefficient()">修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "deletecoefficient" onclick = "deletecoefficient()">删除</a>
</div>
</body>
</html>