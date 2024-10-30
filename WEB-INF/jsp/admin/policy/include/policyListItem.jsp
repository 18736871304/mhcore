<%@ page contentType="text/html;charset=utf-8"%>
<th data-options="field:'accepttime',width:125">出单日期</th>
<th data-options="field:'agentcom',width:70">出单营业部</th>
<th data-options="field:'teamname',width:100">出单团队</th>
<th data-options="field:'reusername',width:70">出单业务员</th>
<th data-options="field:'serviceusername',width:70">服务人员</th>

<th data-options="field:'contno',width:180">保单号</th>
<th data-options="field:'statename',width:60">保单状态</th>
<th data-options="field:'insrevisitstatename',width:60">回访状态</th>
<th data-options="field:'receiptstatename',width:60">回执状态</th>
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
		
<th data-options="field:'fyp20',width:60">标保</th>
<th data-options="field:'coefficientfyp20',width:60">折算系数后标保</th>
<th data-options="field:'activitychannelname',width:60">渠道类型</th>
<th data-options="field:'activityappname',width:60">流量来源</th>
<th data-options="field:'policy_download',width:60,formatter:policydownload">电子保单</th>
<th data-options="field:'_operate',width:60,formatter:queryPolicyInfo">查看详情</th>
<th data-options="field:'_isxubao',width:60,formatter:queryIsXbInfo">是否续保</th>

<script>

function queryIsXbInfo(val,row,index)
{
	if(row.isxubao!=null&&row.isxubao!='')
	{
		if(row.isxubao=='05')
		{
			return '<a href="#" onclick="disXbPolicyInfo(\''+row.orderid+'\')">是</a>';
		}
		else
		{
			return '否'
		}
	}
}

function disXbPolicyInfo(orderid)
{
	var tturl = "policy/getRe_Xb_Policy.do";
	
	var tParam = new Object();
	tParam.orderid = orderid;

	ajaxdeal(tturl, tParam, openPolicyDlg, null);
}

function openPolicyDlg(data)
{
	if(data.code!='0')
	{
		$.messager.alert('操作提示',data.msg,'error');
		return;
	}
	else
	{
		dispolicyDetailDlg(data.xbpolicyinfo);
	}
}

function policydownload(val,row,index)
{
	if(row.policyurl!=null&&row.policyurl!='')
	{
		if(row.policyurl.indexOf("insure.meihualife.com")>0&&row.policyurl.endsWith("/"))
		{
			return '<a onclick = "disPolicyUrlDlg(\''+row.orderid+'\')">下载</a>';
		}
		else
		{
			return '<a href="'+row.policyurl+'" target = "_blank">下载</a>';	
		}
	}
}

</script>	