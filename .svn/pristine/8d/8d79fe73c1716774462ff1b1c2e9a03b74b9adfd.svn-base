<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#customerintentionList'));
	
	dlgUserInit();

	disComBox($('#qchannel'), "source", null);
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
	
	inputList = [
		 	];
	
	checkList = [
		 	];
	
	init02Org();
}

function aftercodeselect(comboxid)
{
	if (comboxid.attr("id") == "qchannel") {
        var tParam = new Object();
        tParam.comboxType = 'sourcedetail_' + comboxid.combobox('getValue');

        var tturl = "activity/getSourceDetail.do";
        displayCombox($('#qappname'), tParam, tturl, "dd_key", "dd_value");
    } else {
        organAfterSelect(comboxid);
    }
}

function selectone()
{
	
}

function customerIntentionquery()
{
	var tturl = "activity/getActivityCustomerIntentionMonthList.do";

	var tParam = new Object();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	tParam.yearMonth = $('#qdistributedate').datebox("getValue");
	tParam.username = $('#qusername').val();
	tParam.channel = $('#qchannel').combobox('getValue');
    tParam.appname = $('#qappname').combobox('getText');
    tParam.queryflag = '02';
	
	displayDataGrid20($('#customerintentionList'), tParam, tturl);
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

function saveSuss()
{
	clearCarData();
	$('#customerintentionList').datagrid('reload');
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
		
		<td class="reprot_title">
			渠道类型
        </td>
        <td class="report_common">
        	<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qchannel"id="qchannel"></select>
		</td>

        <td class="reprot_title">
        	流量来源
		</td>
        <td class="report_common">
        	<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qappname"id="qappname"></select>
        </td>
		
		<td class = "reprot_title" style="width: 7%;">
			业务员姓名
		</td>
		<td class = "report_common" style="width: 10%;">
			<input class = "txt" id = 'qusername' name = 'qusername'>
		</td>
	</tr>
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "customerIntentionquery" onclick = "customerIntentionquery()">查询</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="customerintentionList" class="easyui-datagrid" title="热线质量报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'content',width:120">内容</th>
				<th data-options="field:'day01',width:35">01</th>
				<th data-options="field:'day02',width:35">02</th>
				<th data-options="field:'day03',width:35">03</th>
				<th data-options="field:'day04',width:35">04</th>
				<th data-options="field:'day05',width:35">05</th>
				<th data-options="field:'day06',width:35">06</th>
				<th data-options="field:'day07',width:35">07</th>
				<th data-options="field:'day08',width:35">08</th>
				<th data-options="field:'day09',width:35">09</th>
				<th data-options="field:'day10',width:35">10</th>
				<th data-options="field:'day11',width:35">11</th>
				<th data-options="field:'day12',width:35">12</th>
				<th data-options="field:'day13',width:35">13</th>
				<th data-options="field:'day14',width:35">14</th>
				<th data-options="field:'day15',width:35">15</th>
				<th data-options="field:'day16',width:35">16</th>
				<th data-options="field:'day17',width:35">17</th>
				<th data-options="field:'day18',width:35">18</th>
				<th data-options="field:'day19',width:35">19</th>
				<th data-options="field:'day20',width:35">20</th>
				<th data-options="field:'day21',width:35">21</th>
				<th data-options="field:'day22',width:35">22</th>
				<th data-options="field:'day23',width:35">23</th>
				<th data-options="field:'day24',width:35">24</th>
				<th data-options="field:'day25',width:35">25</th>
				<th data-options="field:'day26',width:35">26</th>
				<th data-options="field:'day27',width:35">27</th>
				<th data-options="field:'day28',width:35">28</th>
				<th data-options="field:'day29',width:35">29</th>
				<th data-options="field:'day30',width:35">30</th>
				<th data-options="field:'day31',width:35">31</th>
				
				<th data-options="field:'sumcount',width:40">合计</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>