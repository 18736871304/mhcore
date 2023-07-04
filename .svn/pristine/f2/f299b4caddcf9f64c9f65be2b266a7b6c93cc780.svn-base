<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#activityTranslateList'));
	
	$('#qstartdate').datebox('setValue',getMonthOneFormatDate());
	
	disComBox($('#qchannel'),"source",null);
	disComBox($('#qinitSourceLevel'),"hotline_sourcelevle",null);
	
	init02Org();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function selectone()
{
}

function getQueryParam()
{
	var tParam = new Object();
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qhotlinestartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qhotlineenddate').datebox("getValue");
	
	tParam.distributeStartDate = $('#qstartdate').datebox("getValue");
	tParam.distributeEndDate = $('#qenddate').datebox("getValue");
	
	var channel = $('#qchannel').combobox('getValue');
	if (channel.length == 4) {
		tParam.channel = channel;
	} else if (channel.length > 4) {
		tParam.channeldetail = channel;
	}
	//tParam.channel = $('#qchannel').combobox('getValue');
	
	tParam.initSourceLevel = $('#qinitSourceLevel').combobox('getValue');
	
	tParam.accountid = $('#qaccountid').val();
	tParam.planid = $('#qplanid').val();
	tParam.username = $('#qusername').val();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();;
	
	tParam.teamid = getQTeamId();
	
	return tParam;
}

function pusherquery()
{
	var tturl = "activity/activityPlanTranslateReport.do";

	var tParam = getQueryParam();
	
	displayDataGrid20($('#activityTranslateList'), tParam, tturl);
	
	var sumurl = "activity/activityTranslateSum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function activitydownload()
{
	var tturl = "activity/activityPlanTranslateReportDownLoad.do";
	
	var tParam = getQueryParam();
	tParam.isdownload = '1';
	
	ajaxdeal(tturl,tParam,listdownloadreturn,null);
}

function listdownloadreturn(data)
{
	if(data.flag == "0")
	{
		if(data.message == null || data.message == "")
		{
			$.messager.alert('执行失败','没有生成下载文件','error');	
		}
		else
		{
			$.messager.alert('执行成功',"执行成功，请点击下载",'info');	
			//判断id存在的代码
			if($("#xiazai").length>0)
			{
				$("#xiazai").remove();
				$('#activitydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename="+data.message+"'>点击下载</a>");
			}
			else
			{
				$('#activitydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename="+data.message+"'>点击下载</a>");
			}
		}
	}
	else
	{
		if(data.message == null || data.message == "")
		{
			$.messager.alert('执行失败','操作失败','error');	
		}
		else
		{
			$.messager.alert('执行失败',data.message,'error');	
		}
	}
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#hotlinecount').val("");
		$('#follow01count').val("");
		$('#follow02count').val("");
		$('#follow03count').val("");
		$('#follow04count').val("");
		$('#follow05count').val("");
		$('#follow07count').val("");
	}
	else
	{
		$('#hotlinecount').val(data.hotlinecount);
		$('#follow01count').val(data.follow01count);
		$('#follow02count').val(data.follow02count);
		$('#follow03count').val(data.follow03count);
		$('#follow04count').val(data.follow04count);
		$('#follow05count').val(data.follow05count);
		$('#follow07count').val(data.follow07count);
		
		if((data.hotlinecount-0)==0||data.hotlinecount==""||data.hotlinecount==null)
		{
			$('#follow01rate').val('0');
			$('#follow02rate').val('0');
			$('#follow03rate').val('0');
			$('#follow04rate').val('0');
			$('#follow05rate').val('0');
			$('#follow07rate').val('0');
		}
		else
		{
			var followrate = 0;
			followrate = Number(data.follow01count)/Number(data.hotlinecount)*100;
			$('#follow01rate').val(followrate.toFixed(2)+'%');
			
			followrate = 0;
			followrate = Number(data.follow02count)/Number(data.hotlinecount)*100;
			$('#follow02rate').val(followrate.toFixed(2)+'%');
			
			followrate = 0;
			followrate = Number(data.follow03count)/Number(data.hotlinecount)*100;
			$('#follow03rate').val(followrate.toFixed(2)+'%');
			
			followrate = 0;
			followrate = Number(data.follow04count)/Number(data.hotlinecount)*100;
			$('#follow04rate').val(followrate.toFixed(2)+'%');
			
			followrate = 0;
			followrate = Number(data.follow05count)/Number(data.hotlinecount)*100;
			$('#follow05rate').val(followrate.toFixed(2)+'%');
			
			followrate = 0;
			followrate = Number(data.follow07count)/Number(data.hotlinecount)*100;
			$('#follow07rate').val(followrate.toFixed(2)+'%');
		}
	}
}

function clearCarData()
{
}

function getMonthOneFormatDate()
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
    var currentdate = year + seperator1 + month + seperator1 + "01";
    return currentdate;
}

function disSourceLevel(val,row,index)
{
	if(val=='A+')
	{
		return 'A理财';	
	}
	else if(val=='A')
	{
		return 'A重疾';	
	}
	else
	{
		return val;
	}
}

</script>
<style>
	table.common {
		width: 100%;
	}

	td.reprot_title {
		width: 4%;
	}

	td.report_common {
		width: 6%;
	}

	.combo {
		width: 95% !important;
	}

	.combo .combo-text {
		width: 75% !important;
	}

	input.txt {
		width: 95%;
	}

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

	.combo {
		width: 95% !important;
	}

	td.four_title {
		width: 14%;
	}
</style>
</head>
<body>
<table class = "common">
	<tr>
		<td class = "reprot_title">
			线索产生起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qhotlinestartdate" name="qhotlinestartdate">
		</td>
		
		<td class = "reprot_title">
			线索产生止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qhotlineenddate" name="qhotlineenddate">
		</td>
		
		<td class = "reprot_title">
			线索分配起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
		</td>
		<td class = "reprot_title">
			线索分配止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
		</td>
		
		<td class = "reprot_title">
			渠道类型
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qchannel" id="qchannel">
			</select>
		</td>
		
		<td class = "reprot_title">
			初始资源等级
		</td>
		<td class = "report_common">
		<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qinitSourceLevel" id="qinitSourceLevel">
			</select>
		</td>
	</tr>
	<tr>
		<td class = "reprot_title">
			账户ID
		</td>
		<td class = "report_common">
			<input class = "txt" name="qaccountid" id="qaccountid">
		</td>
	
		<td class = "reprot_title">
			广告计划ID
		</td>
		<td class = "report_common">
			<input class = "txt" name="qplanid" id="qplanid">
		</td>
		
		<td class = "reprot_title">
			业务员姓名
		</td>
		<td class = "report_common">
			<input class = "txt" name="qusername" id="qusername">
		</td>
	</tr>
	
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "pusherquery" onclick = "pusherquery()">查询</a>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "activitydownload" onclick = "activitydownload()">下载</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="activityTranslateList" class="easyui-datagrid" title="计划转化报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'accountid',width:115">账户ID</th>
				<th data-options="field:'planid',width:115">广告计划ID</th>
				<th data-options="field:'planname',width:200">广告计划名称</th>
				<th data-options="field:'initsourcelevel',width:80,formatter:disSourceLevel">初始资源等级</th>
				<th data-options="field:'hotlinecount',width:70" sortable="true">热线数量</th>
				
				<th data-options="field:'connectcount',width:70" sortable="true">接通数量</th>
				<th data-options="field:'connectcountrate',width:70" sortable="true">接通率</th>
				
				<th data-options="field:'follow01count',width:70" sortable="true">微信</th>
				<th data-options="field:'follow01rate',width:70" sortable="true">微信率</th>
				<th data-options="field:'follow02count',width:70" sortable="true">配置方案</th>
				<th data-options="field:'follow02rate',width:70" sortable="true">配置方案率</th>
				<th data-options="field:'follow03count',width:70" sortable="true">认清市场</th>
				<th data-options="field:'follow03rate',width:70" sortable="true">认清市场率</th>
				<th data-options="field:'follow04count',width:70" sortable="true">渠道服务</th>
				<th data-options="field:'follow04rate',width:70" sortable="true">渠道服务率</th>
				<th data-options="field:'follow05count',width:70" sortable="true">促销T单</th>
				<th data-options="field:'follow05rate',width:70" sortable="true">促销T单率</th>
				<th data-options="field:'follow07count',width:70" sortable="true">已成交</th>
				<th data-options="field:'follow07rate',width:70" sortable="true">已成交率</th>
				
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				热线数量合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="hotlinecount" name="hotlinecount" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				微信合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow01count" name="follow01count" readonly>
			</td>
			
			<td class = "reprot_title">
				微信率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow01rate" name="follow01rate" readonly>
			</td>
			
			<td class = "reprot_title">
				配置方案合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow02count" name="follow02count" readonly>
			</td>
			
			<td class = "reprot_title">
				配置方案率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow02rate" name="follow02rate" readonly>
			</td>
			
			<td class = "reprot_title">
				认清市场合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow03count" name="follow03count" readonly>
			</td>
			
			<td class = "reprot_title">
				认清市场率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow03rate" name="follow03rate" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				渠道服务合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow04count" name="follow04count" readonly>
			</td>
			
			<td class = "reprot_title">
				渠道服务率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow04rate" name="follow04rate" readonly>
			</td>
			
			<td class = "reprot_title">
				促销T单合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow05count" name="follow05count" readonly>
			</td>
			
			<td class = "reprot_title">
				促销T单率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow05rate" name="follow05rate" readonly>
			</td>
			
			<td class = "reprot_title">
				已成交合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow07count" name="follow07count" readonly>
			</td>
			
			<td class = "reprot_title">
				已成交率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow07rate" name="follow07rate" readonly>
			</td>
		</tr>
	</table>
	<br>
<font color="red">此报表只包含已分配线索数量，不包含未分配线索数量
</font>
</div>
</body>
</html>