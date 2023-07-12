<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;
var doubleList;

var checkList_main;

window.onload = function()
{	
	dis_riskcode.style.display="none";
	
	initDataGrid($('#riskdefinelist'));
	initDataGrid20($('#filelist'));

	inputList = [
			$('#riskcode'),
			$('#riskname'),
			$('#ismain'),
			$('#insorgancode'),
			$('#mainriskcode'),
			$('#channel'),
			$('#risktype'),
			$('#riskkind01'),
			$('#riskkind02'),
			$('#isseal'),
			$('#jointype'),
			$('#freelookperiod'),
			$('#description'),
			$('#price'),
			$('#url'),
			$('#insrevisiturl'),
			$('#discode'),
			$('#promise_xubao'),
			
	];

	checkList = [
			//$('#riskcode'),
			$('#riskname'),
			//$('#ismain'),
			$('#insorgancode'),
			//$('#mainriskcode'),
			$('#channel'),
			$('#risktype'),
			$('#riskkind01'),
			//$('#riskkind02'),
			$('#isseal'),
			$('#jointype'),
			$('#freelookperiod'),
	];
	
	checkList_main = [
	      	$('#description'),
	    	$('#price'),
	    	//$('#orderby'),
	    	$('#url'),
	    	];

	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#insorgancode'),"insorgancode",null);
	
	disComBox($('#qismain'),"ismain",null);
	disComBox($('#ismain'),"ismain",null);
	disComBox($('#promise_xubao'),"ismain",null);
	
	disComBox($('#qchannel'),"channel",null);
	disComBox($('#channel'),"channel",null);

	disComBox($('#qrisktype'),"risktype",null);
	disComBox($('#risktype'),"risktype",null);
	
	disComBox($('#qisseal'),"isseal",null);
	disComBox($('#isseal'),"isseal",null);
	
	disComBox($('#qjointype'),"jointype",null);
	disComBox($('#jointype'),"jointype",null);
	
	disComBox($('#salesarea'),"province",null);
	
	$('#emailuw_remark').val('');
	
	$('#qisseal').combobox('setValue','01');
	$('#qismain').combobox('setValue','Y');
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="riskkind01")
	{
		disComBox($('#riskkind02'),"riskkind01"+comboxid.combobox('getValue'),null);
	}
	else if(comboxid.attr("id")=="insorgancode")
	{
		disMainRiskCode();
		disInsTypeByInsCode();
	}
	else if(comboxid.attr("id")=="ismain")
	{
		if(comboxid.combobox('getValue')=="Y")
		{
			$('#mainriskcode').combobox('setValue',$('#riskcode').val());
			$('#mainriskcode').combobox('setText',$('#riskname').val());
		}
	}
}

function disInsTypeByInsCode()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	
	var insTypeUrl = "supplier/getInsType.do";
	ajaxdeal(insTypeUrl,tParam,getInsType,null);
}

function getInsType(data)
{
	if(data.instype=="00")
	{
		disComBox($('#riskkind01'),"riskkind01",null);	
	}
	else if(data.instype=="01"||data.instype=="03")
	{
		disComBox($('#riskkind01'),"riskkind01_l",null);	
	}
	else if(data.instype=="02")
	{
		disComBox($('#riskkind01'),"riskkind01_p",null);	
	}
	
	var row = $('#riskdefinelist').datagrid('getSelected');
	
	if(row!=null)
	{
		$('#riskkind01').combobox('setValue',row.riskkind01);
		disriskkind02();
		$('#riskkind02').combobox('setValue',row.riskkind02);
	}
}

function disMainRiskCode()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	
	var tturl1 = "policy/getMainRiskList.do";
	
	displayCombox($('#mainriskcode'),tParam,tturl1,"dd_key","dd_value");
}

function selectone()
{
	var row = $('#riskdefinelist').datagrid('getSelected');

	$('#riskcode').val(row.riskcode);
	$('#riskname').val(row.riskname);
	$('#ismain').combobox('setValue',row.ismain);
	$('#promise_xubao').combobox('setValue',row.promise_xubao);
	
	$('#insorgancode').combobox('setValue',row.insorgancode);
	disMainRiskCode();
	disInsTypeByInsCode();
	
	$('#mainriskcode').combobox('setValue',row.mainriskcode);
	$('#channel').combobox('setValue',row.channel);
	$('#freelookperiod').val(row.freelookperiod);
	$('#risktype').combobox('setValue',row.risktype);
	
	$('#isseal').combobox('setValue',row.isseal);
	$('#jointype').combobox('setValue',row.jointype);
	
	$('#description').val(row.description);
	$('#insrevisiturl').val(row.insrevisiturl);
	$('#url').val(row.url);
	$('#price').val(row.price);
	$('#orderby').val(row.orderby);
	$('#outriskcode').val(row.outriskcode);
	$('#discode').val(row.discode);
	$('#salesarea').combobox('setValues',row.salesarea.split(','));
	
	if(row.aiuw=='Y')
	{
		$("#aiuw").prop("checked",true);	
	}
	else
	{
		$("#aiuw").prop("checked",false);	
	}
	
	if(row.emailuw=='Y')
	{
		$("#emailuw").prop("checked",true);
		$("#emailuw_remark").val(row.emailuw_remark);
		$(".dis_emali_uw").show();
	}
	else
	{
		$("#emailuw").prop("checked",false);
		$("#emailuw_remark").val('');
		$(".dis_emali_uw").hide();
	}
	
	disFileList();
}

function disriskkind02()
{
	disComBox($('#riskkind02'),"riskkind01"+$('#riskkind01').combobox('getValue'),null);
}

function riskchange()
{
	if($('#ismain').combobox('getValue')=="Y")
	{
		$('#mainriskcode').combobox('setValue',$('#riskcode').val());
		$('#mainriskcode').combobox('setText',$('#riskname').val());
	}
}

function saveSuss()
{
	clearCarData();
	$('#outriskcode').val("");
	$('#orderby').val("");
	$('#riskdefinelist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
	
	$('#emailuw_remark').val('');
}

function riskdefineInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	if($('#ismain').combobox('getValue')=="Y")
	{
		if(!checknotnull(checkList_main))
		{
			return;
		}
		
		if($('#orderby').val()<1)
		{
			$.messager.alert('执行失败',"【排序】请录入大于0的整数！",'error');
			return false;
		}
	}
	
	if($('#riskkind01').combobox('getValue')!="007"&&$('#riskkind01').combobox('getValue')!="010"
	 &&$('#riskkind01').combobox('getValue')!="011"&&$('#riskkind01').combobox('getValue')!="012"
	 &&$('#riskkind01').combobox('getValue')!="014"&&$('#riskkind01').combobox('getValue')!="015"
	 &&$('#riskkind01').combobox('getValue')!="016"&&$('#riskkind01').combobox('getValue')!="017"
	 &&$('#riskkind01').combobox('getValue')!="018"&&$('#riskkind01').combobox('getValue')!="020"
	 &&$('#riskkind01').combobox('getValue')!="021")
	{
		if(trim($('#riskkind02').combobox('getText')) ==null || trim($('#riskkind02').combobox('getText')) == "" )
		{
			$.messager.alert('执行失败',$('#riskkind02').attr("notnull")+"不能为空",'error');
			return false;
		}
	}
	
	var tparam = prepareparam(inputList);
	
	if($('#ismain').combobox('getValue')=="Y")
	{
		tparam.orderby = $('#orderby').val();
	}
	
	if($('#aiuw').attr('checked')=="checked")
	{
		tparam.aiuw = 'Y';
	}
	else
	{
		tparam.aiuw = 'N';
	}
	
	if($('#emailuw').attr('checked')=="checked")
	{
		tparam.emailuw = 'Y';
		tparam.emailuw_remark = $('#emailuw_remark').val();
	}
	else
	{
		tparam.emailuw = 'N';
	}
	
	if($('#channel').combobox('getValue')=='10')
	{
		if($('#outriskcode').val()==null||$('#outriskcode').val()=='')
		{
			$.messager.alert('操作提示','小雨伞渠道，需要录入渠道险种编码！','error');
			return;
		}
	}
	
	tparam.outriskcode = $('#outriskcode').val();
	tparam.salesarea = $('#salesarea').combobox('getValues')+"";

	ajaxdeal("supplier/riskdefineInsert.do",tparam,null,null,saveSuss);
}

function riskdefineUpdate()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	if($('#ismain').combobox('getValue')=="Y")
	{
		if(!checknotnull(checkList_main))
		{
			return;
		}
		
		if($('#orderby').val()<1)
		{
			$.messager.alert('执行失败',"【排序】请录入大于0的整数！",'error');
			return false;
		}
	}
	
	if($('#riskkind01').combobox('getValue')!="007"&&$('#riskkind01').combobox('getValue')!="010"
	 &&$('#riskkind01').combobox('getValue')!="011"&&$('#riskkind01').combobox('getValue')!="012"
	 &&$('#riskkind01').combobox('getValue')!="014"&&$('#riskkind01').combobox('getValue')!="015"
	 &&$('#riskkind01').combobox('getValue')!="016"&&$('#riskkind01').combobox('getValue')!="017"
	 &&$('#riskkind01').combobox('getValue')!="018"&&$('#riskkind01').combobox('getValue')!="020"
	 &&$('#riskkind01').combobox('getValue')!="021")
	{
		if(trim($('#riskkind02').combobox('getText')) ==null || trim($('#riskkind02').combobox('getText')) == "" )
		{
			$.messager.alert('执行失败',$('#riskkind02').attr("notnull")+"不能为空",'error');
			return false;
		}
	}

	var tparam = prepareparam(inputList);
	tparam.old_riskcode = row.riskcode;
	tparam.old_insorgancode = row.insorgancode;
	tparam.old_mainriskcode = row.mainriskcode;

	if($('#ismain').combobox('getValue')=="Y")
	{
		tparam.orderby = $('#orderby').val();
	}
	
	if($('#aiuw').attr('checked')=="checked")
	{
		tparam.aiuw = 'Y';
	}
	else
	{
		tparam.aiuw = 'N';
	}
	
	if($('#emailuw').attr('checked')=="checked")
	{
		tparam.emailuw = 'Y';
		tparam.emailuw_remark = $('#emailuw_remark').val();
	}
	else
	{
		tparam.emailuw = 'N';
	}
	
	if($('#channel').combobox('getValue')=='10')
	{
		if($('#outriskcode').val()==null||$('#outriskcode').val()=='')
		{
			$.messager.alert('操作提示','小雨伞渠道，需要录入渠道险种编码！','error');
			return;
		}
	}
	
	tparam.outriskcode = $('#outriskcode').val();
	tparam.salesarea = $('#salesarea').combobox('getValues')+"";
	
	ajaxdeal("supplier/riskdefineUpdate.do",tparam,null,null,saveSuss);
}

function riskdefineDelete()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.riskcode = row.riskcode;
	tparam.insorgancode = row.insorgancode;
	tparam.mainriskcode = row.mainriskcode;

	ajaxdeal("supplier/riskdefineDelete.do",tparam,null,null,saveSuss);
}

function riskdefinequery()
{
	var tturl = "supplier/getRiskdefineList.do";

	var tParam = queryParam()

	
	displayDataGrid($('#riskdefinelist'), tParam, tturl);

	clearCarData();
}

function queryParam()
{
	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.riskname = $('#qriskname').val();
	tParam.ismain = $('#qismain').combobox('getValue');
	
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.risktype = $('#qrisktype').combobox('getValue');
	tParam.isseal = $('#qisseal').combobox('getValue');
	tParam.jointype = $('#qjointype').combobox('getValue');
	
	return tParam;
}

function disemailuw()
{
	if($('#emailuw').attr('checked')=="checked")
	{
		$(".dis_emali_uw").show();
	}
	else
	{
		$(".dis_emali_uw").hide();
	}
}

function FileUpload()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(row.emailuw!='Y')
	{
		$.messager.alert('操作提示','请先选中人工核保并保存！','error');
		return;
	}
	
	if($('#textfield').val()==null||$('#textfield').val()=='')
	{
		$.messager.alert('操作提示','请选中要上传的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.buzid = row.riskcode;
	
	ajaxFileUpload('filename','supplier/uploadUwFile.do',tparam,null,null,uploadsaveSuss);
	//上传完毕之后，把浏览框中的文本清除。
}

function disFileList()
{
	var row = $('#riskdefinelist').datagrid('getSelected');
	if(row==null)
	{
		return;
	}
	
	var tturl = "supplier/getUwFileList.do";
	
	var tparam = new Object();
	tparam.buzid = row.riskcode;
	
	displayDataGrid($('#filelist'), tparam, tturl);
}

function uploadsaveSuss()
{
	$('#textfield').val("");
	$('#filelist').datagrid('reload');
}

function selectonefile()
{
	
}

function signdownload(val,row,index)
{
	return '<a href="http://insure.meihualife.com/filedownload.do?fileid='+row.fileid+'">下载</a>';
}

function fileDelete()
{
	var row = $('#filelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.fileid = row.fileid;

	ajaxdeal("supplier/uwfileDelete.do",tparam,null,null,uploadsaveSuss);
}

function moveUp (val,row,index) 
{
  return '<div style="display:flex;justify-content: center; cursor: pointer;">'
        +'<img onclick=moveup('+index+') src="../../../../images/jiantou.jpeg" style="width: 20px; margin-right: 5px;" alt="">'
        +'<img onclick=movedown('+index+') src="../../../../images/jiantou.jpeg" style="width: 20px; transform: rotate(180deg)" alt="">'
        +'</div>';
}

function getCurrPage()
{ 
	var riskdefine_options = $('#riskdefinelist').datagrid('getPager').data("pagination").options;  
	//当前页
	var curr_page = riskdefine_options.pageNumber;
	
	return curr_page;
}

function moveup(index)
{
	var currpage = getCurrPage();
	
	if(index==0&&currpage==1)
	{
		$.messager.alert('操作提示','无法继续移动！','error');
		return;
	}
	
	var rows=$('#riskdefinelist').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	var tparam = new Object();
	if(index==0)
	{
		tparam = queryParam();
		
		tparam.operation = "up";
		tparam.opr_calpage = currpage-1;
		tparam.opr_riskcode = row.riskcode;
		tparam.opr_insorgancode = row.insorgancode;
		tparam.opr_orderby = row.orderby;
	}
	else
	{
		tparam.operation = "change";	
		tparam.opr_riskcode = row.riskcode;
		tparam.opr_insorgancode = row.insorgancode;
		tparam.opr_orderby = row.orderby;
		
		var rowed=rows[index-1];
		tparam.opred_riskcode = rowed.riskcode;
		tparam.opred_insorgancode = rowed.insorgancode;
		tparam.opred_orderby = rowed.orderby;
	}
	
	ajaxdeal("supplier/riskMove.do",tparam,null,null,saveSuss);
}

function movedown(index) 
{
	var currpage = getCurrPage();
	
	var rows=$('#riskdefinelist').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	var tparam = new Object();
	if(index==9)
	{
		tparam = queryParam();
		
		tparam.operation = "down";
		tparam.opr_calpage = currpage+1;
		tparam.opr_riskcode = row.riskcode;
		tparam.opr_insorgancode = row.insorgancode;
		tparam.opr_orderby = row.orderby;
	}
	else
	{
		tparam.operation = "change";	
		tparam.opr_riskcode = row.riskcode;
		tparam.opr_insorgancode = row.insorgancode;
		tparam.opr_orderby = row.orderby;
		
		var rowed=rows[index+1];
		tparam.opred_riskcode = rowed.riskcode;
		tparam.opred_insorgancode = rowed.insorgancode;
		tparam.opred_orderby = rowed.orderby;
	}
	
	ajaxdeal("supplier/riskMove.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				签约渠道
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
			<td class = "reprot_title">
				险种类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
				</select>
			</td>
			
			<td class = "reprot_title">
				保险公司
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "reprot_title">
				险种名称
			</td>
			<td class = "report_common">
				<input class = "txt" name="qriskname" id="qriskname">
			</td>
			
			<td class = "reprot_title" hidden>
				是否主险
			</td>
			<td class = "report_common" hidden>
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qismain" id="qismain">
				</select>
			</td>
			
			<td class = "reprot_title">
				产品属性
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qjointype" id="qjointype">
				</select>
			</td>
			
			<td class = "reprot_title">
				是否在售
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qisseal" id="qisseal">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "riskdefinequery" onclick = "riskdefinequery()">查询</a>
	<br>
	<br>
	<table id="riskdefinelist" class="easyui-datagrid" title="保险产品管理" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'moveup',width:60,formatter:moveUp">排序</th>
				<th data-options="field:'groupcode',width:90">保险产品编码</th>
				<th data-options="field:'channelname',width:80">签约渠道</th>
				<th data-options="field:'risktypename',width:80">险种类型</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskname',width:320">险种名称</th>
				<th data-options="field:'riskkind01name',width:90">产品大类</th>
				<th data-options="field:'riskkind02name',width:90">产品小类</th>
				<th data-options="field:'jointypename',width:80">产品属性</th>
				<th data-options="field:'issealname',width:80">是否在售</th>
				<th data-options="field:'freelookperiod',width:80">犹豫期天数</th>
				<th data-options="field:'price',width:50">保费</th>
				<th data-options="field:'promise_xubaoname',width:60">保证续保</th>
				<th data-options="field:'url',width:600">投保链接</th>
				<th data-options="field:'description',width:600">产品描述</th>
				<th data-options="field:'aiuw',width:80">智能核保</th>
				<th data-options="field:'emailuw',width:80">人工核保</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr id = "dis_riskcode">
			<td class = "reprot_title">
				险种代码
			</td>
			<td class = "common">
				<input class = "txt" name="riskcode" id="riskcode" notnull = "险种代码" onchange = "riskchange();">
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				签约渠道
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="channel" id="channel" notnull = "签约渠道">
				</select>
			</td>
			
			<td class = "reprot_title">
				渠道险种编码
			</td>
			<td class = "report_common">
				<input class = "txt" name="outriskcode" id="outriskcode" notnull = "渠道险种编码">
			</td>
			
			<td class = "reprot_title">
				险种类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="risktype" id="risktype" notnull = "险种类型">
				</select>
			</td>
			
			<td class = "reprot_title">
				保险公司
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" name="insorgancode" id="insorgancode" notnull = "保险公司">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				险种名称
			</td>
			<td class = "report_common">
				<input class = "txt" name="riskname" id="riskname" notnull = "险种名称">
			</td>
			
			<td class = "reprot_title">
				美华险种编码
			</td>
			<td class = "report_common">
				<input class = "txt" name="discode" id="discode" notnull = "渠道险种编码">
			</td>
			
			<td class = "reprot_title">
				产品大类
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" name="riskkind01" id="riskkind01" notnull = "产品大类">
				</select>
			</td>
			
			<td class = "reprot_title">
				产品小类
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="riskkind02" id="riskkind02" notnull = "产品小类">
				</select>
			</td>
		</tr>
		
		<tr hidden>
			<td class = "reprot_title">
				是否主险
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="ismain" id="ismain" notnull = "是否主险">
				</select>
			</td>
			
			<td class = "reprot_title">
				主险名称
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="mainriskcode" id="mainriskcode" notnull = "主险名称">
				</select>
			</td>
			
			<td class = "reprot_title">
				排序（险种类型）
			</td>
			<td class = "report_common">
				<input class = "txt" name="orderby" id="orderby" notnull = "排序">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				产品属性
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="jointype" id="jointype" notnull = "产品属性">
				</select>
			</td>
			
			<td class = "reprot_title">
				是否在售
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="isseal" id="isseal" notnull = "是否在售">
				</select>
			</td>
			
			<td class = "reprot_title">
				犹豫期天数
			</td>
			<td class = "report_common">
				<input class = "txt" name="freelookperiod" id="freelookperiod"notnull = "犹豫期天数">
			</td>
			
			<td class = "reprot_title">
				保费
			</td>
			<td class = "report_common">
				<input class = "txt" name="price" id="price" notnull = "保费">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				投保链接
			</td>
			<td class = "report_common" colspan="5">
				<input class = "txt" name="url" id="url" notnull = "链接">
			</td>
			
			<td class = "reprot_title">
				保证续保
			</td>
			<td class = "report_common" colspan="5">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="promise_xubao" id="promise_xubao" notnull = "保证续保">
				</select>
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				销售区域
			</td>
			<td class = "report_common" colspan="7">
				<select class = "easyui-combobox" panelHeight="auto" name="salesarea" id="salesarea" notnull = "销售区域"
				data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
				</select>
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				承保后续链接
			</td>
			<td class = "report_common" colspan="7">
				<input class = "txt" name="insrevisiturl" id="insrevisiturl" notnull = "产品回访说明">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				产品描述
			</td>
			<td class="report_common" colspan="7">
				<input class = "txt" name="description" id="description" notnull = "产品描述">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				智能核保
			</td>
			<td class = "report_common">
				<input type="checkbox" id="aiuw">
			</td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		
		<tr class = 'state01'>
			<td class = "reprot_title">
				人工核保
			</td>
			<td class = "report_common">
				<input type="checkbox" id="emailuw" onclick = "disemailuw()">
			</td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		
		<tr class = 'dis_emali_uw' hidden>
			<td class = "reprot_title">
				人工核保详情
			</td>
			<td class="report_common" colspan="5">
				<textarea notnull = "人工核保详情" class="txt" style="line-height: 1.5;width: 600px;height: 200px;" id="emailuw_remark" name="emailuw_remark">
				</textarea>
			</td>
		</tr>
		
	</table>
	<br>
	<div class="upload-box-uw dis_emali_uw" hidden>
		<input type='text' name='textfield' id='textfield' class='upload-txt' />  
	 	<button id = "file-view" class="smsbutton">浏览...</button> 	
	 	<input type="file" name="myfiles" class="upload-file-uw" id="filename" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" /> 	
	 	<button id = "file-upload" class="smsbutton" onclick = "FileUpload()">上传</button>
	 	<button id = "file-delete" class="smsbutton" onclick = "fileDelete()">删除</button>
	</div>
	<div class = "dis_emali_uw" hidden>
	<table id="filelist" class="easyui-datagrid" title="附件信息" style="width:560px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonefile">
		<thead>
			<tr>
				<th data-options="field:'filename',width:450">文件名称</th>
				<th data-options="field:'_signdownload',width:60,formatter:signdownload">操作</th>
			</tr>
		</thead>
	</table>
	<br>
	</div>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "riskdefineInsert" onclick = "riskdefineInsert()">险种录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "riskdefineUpdate" onclick = "riskdefineUpdate()">险种修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "riskdefineDelete" onclick = "riskdefineDelete()">险种删除</a>
</div>
</body>
</html>
