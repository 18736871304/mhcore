<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
		<!-- <link rel="stylesheet" type="text/css" href="css/checkbix.min.css">
	<script type="text/javascript" src="js/common/checkbix.min.js?v=20180504"></script> -->
<script>

var inputList;
var checkList;
var doubleList;

!function(t,e){"use strict";"function"==typeof define&&define.amd?define("Checkbix",e):"object"==typeof exports?exports=module.exports=e():t.Checkbix=e()}(this,function(){"use strict";var t,e={},n={initClass:"checkbix"},i=function(t,e,n){if("[object Object]"===Object.prototype.toString.call(t))for(var i in t)Object.prototype.hasOwnProperty.call(t,i)&&e.call(n,t[i],i,t);else for(var a=0,r=t.length;a<r;a++)e.call(n,t[a],a,t)},a=function(t,e){var n={};return i(t,function(e,i){n[i]=t[i]}),i(e,function(t,i){n[i]=e[i]}),n},r=function(){for(var e=document.querySelectorAll("."+t.initClass),n=0;n<e.length;n++){var i=e[n].getAttribute("data-size")?e[n].getAttribute("data-size"):"",a=e[n].getAttribute("data-arialabel")?e[n].getAttribute("data-arialabel"):"";e[n].insertAdjacentHTML("afterend",'<label aria-label="'+a+'" role="checkbox" for="'+e[n].id+'" class="'+t.initClass+'"><span class="'+i+'"></span>'+e[n].getAttribute("data-text")+"</label>")}};return e.destroy=function(){t&&(document.removeEventListener("click",r,!1),t=null)},e.init=function(i){e.destroy(),t=a(n,i||{}),document.addEventListener("DOMContentLoaded",r,!1)},e});
Checkbix.init();
window.onload = function()
{
	Checkbix.init();
	inputList = [
		 	];

		 checkList = [
		 	];
		 
	initDataGrid($('#userintentionlist'));
	
	disComBox($('#qsource'),"source",null);
	displayCombox($('#qworkerno'));
	$('#userintentionlist').datagrid('hideColumn', "workerno");
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qworkerno"){
		if( $('#qworkerno').combobox('getValue')=='reuserid'){
			$('#userintentionlist').datagrid('hideColumn', "workerno");
			$('#userintentionlist').datagrid('showColumn', "reuserid");
		}else{
			$('#userintentionlist').datagrid('hideColumn', "reuserid");
			$('#userintentionlist').datagrid('showColumn', "workerno");
		}
		
	}
}

function selectone()
{
}

function saveSuss()
{
	$('#userintentionlist').datagrid('reload');
}

function clearCarData() 
{
}

function userintentionquery()
{
	var tturl = "policy/getUserintentionStatList.do";

	var tParam = new Object();

	tParam.startdate = $('#qStartDate').datebox("getValue");
	tParam.enddate = $('#qEndDate').datebox("getValue");
	
	//tParam.source = $('#qsource').combobox('getValue');
	tParam.groupno = $('#qgroupno').val();
	
	tParam.smscontact = $('#qworkerno').combobox('getValue');

	displayDataGrid($('#userintentionlist'), tParam, tturl);

	clearCarData();
}

function displayCombox(comboxid)
{
	comboxid.combobox
	({
		
		onSelect:function()
		{
			aftercodeselect(comboxid);
		}
	});
}
</script>
<style>
 
	input[type=checkbox].checkbix{position:absolute;opacity:0;z-index:-1}input[type=checkbox].checkbix+label{position:relative;display:-webkit-inline-box;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;color:inherit;-webkit-transition:all 250ms cubic-bezier(.4,0,.23,1);transition:all 250ms cubic-bezier(.4,0,.23,1);margin-bottom:.15rem}input[type=checkbox].checkbix+label>span{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;margin-right:.5em;width:16px;height:16px;background:0 0;border:.1rem solid #878787;border-radius:1px;cursor:pointer;-webkit-transition:all 250ms cubic-bezier(.4,0,.23,1);transition:all 250ms cubic-bezier(.4,0,.23,1);position:relative}input[type=checkbox].checkbix:focus+label>span{outline:0;}input[type=checkbox].checkbix:checked+label>span{background:rgb(224,235,255);border:.1rem solid transparent;-webkit-animation:reveal .2s cubic-bezier(.4,0,.5,1);animation:reveal .2s cubic-bezier(.4,0,.5,1)}input[type=checkbox].checkbix:checked+label>span:before{content:"";position:absolute;top:-1px;left:22%;margin-left:auto;margin-right:auto;border-right:2px solid transparent;border-bottom:2px solid transparent;-webkit-transform:rotate(45deg);transform:rotate(45deg);-webkit-transform-origin:0 100%;transform-origin:0 100%;-webkit-animation:checkboxcheck 125ms 50ms cubic-bezier(.1,0,.1,1) forwards;animation:checkboxcheck 125ms 50ms cubic-bezier(.1,0,.1,1) forwards}@-webkit-keyframes reveal{0%,100%{-webkit-transform:scale(1);transform:scale(1)}33%{-webkit-transform:scale(.5);transform:scale(.5)}}@keyframes reveal{0%,100%{-webkit-transform:scale(1);transform:scale(1)}33%{-webkit-transform:scale(.5);transform:scale(.5)}}@-webkit-keyframes checkboxcheck{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.2em;height:.3em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.2em;height:.4em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}@keyframes checkboxcheck{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.2em;height:.3em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.2em;height:.4em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}input[type=checkbox].checkbix[data-size=large]+label>span{width:17px;height:17px}input[type=checkbox].checkbix[data-size=large]+label>span:before{-webkit-animation:checkboxchecklarge 125ms 50ms cubic-bezier(.1,0,.1,1) forwards;animation:checkboxchecklarge 125ms 50ms cubic-bezier(.1,0,.1,1) forwards;border-right:3px solid transparent;border-bottom:3px solid transparent}@-webkit-keyframes checkboxchecklarge{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.3em;height:.6em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.3em;height:.6em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}@keyframes checkboxchecklarge{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.3em;height:.6em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.3em;height:.6em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}input[type=checkbox].checkbix[data-shape=circled]+label>span{border-radius:100%}input[type=checkbox].checkbix[data-color=black]:checked+label>span{background:#111}input[type=checkbox].checkbix[data-color=blue]:checked+label>span{background:#0074D9}input[type=checkbox].checkbix[data-color=red]:checked+label>span{background:#FF4136}input[type=checkbox].checkbix[data-color=gray]:checked+label>span{background:#AAA}input[type=checkbox].checkbix[data-color=orange]:checked+label>span{background:#FF851B}
</style>

</head>
<style>
.hide{
	display:none !important;
}
</style>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				申请起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qStartDate" name="qStartDate" notnull = "申请起期">
			</td>
			<td class = "title">
				申请止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qEndDate" name="qEndDate" notnull = "申请止期">
			</td>
			<td class="title">
				微信群号
			</td>
			<td class="common">
				<input class="txt" name="qgroupno" id="qgroupno">
			</td>
		</tr>
		<tr>
			<td class = "title">
				统计规则
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qworkerno" id="qworkerno">
					<option value="reuserid" selected="selected">按推送业务员</option>
					<option value="workerno">按录入业务员</option>
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userintentionquery" onclick = "userintentionquery()">用户意向查询</a>
	<br>
	<br>
	<table id="userintentionlist" class="easyui-datagrid" title="用户意向信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				
				<th data-options="field:'workerno',width:100">员工id</th>
				<th data-options="field:'reuserid',width:100">员工id</th>
				<th data-options="field:'visitname',width:100">员工姓名</th>
				<th data-options="field:'sourcename',width:100">收到微信</th>
				<th data-options="field:'ispass',width:100">加上微信</th>
				<th data-options="field:'wx',width:100">加上微信百分比</th>
				<th data-options="field:'isingroup',width:100">进群数量</th>
				<th data-options="field:'wxdelete',width:100">进群数量百分比</th>
				<!-- 
				<th data-options="field:'onein',width:110">第一天进直播数量</th>
				<th data-options="field:'oneisover',width:140">第一天进直播数量百分比</th>
				<th data-options="field:'twoin',width:110">第二天进直播数量</th>
				<th data-options="field:'twoisover',width:140">第二天进直播数量百分比</th>
				<th data-options="field:'threein',width:110">第三天进直播数量</th>
				<th data-options="field:'threeisover',width:140">第三天进直播数量百分比</th>
				 -->
				<th data-options="field:'planbook',width:100">计划书数量</th>
				<th data-options="field:'isbargain',width:100">成交数量 </th>
			</tr>
		</thead>
	</table>
	<br>
<script>

/* $('.sex_checkbox').find('input[type=checkbox]').bind('click', function(){
    $('.sex_checkbox').find('input[type=checkbox]').not(this).attr("checked", false);
}); */
$("input[type = checkbox]").each(function () {
    $(this).on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).val("是");
            $(this).removeClass("unCheckBox").addClass("checkBox").prop("checked",true);
        } else {
            $(this).val("");
            $(this).removeClass("checkBox").addClass("unCheckBox").prop("checked",false);
         
        }
    });
});

$("input[type = checkbox]").each(function () {
    if ($(this).prop("checked")) {
        $(this).val("是"); 
        $(this).removeClass("unCheckBox").addClass("checkBox");
       
    } else {
        $(this).val("");
        $(this).removeClass("checkBox").addClass("unCheckBox");
    }
});
/* $("#mycheckbox2").on("click", function () {
    if ($(this).hasClass("CheckBox")) {
       
    }else{
        
    }
}); */
</script>
</body>
</html>
