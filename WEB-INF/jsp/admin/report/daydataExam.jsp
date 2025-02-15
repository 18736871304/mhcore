<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid20($('#daydatalist'));
	
	inputList = [
	 			$('#recorddate'),
	 			$('#hotlinecount'),
	 			$('#callcount'),
	 			$('#connectcount'),
	 			$('#callcentertime'),
	 			$('#nocallcentertime'),
	 			$('#wxcount'),
	 			$('#revisit'),
	 			$('#firstplancount'),
	 			$('#secondplancount'),
	 			$('#contractcount'),
	 			$('#claimcount'),
	 			$('#videoservicecount'),
	 			$('#renshecount'),
	 			$('#tdancount'),
	 	];

	 	checkList = [
	 			$('#recorddate'),
	 			$('#hotlinecount'),
	 			$('#callcount'),
	 			$('#connectcount'),
	 			$('#callcentertime'),
	 			$('#nocallcentertime'),
	 			$('#wxcount'),
	 			$('#revisit'),
	 			$('#firstplancount'),
	 			$('#secondplancount'),
	 			$('#contractcount'),
	 			$('#claimcount'),
	 			$('#videoservicecount'),
	 			$('#renshecount'),
	 			$('#tdancount'),
	 	];
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	 	
	setRowsHeight(36);
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="q02org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get03Org.do";
		
		displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
		
		$('#q03org').combobox('setValue',"");
		$('#q04org').combobox('setValue',"");
	}
	else if(comboxid.attr("id")=="q03org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get04Org.do";
		
		displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
		
		$('#q04org').combobox('setValue',"");
	}
	else
	{
		teamAfterSelect(comboxid);
	}
}

function setRowsHeight(height)
{
	var aa = $("td[field=callcentertime] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    aa = $("td[field=nocallcentertime] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    aa = $("td[field=revisit] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    aa = $("td[field=firstplancount] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    aa = $("td[field=secondplancount] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
}

function selectone()
{
	var row = $('#daydatalist').datagrid('getSelected');

	$('#recorddate').datebox('setValue',row.recorddate);
	$('#hotlinecount').val(row.hotlinecount);
	$('#callcount').val(row.callcount);
	$('#connectcount').val(row.connectcount);
	$('#callcentertime').val(row.callcentertime);
	$('#nocallcentertime').val(row.nocallcentertime);
	$('#wxcount').val(row.wxcount);
	$('#revisit').val(row.revisit);
	$('#firstplancount').val(row.firstplancount);
	$('#secondplancount').val(row.secondplancount);
	$('#contractcount').val(row.contractcount);
	$('#claimcount').val(row.claimcount);
	$('#videoservicecount').val(row.videoservicecount);
	$('#renshecount').val(row.renshecount);
	$('#tdancount').val(row.tdancount);
}

function saveSuss()
{
	clearCarData();
	$('#daydatalist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function daydataquery()
{
	var tturl = "report/getDaydataList.do";

	var tParam = new Object();
	
	tParam.state = "01";
	tParam.dataflag = "02";

	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	
	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";
	q04orgStr = q04org_codes.join(","); 
    // for(var i=0;i<q04org_codes.length;i++)
    // {
    //     if (q04orgStr != "") 
    //     {
    //     	q04orgStr += "','";
    //     }
    //     q04orgStr += q04org_codes[i];
    // }
	
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#daydatalist'), tParam, tturl);

	setRowsHeight(36);
	initDataGrid20($('#daydatalist'));
	
	clearCarData();
}

function daydataExam(state)
{
	var row = $('#daydatalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.daydataserialno = row.daydataserialno;
	tparam.state = state;

	ajaxdeal("report/daydataUpdateState.do",tparam,null,null,saveSuss);
}

function daydataUpdate()
{
	var row = $('#daydatalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if($('#callcount').val()=="0")
	{
		$.messager.alert('操作提示','外拨数量不能为0！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.daydataserialno = row.daydataserialno;
	
	tparam.oldrecorddate = row.recorddate;
	
	tparam.userid = row.userid;
	tparam.organcode = row.organcode;
	tparam.state = row.state;

	ajaxdeal("report/daydataUpdate.do",tparam,null,null,saveSuss);
}

function daydataDelete()
{
	var row = $('#daydatalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.daydataserialno = row.daydataserialno;

	ajaxdeal("report/daydataDelete.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<td class = "title">
				营业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org" data-options="multiple:true">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "daydataquery" onclick = "daydataquery()">日数据查询</a>
	<br>
	<br>
	<table id="daydatalist" class="easyui-datagrid" title="日数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'recorddate',width:76">数据日期</th>
				
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:120">所属团队</th>
				
				<th data-options="field:'username',width:76">业务员姓名</th>
				
				<th data-options="field:'hotlinecount',width:76">热线数量</th>
				<th data-options="field:'callcount',width:76">外拨</th>
				<th data-options="field:'connectcount',width:76">接通</th>
				<th data-options="field:'connectrate',width:76">接通率</th>
				<th data-options="field:'callcentertime',width:76">话务时长<br/>（分钟）</th>
				<th data-options="field:'nocallcentertime',width:76">非话务时长<br/>（分钟）</th>
				<th data-options="field:'sumtime',width:76">总时长</th>
				<th data-options="field:'wxcount',width:76">加微信</th>
				<th data-options="field:'revisit',width:76">&nbsp;&nbsp;保单检视<br/>（陌客）</th>
				<th data-options="field:'firstplancount',width:76">计划书<br/>（电话）</th>
				<th data-options="field:'secondplancount',width:76">认清市场<br/>（电话）</th>
				<th data-options="field:'contractcount',width:76">合同</th>
				<th data-options="field:'claimcount',width:76">理赔</th>
				<th data-options="field:'videoservicecount',width:76">视频</th>
				<th data-options="field:'renshecount',width:76">人设</th>
				<th data-options="field:'tdancount',width:76">服务T单</th>
				<th data-options="field:'statename',width:90">状态</th>
				
				<th data-options="field:'workyears',width:80">司龄（月）</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr hidden>
			<td class = "title">
				热线数量
			</td>
			<td class = "common">
				<input class = "txt" name="hotlinecount" id="hotlinecount" notnull = "热线数量">
			</td>
		</tr>
		<tr>
			<td class = "title">
				数据日期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="recorddate" id="recorddate" notnull = "数据日期">
			</td>
			<td class = "title">
				外拨
			</td>
			<td class = "common">
				<input class = "txt" name="callcount" id="callcount"notnull = "外拨">
			</td>
		</tr>
		<tr>
			<td class = "title">
				接通
			</td>
			<td class = "common">
				<input class = "txt" name="connectcount" id="connectcount"notnull = "接通">
			</td>
			<td class = "title">
				话务时长（分钟）
			</td>
			<td class = "common">
				<input class = "txt" name="callcentertime" id="callcentertime"notnull = "话务系统时长（分钟）">
			</td>
			<td class = "title">
				非话务时长（分钟）
			</td>
			<td class = "common">
				<input class = "txt" name="nocallcentertime" placeholder="时长截图发给IT管理员" id="nocallcentertime"notnull = "非话务系统时长（分钟）">
			</td>
		</tr>
		<tr>
			<td class = "title">
				加微信
			</td>
			<td class = "common">
				<input class = "txt" name="wxcount" id="wxcount"notnull = "加微信">
			</td>
			<td class = "title">
				保单检视（陌客）
			</td>
			<td class = "common">
				<input class = "txt" name="revisit" id="revisit"notnull = "保单检视（陌客）">
			</td>
			<td class = "title">
				计划书（电话）
			</td>
			<td class = "common">
				<input class = "txt" name="firstplancount" id="firstplancount"notnull = "计划书（电话）">
			</td>
		</tr>
		<tr>
			<td class = "title">
				认清市场（电话）
			</td>
			<td class = "common">
				<input class = "txt" name="secondplancount" id="secondplancount"notnull = "认清市场（电话）">
			</td>
		
			<td class = "title">
				合同
			</td>
			<td class = "common">
				<input class = "txt" name="contractcount" id="contractcount"notnull = "合同">
			</td>
			<td class = "title">
				理赔
			</td>
			<td class = "common">
				<input class = "txt" name="claimcount" id="claimcount"notnull = "理赔">
			</td>
		</tr>
		<tr>
			<td class = "title">
				视频
			</td>
			<td class = "common">
				<input class = "txt" name="videoservicecount" id="videoservicecount"notnull = "视频">
			</td>
			
			<td class = "title">
				人设
			</td>
			<td class = "common">
				<input class = "txt" name="renshecount" id="renshecount"notnull = "人设">
			</td>
			
			<td class = "title">
				服务T单
			</td>
			<td class = "common">
				<input class = "txt" name="tdancount" id="tdancount"notnull = "服务T单">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "exam" onclick = "daydataExam('02')">审核通过</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "noexam" onclick = "daydataExam('03')">审核不通过</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "daydataUpdate" onclick = "daydataUpdate()">日数据修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "daydataDelete" onclick = "daydataDelete()">日数据删除</a>
</div>
</body>
</html>
