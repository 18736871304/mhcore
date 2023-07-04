<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line7.css">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#pusherList'));
	
	$('#qdistributeStartDate').datebox('setValue',getMonthOneFormatDate());
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

function pusherquery()
{
	var tturl = "activity/getactivityReportByOrgan.do";

	var tParam = new Object();
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qstartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qenddate').datebox("getValue");
	
	tParam.distributeStartDate = $('#qdistributeStartDate').datebox("getValue");
	tParam.distributeEndDate = $('#qdistributeEndDate').datebox("getValue");
	
	displayDataGrid20($('#pusherList'), tParam, tturl);
	
	var sumurl = "activity/getactivityReportByOrgan_Sum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#benbucount_sum').val("");
		$('#shanxicount_sum').val("");
		$('#meiyuancount_sum').val("");
		$('#xinhaocount_sum').val("");
		$('#dailicount_sum').val("");
		
		$('#benbucount_sum_A').val("");
		$('#shanxicount_sum_A').val("");
		$('#meiyuancount_sum_A').val("");
		$('#xinhaocount_sum_A').val("");
		$('#dailicount_sum_A').val("");
		
		$('#benbucount_sum_APlus').val("");
		$('#shanxicount_sum_APlus').val("");
		$('#meiyuancount_sum_APlus').val("");
		$('#xinhaocount_sum_APlus').val("");
		$('#dailicount_sum_APlus').val("");
		
		$('#sumcount').val("");
	}
	else
	{
		$('#benbucount_sum').val(data.benbucount_sum);
		$('#shanxicount_sum').val(data.shanxicount_sum);
		$('#meiyuancount_sum').val(data.meiyuancount_sum);
		$('#xinhaocount_sum').val(data.xinhaocount_sum);
		$('#dailicount_sum').val(data.dailicount_sum);
		
		$('#benbucount_sum_A').val(data.benbucount_sum_A);
		$('#shanxicount_sum_A').val(data.shanxicount_sum_A);
		$('#meiyuancount_sum_A').val(data.meiyuancount_sum_A);
		$('#xinhaocount_sum_A').val(data.xinhaocount_sum_A);
		$('#dailicount_sum_A').val(data.dailicount_sum_A);
		
		$('#benbucount_sum_APlus').val(data.benbucount_sum_APlus);
		$('#shanxicount_sum_APlus').val(data.shanxicount_sum_APlus);
		$('#meiyuancount_sum_APlus').val(data.meiyuancount_sum_APlus);
		$('#xinhaocount_sum_APlus').val(data.xinhaocount_sum_APlus);
		$('#dailicount_sum_APlus').val(data.dailicount_sum_APlus);
		
		$('#sumcount').val(data.sumcount);
	}
}

function clearCarData()
{
}

function getMonthOneFormatDate()
{
	var date = new Date();
    
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + "01";
    return currentdate;
}

</script>
<style>
	td.title {
		width: 14%;
	}
	td.reprot_title{
		width: 7%;
	}
	td.report_common {
		width: 12%;
	}
</style>
</head>
<body>
<table class = "common">
	<tr>
		<td class = "reprot_title">
			线索产生起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
		</td>
		
		<td class = "reprot_title">
			线索产生止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
		</td>
		
		<td class = "reprot_title">
			线索分配起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qdistributeStartDate" name="qdistributeStartDate">
		</td>
		
		<td class = "reprot_title">
			线索分配止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qdistributeEndDate" name="qdistributeEndDate">
		</td>
		
		<td></td><td></td>
		<td></td><td></td>
	</tr>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "pusherquery" onclick = "pusherquery()">查询</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="pusherList" class="easyui-datagrid" title="团队分配报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'makedate',width:125">线索分配时间</th>
				<th data-options="field:'benbucount_A',width:135">本部营业部（A重疾）</th>
				<th data-options="field:'benbucount_APlus',width:135">本部营业部（A理财）</th>
				<th data-options="field:'benbucount',width:135">本部营业部合计</th>
				
				<th data-options="field:'meiyuancount_A',width:135">梅园营业部（A重疾）</th>
				<th data-options="field:'meiyuancount_APlus',width:135">梅园营业部（A理财）</th>
				<th data-options="field:'meiyuancount',width:135">梅园营业部合计</th>
				
				<th data-options="field:'xinhaocount_A',width:135">新濠天地营业部（A重疾）</th>
				<th data-options="field:'xinhaocount_APlus',width:135">新濠天地营业部（A理财）</th>
				<th data-options="field:'xinhaocount',width:135">新濠天地营业部合计</th>
				
				<th data-options="field:'shanxicount_A',width:135">小店营业部（A重疾）</th>
				<th data-options="field:'shanxicount_APlus',width:135">小店营业部（A理财）</th>
				<th data-options="field:'shanxicount',width:135">小店营业部合计</th>
				
				<th data-options="field:'dailicount_A',width:135">代理营业部（A重疾）</th>
				<th data-options="field:'dailicount_APlus',width:135">代理营业部（A理财）</th>
				<th data-options="field:'dailicount',width:135">代理营业部合计</th>
				
				<th data-options="field:'sumcount',width:135">热线数量合计</th>
			</tr>
		</thead>
	</table>
	<br>
	
	<table class = "common">
		<tr>
			<td class = "title">
				本部营业部合计（A重疾）
			</td>
			<td class = "common">
				<input class = "txt" name="benbucount_sum_A" id="benbucount_sum_A">
			</td>
			
			<td class = "title">
				本部营业部合计（A理财）
			</td>
			<td class = "common">
				<input class = "txt" name="benbucount_sum_APlus" id="benbucount_sum_APlus">
			</td>
			
			<td class = "title">
				本部营业部合计
			</td>
			<td class = "common">
				<input class = "txt" name="benbucount_sum" id="benbucount_sum">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				梅园营业部合计（A重疾）
			</td>
			<td class = "common">
				<input class = "txt" name="meiyuancount_sum_A" id="meiyuancount_sum_A">
			</td>
			
			<td class = "title">
				梅园营业部合计（A理财）
			</td>
			<td class = "common">
				<input class = "txt" name="meiyuancount_sum_APlus" id="meiyuancount_sum_APlus">
			</td>
			
			<td class = "title">
				梅园营业部合计
			</td>
			<td class = "common">
				<input class = "txt" name="meiyuancount_sum" id="meiyuancount_sum">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				新濠天地营业部合计（A重疾）
			</td>
			<td class = "common">
				<input class = "txt" name="xinhaocount_sum_A" id="xinhaocount_sum_A">
			</td>
			
			<td class = "title">
				新濠天地营业部合计（A理财）
			</td>
			<td class = "common">
				<input class = "txt" name="xinhaocount_sum_APlus" id="xinhaocount_sum_APlus">
			</td>
			
			<td class = "title">
				新濠天地营业部合计
			</td>
			<td class = "common">
				<input class = "txt" name="xinhaocount_sum" id="xinhaocount_sum">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				小店营业部合计（A重疾）
			</td>
			<td class = "common">
				<input class = "txt" name="shanxicount_sum_A" id="shanxicount_sum_A">
			</td>
			
			<td class = "title">
				小店营业部合计（A理财）
			</td>
			<td class = "common">
				<input class = "txt" name="shanxicount_sum_APlus" id="shanxicount_sum_APlus">
			</td>
			
			<td class = "title">
				小店营业部合计
			</td>
			<td class = "common">
				<input class = "txt" name="shanxicount_sum" id="shanxicount_sum">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				代理营业部合计（A重疾）
			</td>
			<td class = "common">
				<input class = "txt" name="dailicount_sum_A" id="dailicount_sum_A">
			</td>
			
			<td class = "title">
				代理营业部合计（A理财）
			</td>
			<td class = "common">
				<input class = "txt" name="dailicount_sum_APlus" id="dailicount_sum_APlus">
			</td>
			
			<td class = "title">
				代理营业部合计
			</td>
			<td class = "common">
				<input class = "txt" name="dailicount_sum" id="dailicount_sum">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				热线数量合计
			</td>
			<td class = "common">
				<input class = "txt" name="sumcount" id="sumcount">
			</td>
		</tr>
	</table>
</div>
</body>
</html>