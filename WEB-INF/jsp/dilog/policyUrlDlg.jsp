<%@ page contentType="text/html;charset=utf-8"%>

<script>
	var policyUrl_orderid;

	function policyUrlDlgInit() {
		$('#policyUrlDlg').dialog('close');

		initDataGrid($('#dlgpolicyurllist'));
	}

	function disPolicyUrlDlg(orderid) {
		policyUrl_orderid = orderid;
		policyUrlDlgquery();
		$('#policyUrlDlg').dialog('open');
	}

	function policyUrlDlgquery() {
		if (policyUrl_orderid == null) {
			$.messager.alert('Debug信息', '未进行弹出框初始化！', 'error');
			return;
		}

		var tturl = "policy/getPolicyUrlList.do";

		var tParam = new Object();

		tParam.orderid = policyUrl_orderid;

		displayDataGrid($('#dlgpolicyurllist'), tParam, tturl);
	}

	function dlg_policydownload(val, row, index) {
		if (row.policyurl != null && row.policyurl != '') {
			// return '<a href="'+row.policyurl+'" target = "_blank">下载</a>';	
			return '<a onclick = "disPolicyUrlDlg(\'' + row.orderid + '\',\'' + row.contno + '\',\'' + row.policyurl + '\')">下载</a>';
		}
	}

	function disPolicyUrlDlg(orderid, contno,policyurl) {

		var tturl = '/policy/policyDownLoad.do'
		var tParam = {
			orderid: orderid,
			contno:contno
		}
		httpRequest(tturl, 'post', tParam, {
			success: function (res) {
				console.log(res)
				if (res.code == '0' && res.policyUrl && res.policyUrl != '') {
					if (res.policyUrl.startsWith('/opt/ps2')) {
  res.policyUrl = res.policyUrl.replace('/opt/ps2', 'https://insure.meihualife.com');
}
					let a = document.createElement('a')
					a.target = '_blank';
					a.href = res.policyUrl;
					a.click();
				} else {
					let a = document.createElement('a')
					a.target = '_blank';
					a.href = policyurl;
					a.click();
				}
			}
		})

	}

	 
	function httpRequest(url, method, data, fnObj) {
		$.ajax({
			url: url,
			type: method,
			data: data,
			dataType: 'json',
			timeout: 15000,
			beforeSend: function () {
				// $.showLoading("加载中...")
				if (fnObj.beforeSend) {
					fnObj.beforeSend()
				}
			},
			complete: function (xhr, status) {
				// $.hideLoading()
				if (status === 'timeout') {
					console.log('api time out')
				}
				if (fnObj.complete) {
					fnObj.complete(status)
				}
			},
			success: function (res) {
				// $.hideLoading()
				if (fnObj.success) {
					fnObj.success(res)
				}
			},
			error: function (error) {
				// $.hideLoading()
				console.log(error)
				if (fnObj.error) {
					fnObj.error(error)
				}
			}
		})
	}




</script>

<div id="policyUrlDlg" class="easyui-dialog" title="保单下载" style="width:520px;height:500px;padding:10px;top:90px"
	data-options="iconCls: 'icon-save',">

	<br>
	<table id="dlgpolicyurllist" class="easyui-datagrid" title="电子保单信息" style="width:480px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true">
		<thead>
			<tr>
				<th data-options="field:'dlg_policy_download',width:400,formatter:dlg_policydownload"">电子保单</th>
				</tr>
			</thead>
		</table>
		
</div>