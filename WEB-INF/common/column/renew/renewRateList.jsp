<%@ page contentType="text/html;charset=utf-8"%>
<th data-options="field:'renewmonth_start',width:80">应收起期</th>
<th data-options="field:'renewmonth_end',width:80">宽限期止期</th>
<th data-options="field:'riskchannelname',width:80">签约渠道</th>
<th data-options="field:'groupcode',width:90">保险产品编码</th>
<th data-options="field:'insorganname',width:80">保险公司</th>
<th data-options="field:'riskname',width:160">险种名称</th>
<th data-options="field:'policyyear',width:60">保单年度</th>
<th data-options="field:'callbacktypename',width:60">确认方式</th>
<th data-options="field:'policycount',width:60">应收单数</th>
<th data-options="field:'sumreprem',width:60">应收保费</th>
<th data-options="field:'paypolicycount',width:60">实收单数</th>
<th data-options="field:'sumrepayprem',width:60">实收保费</th>
<th data-options="field:'renewrate',width:70">当前继续率</th>
<th data-options="field:'_reportpolicy',width:60,formatter:reportpolicy">导出详情</th>
<script>
function reportpolicy(val,row,index)
{
	return '<a href="#" onclick="renewDownloadCall('+index+')">点击下载</a>';
}

function renewDownloadCall(index)
{
	var rows=$('#renewList').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	var tParam = getRenewQueryParam();
	tParam.riskchannel = row.riskchannel;
	tParam.insorgancode = row.insorgancode;
	tParam.mainriskcode = row.riskcode;
	tParam.policyyear = row.policyyear;
	tParam.renew_callbacktype = row.callbacktype;
	
	ajaxdeal('policy/renewPolicyListDownLoad.do', tParam, renewDownload, null);
}

function renewDownload(data)
{
	window.open('download.do?filename=' + data.message);
}
</script>