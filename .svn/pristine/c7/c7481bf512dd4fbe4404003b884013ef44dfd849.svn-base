<%@ page contentType="text/html;charset=utf-8"%>

<script>

var policyUrl_orderid;

function policyUrlDlgInit()
{
	$('#policyUrlDlg').dialog('close');	
	
	initDataGrid($('#dlgpolicyurllist'));
}

function disPolicyUrlDlg(orderid)
{
	policyUrl_orderid = orderid;
	policyUrlDlgquery();
	$('#policyUrlDlg').dialog('open');
}

function policyUrlDlgquery()
{
	if(policyUrl_orderid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "policy/getPolicyUrlList.do";
	
	var tParam = new Object();
	
	tParam.orderid = policyUrl_orderid;
	
	displayDataGrid($('#dlgpolicyurllist'),tParam,tturl);
}

function dlg_policydownload(val,row,index)
{
	if(row.policyurl!=null&&row.policyurl!='')
	{
		return '<a href="'+row.policyurl+'" target = "_blank">下载</a>';	
	}
}

</script>

<div id="policyUrlDlg" class="easyui-dialog" title="保单下载" 
		style="width:520px;height:500px;padding:10px;top:90px" 
		data-options="iconCls: 'icon-save',">
		
		<br>
		<table id="dlgpolicyurllist" class="easyui-datagrid" title="电子保单信息" style="width:480px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
				<th data-options="field:'dlg_policy_download',width:400,formatter:dlg_policydownload"">电子保单</th>
				</tr>
			</thead>
		</table>
		
</div>