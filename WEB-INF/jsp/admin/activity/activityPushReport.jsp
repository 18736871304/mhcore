<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line7.css">
	<script>
		var inputList;
		var checkList;

		window.onload = function () {
			initDataGrid20($('#activitylist'));

			inputList = [];

			checkList = [];

			$('#menudisplaydlg').dialog('close');

			$('#qstartdate').datebox('setValue', get1BeforeFormatDate());

			var tturl = "policy/get02Org.do";
			displayCombox($('#q02org'), null, tturl, "dd_key", "dd_value");

			init02Org();
		}

		function aftercodeselect(comboxid) {
			organAfterSelect(comboxid);
		}

		function selectone() {}

		function activityquery() {
			var tturl = "activity/getactivityReportByUser.do";

			var tParam = new Object();

			tParam.queryflag = '02';

			tParam.distributeStartDate = $('#qstartdate').datebox("getValue");
			tParam.distributeEndDate = $('#qenddate').datebox("getValue");

			tParam.organcode = $('#departmentId').val();

			tParam.q02org = $('#q02org').combobox('getValue');
			tParam.q03org = $('#q03org').combobox('getValue');

			tParam.q04org = getOrgan04Code();

			tParam.teamid = getQTeamId();

			displayDataGrid20($('#activitylist'), tParam, tturl);

			var sumurl = "activity/getactivityCount.do";

			ajaxdeal(sumurl, tParam, displaysumdata, null);
		}

		function displaysumdata(data) {
			if (data == null || data == "") {
				$('#activityCount').val("");
				$('#activityCount_APlus').val("");
				$('#activityCount_A').val("");
			} else {
				$('#activityCount').val(data.activityCount);
				$('#activityCount_APlus').val(data.activityCount_APlus);
				$('#activityCount_A').val(data.activityCount_A);
			}
		}

		function saveSuss() {
			$('#activitylist').datagrid('reload');
		}

		function getChecked() {
			var nodes = $('#userauthtree').tree('getChecked');
			var s = '';
			var s2 = '';
			for (var i = 0; i < nodes.length; i++) {
				if (s != '') s += '\',\'';
				if (s2 != '') s2 += ',';
				s += nodes[i].id;
				s2 += nodes[i].text;
			}
			$('#departmentId').val(s);
			$('#departmentName').val(s2);

			$('#menudisplaydlg').dialog('close');
		}

		function userMenuDis() {
			$("#userauthtree").tree({
				url: 'combox/departmentList.do'
			});
			$('#menudisplaydlg').dialog('open');
		}

		function get1BeforeFormatDate() {
			var curDate = new Date();

			var date = new Date(curDate.getTime() - 24 * 60 * 60 * 1000);

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
		td.report_common {
			width: 10%;
		}
	</style>
	
</head>

<body>
	<div style="margin-left:0%">
		<input type="text" hidden="hidden" id="departmentId">
		<div id="menudisplaydlg" class="easyui-dialog" title="机构查询" style="width:300px;height:500px;padding:10px"
			data-options="iconCls: 'icon-save'">
			<div style="margin-left:15%">
				<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
			</div>
			<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
		</div>
		<table class="common">
			<tr>
				<td class="reprot_title" style="width: 7%;">
					线索分配起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
				</td>
				<td class="reprot_title" style="width: 7%;">
					线索分配止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
				</td>
			</tr>

			<tr hidden="hidden">
				<td class="title">
					员工机构
				</td>
				<td class="common" colspan="2">
					<input class="txt" name="departmentName" id="departmentName" readonly><a href="#"
						class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id="userMenuDis"
						onclick="userMenuDis()"></a>
				</td>
			</tr>

			<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="userwxquery"
			onclick="activityquery()">查询</a>
		<br>
		<br>
		<table id="activitylist" class="easyui-datagrid" title="热线分配报表" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'organ02name',width:70">所属省公司</th>
					<th data-options="field:'organname',width:70">所属分公司</th>
					<th data-options="field:'agentcom',width:70">所属营业部</th>
					<th data-options="field:'teamname',width:100">所属团队</th>
					<th data-options="field:'usercode',width:70">业务员编号</th>
					<th data-options="field:'username',width:70">业务员姓名</th>

					<th data-options="field:'activityCount_A',width:110">热线数量（A重疾）</th>
					<th data-options="field:'activityCount_APlus',width:110">热线数量（A理财）</th>

					<th data-options="field:'activityCount',width:110">热线数量合计</th>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr>
				<td class="reprot_title" style="width: 12%;">
					热线数量合计（A重疾）
				</td>
				<td class="report_common">
					<input class="txt" id="activityCount_A" name="activityCount_A" readonly>
				</td>

				<td class="reprot_title" style="width: 12%;">
					热线数量合计（A理财）
				</td>
				<td class=report_common>
					<input class="txt" id="activityCount_APlus" name="activityCount_APlus" readonly>
				</td>

				<td class="reprot_title" style="width: 12%;">
					热线数量合计
				</td>
				<td class="report_common">
					<input class="txt" id="activityCount" name="activityCount" readonly>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>

</html>