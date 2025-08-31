<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v_2022_05_16">
			<script>

				window.onload = function () {
					initDataGrid20($('#policyList'));

					disComBox($('#qusergrade'), "usergrade", null);
					disComBox($('#qposition'), "position", null);

					$('#qacceptStartDate').datebox('setValue', getLastMonthOneFormatDate());

					$('#qacceptEndDate').datebox('setValue', getMonthOneFormatDate());

					init02Org();
					$('#q02org').combobox('setValue', '100100000');
					organAfterSelect($('#q02org'))
				}

				function aftercodeselect(comboxid) {
					organAfterSelect(comboxid);
				}

				function selectone() {

				}

				function getQueryParam() {
					var tParam = new Object();

					tParam.state = '40';
					tParam.agentflag = '02';
					tParam.isxubao = 'NOTY';
					tParam.has_coefficient = "N";

					tParam.reusername = $('#qusername').val();
					tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
					tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
					// tParam.usergrade = $('#qusergrade').combobox('getValue');
					tParam.his_usergrade = $('#qusergrade').combobox('getValue');
					tParam.position = $('#qposition').combobox('getValue');

					tParam.q02org = $('#q02org').combobox('getValue');
					tParam.q03org = $('#q03org').combobox('getValue');
					tParam.q04org = getOrgan04Code();

					tParam.teamid = getQTeamId();

					tParam.orderby = " coefficientsumfyp20order desc ";

					return tParam;
				}

				function newPolicyQuery() {
					if ($('#qacceptStartDate').datebox("getValue") == null || $('#qacceptStartDate').datebox("getValue") == "") {
						$.messager.alert('操作提示', '起始日期不能为空！', 'info');
						return
					}

					var tturl = "policy/getAgentFypList.do";

					var tParam = getQueryParam();

					displayDataGrid20($('#policyList'), tParam, tturl);

					var sumurl = "policy/getPolicySum.do";

					ajaxdeal(sumurl, tParam, displaysumdata, null);
				}

				function displaysumdata(data) {
					if (data == null || data == "") {
						$('#sumprem').val("");
						$('#policycount').val("");
						$('#sumfyp20').val("");
						$('#coefficientsumfyp20').val("");
					}
					else {
						$('#sumprem').val(data.sumprem);
						$('#policycount').val(data.policycount);
						$('#sumfyp20').val(data.sumfyp20);
						$('#coefficientsumfyp20').val(data.coefficientsumfyp20);
					}
				}

				function policyquerydownload() {
					if ($('#qacceptStartDate').datebox("getValue") == null || $('#qacceptStartDate').datebox("getValue") == "") {
						$.messager.alert('操作提示', '起始日期不能为空！', 'info');
						return
					}

					var tturl = "policy/agentFypListDownLoad.do";

					var tParam = getQueryParam();
					ajaxdeal(tturl, tParam, listdownloadreturn, null);
				}

				function listdownloadreturn(data) {
					if (data.flag == "0") {
						if (data.message == null || data.message == "") {
							$.messager.alert('执行失败', '没有生成下载文件', 'error');
						} else {
							$.messager.alert('执行成功', "执行成功，请点击下载", 'info');
							//判断id存在的代码
							if ($("#xiazai").length > 0) {
								$("#xiazai").remove();
								$('#policyquerydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename=" + data.message + "'>点击下载</a>");
							} else {
								$('#policyquerydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename=" + data.message + "'>点击下载</a>");
							}
						}
					} else {
						if (data.message == null || data.message == "") {
							$.messager.alert('执行失败', '操作失败', 'error');
						} else {
							$.messager.alert('执行失败', data.message, 'error');
						}
					}
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
							<!-- (算头不算尾) -->
						</td>

						<td class="reprot_title">
							出单业务员
						</td>
						<td class="report_common">
							<input class="txt" name="qusername" id="qusername">
						</td>

						<td class="reprot_title">
							职能级别
						</td>
						<td class="report_common">
							<select class="easyui-combobox" panelHeight="auto" style="width:160%" name="qusergrade"
								id="qusergrade">
							</select>
						</td>

						<td class="reprot_title">
							职岗
						</td>
						<td class="report_common">
							<select class="easyui-combobox" panelHeight="auto" style="width:160%" name="qposition"
								id="qposition">
							</select>
						</td>
					</tr>
					<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp" %>
				</table>
				<br>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="newPolicyQuery"
					onclick="newPolicyQuery()">查询</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="policyquerydownload"
					onclick="policyquerydownload()">下载</a>
				<br>
				<br>
				<table id="policyList" class="easyui-datagrid" title="首期薪资查询" style="width:auto;height:auto"
					data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
					<thead>
						<tr>
							<!-- <th data-options="field:'organname',width:70">所属省公司</th> -->
							<th data-options="field:'organ02name',width:70">所属分公司</th>
							<th data-options="field:'agentcom',width:70">所属营业部</th>
							<th data-options="field:'teamname',width:100">所属团队</th>
							<th data-options="field:'reusername',width:70">人员姓名</th>
							<th data-options="field:'degreename',width:70">学历</th>
							<th data-options="field:'usergradename',width:70">职能级别</th>
							<th data-options="field:'positionname',width:60">职岗</th>
							<th data-options="field:'entrydate',width:70">下团队日期</th>
							<th data-options="field:'sumfyp20',width:70">标保</th>
							<th data-options="field:'jiaquan_fyp',width:70">加权标保</th>
							<th data-options="field:'changxian_sumfyp20',width:90">长期险标保</th>
							<th data-options="field:'changxian_nian_sumfyp20',width:100">长期险年缴标保</th>
							<th data-options="field:'changxian_yue_sumfyp20',width:100">长期险月缴标保</th>
							<th data-options="field:'coefficient_changxian_sumfyp20',width:140">折算系数后长期险标保</th>
							<th data-options="field:'coefficient_changxian_nian_sumfyp20',width:160">折算系数后长期险年缴标保</th>
							<th data-options="field:'coefficient_changxian_yue_sumfyp20',width:160">折算系数后长期险月缴标保</th>
							<th data-options="field:'ylprem',width:70">医疗险保费</th>
							<th data-options="field:'jixiao',width:70">绩效</th>
							<th data-options="field:'cx_nian_fyp_ticheng',width:100">长期险年缴提成</th>
							<th data-options="field:'cx_yue_fyp_ticheng',width:100">长期险月缴提成</th>
							<th data-options="field:'yiliaoticheng',width:70">医疗险提成</th>
							<th data-options="field:'pushaward',width:80">宣传推动奖励</th>
							<th data-options="field:'buxianshi',width:70">限时奖励</th>


						</tr>
					</thead>
				</table>
				<br>
				<table class="common">
<!-- 
					  <tr>
						<td class="reprot_title_4"  style="width: 6%;"> 
							绩效合计
						</td>
						<td class="report_common_6">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>
						<td class="reprot_title_4">
							长期险年缴提成合计
						</td>
						<td class="report_common_6">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>

						<td class="reprot_title_4">
							长期险月缴提成合计
						</td>
						<td class="report_common_6">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>

						<td class="reprot_title_4">
							医疗险提成合计
						</td>
						<td class="report_common_6">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>

						<td class="reprot_title_4">
							宣传推动奖励合计
						</td>
						<td class="report_common_6">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>

						<td class="reprot_title_4">
							限时奖励合计
						</td>
						<td class="report_common_6">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>
					</tr>   -->


					<tr>
						<td class="reprot_title_4">
							单数合计
						</td>
						<td class="report_common_4">
							<input class="txt" id="policycount" name="policycount" readonly>
						</td>
						<td class="reprot_title_4">
							保费合计
						</td>
						<td class="report_common_4">
							<input class="txt" id="sumprem" name="sumprem" readonly>
						</td>
						<td class="reprot_title_4">
							标保合计
						</td>
						<td class="report_common_4">
							<input class="txt" id="sumfyp20" name="sumfyp20" readonly>
						</td>

						<td class="reprot_title_4">
							折算系数后标保合计
						</td>
						<td class="report_common_4">
							<input class="txt" id="coefficientsumfyp20" name="coefficientsumfyp20" readonly>
						</td>
					</tr>
				</table>
			</div>
		</body>

	</html>