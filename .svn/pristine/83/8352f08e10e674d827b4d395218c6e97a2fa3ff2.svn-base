<%@ page contentType="text/html;charset=utf-8"%>
<th data-options="field:'xbtime',width:80">续保日期</th>
<th data-options="field:'xubao_payendtime',width:80">续保止期</th>
<th data-options="field:'policyyear',width:60">续保年度</th>
<th data-options="field:'xbstatename',width:60">续保状态</th>
<th data-options="field:'callbacktypename',width:60">确认方式</th>
<th data-options="field:'xbpaytime',width:80,formatter:xbpayData" >实收日期</th>
<th data-options="field:'actualprem',width:60">实收保费</th>
<th data-options="field:'prem',width:60">上一年度保费</th>
<th data-options="field:'orgin_accepttime',width:120">首年出单日期</th>
<th data-options="field:'fincestatename',width:60"  hidden>结算状态</th>
<th data-options="field:'agentcom',width:70">出单营业部</th>
<th data-options="field:'teamname',width:100">出单团队</th>
<th data-options="field:'reusername',width:70">出单业务员</th>
<th data-options="field:'serviceusername',width:70">服务人员</th>
<th data-options="field:'xbcontno',width:180">新保单号</th>
<th data-options="field:'contno',width:180">原保单号</th>
<th data-options="field:'statename',width:60">保单状态</th>

<th data-options="field:'insrevisitstatename',width:60">回访状态</th>
<th data-options="field:'receiptstatename',width:60">回执状态</th>

<th data-options="field:'riskchannelname',width:80">签约渠道</th>
<th data-options="field:'insorganname',width:80">保险公司</th>
<th data-options="field:'riskname',width:160">险种名称</th>
<th data-options="field:'groupcode',width:90">保险产品编码</th>
<th data-options="field:'risktypename',width:80" hidden>险种类型</th>
<th data-options="field:'appname',width:70">投保人姓名</th>
<th data-options="field:'insname',width:70">被保人姓名</th>
<th data-options="field:'payintvvalue',width:60">缴费方式</th>
<th data-options="field:'payendyearvalue',width:60">缴费年期</th>
<th data-options="field:'insuyearvalue',width:60">保障期限</th>
<th data-options="field:'policy_download',width:60,formatter:policydownload">电子保单</th>
<th data-options="field:'_operate',width:60,formatter:queryPolicyInfo">查看详情</th>
<th data-options="field:'promise_xubaoname',width:60">保证续保</th>
<script>
function policydownload(val,row,index)
{
	if(row.policyurl!=null&&row.policyurl!='')
	{
		if(row.policyurl.indexOf("insure.meihualife.com")>0&&row.policyurl.endsWith("/"))
		{
			return '<a onclick = "disPolicyUrlDlg(\''+row.orderid+'\',\'' + row.contno + '\')">下载</a>';
		}
		else
		{
			// return '<a href="'+row.policyurl+'" target = "_blank">下载</a>';	
			return '<a onclick = "disPolicyUrlDlg(\'' + row.orderid + '\',\'' + row.contno + '\',\'' + row.policyurl + '\')">下载</a>';
		}
	}
}

function disPolicyUrlDlg(orderid,contno, policyurl) {
 
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

	function xbpayData(val,row,index){
		if(row.xbpaytime!=null&&row.xbpaytime!=''){
		return	row.xbpaytime.substring(0, 10)
		}else{
			return ''
		}
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







function queryPolicyInfo(val, row, index) {
	return '<a href="#" onclick="openDlg(' + index + ')">查看详情</a>';
}

function openDlg(index) {
	var rows = $('#policyList').datagrid('getRows'); //获取所有当前加载的数据行
	var row = rows[index];
	//alert(row.agentcom);
	
	row.disxubao = 'Y';
	row.queryinsured = 'Y';
	dispolicyDetailDlg(row);
}
</script>