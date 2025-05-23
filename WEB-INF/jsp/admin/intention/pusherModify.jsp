<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
	<script>
		var inputList;
		var checkList;
		var pushchannel = '${pushchannel}';

		window.onload = function () {
			if (pushchannel != '0003') {
				$(".zhubo").hide()
				$('#pusherList').datagrid('hideColumn', 'appname')
				$('#pusherList').datagrid('hideColumn', 'channelname')
			}

			if (pushchannel != '0001') {
				$(".activitystate").hide()
			}

			dlgUserInit();
			initDataGrid($('#pusherList'));

			disComBox($('#source'), "source", null);
			disComBox($('#qsource'), "source", null);

			disComBox($('#qchannel'), "source", null);
			disComBox($('#channel'), "source", null);

			inputList = [
				$('#oldusercode'),
				$('#oldordernum'),
				$('#usercode'),
				//$('#source'),
				$('#ordernum'),
				$('#pushcount'),
				$('#pushcount_aplus'),
				$('#remark'),
				$('#channel'),
				$('#appname'),
			];
			checkList = [
				$('#usercode'),
				$('#ordernum'),
				$('#pushcount'),
				$('#pushcount_aplus'),
			];

			if (pushchannel == '0003') {
				checkList = [
					$('#channel'),
					$('#appname'),
					$('#usercode'),
					$('#ordernum'),
					$('#pushcount'),
					$('#pushcount_aplus'),
				];
			}

			checkList_batch = [
				$('#pushcount'),
				$('#pushcount_aplus'),
			];

			$('#qsource').combobox('setValue', pushchannel);
			$('#source').combobox('setValue', pushchannel);
			$('#remark').val("");

			init02Org();
			setRowsHeight(36);

			pusherquery();
			getActivityState();
		}

		function setRowsHeight(height) {
			var aa = $("td[field=pushcount] div:first");
			if (aa != null) {
				aa.css("height", height);
			}

			aa = $("td[field=pushcount_aplus] div:first");
			if (aa != null) {
				aa.css("height", height);
			}

			aa = $("td[field=pushcount_sum] div:first");
			if (aa != null) {
				aa.css("height", height);
			}
		}

		function aftercodeselect(comboxid) {
			if (comboxid.attr("id") == "channel") {
				var tParam = new Object();
				tParam.comboxType = 'sourcedetail_' + comboxid.combobox('getValue');

				var tturl = "activity/getSourceDetail.do";
				displayCombox($('#appname'), tParam, tturl, "dd_value", "dd_value");
			} else if (comboxid.attr("id") == "qchannel") {
				var tParam = new Object();
				tParam.comboxType = 'sourcedetail_' + comboxid.combobox('getValue');

				var tturl = "activity/getSourceDetail.do";
				displayCombox($('#qappname'), tParam, tturl, "dd_value", "dd_value");
			} else if (comboxid.attr("id") == "qsource") {
				pusherquery();
			} else {
				organAfterSelect(comboxid);
			}
		}

		function selectone() {
			var row = $('#pusherList').datagrid('getSelected');
			$('#oldusercode').val(row.usercode);
			$('#oldordernum').val(row.ordernum);
			$('#usercode').val(row.usercode);
			$('#userid').val(row.userid);
			$('#username').val(row.username);

			$('#ordernum').val(row.ordernum);
			$('#pushcount').val(row.pushcount);
			$('#pushcount_aplus').val(row.pushcount_aplus);

			$('#pushid').val(row.pushid);
			$('#remark').val(row.remark);

			$('#source').combobox('setValue', row.source);

			$('#channel').combobox('setValue', row.channel);
			$('#appname').combobox('setValue', row.appname);
		}

		function pusherquery() {
			var tturl = "push/getPushturunCtlList.do";

			var tParam = new Object();

			tParam.channel = $('#qchannel').combobox('getValue');
			tParam.appname = $('#qappname').combobox('getValue');
			tParam.source = $('#qsource').combobox('getValue');

			tParam.q02org = $('#q02org').combobox('getValue');
			tParam.q03org = $('#q03org').combobox('getValue');
			tParam.q04org = getOrgan04Code();

			tParam.teamid = getQTeamId();
			tParam.deleteflag = 'N';
			tParam.yearMonth = '2020-09';

			displayDataGrid($('#pusherList'), tParam, tturl);

			var pushCount_url = "push/getPushturunCount.do";

			ajaxdeal(pushCount_url, tParam, displaysumdata, null);

			setRowsHeight(36);
			clearCarData();
		}

		function displaysumdata(data) {
			if (data == null || data == "") {
				$('#maxpushcount').val("");
				$('#maxpushcount_a').val("");
				$('#maxpushcount_aplus').val("");
			} else {
				$('#maxpushcount').val(Number(data.sumpushcount_a) + Number(data.sumpushcount_aplus));
				$('#maxpushcount_a').val(data.sumpushcount_a);
				$('#maxpushcount_aplus').val(data.sumpushcount_aplus);
			}
		}

		function saveSuss() {
			clearCarData();
			$('#pusherList').datagrid('reload');
		}

		function clearCarData() {
			cleardata(inputList);
			$('#userid').val("");
			$('#username').val("");
			$('#appname').combobox('setValue', '');
		}

		function pusherEdit() {
			var row = $('#pusherList').datagrid('getSelected');

			if (row == null) {
				$.messager.alert('操作提示', '请选中要修改的数据！', 'error');
				return;
			}
			var oldusercode = $('#oldusercode').val();
			var usercode = $('#usercode').val();

			if (!checknotnull(checkList)) {
				return;
			}
			if (oldusercode != null && usercode != null && usercode != oldusercode) {
				$.messager.alert('操作提示', '不能修改业务员工号！', 'error');
				return;
			}

			var tparam = prepareparam(inputList);
			tparam.userid = $('#userid').val();
			tparam.pushid = $('#pushid').val();
			ajaxdeal("push/pushturunCtlUpdate.do", tparam, null, null, saveSuss);
		}

		function pusherEdit_Batch() {
			var rows = $('#pusherList').datagrid('getSelections');

			if (rows.length <= 0) {
				$.messager.alert('操作提示', '请选中要操作的数据！', 'error');
				return;
			}

			var pushidStr = "";

			for (var i = 0; i < rows.length; i++) {
				pushidStr = pushidStr + rows[i].pushid;

				if (i != rows.length - 1) {
					pushidStr = pushidStr + ",";
				}
			}

			if (!checknotnull(checkList_batch)) {
				return;
			}

			var tparam = new Object();

			tparam.pushidStr = pushidStr;
			tparam.pushcount = $('#pushcount').val();
			tparam.pushcount_aplus = $('#pushcount_aplus').val();

			ajaxdeal("push/pushturunUpdate_batch.do", tparam, null, null, saveSuss);
		}

		function pusherInsert() {
			if (!checknotnull(checkList)) {
				return;
			}
			var tparam = prepareparam(inputList);
			tparam.source = $('#source').combobox('getValue');
			tparam.userid = $('#userid').val();

			ajaxdeal("push/pushturunCtlInsert.do", tparam, null, null, saveSuss);
		}

		function pusherDelete() {
			var row = $('#pusherList').datagrid('getSelected');

			if (row == null) {
				$.messager.alert('操作提示', '请选中要修改的数据！', 'error');
				return;
			}

			var tparam = prepareparam(inputList);
			tparam.pushid = $('#pushid').val();

			$.messager.alert('操作提示', '确认要删除吗？', 'question', function () {
				ajaxdeal("push/pushturunCtlDelete.do", tparam, null, null, saveSuss);

			});
		}

		function dealorgan(organcode) {}

		function pushsum(val, row, index) {
			return row.pushcount + row.pushcount_aplus;
		}

		function checkauto() {
			var checkauto = document.getElementById("checkauto").checked
			var checkhead = document.getElementById("checkhead").checked
			if (checkauto == true) {
				$("#checkhead").prop('checked', false);
			}
			var parm = {
				activitystate: 'Y'
			}
			sendRequest("/activity/updateActivityState.do", parm, function (dataPath) {
				console.log('使用自动分配' + dataPath)
				if (JSON.parse(dataPath).code == '0') {
					$.messager.alert('操作提示', '使用自动分配成功！', 'info');
				}
			})

		}

		function checkhead() {
			var checkauto = document.getElementById("checkauto").checked
			var checkhead = document.getElementById("checkhead").checked
			if (checkhead == true) {
				$("#checkauto").prop('checked', false);
			}
			var parm = {
				activitystate: 'N'
			}
			sendRequest("/activity/updateActivityState.do", parm, function (dataPath) {
				console.log('使用手动分配' + dataPath)
				if (JSON.parse(dataPath).code == '0') {
					$.messager.alert('操作提示', '使用手动分配成功！', 'info');
				}

			})
		}



		function getActivityState() {
			sendRequest("./activity/getActivityState.do", '', function (dataPath) {
				console.log(JSON.parse(dataPath))
				console.log(JSON.parse(dataPath).activitystate == "N")
				if (JSON.parse(dataPath).activitystate == "N") {
					$("#checkauto").prop('checked', false);
					$("#checkhead").prop('checked', true);
				}
				if (JSON.parse(dataPath).activitystate == "Y") {
					$("#checkhead").prop('checked', false);
					$("#checkauto").prop('checked', true);
				}
			})
		}



		function sendRequest(url, data, success, error) {
			$.ajax({
				url: url,
				type: "post",
				async: true,
				data: data ? data : {},
				beforeSend: function () {
					$(".loading").show();
				},
				success: function (data) {
					$(".loading").hide();
					if (success) {
						success(data);
					}
				},
				error: function (data) {
					if (error) {
						error(data);
					}
				},
				complete: function () {
					$(".loading").hide();
				}
			});
		}
	</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>

<body>

	<table class="common">
		<tr class="activitystate">
			<td class="reprot_title" style="width: 10%;">
				本部使用自动分配
			</td>
			<td class="report_common">
				<input type="checkbox" id='checkauto' onchange="checkauto()" style="zoom: 160%;margin: 0 4px;">
			</td>

			<td class="reprot_title" style="width: 10%;">
				本部使用手动分配
			</td>
			<td class="report_common">
				<input type="checkbox" id='checkhead' onchange="checkhead()" style="zoom: 160%;margin: 0 4px;">
			</td>
		</tr>
		<tr class="zhubo">
			<td class="reprot_title">
				渠道类型
			</td>
			<td class="report_common">
				<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
			<td class="reprot_title">
				流量来源
			</td>
			<td class="report_common">
				<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qappname" id="qappname">
				</select>
			</td>
		</tr>
		<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
		<tr hidden>
			<td class="reprot_title">
				渠道筛选
			</td>
			<td class="report_common">
				<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qsource" id="qsource">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="pusherquery"
		onclick="pusherquery()">查询</a>
	<br>
	<br>
	<div style="margin-left:0%">
		<table id="pusherList" class="easyui-datagrid" title="热线分配规则" style="width:auto;height:auto"
			data-options="rownumbers:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th field="ck" checkbox="true"></th>
					<th data-options="field:'organ02name',width:70">所属省公司</th>
					<th data-options="field:'organname',width:70">所属分公司</th>
					<th data-options="field:'agentcom',width:70">所属营业部</th>
					<th data-options="field:'teamname',width:100">所属团队</th>

					<th data-options="field:'channelname',width:70">渠道类型</th>
					<th data-options="field:'appname',width:100">流量来源</th>
					<th data-options="field:'usercode',width:70">业务员编号</th>
					<th data-options="field:'usergradename',width:90">职能级别</th>
					<th data-options="field:'username',width:70">业务员姓名</th>

					<th data-options="field:'ordernum',width:50">排序</th>

					<th data-options="field:'pushcount',width:75">日推送数量<br />（A重疾）</th>
					<th data-options="field:'pushcount_aplus',width:75">日推送数量<br />（A理财）</th>

					<th data-options="field:'pushcount_sum',width:75,formatter:pushsum">日推送数量<br />合计</th>

					<th data-options="field:'isonline',width:60">是否在线</th>

					<th data-options="field:'lastonlinetime',width:125">最新上线时间</th>
					<th data-options="field:'lastofflinetime',width:125">最新下线时间</th>

					<th data-options="field:'remark',width:300">备注</th>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr hidden="">
				<td class="reprot_title_4">
					渠道
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="source" id="source"
						notnull="渠道">
					</select>
				</td>
			</tr>

			<tr>
				<td class="reprot_title_4">
					日推送数量合计（A重疾）
				</td>
				<td class="report_common_4">
					<input class="txt" name="maxpushcount_a" id="maxpushcount_a">
				</td>

				<td class="reprot_title_4">
					日推送数量合计（A理财）
				</td>
				<td class="report_common_4">
					<input class="txt" name="maxpushcount_aplus" id="maxpushcount_aplus">
				</td>

				<td class="reprot_title_4">
					日推送数量合计
				</td>
				<td class="report_common_4">
					<input class="txt" name="maxpushcount" id="maxpushcount">
				</td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>

			<tr class="zhubo">
				<td class="reprot_title_4">
					渠道类型
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="channel" id="channel"
						notnull=" 渠道类型">
					</select>
				</td>

				<td class="reprot_title_4">
					流量来源
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="appname" id="appname"
						notnull="流量来源">
					</select>
				</td>
			</tr>
			<tr>
				<input class="txt" name="oldusercode" hidden="hidden" readonly="readonly" id="oldusercode">
				<input class="txt" name="oldordernum" hidden="hidden" readonly="readonly" id="oldordernum">
				<td class="reprot_title_4">
					业务员姓名
				</td>
				<td class="report_common_4">
					<input readonly="readonly" class="txt" name="username" id="username" notnull="业务员姓名"
						onclick="disuUserDlg($('#usercode'),$('#userid'),$('#username'));">

					<input type='hidden' class="txt" id='usercode' notnull="业务员姓名">
					<input type='hidden' id='userid'>

					<input type='hidden' id='pushid'>
				</td>
				<td class="reprot_title_4">
					排序
				</td>
				<td class="report_common_4">
					<input class="txt" name="ordernum" id="ordernum" maxlength="10" notnull="排序">
				</td>

				<td class="reprot_title_4">
					日推送数量（A重疾）
				</td>
				<td class="report_common_4">
					<input class="txt" name="pushcount" id="pushcount" maxlength="10" notnull="日推送数量（A重疾）">
				</td>

				<td class="reprot_title_4">
					日推送数量（A理财）
				</td>
				<td class="report_common_4">
					<input class="txt" name="pushcount_aplus" id="pushcount_aplus" maxlength="10" notnull="日推送数量（A理财）">
				</td>
			</tr>
			<tr>
				<td class="reprot_title_4">
					备注
				</td>
				<td class="report_common_4" colspan="3">
					<textarea notnull="备注" class="txt" style="width: 600px;height: 75px;" id="remark" name="remark">
				</textarea>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="pusherEdit"
			onclick="pusherEdit()">保存</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="pusherEdit_Batch"
			onclick="pusherEdit_Batch()">批量保存</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="pusherInsert"
			onclick="pusherInsert()">新增</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="pusherDelete"
			onclick="pusherDelete()">删除</a>
	</div>
</body>

</html>