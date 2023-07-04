<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line7.css">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#pusherList'));
	
	dlgUserInit();
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	 $('#qdistributedate').datebox({formatter:function(date){
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? '0' + m : m;
        return y.toString() + '-' + m.toString();
    },parser:function(date){
        console.log(date);
        if (date) {
            return new Date(String(date).substring(0, 4) + '-'
                    + String(date).substring(5,7));
        } else {
            return new Date();
        }
    }});
	 
	 var curMonth = getCurMonth();
	
	$('#qdistributedate').datebox('setValue',curMonth);
	
	$('#remark').val("");
	
	inputList = [
	             	$('#remark')
		 	];
	
	checkList = [
		 	];
	
	disComBox($('#qinitSourceLevel'),"hotline_sourcelevle",null);
	
	$('#pusherList').datagrid('hideColumn', 'pushcount_aplus');
	$('#pusherList').datagrid('hideColumn', 'pushcount');
	
	init02Org();
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qinitSourceLevel")
	{
		$('#pusherList').datagrid('showColumn', 'pushcount_all');
		$('#pusherList').datagrid('showColumn', 'pushcount_aplus');
		$('#pusherList').datagrid('showColumn', 'pushcount');
		
		if(comboxid.combobox('getValue')=='A+')
		{
			$('#pusherList').datagrid('hideColumn', 'pushcount_all');
			$('#pusherList').datagrid('hideColumn', 'pushcount');
		}
		else if(comboxid.combobox('getValue')=='A')
		{
			$('#pusherList').datagrid('hideColumn', 'pushcount_all');
			$('#pusherList').datagrid('hideColumn', 'pushcount_aplus');
		}
	}
	else
	{
		organAfterSelect(comboxid);
	}
}

function selectone()
{
	var row = $('#pusherList').datagrid('getSelected');
	
	$('#remark').val(row.remark);
}

function pusherquery()
{
	var tturl = "push/userPushReportList.do";

	var tParam = new Object();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	tParam.yearMonth = $('#qdistributedate').datebox("getValue");
	tParam.username = $('#qusername').val();
	tParam.reportFlag = 'Y';
	
	tParam.initSourceLevel = $('#qinitSourceLevel').combobox('getValue');
	
	displayDataGrid20($('#pusherList'), tParam, tturl);

	//调用下面这个接口的时候，不需要userid
	tParam.username = '';
	tParam.queryflag = '02';
	tParam.distributeusername = $('#qusername').val();
	
	tParam.distributeStartDate = $('#qdistributedate').datebox("getValue") +"-01";
	tParam.distributeEndDate = getNextMonth($('#qdistributedate').datebox("getValue")) +"-01";
	
	var sumurl = "activity/getactivityCount.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
	
	clearCarData();
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#activityCount').val("");
	}
	else
	{
		$('#activityCount').val(data.activityCount);
	}
}

function getCurMonth()
{
	var currTime=new Date();
	
	var year = currTime.getFullYear();
    var month = currTime.getMonth() + 1;
    
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    
    return year+"-"+month;
}

function getNextMonth(yearMonth)
{
	var dateStr = yearMonth.split("-");
	var year = dateStr[0];
	var month = dateStr[1];
	
	if(month=='12')
	{
		month = '01'
		year = Number(year) + Number(1);
	}
	else
	{
		month = Number(month) + Number(1);
	}
	
	return year+"-"+month;
}

function updateremark()
{
	var row = $('#pusherList').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	var tparam = prepareparam(inputList);
	tparam.userid = row.userid;
	tparam.yearmonth = row.yearmonth;
	
	ajaxdeal("push/pushRemark.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	clearCarData();
	$('#pusherList').datagrid('reload');
}

function clearCarData()
{
	cleardata(inputList);
}

</script>
<style>
	td.reprot_title {
		width: 7%;
	}
</style>
</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<body>
<table class = "common">
	<tr>
		<td class = "reprot_title" style="width: 7%;">
			线索分配月
		</td>
		<td class = "report_common" style="width: 10%;">
			<input class="easyui-datebox" style="width: 90%" id="qdistributedate" name="qdistributedate">
		</td>
		<td class = "reprot_title" style="width: 7%;">
			业务员姓名
		</td>
		<td class = "report_common" style="width: 10%;">
			<input class = "txt" id = 'qusername' name = 'qusername'>
		</td>
		<td class = "reprot_title" style="width: 7%;">
			初始资源等级
		</td>
		<td class = "report_common" style="width: 10%;">
		<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qinitSourceLevel" id="qinitSourceLevel">
			</select>
		</td>
	</tr>
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "pusherquery" onclick = "pusherquery()">查询</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="pusherList" class="easyui-datagrid" title="个人分配报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'agentcom',width:70">所属营业部</th>
				<th data-options="field:'teamname',width:100">所属团队</th>
				<th data-options="field:'username',width:70">业务员姓名</th>
				<th data-options="field:'pushcount_all',width:100">日推送数量合计</th>
				<th data-options="field:'isonline',width:60">是否在线</th>
				<th data-options="field:'pushcount_aplus',width:120">日推送数量（A+）</th>
				<th data-options="field:'pushcount',width:120">日推送数量（A）</th>
				
				<th data-options="field:'day01',width:25">01</th>
				<th data-options="field:'day02',width:25">02</th>
				<th data-options="field:'day03',width:25">03</th>
				<th data-options="field:'day04',width:25">04</th>
				<th data-options="field:'day05',width:25">05</th>
				<th data-options="field:'day06',width:25">06</th>
				<th data-options="field:'day07',width:25">07</th>
				<th data-options="field:'day08',width:25">08</th>
				<th data-options="field:'day09',width:25">09</th>
				<th data-options="field:'day10',width:25">10</th>
				<th data-options="field:'day11',width:25">11</th>
				<th data-options="field:'day12',width:25">12</th>
				<th data-options="field:'day13',width:25">13</th>
				<th data-options="field:'day14',width:25">14</th>
				<th data-options="field:'day15',width:20">15</th>
				<th data-options="field:'day16',width:25">16</th>
				<th data-options="field:'day17',width:25">17</th>
				<th data-options="field:'day18',width:25">18</th>
				<th data-options="field:'day19',width:25">19</th>
				<th data-options="field:'day20',width:25">20</th>
				<th data-options="field:'day21',width:25">21</th>
				<th data-options="field:'day22',width:25">22</th>
				<th data-options="field:'day23',width:25">23</th>
				<th data-options="field:'day24',width:25">24</th>
				<th data-options="field:'day25',width:25">25</th>
				<th data-options="field:'day26',width:25">26</th>
				<th data-options="field:'day27',width:25">27</th>
				<th data-options="field:'day28',width:25">28</th>
				<th data-options="field:'day29',width:25">29</th>
				<th data-options="field:'day30',width:25">30</th>
				<th data-options="field:'day31',width:25">31</th>
				
				<th data-options="field:'sumcount',width:40">合计</th>
				<th data-options="field:'remark',width:300">备注</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				合计
			</td>
			<td class = "common">
				<input class = "txt" id="activityCount" name="activityCount" readonly>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<table class = "common" hidden>
		<tr>
			<td class = "title">
				备注
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "备注" class="txt" style="width: 600px;height: 75px;" id="remark" name="remark">
				</textarea>
			</td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<!-- 
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "updateremark" onclick = "updateremark()">保存</a>
	 -->
</div>
</body>
</html>