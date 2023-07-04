<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>
var inputList;
var checkList;
var doubleList;

window.onload = function () 
{
	initDataGrid20($('#articleClueList'));
	
	inputList = [
			];

			checkList = [
			];
	
	init02Org();
	disComBox($('#qisaddfriend'),"yesno",null);
	disComBox($('#qchannel'),"source",null);
	disComBox($('#qcluetype'),"cluetype",null);
	
	$('#qisaddfriend').combobox('setValue','Y');
	$('#qcluestartdate').datebox('setValue', getMonthOneFormatDate());
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

function saveSuss() 
{
}

function clearInputData() 
{
	
}

function articleClueQuery()
{
	var tturl = "articleMan/getArticleClueList.do";

	var tParam = new Object();

	tParam.cluestartdate = $('#qcluestartdate').datebox("getValue");
	tParam.clueenddate = $('#qclueenddate').datebox("getValue");
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.appname = $('#qappname').combobox('getText');
	
	tParam.cluetype = $('#qcluetype').combobox('getValue');
	tParam.isaddfriend = $('#qisaddfriend').combobox('getValue');
	tParam.customerremarkname = $('#qcustomerremarkname').val();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();

	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#articleClueList'), tParam, tturl);
}

function disarticle(val,row,index)
{
	return '<a href="#" onclick="openArticleUrl(\''+row.articleurl+'\')">'+row.articleurl+'</a>';
}

function openArticleUrl(articleurl)
{
	window.open(articleurl,'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
}
	
</script>
</head>
<body>
	<div style="margin-left:0%">
		<table class="common">
			<tr>
				<td class="reprot_title">
					线索产生起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qcluestartdate" name="qcluestartdate">
				</td>
				
				<td class="reprot_title">
					线索产生止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qclueenddate" name="qclueenddate">
				</td>
			
				<td class="reprot_title">
					渠道活码
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qcluetype" id="qcluetype">
					</select>
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
				
			</tr>
			<tr>
				<td class="reprot_title">
					是否添加好友
				</td>
				<td class="reprot_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qisaddfriend" id="qisaddfriend">
					</select>
				</td>
				
				<td class = "reprot_title">
					客户微信备注
				</td>
				<td class = "report_common">
					<input class = "txt" name="qcustomerremarkname" id="qcustomerremarkname">
				</td>
			</tr>
			<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articleClueQuery" onclick="articleClueQuery()">查询</a>
		<br>
		<br>
		<table id="articleClueList" class="easyui-datagrid" title="企微线索查询" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'makedate',width:120">线索产生时间</th>
					<th data-options="field:'cluetypename',width:80">渠道活码</th>
					<th data-options="field:'isaddfriend',width:80">是否添加好友</th>
					<th data-options="field:'customername',width:100">客户微信昵称</th>
					<th data-options="field:'customerremarkname',width:100">客户微信备注</th>
					<th data-options="field:'customersex',width:60">客户性别</th>
					<th data-options="field:'channelname',width:60">渠道类型</th>
					<th data-options="field:'appname',width:60">流量来源</th>
					<th data-options="field:'sourcetypename',width:60">来源属性</th>
					
					<th data-options="field:'ip',width:90">IP</th>
					<th data-options="field:'ipaddress',width:90">自动定位地址</th>
					
					<th data-options="field:'agentcom',width:70">所属营业部</th>
					<th data-options="field:'teamname',width:100">所属团队</th>

					<th data-options="field:'usercode',width:70">业务员编号</th>
					<th data-options="field:'username',width:70">业务员姓名</th>
				</tr>
			</thead>
		</table>
		<br>
	</div>
</body>

</html>