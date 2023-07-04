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
	initDataGrid20($('#daydatalist'));

	inputList = [
			$('#recorddate'),
			$('#nocallcentertime'),
			
			$('#wxcount'),
			$('#firstplancount'),
			$('#secondplancount'),
			$('#claimcount'),
			$('#tdancount'),
	];

	checkList = [
			$('#recorddate'),
			$('#nocallcentertime'),
			
			$('#wxcount'),
			$('#firstplancount'),
			$('#secondplancount'),
			$('#claimcount'),
			$('#tdancount'),
	];

	$('#recorddate').datebox('setValue',getNowFormatDate());
	//$('#hotlinecount').val('0');
	
	setRowsHeight(36);
}

function setRowsHeight(height)
{
	
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#daydatalist').datagrid('getSelected');

	$('#recorddate').datebox('setValue',row.recorddate);
	$('#nocallcentertime').val(row.nocallcentertime);
	
	$('#wxcount').val(row.wxcount);
	$('#firstplancount').val(row.firstplancount);
	$('#secondplancount').val(row.secondplancount);
	$('#claimcount').val(row.claimcount);
	$('#tdancount').val(row.tdancount);
}

function saveSuss()
{
	clearCarData();
	//$('#hotlinecount').val('0');
	$('#daydatalist').datagrid('reload');
}

function deleteSuss()
{
	$('#daydatalist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
	$('#recorddate').datebox('setValue',getNowFormatDate());
}

function daydataInsert()
{
	if($('#callcount').val()=="0")
	{
		$.messager.alert('操作提示','电话外拨量数量不能为0！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("report/daydataInsert.do",tparam,null,null,saveSuss);
}

function daydataUpdate()
{
	var row = $('#daydatalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.daydataserialno = row.daydataserialno;
	
	tparam.oldrecorddate = row.recorddate;
	
	tparam.userid = row.userid;
	tparam.organcode = row.organcode;
	tparam.state = row.state;

	ajaxdeal("report/daydataUpdate.do",tparam,null,null,saveSuss);
}

function daydataDelete()
{
	var row = $('#daydatalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.daydataserialno = row.daydataserialno;

	ajaxdeal("report/daydataDelete.do",tparam,null,null,deleteSuss);
}

function daydataquery()
{
	var tturl = "report/getDaydataList.do";

	var tParam = new Object();
	
	tParam.dataflag = "01";
	tParam.state = "01','03";

	displayDataGrid20($('#daydatalist'), tParam, tturl);

	setRowsHeight(36);
	initDataGrid20($('#daydatalist'));
	
	clearCarData();
}

function getNowFormatDate()
{
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

</script>

<style>
	table.common {
		width: 100%;
	}

	.common .reprot_title {
		width: 6%;
	}

	.combo .combo-text {
		width: 80% !important;
	}

	.report_common .txt {
		width: 95%;
	}

	tr .report_common {
		width: 10%;
	}

	.combo {
		width: 95% !important;
	}

	/* .common .txt {
		width: 55%;
	} */
	.combo-p {
		width: 13% !important;
	}

	.combo-panel {
		width: 90% !important;
		height: auto !important;
	}

	.combo-arrow {
		float: right;
	}
</style>

</head>
<body>
<div style="margin-left:0%">
	<br>
	<table id="daydatalist" class="easyui-datagrid" title="日数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'recorddate',width:76">数据日期</th>
				
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:120">所属团队</th>
				<th data-options="field:'username',width:76">业务员姓名</th>
				<th data-options="field:'hotlinecount',width:76">热线新增量</th>
				<th data-options="field:'callcount',width:76">电话外拨量</th>
				<th data-options="field:'connectcount',width:76">电话接通量</th>
				<th data-options="field:'connectrate',width:76">电话接通率</th>
				
				<th data-options="field:'cluecallcount',width:76">线索拨打量</th>
				<th data-options="field:'clueconnectcount',width:76">线索接通量</th>
				<th data-options="field:'clueconnectrate',width:76">线索接通率</th>
				
				<th data-options="field:'callcentertime',width:76">话务时长</th>
				<th data-options="field:'nocallcentertime',width:76">非话务时长</th>
				<th data-options="field:'sumtime',width:76">总时长</th>
				
				<th data-options="field:'wxcount',width:76">微信</th>
				<th data-options="field:'firstplancount',width:76">配置方案</th>
				<th data-options="field:'secondplancount',width:76">认清市场</th>
				<th data-options="field:'claimcount',width:76">渠道服务</th>
				<th data-options="field:'tdancount',width:76">促销T单</th>
				<th data-options="field:'dealcount',width:76">已成交</th>
				<th data-options="field:'statename',width:90">状态</th>
				<th data-options="field:'workyears',width:80">司龄（月）</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				数据日期
			</td>
			<td class = "reprot_common">
				<input class="easyui-datebox" style="width:90%" name="recorddate" id="recorddate" notnull = "数据日期">
			</td>
			<td class = "reprot_title">
				非话务时长
			</td>
			<td class = "reprot_common">
				<input class = "txt" name="nocallcentertime" id="nocallcentertime" notnull = "非话务系统时长">
			</td>
			<td></td><td></td>
			
			<td class = "reprot_title">
				微信
			</td>
			<td class = "reprot_common">
				<input class = "txt" name="wxcount" id="wxcount"notnull = "微信">
			</td>
			
			<td class = "reprot_title">
				配置方案
			</td>
			<td class = "reprot_common">
				<input class = "txt" name="firstplancount" id="firstplancount"notnull = "配置方案">
			</td>
			
			<td class = "reprot_title">
				认清市场
			</td>
			<td class = "reprot_common">
				<input class = "txt" name="secondplancount" id="secondplancount"notnull = "认清市场">
			</td>
			
			<td class = "reprot_title">
				渠道服务
			</td>
			<td class = "reprot_common">
				<input class = "txt" name="claimcount" id="claimcount"notnull = "渠道服务">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				T单
			</td>
			<td class = "reprot_common">
				<input class = "txt" name="tdancount" id="tdancount"notnull = "T单">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "daydataquery" onclick = "daydataquery()">查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "daydataUpdate" onclick = "daydataUpdate()">日数据录入</a>
</div>
</body>
</html>
