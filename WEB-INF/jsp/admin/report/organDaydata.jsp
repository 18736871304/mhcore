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
	
	setRowsHeight(36);
	
	$('#qrecorddateStart').datebox('setValue',get1BeforeFormatDate());
	$('#qrecorddateEnd').datebox('setValue',getNowDate());
	disComBox($('#qusergrade'),"usergrade",null);
	
	init02Org();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function setRowsHeight(height)
{	
	
}

function selectone()
{
}

function saveSuss()
{
	clearCarData();
	$('#daydatalist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function daydataquery()
{
	if($('#qrecorddateStart').datebox("getValue")==null||$('#qrecorddateStart').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','起始日期不能为空！','info');
		return
	}
	
	var tturl = "report/getOrganDataList.do";

	var tParam = new Object();
	
	tParam.dataflag = "02";
	tParam.state = "01,02";
	tParam.userid = $('#quserkey').val();
	tParam.usertype = '02';
	
	tParam.recorddateStart = $('#qrecorddateStart').datebox("getValue");
	tParam.recorddateEnd = $('#qrecorddateEnd').datebox("getValue");
	tParam.isNeedFyp = "02";
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	tParam.teamid = getQTeamId();
	
	tParam.usergrade = $('#qusergrade').combobox('getValue');
	tParam.position = '001';
	
	displayDataGrid20($('#daydatalist'), tParam, tturl);
	
	ajaxdeal("report/getAgentSumData.do",tParam,displaysumdata,null);
	
	setRowsHeight(36);
	initDataGrid20($('#daydatalist'));
}

function displaysumdata(data)
{
	$('#hotlinecount').val(data.hotlinecount);
	$('#callcount').val(data.callcount);
	$('#connectcount').val(data.connectcount);

	$('#cluecallcount').val(data.cluecallcount);
	$('#clueconnectcount').val(data.clueconnectcount);
	$('#clueconnectrate').val(data.clueconnectrate);
	
	$('#connectrate').val(data.connectrate);
	$('#callcentertime').val(data.callcentertime);
	$('#nocallcentertime').val(data.nocallcentertime);

	$('#sumtime').val(data.sumtime);
	
	$('#wxcount').val(data.wxcount);
	$('#firstplancount').val(data.firstplancount);
	$('#secondplancount').val(data.secondplancount);
	$('#claimcount').val(data.claimcount);
	$('#tdancount').val(data.tdancount);
	$('#dealcount').val(data.dealcount);
	
	$('#policycount').val(data.policycount);

	$('#sumfyp20').val(data.sumfyp20);
}

function get1BeforeFormatDate()
{
	var curDate = new Date();
	
    var date = new Date(curDate.getTime() - 24*60*60*1000);
    
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

function getNowDate()
{
	var curDate = new Date();
	
    var date = new Date(curDate.getTime() - 0);
    
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
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				数据起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width:160%" name="qrecorddateStart" id="qrecorddateStart">
			</td>
			<td class = "reprot_title">
				数据止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width:160%" name="qrecorddateEnd" id="qrecorddateEnd">
			</td>
			
			<td class = "reprot_title">
				职能级别
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusergrade" id="qusergrade">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "daydataquery" onclick = "daydataquery()">查询</a>
	<br>
	<br>
	<table id="daydatalist" class="easyui-datagrid" title="日数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'agentcom',width:70">所属营业部</th>
				<th data-options="field:'teamname',width:100">所属团队</th>
				<th data-options="field:'username',width:70">业务员姓名</th>
				<th data-options="field:'usergradename',width:80">职能级别</th>
				<th data-options="field:'hotlinecount',width:76" sortable="true">热线新增量</th>
				<th data-options="field:'callcount',width:76" sortable="true">电话外拨量</th>
				<th data-options="field:'connectcount',width:76" sortable="true">电话接通量</th>
				<th data-options="field:'connectrate',width:76" sortable="true">电话接通率</th>
				
				<th data-options="field:'cluecallcount',width:76" sortable="true">线索拨打量</th>
				
				<th data-options="field:'callcentertime',width:76" sortable="true">话务时长</th>
				<th data-options="field:'nocallcentertime',width:76" sortable="true">非话务时长</th>
				<th data-options="field:'sumtime',width:76" sortable="true">总时长</th>
				
				<th data-options="field:'wxcount',width:76" sortable="true">微信</th>
				<th data-options="field:'firstplancount',width:76" sortable="true">配置方案</th>
				<th data-options="field:'secondplancount',width:76" sortable="true">认清市场</th>
				<th data-options="field:'claimcount',width:76" sortable="true">渠道服务</th>
				<th data-options="field:'tdancount',width:76" sortable="true">促销T单</th>
				<th data-options="field:'dealcount',width:76" sortable="true">已成交</th>
				
				<th data-options="field:'policycount',width:80" sortable="true">单数合计</th>
				<th data-options="field:'sumfyp20',width:100" sortable="true">标保合计</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr hidden>
			<td class = "reprot_title">
				话务时长
			</td>
			<td class = "report_common">
				<input class = "txt" name="callcentertime" readonly id="callcentertime"notnull = "话务系统时长">
			</td>
			<td class = "reprot_title">
				非话务时长
			</td>
			<td class = "report_common">
				<input class = "txt" name="nocallcentertime" readonly id="nocallcentertime"notnull = "非话务系统时长">
			</td>
			
			<td class = "reprot_title">
				人设
			</td>
			<td class = "report_common">
				<input class = "txt" name="renshecount" readonly id="renshecount"notnull = "人设">
			</td>
			
			<td class = "reprot_title">
				线索接通量
			</td>
			<td class = "report_common">
				<input class = "txt" name="clueconnectcount" readonly id="clueconnectcount" notnull = "线索接通量">
			</td>
			
			<td class = "reprot_title">
				线索接通率
			</td>
			<td class = "report_common">
				<input class = "txt" name="clueconnectrate" readonly id="clueconnectrate" notnull = "线索接通率">
			</td>
			
		</tr>
	
		<tr>
			<td class = "reprot_title">
				热线新增量
			</td>
			<td class = "report_common">
				<input class = "txt" name="hotlinecount" readonly id="hotlinecount" notnull = "热线新增量">
			</td>
		
			<td class = "reprot_title">
				电话外拨量
			</td>
			<td class = "report_common">
				<input class = "txt" name="callcount" readonly id="callcount"notnull = "电话外拨量">
			</td>
			<td class = "reprot_title">
				电话接通量
			</td>
			<td class = "report_common">
				<input class = "txt" name="connectcount" readonly id="connectcount"notnull = "电话接通量">
			</td>
			<td class = "reprot_title">
				电话接通率
			</td>
			<td class = "report_common">
				<input class = "txt" name="connectrate" readonly id="connectrate" notnull = "电话接通率">
			</td>
			
			<td class = "reprot_title">
				线索拨打量
			</td>
			<td class = "report_common">
				<input class = "txt" name="cluecallcount" readonly id="cluecallcount" notnull = "线索拨打量">
			</td>
		</tr>
		
		<tr>
			
			<td class = "reprot_title">
				总时长
			</td>
			<td class = "report_common">
				<input class = "txt" name="sumtime" readonly id="sumtime"notnull = "总时长">
			</td>
		
			<td class = "reprot_title">
				微信
			</td>
			<td class = "report_common">
				<input class = "txt" name="wxcount" readonly id="wxcount"notnull = "微信">
			</td>
			
			<td class = "reprot_title">
				配置方案
			</td>
			<td class = "report_common">
				<input class = "txt" name="firstplancount" readonly id="firstplancount"notnull = "配置方案">
			</td>
			
			<td class = "reprot_title">
				认清市场
			</td>
			<td class = "report_common">
				<input class = "txt" name="secondplancount" readonly id="secondplancount"notnull = "认清市场">
			</td>
			
			<td class = "reprot_title">
				渠道服务
			</td>
			<td class = "report_common">
				<input class = "txt" name="claimcount" readonly id="claimcount"notnull = "渠道服务">
			</td>
			
			<td class = "reprot_title">
				促销T单
			</td>
			<td class = "report_common">
				<input class = "txt" name="tdancount" readonly id="tdancount"notnull = "促销T单">
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				已成交
			</td>
			<td class = "report_common">
				<input class = "txt" name="dealcount" readonly id="dealcount" notnull = "已成交">
			</td>
			<td class = "reprot_title">
				单数合计
			</td>
			<td class = "report_common">
				<input class = "txt" name="policycount" readonly id="policycount"notnull = "单数合计">
			</td>
			<td class = "reprot_title">
				标保合计
			</td>
			<td class = "report_common">
				<input class = "txt" name="sumfyp20" readonly id="sumfyp20"notnull = "标保合计">
			</td>
		</tr>
	</table>
</div>
</body>
</html>
