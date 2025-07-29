<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../css/inputbox/line3.css?v_2022_05_16">
			<script>

				window.onload = function () {
					initDataGrid20($('#policyList'));

					init02Org();

					disComBox($('#qchannel'), "source", null);
					$('#qacceptStartDate').datebox('setValue', getMonthOneFormatDate());
					displayCombox($('#qriskType'), null, "/jsondata/policy/risktypestr.json", "dd_key", "dd_value");
				}

				function aftercodeselect(comboxid) {
					organAfterSelect(comboxid);
				}

				function selectone() {

				}

				function fypquery(orderbystr) {
					if ($('#qacceptStartDate').datebox("getValue") == null || $('#qacceptStartDate').datebox("getValue") == "") {
						$.messager.alert('操作提示', '起始日期不能为空！', 'info');
						return
					}

					var tturl = "policy/getOrganFypList.do";

					var tParam = new Object();

					tParam.state = '40';
					tParam.agentflag = '02';

					tParam.q02org = $('#q02org').combobox('getValue');
					tParam.q03org = $('#q03org').combobox('getValue');
					tParam.q04org = getOrgan04Code();

					tParam.teamid = getQTeamId();

					tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
					tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");

					tParam.orderby = orderbystr + " desc ";
					tParam.riskTypeStr = $('#qriskType').combobox('getValue');
					tParam.isxubao = 'NOTY';
					//tParam.has_coefficient = "N";
					tParam.channel = $('#qchannel').combobox('getValue');

					displayDataGrid20($('#policyList'), tParam, tturl);

					var sumurl = "policy/getPolicySum.do";

					ajaxdeal(sumurl, tParam, displaysumdata, null);
				}

				function displaysumdata(data) {
					if (data == null || data == "") {
					
						$('#policycount').val("");
						$('#ylpolicycount').val("");
						$('#ylprem').val("");
						$('#changxian_sumfyp20').val("");
						$('#sumprem').val("");
						$('#sumfyp').val("");
						$('#sumfyp20').val("");
					}
					else {
						
						$('#policycount').val(data.policycount);
						$('#ylpolicycount').val(data.ylpolicycount);
						$('#ylprem').val(data.ylprem);
						$('#changxian_sumfyp20').val(data.changxian_sumfyp20);

						$('#sumprem').val(data.sumprem);
						$('#sumfyp').val(data.sumfyp);
						$('#sumfyp20').val(data.sumfyp20);







					}
				}

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


				function jiaquanfyp(val, row, index) {
					var fyp = (row.changxian_sumfyp20 / 15000) + (row.ylprem / 25000)
					return (fyp * 15000).toFixed(2)
				}



			</script>
		</head>

		<body>
			<div style="margin-left:0%">
				<table class="common">
					<tr>
						<td class="reprot_title">
							出单起期
						</td>
						<td class="report_common">
							<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate"
								name="qacceptStartDate" notnull="出单起期">
						</td>
						<td class="reprot_title">
							出单止期
						</td>
						<td class="report_common">
							<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate"
								notnull="出单止期">
						</td>

						<td class="reprot_title">
							渠道类型
						</td>
						<td class="report_common">
							<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qchannel"
								id="qchannel">
							</select>
						</td>

						<td class="reprot_title" hidden>
							险种类型
						</td>
						<td class="report_common" hidden>
							<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qriskType"
								id="qriskType">
							</select>
						</td>
					</tr>
					<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp" %>
				</table>
				<br>
				<!-- <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "fypquery" onclick = "fypquery('policycount')">按单数排名</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "fypquery" onclick = "fypquery('sumfyp20order')">按标保排名</a> -->

				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="fypquery"
					onclick="fypquery('policycountorder')">按长期险单数排名</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="fypquery"
					onclick="fypquery('changxian_sumfyp20_order')">按长期险标保排名</a>

				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="fypquery"
					onclick="fypquery('ylpolicycountorder')">按医疗险单数排名</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="fypquery"
					onclick="fypquery('ylpremorder')">按医疗险保费排名</a>




				<br>
				<br>
				<table id="policyList" class="easyui-datagrid" title="团队排名" style="width:auto;height:auto"
					data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
					<thead>
						<tr>
							<th data-options="field:'agentcom',width:70">所属营业部</th>
							<th data-options="field:'teamname',width:100">所属团队</th>
							<th data-options="field:'policycount',width:80">长期险单数</th>
							<th data-options="field:'changxian_sumfyp20',width:80">长期险标保</th>
								<th data-options="field:'coefficient_changxian_sumfyp20',width:130">长期险折算系数后标保 </th>
							<th data-options="field:'ylpolicycount',width:80">医疗险单数</th>
							<th data-options="field:'ylprem',width:80">医疗险保费</th>
							<th data-options="field:'yl',width:80,formatter:jiaquanfyp">加权标保</th>
						</tr>
					</thead>
				</table>
				<br>
				<table class="common" style="width: 73.5%;">
					<tr>
						<td class="reprot_title">
							长期险单数合计
						</td>
						<td class="report_common">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>
			
						<td class="reprot_title">
							长期险标保合计
						</td>
						<td class="report_common">
							<input class="txt" id="changxian_sumfyp20" name="changxian_sumfyp20" readonly>
						</td>

						<td class="reprot_title">
							医疗险单数合计
						</td>
						<td class="report_common">
							<input class="txt" id="ylpolicycount" name="ylpolicycount" readonly>
						</td>

						<td class="reprot_title">
							医疗险保费合计
						</td>
						<td class="report_common">
							<input class="txt" id="ylprem" name="ylprem" readonly>
						</td>


					</tr>
					<tr hidden="">
						<td class="reprot_title">
							10年FYP合计
						</td>
						<td class="report_common">
							<input class="txt" id="sumfyp" name="sumfyp" readonly>
						</td>
					</tr>
				</table>
				<br>
				<font color="red">金额不包含续保以及折算系数为0的保单（例如万能险）</font>
			</div>
		</body>

	</html>