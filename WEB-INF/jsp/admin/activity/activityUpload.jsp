<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>
<head>
	<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
	<script>
		var inputList;
		var checkList;

		window.onload = function () {
			initDataGrid20($('#activitylist'));

			inputList = [
				$('#sourcelevel'),
				$('#channel')
			];

			checkList = [
				$('#sourcelevel'),
				$('#channel')
			];

			disComBox($('#organcode'),"crmsysterm",null);
			disComBox($('#channel'), "source_upload", null);
			disComBox($('#qchannel'), "source_upload", null);
			disComBox($('#sourcelevel'), "hotline_sourcelevle", null);
			disComBox($('#qinitSourceLevel'), "hotline_sourcelevle", null);

			$('#qstartdate').datebox('setValue', getMonthOneFormatDate());
		}

		function aftercodeselect(comboxid) {

		}

		function selectone() {}

		function FileUpload() {
			if (!checknotnull(checkList)) {
				return;
			}

			var tparam = prepareparam(inputList);

			tparam.updatetosea = '02';
			if($('#updatetosea').attr('checked')=="checked")
			{
				tparam.updatetosea = '01';
				if($('#organcode').combobox('getValue')==null||$('#organcode').combobox('getValue')=='')
				{
					$.messager.alert('操作提示','选择了上传到公海，需要选择CRM系统','error');
					return;
				}
				tparam.organcode = $('#organcode').combobox('getValue');
			}
			
			ajaxFileUpload('filename', 'activity/activityUpload.do', tparam, null, null, saveSuss);
			//上传完毕之后，把浏览框中的文本清除。
		}

		function saveSuss() {
			clearCarData()
			$('#activitylist').datagrid('reload');
		}

		function clearCarData() {
			$('#textfield').val($('#filename').val());
			$('#updatetosea').prop("checked",false);
			$('#organcode').combobox('setValue',"");
			cleardata(inputList);
		}

		function activityquery() {
			var tturl = "activity/getActivity20190824List20.do";

			var tParam = new Object();

			tParam.queryflag = '02';
			tParam.uploadflag = 'Y';

			tParam.channel = $('#qchannel').combobox('getValue');
			tParam.uploadStartDate = $('#qstartdate').datebox("getValue");
			tParam.uploadEndDate = $('#qenddate').datebox("getValue");

			tParam.initSourceLevel = $('#qinitSourceLevel').combobox('getValue');

			displayDataGrid20($('#activitylist'), tParam, tturl);
		}

		function dispageurl(val, row, index) {
			return '<a href="#" onclick="openpageurl(\'' + row.channel + '\',\'' + row.pagetype + '\',\'' + row.planid +
				'\',\'' + row.pageurl + '\')">' + row.pagename + '</a>';
		}

		function openpageurl(channel, pagetype, planid, pageurl) {
			if (pageurl != null && pageurl != '') {
				window.open(pageurl, '_blank',
					'width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
			}
		}

		function calhours(val, row, index) {
			var afterDate = new Date(row.uploaddate);
			var beforeDate = new Date(row.makedate);

			var difTime = afterDate.getTime() - beforeDate.getTime();

			var difhours = Math.floor(difTime / 1000 / 3600);

			return difhours;
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

		function getMonthOneFormatDate() {
			var date = new Date();

			var seperator1 = "-";
			var year = date.getFullYear();
			var month = date.getMonth() + 1;

			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}

			var currentdate = year + seperator1 + month + seperator1 + "01";
			return currentdate;
		}
	</script>
</head>

<body>
	<div style="margin-left:0%">
		<table class="common" style="width: 68%;">
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
					初始资源等级
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qinitSourceLevel"
						id="qinitSourceLevel">
					</select>
				</td>
				<td class="reprot_title">
					渠道类型
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width: 90%" panelHeight="auto" name="qchannel" id="qchannel">
					</select>
				</td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="userwxquery"
			onclick="activityquery()">查询</a>
		<a href="/upload/activity_upload.xls" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
			id="templete_download">模板下载</a>
		<br>
		<br>
		<table id="activitylist" class="easyui-datagrid" title="热线手动上传" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'uploaddate',width:125">上传时间</th>
					<th data-options="field:'makedate',width:125">线索产生时间</th>
					<th data-options="field:'diffhours',width:60,formatter:calhours">上传时效</th>
					<th data-options="field:'createname',width:70">上传人</th>

					<th data-options="field:'name',width:70">客户姓名</th>
					<th data-options="field:'mobile',width:85">电话号码</th>
					<th data-options="field:'wxno',width:85">微信号</th>
					<th data-options="field:'initSourceLevel',width:60,formatter:disSourceLevel">初始资源等级</th>

					<th data-options="field:'channelname',width:60">渠道类型</th>

					<th data-options="field:'accountid',width:115">广告主ID</th>
					<th data-options="field:'accountname',width:150">广告主名称</th>

					<th data-options="field:'planid',width:115">广告计划ID</th>
					<th data-options="field:'planname',width:200">广告计划名称</th>

					<th data-options="field:'area',width:90">自动定位地址</th>
					<th data-options="field:'clue_sourcename',width:60">线索来源</th>
					<th data-options="field:'appname',width:60">流量来源</th>

					<th data-options="field:'clueid',width:135">线索ID</th>

					<th data-options="field:'module_id',width:115">组件ID</th>
					<th data-options="field:'module_name',width:135">组件名称</th>

					<th data-options="field:'pageurl',width:150">推广页面</th>
					<th data-options="field:'remark',width:150">备注</th>


				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr>
				<td class="reprot_title_4">
					初始资源等级
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="sourcelevel"
						id="sourcelevel">
					</select>
				</td>
				<td class="reprot_title_4">
					渠道类型
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="channel" id="channel"
						notnull="渠道类型">
					</select>
				</td>
				
				<td></td><td></td>
				<td></td><td></td>
			</tr>
			
			<tr>
				<td class = "reprot_title_4">
					上传到公海
				</td>
				<td class = "report_common_4">
					<input type="checkbox" id = 'updatetosea'>
				</td>
				<td class = "reprot_title_4">
					CRM系统
				</td>
				<td class = "report_common_4">
					<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="organcode" id="organcode">
					</select>
				</td>
			</tr>
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
		<br>
		<font color="red">上传时间必须自线索产生时间7天以内
		</font>
	</div>
</body>

</html>