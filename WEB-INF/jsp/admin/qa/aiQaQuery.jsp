<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
	
			<script>
				var inputList;
				var checkList;
				var doubleList;

				window.onload = function () {
					$('#chatRecord').dialog('close');
					$('#chatRecordee').dialog('close');
					initDataGrid20($('#aiqaList'));
					init02Org();

					inputList = [
					];

					checkList = [
					];
					$("#qstartdate").datebox("setValue", getMonthOneFormatDate());
				}

				function aftercodeselect(comboxid) {
					organAfterSelect(comboxid);
				}

				// function selectone() {
				// 	var row = $('#aiqaList').datagrid('getSelected');

				// 	var tturl = "/qa/getQaContentList.do";

				// 	var tParam = new Object();

				// 	tParam.sessionid = row.id;

				// 	displayDataGrid20($('#aiqaContentList'), tParam, tturl);
				// }

				function selectonecontent() {

				}

				function saveSuss() {
				}

				function clearInputData() {

				}

				function aiqaQuery() {
					var tturl = "/qa/getQaTitleList.do";

					var tParam = new Object();

					tParam.startdate = $('#qstartdate').datebox("getValue");
					tParam.enddate = $('#qenddate').datebox("getValue");
					tParam.q02org = $('#q02org').combobox('getValue');
					tParam.q03org = $('#q03org').combobox('getValue');
					tParam.q04org = getOrgan04Code();
					tParam.teamid = getQTeamId();
					tParam.username = $('#qusername').val();

					displayDataGrid20($('#aiqaList'), tParam, tturl);
				}

				function getusername(val, row, index) {
					if (row.role == 'system') {
						return 'AI';
					} else {
						return row.username;
					}
				}


				function openAIRecord(val, row, index) {
					var sessionid = row.id;
					// console.log(sessionid);
					// 如果 sessionid 是字符串，需加引号
					return '<a href="#" style="cursor:pointer;" onclick="openChatDlg(\'' + sessionid + '\')">查看</a>';
				};
				function getMonthOneFormatDate() {
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



			</script>
		</head>

		<body>
			<div style="margin-left:0%">
				<table class="common">
					<tr>
						<td class="reprot_title">
							问答起期
						</td>
						<td class="report_common">
							<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
						</td>

						<td class="reprot_title">
							问答止期
						</td>
						<td class="report_common">
							<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
						</td>

						<td class = "reprot_title">
							人员姓名
						</td>
						<td class = "report_common">
							<input class = "txt" name="qusername" id="qusername">
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp" %>
				</table>
				<br>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="aiqaQuery"
					onclick="aiqaQuery()">查询</a>
				<br>
				<br>
				<table id="aiqaList" class="easyui-datagrid" title="AI问答查询" style="width:auto;height:auto"
					data-options="rownumbers:true,singleSelect:true,pagination:true">
					<thead>
						<tr>
							<th data-options="field:'makedate',width:125">问答时间</th>
							<%@ include file="/WEB-INF/common/column/organ/organList.jsp" %>
								<th data-options="field:'username',width:60">人员姓名</th>
								<th data-options="field:'title',width:500">首个问题</th>
								<th data-options="field:'openAIRecord',width:60,formatter:openAIRecord">问答内容</th>

						</tr>
					</thead>
				</table>
				<br>

				<%@ include file="/WEB-INF/common/AIRecord.jsp" %>



			</div>
		</body>

	</html>