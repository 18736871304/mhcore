<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../.././../../css/inputbox/line7.css">
<script>

window.onload = function()
{
	initDataGrid20($('#activitylist'));
	
	disComBox($('#qchannel'),"source",null);
	disComBox($('#qfollowupstep'),"followupstep",null);
	
	disComBox($('#qissea'),"yesno",null);
	disComBox($('#qcustype'),"custype",null);
	
	disComBox($('#qinitSourceLevel'),"hotline_sourcelevle",null);
	disComBox($('#qSourceLevel'),"sourcelevle",null);
	
	dlgUserInit();
	
	$('#qdistributeStartDate').datebox('setValue',getMonthOneFormatDate());
	
	init02Org();
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qchannel")
	{
		var tParam = new Object();
		tParam.comboxType = 'sourcedetail_'+comboxid.combobox('getValue');
		
		var tturl = "activity/getSourceDetail.do";
		displayCombox($('#qappname'),tParam,tturl,"dd_key","dd_value");
	}
	else
	{
		organAfterSelect(comboxid);	
	}
}

function selectone()
{
}

function getQueryParam()
{
	var tParam = new Object();
	
	tParam.username = $('#qusername').val();
	
	tParam.userid = $('#quserid').val();
	tParam.name = $('#qname').val();
	
	tParam.mobile = $('#qmobile').val();
	
	var channel = $('#qchannel').combobox('getValue');
	if (channel.length == 4) {
		tParam.channel = channel;
	} else if (channel.length > 4) {
		tParam.channeldetail = channel;
	}
	//tParam.channel = $('#qchannel').combobox('getValue');
	
	tParam.wxno = $('#qwxno').val();
	tParam.crm_remark = $('#qcrm_remark').val();
	
	tParam.appname = $('#qappname').combobox('getText');
	
	tParam.initSourceLevel = $('#qinitSourceLevel').combobox('getValue');
	tParam.sourceLevel = $('#qSourceLevel').combobox('getValue');
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qstartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qenddate').datebox("getValue");
	
	tParam.distributeStartDate = $('#qdistributeStartDate').datebox("getValue");
	tParam.distributeEndDate = $('#qdistributeEndDate').datebox("getValue");
	
	tParam.appointmentStartTime = $('#qAppointmentStartTime').datebox("getValue");
	tParam.appointmentEndTime = $('#qAppointmentEndTime').datebox("getValue");
	
	tParam.followupstep = $('#qfollowupstep').combobox('getValue');
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');

	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	tParam.issea = $('#qissea').combobox('getValue');
	tParam.custype = $('#qcustype').combobox('getValue');
	
	return tParam;
}

function activityquery()
{
	var tturl = "activity/channel0002List.do";

	var tParam = getQueryParam();
	
	displayDataGrid20($('#activitylist'), tParam, tturl);
}

function dispageurl(val,row,index)
{
	return '<a href="#" onclick="openpageurl(\''+row.channel+'\',\''+row.pagetype+'\',\''+row.planid+'\',\''+row.pageurl+'\')">'+row.pageurl+'</a>';
}

function openpageurl(channel,pagetype,planid,pageurl)
{
	if(pageurl!=null&&pageurl!='')
	{
		window.open(pageurl,
				'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
	}
	else if(channel=='0004'&&pagetype=='1yuango/0001')
	{
		window.open('http://insure.meihualife.com/life/activity/oneyuangodis.do',
		'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
	}
	else
	{
		window.open('http://insure.meihualife.com/life/activity/channelActivity.do?channelCode='+channel+'&pageType='+pagetype+'&planId='+planid,
		'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');	
	}
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
	else if(val=='A-')
	{
		if(row.initSourceLevel=='A')
		{
			return 'A-重疾'
		}
		else if(row.initSourceLevel=='A+')
		{
			return 'A-理财'
		}
		else
		{
			return val;
		}  
	}
	else
	{
		return val;
	}
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				线索产生起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
			</td>
			
			<td class = "reprot_title">
				线索产生止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
			</td>
			
			<td class = "reprot_title">
				资源等级
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qSourceLevel" id="qSourceLevel">
				</select>
			</td>
			
			<td class = "reprot_title">
				初始资源等级
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qinitSourceLevel" id="qinitSourceLevel">
				</select>
			</td>
			
			<td class = "reprot_title">
				客户公海
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qissea" id="qissea">
				</select>
			</td>
			
			<td class = "reprot_title">
				业务员姓名
			</td>
			<td class = "report_common">
				<input class = "txt" name="qusername" id="qusername">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				线索分配起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qdistributeStartDate" name="qdistributeStartDate">
			</td>
			<td class = "reprot_title">
				线索分配止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qdistributeEndDate" name="qdistributeEndDate">
			</td>
			
			<td class = "reprot_title">
				渠道类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
			
			<td class = "reprot_title">
				流量来源
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qappname" id="qappname">
				</select>
			</td>
			
			<td class = "reprot_title">
				备注信息
			</td>
			<td class = "report_common">
				<input class = "txt" name="qcrm_remark" id="qcrm_remark">
			</td>
			
			<td class = "reprot_title">
				客户类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qcustype" id="qcustype">
				</select>
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				预约顾问起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qAppointmentStartTime" name="qAppointmentStartTime">
			</td>
			
			<td class = "reprot_title">
				预约顾问止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qAppointmentEndTime" name="qAppointmentEndTime">
			</td>
		
			<td class = "reprot_title">
				客户姓名
			</td>
			<td class = "report_common">
				<input class = "txt" name="qname" id="qname">
			</td>
			
			<td class = "reprot_title">
				电话号码
			</td>
			<td class = "report_common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			
			<td class = "reprot_title">
				微信号
			</td>
			<td class = "report_common">
				<input class = "txt" name="qwxno" id="qwxno">
			</td>
			
			<td class = "reprot_title">
				跟进步骤
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qfollowupstep" id="qfollowupstep">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "activityquery()">查询</a>
	<br>
	<br>
	<table id="activitylist" class="easyui-datagrid" title="顾问预约查询" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'makedate',width:125" sortable="true">线索产生时间</th>
				<th data-options="field:'distributedate',width:125" sortable="true">线索分配时间</th>
				<th data-options="field:'appointmentTime',width:125" sortable="true">预约顾问时间</th>
				<th data-options="field:'issea',width:60">客户公海</th>
				<th data-options="field:'agentcom',width:70">所属营业部</th>
				<th data-options="field:'teamname',width:70">所属团队</th>
				<th data-options="field:'usercode',width:70" sortable="true">业务员编号</th>
				<th data-options="field:'username',width:70" sortable="true">业务员姓名</th>
				<th data-options="field:'name',width:70" sortable="true">客户姓名</th>
				<th data-options="field:'mobile',width:85" sortable="true">电话号码</th>
				<th data-options="field:'wxno',width:85" sortable="true">微信号</th>
				<th data-options="field:'sourcelevel',width:60,formatter:disSourceLevel" sortable="true">资源等级</th>
				<th data-options="field:'initSourceLevel',width:60,formatter:disSourceLevel" sortable="true">初始资源等级</th>
				
				<th data-options="field:'isconnect',width:60">是否接通</th>
				
				<th data-options="field:'followupstepname',width:60" sortable="true">跟进步骤</th>
				
				<th data-options="field:'callcount',width:85">累计拨打次数</th>
				
				<th data-options="field:'sex',width:40">性别</th>
				<th data-options="field:'age',width:40">年龄</th>
				<th data-options="field:'custypename',width:60">客户类型</th>
				
				<th data-options="field:'area',width:90">自动定位地址</th>
				<th data-options="field:'channelname',width:60">渠道类型</th>
				<th data-options="field:'appname',width:60">流量来源</th>
				<th data-options="field:'pageurl',width:150,formatter:dispageurl">推广页面</th>
				<th data-options="field:'crm_remark',width:260">备注信息</th>
				<th data-options="field:'remark',width:560">跟进记录</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>