<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<script type="text/javascript" src="baidu_ue/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="baidu_ue/ueditor.all.js"></script>
<title></title>
<script>

var inputList;
var checkList;
var doubleList;

var ue = UE.getEditor('content',{
	toolbars: [
	   		[
	   		 'source', //源代码
	   		 'preview', //预览
	   		 'bold', //加粗
	   		 'italic', //斜体
	   		 'underline', //下划线
	   		 'strikethrough', //删除线
	   		 'formatmatch', //格式刷
	   		 'snapscreen', //截图
	   		 
	   		 'fontfamily', //字体
	   		 'fontsize', //字号
	   		 'forecolor', //字体颜色
	   		 'paragraph', //段落格式
	   		 'simpleupload', //单图上传
	   		 
	   		 'justifyleft', //居左对齐
	   		 'justifyright', //居右对齐
	   		 'justifycenter', //居中对齐
	   		 'justifyjustify', //两端对齐
	   		]
	   	]
	   });

window.onload = function()
{
	initDataGrid($('#qalist'));

	inputList = [
	];

	checkList = [
	];
	
	qaViewDlgInit();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#qalist').datagrid('getSelected');

	ue.setContent(row.answer);
}

function saveSuss()
{
	clearCarData();
	$('#qalist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
	ue.setContent('');
}

function optimizeUpdate()
{
	var row = $('#qalist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var html = ue.getContent();
	
	if(html==null||html=="")
	{
		$.messager.alert('执行失败',"解决方案内容不能为空",'error');
		return false;
	}
	
	var tparam = new Object();
	tparam.qaserialno = row.qaserialno;
	tparam.answer = html;

	ajaxdeal("qa/optimize_Update.do",tparam,null,null,saveSuss);
}

function qaquery()
{
	var tturl = "qa/getQaList.do";

	var tParam = new Object();

	tParam.state = "03";

	displayDataGrid($('#qalist'), tParam, tturl);

	clearCarData();
}

function disQaInfo(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>'; 
}

function openDlg(index)
{
	var rows=$('#qalist').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	//alert(row.agentcom);
	
	disqaViewDlg(row);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/qa/qaViewDlg.jsp"%>
<div style="margin-left:0%">
	<br>
	<table id="qalist" class="easyui-datagrid" title="问题信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'question_date',width:130">日期</th>
				<th data-options="field:'question',width:300">问题</th>
				<th data-options="field:'buz_flowname',width:90">所在流程</th>
				<th data-options="field:'statename',width:90">问题状态</th>
				
				<th data-options="field:'_operate',width:70,formatter:disQaInfo">解决方案</th>
				
				<th data-options="field:'zd_answer_username',width:90">指定回答人</th>
				
				<th data-options="field:'answer_username',width:90">回答人</th>
				<th data-options="field:'answer_date',width:130">回答时间</th>
				
				<th data-options="field:'optimize_username',width:90">优化人</th>
				<th data-options="field:'optimize_date',width:130">优化时间</th>
				
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "title">
				解决方案
			</td>
			<!-- 
			<td class="common"  colspan="3">
				<textarea notnull = "解决方案" class="txt" style="width: 600px;height: 150px;" id="answer" name="answer">
				</textarea>
			</td>
			 -->
			<td class = "common">
				
			</td>
		</tr>
	</table>
	<script id="content" name="content" type="text/plain">
    </script>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "qaquery" onclick = "qaquery()">问题查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "answerInsert" onclick = "optimizeUpdate()">解决方案优化</a>
</div>
</body>
</html>
