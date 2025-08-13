<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
			<script>

				window.onload = function () {
					policyDetailDlgInit();

					initDataGrid20($('#orderPolicyList'));

					$('#qorderstratdate').datebox('setValue', getSevenDaysAgo());

					disComBox($("#sealchannel"), "channel", null);

					displayCombox($('#qstate'), null, "/jsondata/order/orderstate.json", "dd_key", "dd_value");
				}

				function aftercodeselect(comboxid) {
				}

				function selectone() {

				}

				function orderquery() {
					var tturl = "orderPolicy/getOrderPollicyList.do";

					var tParam = new Object();
					//todo  还差加条件
					tParam.orderstratdate = $('#qorderstratdate').datebox("getValue");
					tParam.orderenddate = $('#qorderenddate').datebox("getValue");
					tParam.orderid = $('#qorderid').val();
					tParam.state = $('#qstate').combobox('getValue');

					tParam.username = $('#qusername').val();
					tParam.insorganname = $('#qinsorganname').val();
					tParam.riskname = $('#qriskname').val();
					tParam.cusname = $('#qcusname').val();
					tParam.cusmobile = $('#qcusmobile').val();
					tParam.sealchannel = $("#sealchannel").combobox("getValue");



					console.log(tParam)
					displayDataGrid20($('#orderPolicyList'), tParam, tturl);

					clearCarData();
				}

				function saveSuss() {
					$('#orderPolicyList').datagrid('reload');
				}

				function queryPolicyInfo(val, row, index) {
					return '<a href="#" onclick="openDlg(' + index + ')">查看详情</a>';
				}

				function openDlg(index) {
					var rows = $('#orderPolicyList').datagrid('getRows');//获取所有当前加载的数据行
					var row = rows[index];

					//alert(row.agentcom);

					dispolicyDetailDlg(row);
				}

				function disStateName(val, row, index) {
					if (row.state == '70' || row.state == '72' || row.state == '76') {
						return '已退款'
					}
					else {
						return row.statename;
					}
				}

				function dis_payurl(val, row, index) {
					if (row.sealchannel == '13' && row.state!='40') {
						// 如果已经请求过，直接返回 payurl
						if (row.payurl && row.payurl !== '加载中...') {
							return row.payurl;
						}

						// 标记为加载中，避免重复请求
						if (row.payurl !== '加载中...') {
							row.payurl = '加载中...';

							var tParam = {
								orderid: row.orderid,
								sealchannel: row.sealchannel
							};
							var queryurl = "policy/gethzpayurl.do";
							setTimeout(() => {
								ajaxdeal(queryurl, tParam, function (data) {
									var newPayurl = data.payurl || '';
									// 更新当前行数据
									$('#orderPolicyList').datagrid('updateRow', {
										index: index,
										row: {
											payurl: newPayurl
										}
									});
								}, null);
							}, 0);
						}

						return '加载中...';
					} else {
						return val;
					}
				}
 
			</script>

		</head>
		<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp" %>

			<body>
				<div style="margin-left:0%">
					<table class="common">
						<tr>
							<td class="reprot_title">
								订单起期
							</td>
							<td class="report_common">
								<input class="easyui-datebox" style="width: 90%" id="qorderstratdate"
									name="qorderstratdate" notnull="出单起期">
							</td>

							<td class="reprot_title">
								订单止期
							</td>
							<td class="report_common">
								<input class="easyui-datebox" style="width: 90%" id="qorderenddate" name="qorderenddate"
									notnull="出单止期">
							</td>

							<td class="reprot_title">
								订单号
							</td>
							<td class="report_common">
								<input class="txt" name="qorderid" id="qorderid">
							</td>

							<td class="reprot_title">
								订单状态
							</td>
							<td class="report_common">
								<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qstate"
									id="qstate">
								</select>
							</td>

							<td class="reprot_title">签约渠道</td>
							<td class="reprot_common">
								<select class="easyui-combobox" style="width: 160%" name="sealchannel"
									id="sealchannel"></select>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="reprot_title">
								业务员姓名
							</td>
							<td class="report_common">
								<input class="txt" name="qusername" id="qusername">
							</td>



							<td class="reprot_title">
								保险公司
							</td>
							<td class="report_common">
								<input class="txt" name="qinsorganname" id="qinsorganname">
							</td>

							<td class="reprot_title">
								险种名称
							</td>
							<td class="report_common">
								<input class="txt" name="qriskname" id="qriskname">
							</td>

							<td class="reprot_title">
								客户姓名
							</td>
							<td class="report_common">
								<input class="txt" name="qcusname" id="qcusname">
							</td>

							<td class="reprot_title">
								电话号码
							</td>
							<td class="report_common">
								<input class="txt" name="qcusmobile" id="qcusmobile">
							</td>

							<td></td>
							<td></td>
						</tr>
					</table>
					<br>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="orderquery"
						onclick="orderquery()">查询</a>
					<br>
					<br>
					<table id="orderPolicyList" class="easyui-datagrid" title="订单信息" style="width:auto;height:auto"
						data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
						<thead>
							<tr>
								<th data-options="field:'ordertime',width:125">订单日期</th>
								<!-- <th data-options="field:'organ04name',width:70">所属营业部</th>
			<th data-options="field:'teamname',width:100">所属团队</th>
			<th data-options="field:'reusername',width:70">所属业务员</th> -->
								<th data-options="field:'orderid',width:160">订单号</th>
								<th data-options="field:'policystate',width:60,formatter:disStateName">订单状态</th>
								<th data-options="field:'payurl',width:180,formatter:dis_payurl">支付链接</th>

								<th data-options="field:'payendtime',width:120">支付截止时间</th>
								<th
									data-options="field:'payment',width:80,formatter:function(value,row,index){return value === '0' ? '' : value;}">
									支付金额</th>
								<th data-options="field:'payerrormsg',width:120">支付失败原因</th>

								<th data-options="field:'insorganname',width:80">保险公司</th>
								<th data-options="field:'riskname',width:160">险种名称</th>
								<th data-options="field:'appname',width:70">投保人姓名</th>
								<th data-options="field:'appprovincename',width:70">投保人所在省</th>
								<th data-options="field:'appcityname',width:70">投保人所在市</th>
								<th data-options="field:'insname',width:70">被保人姓名</th>
								<th data-options="field:'payintvvalue',width:60">缴费方式</th>
								<th data-options="field:'payendyearvalue',width:60">缴费年期</th>
								<th data-options="field:'insuyearvalue',width:60">保障期限</th>
								<th data-options="field:'prem',width:60">保费</th>
								<!-- <th data-options="field:'_operate',width:60,formatter:queryPolicyInfo">查看详情</th> -->
							</tr>
						</thead>
					</table>
					<br>
					<br>
				</div>
			</body>

	</html>