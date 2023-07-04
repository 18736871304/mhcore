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

		window.onload = function () {
			initDataGrid($('#activityarticleconfiglist'));

			disComBox($('#qchannel'), "source", null);

			disComBox($('#qpushplatform'), "pushplatform", null);
			disComBox($('#qpushpurpose'), "pushpurpose", null);

			disComBox($('#qsourcelevel'), "sourcelevle", null);
		}

		function aftercodeselect(comboxid) {}

		function selectone() {

		}

		function saveSuss() {
			clearInputData();
			$('#activityarticleconfiglist').datagrid('reload');
		}

		function clearInputData() {
			cleardata(inputList);
		}


		function articleConfigQuery() {
			var tturl = "activity/getArticleConfigList.do";

			var tParam = new Object();

			tParam.channel = $('#qchannel').combobox('getValue');
			tParam.pushplatform = $('#qpushplatform').combobox('getValue');
			tParam.pushpurpose = $('#qpushpurpose').combobox('getValue');
			tParam.sourcelevel = $('#qsourcelevel').combobox('getValue');

			displayDataGrid($('#activityarticleconfiglist'), tParam, tturl);

			clearInputData();
		}

		function dispageurl(val, row, index) {
			return '<a href="#" onclick="openpageurl(\'' + row.pageurl + '\')">' + row.pageurl + '</a>';
		}

		function openpageurl(pageurl) {
			if (pageurl != null && pageurl != '') {
				window.open(pageurl, '_blank',
					'width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
			}
		}

		function disSourceLevel(val, row, index) {
			if (val == 'A+') {
				return 'A理财';
			} else if (val == 'A') {
				return 'A重疾';
			} else {
				return val;
			}
		}
	</script>
	<!-- <style>
		table.common {
			width: 100%;
		}

		td.reprot_title {
			width: 7%;
		}

		td.report_common {
			width: 10%;
		}


		.combo .combo-text {
			width: 80% !important;
		}

		input.txt {
			width: 95%;
		}

		.combo-p {
		width: 13% !important;
	}

	.combo-panel {
		width: 90% !important;
		height: auto !important;
	}

		.combo-arrow {
			float: right;
		}

		.combo {
			width: 95% !important;
		}

		td.four_title {
			width: 14%;
		}
	</style> -->
</head>

<body>
	<div style="margin-left:0%">
		<table class="common">
			<tr>
				<td class="reprot_title">
					渠道类型
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qchannel" id="qchannel">
					</select>
				</td>

				<td class="reprot_title">
					推广平台
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qpushplatform"
						id="qpushplatform">
					</select>
				</td>

				<td class="reprot_title">
					推广目的
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qpushpurpose"
						id="qpushpurpose">
					</select>
				</td>

				<td class="reprot_title" style="width: 7%;">
					初始资源等级
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qsourcelevel"
						id="qsourcelevel">
					</select>
				</td>

				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articleConfigQuery"
			onclick="articleConfigQuery()">查询</a>
		<br>
		<br>
		<table id="activityarticleconfiglist" class="easyui-datagrid" title="推广页面查询" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'channelname',width:60">渠道类型</th>
					<th data-options="field:'pushplatform',width:60">推广平台</th>
					<th data-options="field:'pushtypename',width:60">推广方式</th>
					<th data-options="field:'pushpurposename',width:60">推广目的</th>
					<th data-options="field:'pagename',width:450">推广页面名称</th>
					<th data-options="field:'pageurl',width:450,formatter:dispageurl">推广页面链接</th>
					<th data-options="field:'sourcelevel',width:80,formatter:disSourceLevel">初始资源等级</th>
				</tr>
			</thead>
		</table>
	</div>
</body>

</html>