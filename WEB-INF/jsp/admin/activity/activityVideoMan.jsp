<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>



<head>
	<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line7.css">

	<script>
		var inputList;
		var checkList;
		var doubleList;

		window.onload = function () {
			initDataGrid($('#activityvideolist'));

			disComBox($('#qsourcelevel'), "sourcelevle", null);
		}

		function aftercodeselect(comboxid) {}

		function selectone() {

		}

		function FileUpload() {
			ajaxFileUpload('filename', 'activity/activityVideoUpload.do', null, null, null, saveSuss);
			//上传完毕之后，把浏览框中的文本清除。
		}

		function clearCarData() {
			$('#textfield').val($('#filename').val());
			cleardata(inputList);
		}

		function saveSuss() {
			//clearInputData();
			$('#activityvideolist').datagrid('reload');
		}

		function clearInputData() {
			cleardata(inputList);
		}


		function articleVideoQuery() {
			var tturl = "activity/getActivityVideoList.do";

			var tParam = new Object();

			tParam.uploadStartDate = $('#qstartdate').datebox("getValue");
			tParam.uploadEndDate = $('#qenddate').datebox("getValue");

			tParam.accountid = $('#qaccountid').val();
			tParam.planid = $('#qplanid').val();
			tParam.videoname = $('#qvideoname').val();

			tParam.sourcelevel = $('#qsourcelevel').combobox('getValue');

			displayDataGrid($('#activityvideolist'), tParam, tturl);

			clearInputData();
		}

		function articleVideoDelete() {
			var row = $('#activityvideolist').datagrid('getSelected');
			if (row == null) {
				$.messager.alert('操作提示', '请选中要操作的数据！', 'error');
				return;
			}

			var tparam = new Object();
			tparam.videoserialno = row.videoserialno;

			ajaxdeal("activity/articleVideoDelete.do", tparam, null, null, saveSuss);
		}

		function dispageurl(val, row, index) {
			return '<a href="#" onclick="openpageurl(\'' + row.videourl + '\')">' + row.videourl + '</a>';
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
			width: 4%;
		}

		.combo {
			width: 95% !important;
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
					上传起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
				</td>

				<td class="reprot_title">
					上传止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
				</td>

				<td class="reprot_title">
					广告主ID
				</td>
				<td class="report_common">
					<input class="txt" name="qaccountid" id="qaccountid">
				</td>

				<td class="reprot_title">
					广告计划ID
				</td>
				<td class="report_common">
					<input class="txt" name="qplanid" id="qplanid">
				</td>

				<td class="reprot_title">
					广告视频名称
				</td>
				<td class="report_common">
					<input class="txt" name="qvideoname" id="qvideoname">
				</td>

				<td class="reprot_title">
					初始资源等级
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qsourcelevel"
						id="qsourcelevel">
					</select>
				</td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articleVideoQuery"
			onclick="articleVideoQuery()">查询</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="articleVideoDelete"
			onclick="articleVideoDelete()">删除</a>
		<a href="/upload/activity_video_upload.xls" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
			id="templete_download">模板下载</a>
		<br>
		<br>
		<table id="activityvideolist" class="easyui-datagrid" title="广告视频查询" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'accountid',width:115">广告主ID</th>
					<th data-options="field:'accountname',width:150">广告主名称</th>
					<th data-options="field:'planid',width:115">广告计划ID</th>
					<th data-options="field:'planname',width:200">广告计划名称</th>
					<th data-options="field:'videoname',width:230">广告视频名称</th>
					<th data-options="field:'videourl',width:250,formatter:dispageurl">广告视频链接</th>
					<th data-options="field:'sourcelevel',width:80,formatter:disSourceLevel">初始资源等级</th>
					<th data-options="field:'createname',width:70">上传人</th>
					<th data-options="field:'uploaddate',width:125">上传时间</th>
				</tr>
			</thead>
		</table>

		<br>
		<!-- 上传信息展示区域 -->
		<div class="upload-box">
			<input type='text' name='textfield' id='textfield' class='upload-txt' />
			<button id="file-view" class="smsbutton">浏览...</button>
			<input type="file" name="myfiles" class="upload-file" id="filename" size="28"
				onchange="document.getElementById('textfield').value=this.value.substr(12)" />
			<button id="file-upload" class="smsbutton" onclick="FileUpload()">上传</button>
		</div>

	</div>
</body>

</html>