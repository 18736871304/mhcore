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
	
	var tturl = "policy/getgroupnos.do";
	displayCombox($('#qgroupno'),null,tturl,"dd_key","dd_value");
	dlgUserInit();
}

function aftercodeselect(comboxid)
{
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
	var tturl = "policy/getUserintentionList2.do";

	var tParam = new Object();

	tParam.startdate = $('#qStartDate').datebox("getValue");
	tParam.enddate = $('#qEndDate').datebox("getValue");
	
	tParam.source = $('#qsource').combobox('getValue');
	tParam.groupno = $('#qgroupno').combobox('getValue');
	//tParam.visitname = $('#qvisitname').val();
	tParam.mobile = $('#qmobile').val();
	//tParam.wx = $('#qwx').val();
	//tParam.remark = $('#qremark').val();
	//tParam.workerno = $('#qworkerno').val();
	tParam.ispass = $('#qispass').val()=="是"?$('#qispass').val():"";
	tParam.isingroup = $('#qisingroup').val()=="是"?$('#qisingroup').val():"";
	
	/*
	tParam.onequit = $('#qonequit').val()=="是"?$('#qonequit').val():"";
	tParam.twoquit = $('#qtwoquit').val()=="是"?$('#qtwoquit').val():"";
	tParam.therequit = $('#qtherequit').val()=="是"?$('#qtherequit').val():"";
	tParam.fourquit = $('#qfourquit').val()=="是"?$('#qfourquit').val():"";
	tParam.onein = $('#qonein').val()=="是"?$('#qonein').val():"";
	tParam.oneisover = $('#qoneisover').val()=="是"?$('#qoneisover').val():"";
	tParam.twoin = $('#qtwoin').val()=="是"?$('#qtwoin').val():"";
	tParam.twoisover = $('#qtwoisover').val()=="是"?$('#qtwoisover').val():"";
	tParam.threein = $('#qthreein').val()=="是"?$('#qthreein').val():"";
	tParam.threeisover = $('#qthreeisover').val()=="是"?$('#qthreeisover').val():"";
	*/
	
	tParam.planbook = $('#qplanbook').val()=="是"?$('#qplanbook').val():"";
	tParam.isbargain = $('#qisbargain').val()=="是"?$('#qisbargain').val():"";
	tParam.bargainvisit = $('#qbargainvisit').val()=="是"?$('#qbargainvisit').val():"";
	tParam.reuserid = $('#qreuserid').val();

	displayDataGrid($('#userintentionlist'), tParam, tturl);

	clearCarData();
}

</script>
<style>
 
	input[type=checkbox].checkbix{position:absolute;opacity:0;z-index:-1}input[type=checkbox].checkbix+label{position:relative;display:-webkit-inline-box;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;color:inherit;-webkit-transition:all 250ms cubic-bezier(.4,0,.23,1);transition:all 250ms cubic-bezier(.4,0,.23,1);margin-bottom:.15rem}input[type=checkbox].checkbix+label>span{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;margin-right:.5em;width:16px;height:16px;background:0 0;border:.1rem solid #878787;border-radius:1px;cursor:pointer;-webkit-transition:all 250ms cubic-bezier(.4,0,.23,1);transition:all 250ms cubic-bezier(.4,0,.23,1);position:relative}input[type=checkbox].checkbix:focus+label>span{outline:0;}input[type=checkbox].checkbix:checked+label>span{background:rgb(224,235,255);border:.1rem solid transparent;-webkit-animation:reveal .2s cubic-bezier(.4,0,.5,1);animation:reveal .2s cubic-bezier(.4,0,.5,1)}input[type=checkbox].checkbix:checked+label>span:before{content:"";position:absolute;top:-1px;left:22%;margin-left:auto;margin-right:auto;border-right:2px solid transparent;border-bottom:2px solid transparent;-webkit-transform:rotate(45deg);transform:rotate(45deg);-webkit-transform-origin:0 100%;transform-origin:0 100%;-webkit-animation:checkboxcheck 125ms 50ms cubic-bezier(.1,0,.1,1) forwards;animation:checkboxcheck 125ms 50ms cubic-bezier(.1,0,.1,1) forwards}@-webkit-keyframes reveal{0%,100%{-webkit-transform:scale(1);transform:scale(1)}33%{-webkit-transform:scale(.5);transform:scale(.5)}}@keyframes reveal{0%,100%{-webkit-transform:scale(1);transform:scale(1)}33%{-webkit-transform:scale(.5);transform:scale(.5)}}@-webkit-keyframes checkboxcheck{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.2em;height:.3em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.2em;height:.4em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}@keyframes checkboxcheck{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.2em;height:.3em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.2em;height:.4em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}input[type=checkbox].checkbix[data-size=large]+label>span{width:17px;height:17px}input[type=checkbox].checkbix[data-size=large]+label>span:before{-webkit-animation:checkboxchecklarge 125ms 50ms cubic-bezier(.1,0,.1,1) forwards;animation:checkboxchecklarge 125ms 50ms cubic-bezier(.1,0,.1,1) forwards;border-right:3px solid transparent;border-bottom:3px solid transparent}@-webkit-keyframes checkboxchecklarge{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.3em;height:.6em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.3em;height:.6em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}@keyframes checkboxchecklarge{0%{width:0;height:0;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}33%{width:.3em;height:.6em;-webkit-transform:rotate(45deg);transform:rotate(45deg)}100%{width:.3em;height:.6em;border-color:#fff;-webkit-transform:rotate(45deg);transform:rotate(45deg)}}input[type=checkbox].checkbix[data-shape=circled]+label>span{border-radius:100%}input[type=checkbox].checkbix[data-color=black]:checked+label>span{background:#111}input[type=checkbox].checkbix[data-color=blue]:checked+label>span{background:#0074D9}input[type=checkbox].checkbix[data-color=red]:checked+label>span{background:#FF4136}input[type=checkbox].checkbix[data-color=gray]:checked+label>span{background:#AAA}input[type=checkbox].checkbix[data-color=orange]:checked+label>span{background:#FF851B}
</style>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
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
			<td class = "title">
				渠道
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qsource" id="qsource">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				分配业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid" readonly onclick = "disuUserDlg($('#qreuserid'));">
			</td>
			<td class="title">
				手机号码
			</td>
			<td class="common">
				<input class="txt" name="qmobile" id="qmobile">
			</td>
			<td class = "title">
				是否加上微信
			</td>
			<td class = "common sex_checkbox">
                <input id="qispass" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
		</tr>
		<tr>
			<td class = "title">
				是否进群
			</td>
			<td class = "common sex_checkbox">
                <input id="qisingroup" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        <td class = "title">
				计划书
			</td>
			<td class = "common sex_checkbox">
                <input id="qplanbook" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        
	        <td class = "title">
				是否成交
			</td>
			<td class = "common sex_checkbox">
                <input id="qisbargain" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        
	        <!-- 
			<td class = "title">
					第一天退群
			</td>
			<td class = "common sex_checkbox">
                <input id="qonequit" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        <td  class = "title">第二天退群</td>
		        <td class = "common sex_checkbox">

	                <input id="qtwoquit" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large" >		            
		        </td> 
		    -->
		</tr>
		<!-- 
		<tr>
			<td  class = "title">第三天退群</td>
		        <td class = "common sex_checkbox">

	                <input id="qtherequit" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large" >		            
		        </td>
			<td class = "title">
				第四天退群
			</td>
			 <td class = "common sex_checkbox">
                <input id="qfourquit" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        <td class = "title">
				第一天进直播
			</td>
			<td class = "common sex_checkbox">
                <input id="qonein" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
		</tr>
		<tr>
			<td class = "title">
				第一天直播看完
			</td>
			<td class = "common sex_checkbox">
                <input id="qoneisover" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
			<td class = "title">
				第二天进直播
			</td>
			<td class = "common sex_checkbox">
                <input id="qtwoin" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        <td class = "title">
				第二天直播看完
			</td>
			<td class = "common sex_checkbox">
                <input id="qtwoisover" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
		</tr>
		 -->
		<tr>
			<!-- 
			<td class = "title">
				第三天进直播
			</td>
			<td class = "common sex_checkbox">
                <input id="qthreein" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
			<td class = "title">
				第三天直播看完
			</td>
			<td class = "common sex_checkbox">
                <input id="qthreeisover" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	         -->
		</tr>
		<tr>
			<td class = "title">
				成交回访
			</td>
			<td class = "common sex_checkbox">
                <input id="qbargainvisit" type="checkbox" class="checkbix CheckBox" value="" data-text="" data-size="large">		            
	        </td>
	        <td class = "title">
				群编号
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qgroupno" id="qgroupno">
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
				
				<th data-options="field:'makedate',width:120">申请日期</th>
				<th data-options="field:'sourcename',width:80">渠道</th>
				<th data-options="field:'workerno',width:80">提交工号</th>
				<!-- <th data-options="field:'reuserid',width:70">分配业务员</th> -->
				<th data-options="field:'username',width:80">分配业务员</th>
				<th data-options="field:'visitname',width:80">客户姓名</th>
				<th data-options="field:'mobile',width:80">手机号码</th>
				<th data-options="field:'wx',width:80">微信</th>
				<th data-options="field:'ispass',width:80">是否加上微信</th>
				<th data-options="field:'wxnickname',width:80">微信昵称</th>
				<th data-options="field:'isingroup',width:80">是否进群</th>
				<th data-options="field:'groupno',width:80">群编号</th>
				<th data-options="field:'hasbuy',width:80">是否买过寿险</th>
				<th data-options="field:'remark',width:360">备注</th>
				<!-- <th data-options="field:'smscontact',width:60">短信跟踪</th>
				<th data-options="field:'telinterviews',width:60">电话回访</th>
				<th data-options="field:'wxdelete',width:60">微信删除</th> -->
				
				<!-- 
				<th data-options="field:'onequit',width:80">第一天退群</th>
				<th data-options="field:'twoquit',width:80">第二天退群</th>
				<th data-options="field:'therequit',width:80">第三天退群</th>
				<th data-options="field:'fourquit',width:80">第四天退群</th>
				<th data-options="field:'onein',width:80">第一天进直播</th>
				<th data-options="field:'oneisover',width:80">是否看完</th>
				<th data-options="field:'twoin',width:80">第二天进直播</th>
				<th data-options="field:'twoisover',width:80">是否看完</th>
				<th data-options="field:'threein',width:80">第三天进直播</th>
				<th data-options="field:'threeisover',width:80">是否看完</th>
				 -->
				 
				<th data-options="field:'planbook',width:80">计划书</th>
				<th data-options="field:'isbargain',width:80">是否成交</th>
				<th data-options="field:'bargainvisit',width:80">成交回访</th>
			</tr>
		</thead>
	</table>
	<br>
 </div>
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
