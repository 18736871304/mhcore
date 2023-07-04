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
	initDataGrid($('#userwxlist'));

	inputList = [
			$('#wxno'),
			$('#password'),
			$('#paypassword'),
			$('#mobile'),
			$('#state'),
			$('#usercode'),
			$('#remark'),
	];

	checkList = [
			$('#wxno'),
			//$('#password'),
			//$('#mobile'),
			$('#state'),
			//$('#usercode')
	];

	disComBox($('#qstate'),"wxstate",null);
	disComBox($('#state'),"wxstate",null);
	//$('#state').combobox('setValue','02');
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	dlgUserInit();
	
	$('#remark').val("");
	
	$(".state01").hide();
	$(".state02").hide();
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="q02org")
	{	
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get03Org.do";
		
		displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="q03org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get04Org.do";
		
		displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="state")
	{
		disRedFont();
		
		if($('#state').combobox('getValue')=="02"||$('#state').combobox('getValue')=="03")
		{
			$('#password').val('');
			$('#paypassword').val('');
			$('#mobile').val('');
			$('#userkey').val('');
			$('#usercode').val('');
			$('#username').val('');
		}
	}
	else
	{
		teamAfterSelect(comboxid);
	}
	
}

function disRedFont()
{
	$(".state01").hide();
	$(".state02").hide();
	
	if($('#state').combobox('getValue')=="01")
	{
		$(".state01").show();
	}
    else if($('#state').combobox('getValue')=="02")
	{
		$(".state02").show();
	}
}

function selectone()
{
	var row = $('#userwxlist').datagrid('getSelected');

	$('#wxno').val(row.wxno);
	$('#password').val(row.password);
	$('#paypassword').val(row.paypassword);
	
	$('#mobile').val(row.mobile);
	$('#state').combobox('setValue',row.state);
	disRedFont();
	
	$('#userkey').val(row.userid);
	$('#usercode').val(row.usercode);
	$('#username').val(row.username);
	
	$('#remark').val(row.remark);
}

function saveSuss()
{
	clearCarData();
	$('#userwxlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
	$(".state01").hide();
	$(".state02").hide();
}

function stateCheck()
{
	if($('#state').combobox('getValue')=="02"||$('#state').combobox('getValue')=="03")
	{
		if($('#usercode').val()!=null&&$('#usercode').val()!="")
		{
			$.messager.alert('操作提示','使用人姓名需要为空！','error');
			return false;
		}
		
		if($('#mobile').val()!=null&&$('#mobile').val()!="")
		{
			$.messager.alert('操作提示','绑定手机号需要为空！','error');
			return false;
		}
	
		if($('#password').val()!=null&&$('#password').val()!="")
		{
			$.messager.alert('操作提示','微信密码需要为空！','error');
			return false;
		}
	
		if($('#paypassword').val()!=null&&$('#paypassword').val()!="")
		{
			$.messager.alert('操作提示','支付密码需要为空！','error');
			return false;
		}
	}
	
	return true;
}

function userwxInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}
	
	if($('#mobile').val()!=null&&$('#mobile').val()!=''&&$('#mobile').val()!='0')
	{
		if(!validatemobile($('#mobile').val()))	
		{
			return;	
		}
	}
	
	if(!stateCheck())
	{
		return;	
	}

	var tparam = prepareparam(inputList);
	tparam.userid = $('#userkey').val();

	ajaxdeal("userwx/userwxInsert.do",tparam,null,null,saveSuss);
}

function userwxUpdate()
{
	var row = $('#userwxlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	if($('#mobile').val()!=null&&$('#mobile').val()!=''&&$('#mobile').val()!='0')
	{
		if(!validatemobile($('#mobile').val()))	
		{
			return;	
		}
	}
	
	if(!stateCheck())
	{
		return;	
	}

	var tparam = prepareparam(inputList);
	tparam.wxserialno = row.wxserialno;
	
	tparam.oldstate = row.state;
	tparam.olduserid = row.userid;
	tparam.oldorgancode = row.organcode;
	
	tparam.userid = $('#userkey').val();

	ajaxdeal("userwx/userwxUpdate.do",tparam,null,null,saveSuss);
}

function userwxDelete()
{
	var row = $('#userwxlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.wxid = row.wxserialno;
	
	tparam.oldstate = row.state;
	tparam.olduserid = row.userid;
	
	tparam.wxno = row.wxno;

	ajaxdeal("userwx/userwxDelete.do",tparam,null,null,saveSuss);
}

function userwxquery()
{
	var tturl = "userwx/getUserwxList10.do";

	var tParam = new Object();

	tParam.wxno = $('#qwxno').val();
	tParam.mobile = $('#qmobile').val();
	tParam.state = $('#qstate').combobox('getValue');
	
	tParam.usercode = $('#qusercode').val();
	tParam.username = $('#qusername').val();
	
	tParam.organcode = $('#departmentId').val();

	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');

	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";
    for(var i=0;i<q04org_codes.length;i++)
    {
        if (q04orgStr != "") 
        {
        	q04orgStr += "','";
        }
        q04orgStr += q04org_codes[i];
    }
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid($('#userwxlist'), tParam, tturl);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				微信号
			</td>
			<td class = "common">
				<input class = "txt" name="qwxno" id="qwxno">
			</td>
			<td class = "title">
				绑定手机号
			</td>
			<td class = "common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				使用人编码
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qusername" id="qusername">
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "userwxquery()">微信号查询</a>
	<br>
	<br>
	<table id="userwxlist" class="easyui-datagrid" title="微信号信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'wxno',width:110">微信号</th>
				<th data-options="field:'statename',width:90">状态</th>
				<th data-options="field:'meid',width:110">在挂手机</th>
				<th data-options="field:'mobile',width:110">绑定手机号</th>
				
				<th data-options="field:'password',width:110">微信密码</th>
				<th data-options="field:'paypassword',width:90">支付密码</th>
				
				<th data-options="field:'usercode',width:90">使用人编码</th>
				<th data-options="field:'username',width:90" sortable="true">使用人姓名</th>
				
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:90">所属团队</th>
				
				<th data-options="field:'oldusercode',width:90">原使用人编码</th>
				<th data-options="field:'oldusername',width:90">原使用人姓名</th>
				
				<th data-options="field:'oldorgan02name',width:90">原所属省公司</th>
				<th data-options="field:'oldorganname',width:90">原所属分公司</th>
				<th data-options="field:'oldagentcom',width:90">原所属营业部</th>
				<th data-options="field:'oldteamname',width:90">原所属团队</th>
				
				<th data-options="field:'remark',width:300">备注</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="state" id="state" notnull = "状态">
				</select>
			</td>
		</tr>
	
		<tr>
			<td class = "title">
				微信号
			</td>
			<td class = "common">
				<input class = "txt" name="wxno" id="wxno"notnull = "微信号">
			</td>
			
			<td class = "title">
				绑定手机号
			</td>
			<td class = "common">
				<input class = "txt" name="mobile" id="mobile"notnull = "绑定手机号">
			</td>
		</tr>
		<tr>
			<td class = "title">
				微信密码
			</td>
			<td class = "common">
				<input class = "txt" name="password" id="password"notnull = "微信密码">
			</td>
			
			<td class = "title">
				支付密码
			</td>
			<td class = "common">
				<input class = "txt" name="paypassword" id="paypassword"notnull = "支付密码">
			</td>
			
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="username" id="username" notnull = "使用人姓名" readonly onclick = "disuUserDlg($('#usercode'),$('#userkey'),$('#username'));">
				<input type = 'hidden' id = 'userkey'>
				<input class = "txt" type = 'hidden' id = 'usercode' notnull = "使用人姓名">
			</td>
		</tr>
		<tr>
			<td class = "title">
				备注
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "备注" class="txt" style="width: 600px;height: 60px;" id="remark" name="remark">
				</textarea>
			</td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<div class = "state01">
		<font color="red">
			1. 实名认证<br>
			2. 绑定手机号<br>
			3. 绑定银行卡
		</font>
		<br><br>
	</div>
	<div class = "state02">
		<font color="red">
			1. 重置微信密码<br>
			2. 注销实名认证<br>
			3. 解绑手机号<br>
			4. 解绑银行卡<br>
			5. 删除非客户微信<br>
			6. 成交客户交接
		</font>
		<br><br>
	</div>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "userwxInsert" onclick = "userwxInsert()">微信号录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "userwxUpdate" onclick = "userwxUpdate()">微信号修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "userwxDelete" onclick = "userwxDelete()">微信号删除</a>
</div>
</body>
</html>
