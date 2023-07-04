<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

window.onload = function()
{
	initDataGrid20($('#activitylist'));
}

function aftercodeselect(comboxid)
{
	
}

function selectone()
{
}

function FileUpload()
{
	ajaxFileUpload('filename','activity/activityUpload_baidu.do',null,null,null,saveSuss);
	//上传完毕之后，把浏览框中的文本清除。
}

function saveSuss()
{
	$('#textfield').val($('#filename').val());
	$('#activitylist').datagrid('reload');
}

function activityquery()
{
	var tturl = "activity/getActivity20190824List20.do";

	var tParam = new Object();
	
	tParam.queryflag = '02';
	tParam.uploadflag = 'Y';
	tParam.channel = '0002';
	
	tParam.uploadStartDate = $('#qstartdate').datebox("getValue");
	tParam.uploadEndDate = $('#qenddate').datebox("getValue");
	
	displayDataGrid20($('#activitylist'), tParam, tturl);
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

function dispageurl(val,row,index)
{
	return '<a href="#" onclick="openpageurl(\''+row.channel+'\',\''+row.pagetype+'\',\''+row.planid+'\',\''+row.pageurl+'\')">'+row.pagename+'</a>';
}

function openpageurl(channel,pagetype,planid,pageurl)
{
	if(pageurl!=null&&pageurl!='')
	{
		window.open(pageurl,
				'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
	}
	else if(channel=='0004'&&pagetype=='1yuango/0001')
	{
		window.open('http://insure.meihualife.com/life/activity/oneyuangodis.do',
		'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
	}
	else
	{
		window.open('http://insure.meihualife.com/life/activity/channelActivity.do?channelCode='+channel+'&pageType='+pagetype+'&planId='+planid,
		'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');	
	}
}

function calhours(val,row,index)
{
	var afterDate = new Date(row.uploaddate);
	var beforeDate = new Date(row.makedate);
	
	var difTime = afterDate.getTime() - beforeDate.getTime();
	
	var difhours = Math.floor(difTime/1000/3600);
	
	return difhours;
}

</script>

</head>
<body>
<div style="margin-left:0%">

<!-- 上传信息展示区域 -->
<div class="upload-box">
	<input type='text' name='textfield' id='textfield' class='upload-txt' />  
 	<button id = "file-view" class="smsbutton">浏览...</button> 	
 	<input type="file" name="myfiles" class="upload-file" id="filename" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" /> 	
 	<button id = "file-upload" class="smsbutton" onclick = "FileUpload()">上传</button>
</div>
<hr>

	<table class = "common">
		<tr>
			<td class = "title">
				上传起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qstartdate" name="qstartdate">
			</td>
			<td class = "title">
				上传止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qenddate" name="qenddate">
				(算头不算尾)
			</td>
			<td></td><td></td>
		</tr>
			
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "activityquery()">查询</a>
	<br>
	<br>
	<table id="activitylist" class="easyui-datagrid" title="注册客户查询" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'uploaddate',width:135">上传时间</th>
				<th data-options="field:'makedate',width:135">填写时间</th>
				<th data-options="field:'mobile',width:90">电话号码</th>
				<th data-options="field:'name',width:70">客户姓名</th>
				<th data-options="field:'area',width:70">地域</th>
				<th data-options="field:'pagename',width:150,formatter:dispageurl">站点名称</th>
				<th data-options="field:'planname',width:150">计划名称</th>
				<th data-options="field:'unitname',width:150">单元名称</th>
				<th data-options="field:'keywords',width:150">关键词</th>
				<th data-options="field:'searchwords',width:150">搜索词</th>
				<th data-options="field:'diffhours',width:90,formatter:calhours">上传时效</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
