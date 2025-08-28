<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css">

			<script>

				window.onload = function () {
					$('#remarkDlg').dialog('close');
					policyDetailDlgInit();

					disComBox($('#qinsorgancode'), "insorgancode", null);

					$('#qapplystartdate').datebox('setValue', getMonthOneFormatDate());
					disComBox($("#sealchannel"), "channel", null);
					displayCombox($('#quwstate'), null, "/jsondata/order/uwstate.json", "dd_key", "dd_value");

					var tParam = new Object();
					tParam.comboxType = "uwtype";
					displayCombox($('#quwtype'), tParam, "/combox/getCommonComBox.do", "dd_key", "dd_value");

					initDataGrid20($('#orderPolicyList'));
				}

				function aftercodeselect(comboxid) {
					if (comboxid.attr("id") == "qinsorgancode") {
						var tParam = new Object();
						var codes = comboxid.combobox('getValues');

						// 判断是否为字母（包括大小写）
						const isLetter = /^[A-Za-z]+$/.test(codes[0]);
						// 判断是否为汉字
						const isChinese = /^[\u4e00-\u9fa5]+$/.test(codes[0]);
						if (isChinese) {
							codes.splice(0, 1); // 从索引 0 开始删除 1 个元素
							$("#qinsorgancode").combobox('setValue', codes);
						}

						var ic = "";
						ic = codes.join(",");
						tParam.insorgancode = ic;
						var tturl1 = "policy/getRiskListin.do";

						displayCombox($('#qriskcode'), tParam, tturl1, "dd_key", "dd_value");
					}
				}

				function selectone() {

				}

				function uwquery() {
					var tturl = "orderPolicy/getUwPollicyList.do";

					var tParam = new Object();

					tParam.applystartdate = $('#qapplystartdate').datebox("getValue");
					tParam.applyenddate = $('#qapplyenddate').datebox("getValue");

					tParam.uwtype = $('#quwtype').combobox('getValue');
					tParam.uwstate = $('#quwstate').combobox('getValue');

					var codes = $('#qinsorgancode').combobox('getValues');
					var ic = "";
					ic = codes.join(",");

					tParam.insorgancode = ic;

					var codess = $('#qriskcode').combobox('getValues');
					var icc = "";
					icc = codess.join(",");

					tParam.riskcode = icc;

					tParam.uwname = $('#quwname').val();
					tParam.mobile = $('#qmobile').val();
					tParam.sealchannel = $("#sealchannel").combobox("getValue");

					displayDataGrid20($('#orderPolicyList'), tParam, tturl);

					clearCarData();
				}

				function saveSuss() {
					$('#orderPolicyList').datagrid('reload');
				}

				function disremark(val, row, index) {
					if (row.type != null && row.type != '' && row.type == '02') {
						return '<a href="' + row.preuwurl + '" target = "_blank">' + row.preuwurl + '</a>';
					}
					else {
						return row.remark;
					}
				}
				function remarkText(val, row, index) {
					if (val != null) {
						try {
							const obj = JSON.parse(val);
							// 解析成功且是对象或数组
							if (obj.desc) {
								return obj.desc
							} else if (obj.reason) {
								return obj.reason
							} else if (obj.noticeList) {
								const questionDescs = [];
								obj.noticeList.forEach(notice => {
									notice.qas.forEach(qa => {
										if (qa.questionList && qa.questionList.length > 0) {
											qa.questionList.forEach(question => {
												if (question.questionDesc) {
													questionDescs.push(question.questionDesc);
												}
											});
										}
									});
								});
								return questionDescs.join(',')
							}
						} catch (e) {
							return val;
						}



					}
				}


				function queryPolicyInfo(val, row, index) {
					return '<a href="#" onclick="openDlg(' + index + ')">查看详情</a>';
				}

				function openDlg(index) {
					var rows = $('#orderPolicyList').datagrid('getRows'); //获取所有当前加载的数据行
					var row = rows[index];
					row.queryinsured = 'Y';
					dispolicyDetailDlg(row);
				}

				function uwurlEx(val, row, index) {

					var rows = $('#orderPolicyList').datagrid('getRows'); //获取所有当前加载的数据行
					var row = rows[index];
					// && row.uwstatename == "核保中"
					if (row.uwurl !== "" && row.uwurl != null && row.sealchannel == '10' ) {
						return '<a href="#" onclick="uwurlDlg(' + index + ', \'uwurlEx\')"  style="color: blue; cursor: pointer;" >复制</a>';
					} else {
						return ''
					}

				}
				// 13


				function uwurlCus(val, row, index) {

					var rows = $('#orderPolicyList').datagrid('getRows'); //获取所有当前加载的数据行
					var row = rows[index];
					if (row.uwurl !== "" && row.uwurl != null) {
						return '<a href="#" onclick="uwurlDlg(' + index + ', \'uwurlCus\')"  style="color: blue; cursor: pointer;" >复制</a>';

					} else {
						return ''
					}
				}

				function uwurlDlg(index, str) {
					var rows = $('#orderPolicyList').datagrid('getRows'); //获取所有当前加载的数据行
					var row = rows[index];
					// && row.sealchannel == '10'
					if (str == 'uwurlEx') {
						var uwurl = row.uwurl

						var url = new URL(uwurl);
						url.searchParams.set('vscene', '1');
						var newUrl = url.toString();
						copyText(newUrl)
					}
					if (str == "uwurlCus") {
						copyText(row.uwurl)
					}
				}




			</script>

		</head>
		<%@ include file="/WEB-INF/jsp/admin/order/uwpolicyDetailDlg.jsp" %>

			<body>
				<div style="margin-left:0%">
					<table class="common">
						<tr>
							<td class="reprot_title">
								申请起期
							</td>
							<td class="report_common">
								<input class="easyui-datebox" style="width: 90%" id="qapplystartdate"
									name="qapplystartdate">
							</td>

							<td class="reprot_title">
								申请止期
							</td>
							<td class="report_common">
								<input class="easyui-datebox" style="width: 90%" id="qapplyenddate"
									name="qapplyenddate">
							</td>

							<td class="reprot_title">
								核保类型
							</td>
							<td class="report_common">
								<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="quwtype"
									id="quwtype">
								</select>
							</td>

							<td class="reprot_title">
								人核状态
							</td>
							<td class="report_common">
								<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="quwstate"
									id="quwstate">
								</select>
							</td>


							<td class="reprot_title">签约渠道</td>
							<td class="report_common">
								<select class="easyui-combobox" style="width: 90%" name="sealchannel"
									id="sealchannel"></select>
							</td>




						</tr>
						<tr>


							<td class="reprot_title">
								保险公司
							</td>
							<td class="report_common">
								<input class="easyui-combobox" id="qinsorgancode" style="width:90%" name="qinsorgancode"
									data-options="valueField:'id',textField:'text',multiple:true">
							</td>

							<td class="reprot_title">
								险种名称
							</td>
							<td class="report_common">
								<input class="easyui-combobox" id="qriskcode" style="width:90%" name="qriskcode"
									data-options="valueField:'id',textField:'text',multiple:true">
							</td>

							<td class="reprot_title">
								客户姓名
							</td>
							<td class="report_common">
								<input class="txt" name="quwname" id="quwname">
							</td>

							<td class="reprot_title">
								电话号码
							</td>
							<td class="report_common">
								<input class="txt" name="qmobile" id="qmobile">
							</td>

							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<br>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="uwquery"
						onclick="uwquery()">查询</a>
					<br>
					<br>
					<table id="orderPolicyList" class="easyui-datagrid" title="人核信息" style="width:auto;height:auto;"
						data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
						<thead>
							<tr>
								<th data-options="field:'applyTime',width:125">申请时间</th>
								<th data-options="field:'auditTime',width:125">更新时间</th>



								<th
									data-options="field:'dealid',width:160,formatter:function(value,row,index){return value === '0' ? '' : value;}">
									订单号</th>
								<th data-options="field:'hcid',width:160">人核单号</th>
								<th data-options="field:'uwtypename',width:70">核保类型</th>
								<th data-options="field:'uwstatename',width:70">人核状态</th>
								<th data-options="field:'uwurl1',width:80,formatter:uwurlEx">顾问查看链接</th>
								<th data-options="field:'uwurl2',width:80,formatter:uwurlCus">转发客户链接</th>


								<th data-options="field:'insorganname',width:80">保险公司</th>
								<th data-options="field:'riskname',width:160">险种名称</th>

								<th data-options="field:'applyname',width:70">投保人姓名</th>
								<th data-options="field:'applycerttypeName',width:100" hidden>投保人证件类型</th>
								<th data-options="field:'applycert',width:130" hidden>投保人证件号码</th>

								<th data-options="field:'insCname',width:70">被保人姓名</th>
								<th data-options="field:'insCertTypeName',width:100" hidden>被保人证件类型</th>
								<th data-options="field:'insCert',width:130" hidden>被保人证件号码</th>



								<th data-options="field:'validendtime',width:125">有效截止时间</th>
								<th data-options="field:'insuwstatename',width:90" hidden>保司人核状态</th>


								<th data-options="field:'insuranceLink',width:600" hidden>投保链接</th>
								<th data-options="field:'isdeal',width:70" hidden>是否出单</th>
								<th data-options="field:'applymobile',width:80" hidden>电话号码</th>
								<th data-options="field:'applyemail',width:100" hidden>邮箱</th>

								<th data-options="field:'_operate',width:60,formatter:queryPolicyInfo">查看详情</th>

							</tr>
						</thead>
					</table>
					<br>
					<br>
				</div>


				<!-- <div id="remarkDlg" class="easyui-dialog" title="信息"
					style="width:700px;height:auto;padding:10px;top:10px" data-options="iconCls: 'icon-save'">
					<div id="remarkText">
					</div>
				</div> -->


			</body>

	</html>

	<!-- $('#remarkDlg').dialog('open').dialog('resize'); -->