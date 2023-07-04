<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

window.onload = function()
{
	initDataGrid20($('#salaryList'));
	
	var currTime=new Date();
    var strDate=currTime.getFullYear()+"-"+(currTime.getMonth()+1)+"-01";
    $('#commmonth').datebox({formatter:function(date){
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? '0' + m : m;
        return y.toString() + '-' + m.toString();
    },parser:function(date){
        console.log(date);
        if (date) {
            return new Date(String(date).substring(0, 4) + '-'
                    + String(date).substring(5,7));
        } else {
            return new Date();
        }
    }});
    
    initsalaryDetailDlg();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{

}

function salaryQuery(type)
{
	var commmonth = $('#commmonth').datebox("getValue");
	
	if(commmonth==null||commmonth=="")
	{
		$.messager.alert('执行失败','佣金月不能为空！','error');
		return;
	}
	
	var tParam = new Object();

	tParam.commmonth = commmonth;
	tParam.agentflag = '02';
	
	//默认驰派
	tParam.organcode = '100100100';
	
	if(type == "query")
	{
		var tturl = "salary/getAgentSalary.do";
		displayDataGrid20($('#salaryList'), tParam, tturl);	
	}
	else if(type == "download")
	{
		var tturl = "salary/salaryDownload.do";
		ajaxdeal(tturl,tParam,listdownloadreturn,null);
	}
}

function salaryDetail()
{
	var row = $('#salaryList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要查看明细的数据！','info');
		return;
	}
	
	var agentcode = row.agentcode;
	var commmonth = row.commmonth;
	
	dissalaryDetailDlg(agentcode,commmonth);
}

function listdownloadreturn(data)
{
	if(data.flag == "0")
	{
		if(data.message == null || data.message == "")
		{
			$.messager.alert('执行失败','没有生成下载文件','error');
		}
		else
		{
			$.messager.alert('执行成功',"执行成功，请点击下载",'info');
			//判断id存在的代码
			if($("#xiazai").length>0)
			{
				$("#xiazai").remove();
				$('#salaryDownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename="+data.message+"'>点击下载</a>");
			}
			else
			{
				$('#salaryDownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename="+data.message+"'>点击下载</a>");
			}
		}
	}
	else
	{
		if(data.message == null || data.message == "")
		{
			$.messager.alert('执行失败','操作失败','error');	
		}
		else
		{
			$.messager.alert('执行失败',data.message,'error');	
		}
	}
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/salary/salaryDetial.jsp"%>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				佣金月
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="commmonth" name="commmonth" notnull = "出单止期">
			</td>
			
			<td>
			</td>
			<td>
			</td>
			
			<td>
			</td>
			<td>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "salaryQuery" onclick = "salaryQuery('query')">员工薪资查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "salaryDetail" onclick = "salaryDetail()">保单明细查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "salaryDownload" onclick = "salaryQuery('download')">员工薪资下载</a>
	<br>
	<br>
	<table id="salaryList" class="easyui-datagrid" title="员工薪资查询" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'agentcode',width:70">员工工号</th>
				<th data-options="field:'agentname',width:70">员工姓名</th>
				<th data-options="field:'agentstatename',width:70">员工状态</th>
				<th data-options="field:'agentgrade',width:70">职级</th>
				
				<th data-options="field:'organname',width:110">事业部</th>
				<th data-options="field:'commmonth',width:70">佣金月</th>
				<th data-options="field:'sumfyp',width:90">FYP合计</th>
				
				<th data-options="field:'colnum1',width:90">基本薪资</th>
				<th data-options="field:'colnum7',width:90">未达标扣减</th>
				<th data-options="field:'colnum2',width:90">服务报酬</th>
				
				<th data-options="field:'colnum3',width:90">举绩费率</th>
				<th data-options="field:'colnum4',width:90">举绩报酬</th>
				<th data-options="field:'colnum5',width:90">达成费率</th>
				
				<th data-options="field:'colnum6',width:90">达成报酬</th>
				<th data-options="field:'sumsalary',width:90">合计</th>
			</tr>
		</thead>
	</table>
</div>
</body>
</html>