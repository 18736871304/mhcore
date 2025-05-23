<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202004">
			<style>
				#pdfDig .panel .dialog-content {
					overflow: hidden;
				}
			</style>
			<script>
				var inputList;
				var checkList;

				window.onload = function () {
					$('#pdfDig').dialog('close');
					initDataGrid20($('#userList'));
					initDataGrid20($('#filelist'));

					inputList = [];

					checkList = [];

					initUserQuery("00,01,0001,02,0201,03,04,05,06")
					// initUserQuery("(00,01,0001,02,0201,03,04,05,06)")
					// initUserQuery("('00','01','0001','02','0201','03','04','05','06')")
					userDetailDlgInit();





				}

				function aftercodeselect(comboxid) {
					organAfterSelect(comboxid);
				}

				function selectone() {
					disFileList();




				}

				function selectonefile() {
					var row = $('#filelist').datagrid('getSelected');

					var url = encodeURIComponent('https://insure.meihualife.com/filedownload.do?fileid=')
					var pdfSrc = 'https://insure.meihualife.com/js/pdf/web/viewer.html?file=' + url + row.fileid;
					$("#imgSrc").attr("src", pdfSrc);
					$('#pdfDig').dialog('open');
				}

				function signdownload(val, row, index) {

					return '<a href="#" >预览</a>';
					// return '<a href="#" onclick="openPDFDlg(' + row.fileid + ')">预览</a>';

				}



				function disFileList() {
					var row = $('#userList').datagrid('getSelected');
					if (row == null) {
						return;
					}

					var tturl = "userMan/getFileList.do";

					var tparam = new Object();
					tparam.buzid = row.userid;

					displayDataGrid($('#filelist'), tparam, tturl);

					const timer = setInterval(() => {
						const dg = $('#filelist');
						var dataList = dg.datagrid('getRows')
						// 判断datagrid是否初始化且数据加载完成（有数据或无数据都算完成）
						if (dg.length && dg.datagrid('getRows').length >= 0) {
							$('#filelist').datagrid('loadData', dataList.reverse());
							clearInterval(timer);
							// callback();
						} else if (Date.now() - start > 5000) {
							clearInterval(timer);
							console.warn('等待datagrid加载超时');
						}
					}, 100);

				}



				function clearCarData() { }
			</script>

		</head>

		<body>
			<%@ include file="/WEB-INF/jsp/admin/user/userDetailDlg.jsp" %>
				<div style="margin-left:0%">
					<%@ include file="/WEB-INF/common/query/user/userCommonQuery.jsp" %>
						<br>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="userListQuery"
							onclick="userListQuery()">查询</a>
						<br>
						<br>
						<table id="userList" class="easyui-datagrid" title="人员信息" style="width:auto;height:auto"
							data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
							<thead>
								<tr>
									<%@ include file="/WEB-INF/common/column/organ/organList.jsp" %>
										<%@ include file="/WEB-INF/common/column/user/userList.jsp" %>
								</tr>
							</thead>
						</table>
						<br>
						<table id="filelist" class="easyui-datagrid" title="附件信息" style="width:560px;height:auto"
							data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonefile">
							<thead>
								<tr>
									<th data-options="field:'filename',width:450">文件名称</th>
									<th data-options="field:'signdownload',width:60,formatter:signdownload">操作</th>
								</tr>
							</thead>
						</table>
						<br>

						<div id="pdfDig" class="easyui-dialog" title="预览视图"
							style="width:820px;height:750px;padding:10px"
							data-options="iconCls:'icon-save',resizable:true,modal:true">
							<iframe src="" id="imgSrc" width="100%" height="100%"></iframe>
						</div>

				</div>
		</body>

	</html>