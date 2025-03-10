<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

window.onload = function()
{
	initDataGrid20($('#finceReportList'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#qriskchannel'),"channel",null);
	
	$('#menudisplaydlg').dialog('close');
	
	init02Org();
	
	setRowsHeight(36);
}

function setRowsHeight(height)
{
	var aa = $("td[field=fince01sumprem] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince01sumfyp20] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince03sumprem] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince03sumfyp20] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince04sumprem] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince04sumfyp20] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince05sumprem] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince05sumfyp20] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince06sumprem] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince06sumfyp20] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince07sumprem] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
    
    var aa = $("td[field=fince07sumfyp20] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
	teamAfterSelect(comboxid);	
}

function selectone()
{
}

function finceReportQuery()
{
	var tturl = "policy/getFinceReportList.do";

	var tParam = new Object();
	
	var codes = $('#qinsorgancode').combobox('getValues');
    var ic = "";
    for(var i=0;i<codes.length;i++){
        if (ic != "") ic += "\',\'";
        ic += codes[i];
    }
    tParam.insorgancode = ic;
	tParam.organcode = $('#departmentId').val();
	tParam.state = '40';
	
	tParam.agentflag = '02';
	
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
	
	tParam.riskchannel = $('#qriskchannel').combobox('getValue');
	
	displayDataGrid20($('#finceReportList'), tParam, tturl);
	
	setRowsHeight(36);
}

function getChecked(){
    var nodes = $('#userauthtree').tree('getChecked');
    var s = '';
    var s2 = '';
    for(var i=0; i<nodes.length; i++){
        if (s != '') s += '\',\'';
        if (s2 != '') s2 += ',';
        s += nodes[i].id;
        s2 += nodes[i].text;
    }
    $('#departmentId').val(s);
    $('#departmentName').val(s2);

    $('#menudisplaydlg').dialog('close');
}

function userMenuDis()
{
    $("#userauthtree").tree(
        {
            url:'combox/departmentList.do'
        });
    $('#menudisplaydlg').dialog('open');
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<input type="text" hidden="hidden" id="departmentId">
	<div id="menudisplaydlg" class="easyui-dialog" title="机构查询"
		 style="width:300px;height:500px;padding:10px"
		 data-options="iconCls: 'icon-save'">
		<div style="margin-left:15%">
			<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
		</div>
		<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
	</div>
	<table style="width: 95%;">
		<tr>
			<td class = "title">
				签约渠道
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qriskchannel" id="qriskchannel">
				</select>
			</td>
		
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
		</tr>
		
		<tr hidden="hidden">
			<td class = "title">
				出单机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/organ/organQuery.jsp"%>
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "finceReportQuery" onclick = "finceReportQuery()">查询</a>
	<br>
	<br>
	<table id="finceReportList" class="easyui-datagrid" title="结算报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'acceptdate',width:100">出单月</th>
				
				<th data-options="field:'sumprem',width:100">保费合计</th>
				<th data-options="field:'sumfyp20',width:100">标保合计</th>
				
				<th data-options="field:'fince04sumprem',width:100">未结算<br/>保费合计</th>
				<th data-options="field:'fince04sumfyp20',width:100">未结算<br/>标保合计</th>
				
				<th data-options="field:'fince01sumprem',width:100">已结算<br/>保费合计</th>
				<th data-options="field:'fince01sumfyp20',width:100">已结算<br/>标保合计</th>
				
				<th data-options="field:'fince03sumprem',width:100">未回访<br/>保费合计</th>
				<th data-options="field:'fince03sumfyp20',width:100">未回访<br/>标保合计</th>
				
				<th data-options="field:'fince06sumprem',width:100">已开票<br/>保费合计</th>
				<th data-options="field:'fince06sumfyp20',width:100">已开票<br/>标保合计</th>
				
				<th data-options="field:'fince07sumprem',width:100">已回款<br/>保费合计</th>
				<th data-options="field:'fince07sumfyp20',width:100">已回款<br/>标保合计</th>
				
				<th data-options="field:'fince05sumprem',width:100">其他<br/>保费合计</th>
				<th data-options="field:'fince05sumfyp20',width:100">其他<br/>标保合计</th>
			</tr>
		</thead>
	</table>
</div>
</body>
</html>