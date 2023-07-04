<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>阳光车险</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180718_66">
    <link rel="stylesheet" href="../../css/car/car-index.css?v=20180717_09">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=2180719_01"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=2180719_02"></script>
    <script src=" ../../js/car/suncar/checkFn.js?v=2180719_05"></script>
	<script src="../../js/car/suncar/sun_03.js?v=2180718_66"></script>
	<script src="../../js/common/insuCommon.js?v=2180719_03"></script>
	<style>
		.loading .sk-circle {
		    margin: 0 auto;
		    width: 8rem;
		    height: 3rem;
		    position: relative;
		    top: 20%;}
		.img{
			width:100%;
		}
		.errorMsg {
		    width: 100%;
		    display: none;
		    color: #F76F6F;
		    font-size: 0.6rem;
		    text-align: right;
		    position: inherit;
		}
	</style>
<script type="text/javascript">


var vehicleName_typein = "";
var brand_typein = "";
var family_typein = "";
var enginedesc_typein = "";
var gearboxtype_typein = "";

var pageno = "1";

//第三者责任险
var cov_600_data = cData('${luxury.cov_600.data}');
//司机责任险
var cov_701_data = cData('${luxury.cov_701.data}');
//乘客责任险
var cov_702_data = cData('${luxury.cov_702.data}');
//玻璃破碎险
var cov_231_data = cData('${luxury.cov_231.data}');
//车身划痕险
var cov_210_data = cData('${luxury.cov_210.data}');

$(function () 
{
	$("select").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text()=="请选择"){
	                $(this).siblings(".tmp").css("color","#999999");
	            }else{
	                $(this).siblings(".tmp").css("color","#222222");
	            }
	        }
	    }));
	});
	
	$(".tmp").each(function(){
	    if($(this).val()=="请选择"){
	        $(this).css("color","#999999");
	    }else{
	        $(this).css("color","#222222");
	    }
	});
	
	$('.pop-sure').click(function(){
		$('.mask').css("display","none");
	});
	
	var currYear = (new Date()).getFullYear();

	var etdate = ett_date(new Date());

	function addDay(dayNumber, date) 
	{
    	date = date ? date : new Date();
    	var ms = dayNumber * (1000 * 60 * 60 * 24);
	    var newDate = new Date(date.getTime() + ms);
    	return newDate;
    }
	
	var dateObj = 
	{
    	theme: 'android-ics light', //皮肤样式
        display: 'bottom', //显示方式
        rtl:true,
        mode: 'scroller', //日期选择模式
        lang:'zh',
        dateFormat: 'yyyy-mm-dd',
        dateOrder: 'ddmmyy',
        startYear:currYear - 80, //开始年份
        endYear:currYear + 30 //结束年份
    };
    
	$("#insudate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
	$("#effective_date").val(etdate);
})

function ett_date(date){
    var newDate = new Date((date/1000+86400)*1000);
    var y = newDate.getFullYear();
    var m = newDate.getMonth()+1;
    var d = newDate.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}

function cData(data){
//	var one = data.substring(data.lastIndexOf('[')+1,data.lastIndexOf(']')-1);
	var ones = data.split(";");
	var json1 = new Array();
    for(var i=0;i<ones.length;i++){
        var cc = new Object();
        cc.id = ones[i].split(':')[1];
		cc.value = ones[i].split(':')[0];
        json1.push(cc);
    }
	return json1;
}

function editor(status){
    if(status==1){

	}else if(status==2){

	}
}
</script>
</head>
<body style="">
	
	<header class="header w100 pl bgColor" style="z-index: 1;">
        <span>阳光车险</span>
        <br/>
        <span>本产品由阳光财险有限公司承保</span>
        <img src="../../images/car/yangguang/yangguang.png"/>
    </header>
	
    <article class="info" style="margin-top: 5.2rem;">
        <form id="fm" name="fm" method="post" action = "../../car/sunCar/car02save.do">
            <section class="infoList product">
                <p class="ml">车辆信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
			        <input type="text" hidden id="orderid" name="orderid" value="${orderid}">
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车主</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <input type="text" class="textfield txtR personInfo" id="carowner" name="carowner" value="${ownerInfo.ownerName.value}">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车牌</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <input type="text" class="textfield txtR personInfo" readonly="" id="plateno" name="plateno" value="${vehicleInfo.licenseNo.value}">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
					<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车型</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <input type="text" class="textfield txtR personInfo" readonly="" id="cartype" name="cartype" value="${vehicleInfo.vehicleModelName.value}">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
	                
			    </div>
            </section>

			<section class="infoList checkoutBox">
				<div class="isbox d_boxS hasArrow">
					<span class="title w35 l-float">保费合计</span>
					<span class="price w65 l-float">${luxury.totalPremium.premium/100}元</span>
					<input type="text" hidden id="totalPremium" name="totalPremium" value="${luxury.totalPremium.premium/100}">
				</div>
				<div class="infoSec pl pr bgColor borTop1" style="border-bottom: 1px solid #e1e1e1;">
					<div class="row">
						<span class="name">商业险</span>
						<span class="type"><fmt:formatNumber type="number" value="${luxury.bizTotalPremium.premium/100}" pattern="0.00" />元</span>
					</div>
					<i class="link"></i>
					<div class="row">
						<span class="name">交强险</span>
						<span class="type"><fmt:formatNumber type="number" value="${force.forcePremium.premium/100}" pattern="0.00" />元</span>
					</div>
					<i class="link"></i>
					<div class="row">
						<span class="name">车船税</span>
						<span class="type"><fmt:formatNumber type="number" value="${force.vehicleTaxPremium.premium/100}" pattern="0.00" />元</span>
					</div>
					<i class="link"></i>
					<div class="row">
						<span class="name">随车行李险</span>
						<span class="type"><fmt:formatNumber type="number" value="${specialPackage.scxlPremium.premium/100}" pattern="0.00" />元</span>
					</div>
				</div>
			</section>

			<section class="infoList checkoutBox">

				<div class="isbox d_boxS">
					<span class="title">商业险</span>
					<div class="check">
						<label for="syx_checkboxs" class="longTime">是否投保</label>
						<span class="choose">
                            <input type="checkbox" checked="checked" name="applicant.longTermEffective" id="syx_checkboxs" class="checkBox personInfo" value="on">
                        </span>
					</div>
				</div>

				<div class="syz" style="display: block;">
					<div class="infoSec pl pr bgColor borTop1 borBot1">
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">投保日期</dt>
							<dd class="w65 l-float txtR hasArrow">
								<input type="text" class="textfield txtR personInfo c_da251d" readonly="" id="insudate" name="insudate" value="" placeholder="请选择时间">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">机动车损失险</dt>
							<c:if test="${luxury.cov_200.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
								<dd class="w35 l-float txtR hasArrow"><div id="cov_200_v">0.00元</div>
							</c:if>
							<c:if test="${luxury.cov_200.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
								<dd class="w35 l-float txtR hasArrow"><div id="cov_200_v">0.00元</div>
							</c:if>
							<c:if test="${luxury.cov_200.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_200.premium/100}" pattern="0.00" />元</dd>
								<dd class="w35 l-float txtR hasArrow"><span id="cov_200_v">${luxury.cov_200.value}元</span>
							</c:if>
								<span id="cov_200_v_none" style="display: none;">不投保</span>
								<span class="choose">
                            	<input type="checkbox" checked="checked" id="cov_200" name="cov_200" class="checkBox personInfo" value="off">
                            	<input type="text" hidden id="cov_200_data" name="cov_200_data" value="${luxury.cov_200.value}">
							</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec" id="select_cov_600">
							<dt class="w35 l-float">第三者责任险</dt>
							<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_600.premium/100}" pattern="0.00"/>元</dd>
							<dd class="w35 l-float txtR hasArrow">
								<span class="mr-1" id="cov_600"  style="padding-right: 0.75rem;" data-id = '0.00'>不投保</span>
								<input type="text" hidden id="cov_600_v" name="cov_600_v" value="${luxury.cov_600.premium/100}">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec" id="select_cov_701">
							<dt class="w35 l-float">司机责任险</dt>
							<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_701.premium/100}" pattern="0.00"/>元</dd>
							<dd class="w35 l-float txtR hasArrow">
								<span class="mr-1" id="cov_701" style="padding-right: 0.75rem;" data-id = '0.00'>不投保</span>
								<input type="text" hidden id="cov_701_v" name="cov_701_v" value="${luxury.cov_701.premium/100}">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec" id="select_cov_702">
							<dt class="w35 l-float">乘客责任险</dt>
							<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_702.premium/100}" pattern="0.00"/>元</dd>
							<dd class="w35 l-float txtR hasArrow">
								<span class="mr-1" id="cov_702" style="padding-right: 0.75rem;" data-id = '0.00'>不投保</span>
								<input type="text" hidden id="cov_702_v" name="cov_702_v" value="${luxury.cov_702.premium/100}">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">全车盗抢险</dt>
							<c:if test="${luxury.cov_500.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
								<dd class="w35 l-float txtR hasArrow"><div id="cov_500_v">0.00元</div>
							</c:if>
							<c:if test="${luxury.cov_500.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
								<dd class="w35 l-float txtR hasArrow"><div id="cov_500_v">0.00元</div>
							</c:if>
							<c:if test="${luxury.cov_500.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_500.premium/100}" pattern="0.00" />元</dd>
								<dd class="w35 l-float txtR hasArrow"><span id="cov_500_v">${luxury.cov_500.value}元</span>
							</c:if>
								<span id="cov_500_v_none" style="display: none;">不投保</span>
								<span class="choose">
                            	<input type="checkbox" checked="checked" name="cov_500" id="cov_500" class="checkBox personInfo" value="off">
								<input type="text" hidden id="cov_500_data" name="cov_500_data" value="${luxury.cov_500.value}">
							</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec" id="select_cov_231">
							<dt class="w35 l-float">玻璃破碎险</dt>
							<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_231.premium/100}" pattern="0.00"/>元</dd>
							<dd class="w35 l-float txtR hasArrow">
								<span class="mr-1" id="cov_231" style="padding-right: 0.75rem;" data-id = '0.00'>不投保</span>
								<input type="text" hidden id="cov_231_v" name="cov_231_v" value="${luxury.cov_231.premium/100}">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec" id="select_cov_210">
							<dt class="w35 l-float">车身划痕险</dt>
							<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_210.premium/100}" pattern="0.00"/>元</dd>
							<dd class="w35 l-float txtR hasArrow">
								<span class="mr-1" id="cov_210" style="padding-right: 0.75rem;" data-id = '0.00'>不投保</span>
								<input type="text" hidden id="cov_210_v" name="cov_210_v" value="${luxury.cov_210.premium/100}">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">自燃损失险</dt>
							<c:if test="${luxury.cov_310.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_310.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_310.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_310.premium/100}" pattern="0.00" />元</dd>
							</c:if>
							<dd class="w35 l-float txtR hasArrow"><span id="cov_310_v">不投保</span>
								<span class="choose">
                            		<input type="checkbox" name="cov_310" id="cov_310" class="unCheckBox personInfo" value="off">
									<input type="text" hidden id="cov_310_data" name="cov_310_data" value="${luxury.cov_310.value}">
								</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">指定专修厂</dt>
							<c:if test="${luxury.cov_321.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_321.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_321.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_321.premium/100}" pattern="0.00" />元</dd>
							</c:if>
							<dd class="w35 l-float txtR hasArrow"><span id="cov_321_v">不投保</span>
								<span class="choose">
                            		<input type="checkbox" name="cov_321" id="cov_321" class="unCheckBox personInfo" value="off">
									<input type="text" hidden id="cov_321_data" name="cov_321_data" value="${luxury.cov_321.value}">
								</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">发动机涉水险</dt>
							<c:if test="${luxury.cov_291.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_291.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_291.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_291.premium/100}" pattern="0.00" />元</dd>
							</c:if>
							<dd class="w35 l-float txtR hasArrow"><span id="cov_291_v">不投保</span>
								<span class="choose">
									<input type="checkbox" name="cov_291" id="cov_291" class="unCheckBox personInfo" value="off">
									<input type="text" hidden id="cov_291_data" name="cov_291_data" value="${luxury.cov_291.value}">
								</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">精神损害险</dt>
							<c:if test="${luxury.cov_640.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_640.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_640.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_640.premium/100}" pattern="0.00" />元</dd>
							</c:if>
							<dd class="w35 l-float txtR hasArrow"><span id="cov_640_v">不投保</span>
								<span class="choose">
									<input type="checkbox" name="cov_640" id="cov_640" class="unCheckBox personInfo" value="off">
									<input type="text" hidden id="cov_640_data" name="cov_640_data" value="${luxury.cov_640.value}">
								</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">无法找到第三方险</dt>
							<c:if test="${luxury.cov_733.premium == ''}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_733.premium == null}">
								<dd class="w30 l-float c_da251d">0.00元</dd>
							</c:if>
							<c:if test="${luxury.cov_733.premium != null}">
								<dd class="w30 l-float c_da251d"><fmt:formatNumber type="number" value="${luxury.cov_733.premium/100}" pattern="0.00" />元</dd>
							</c:if>
							<dd class="w35 l-float txtR hasArrow"><span id="cov_733_v">不投保</span>
								<span class="choose">
									<input type="checkbox" name="cov_733" id="cov_733" class="unCheckBox personInfo" value="off">
									<input type="text" hidden id="cov_733_data" name="cov_733_data" value="${luxury.cov_733.value}">
								</span>
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<%--<dl class="clearfix borBot1 dlSec">--%>
							<%--<dt class="w35 l-float">修理期间费用补偿险</dt>--%>
							<%--<dd class="w30 l-float c_da251d">0.00元<i class="editor" id="xlq"></i></dd>--%>
							<%--<dd class="w35 l-float txtR hasArrow"><span id="cov_734_v">不投保</span>--%>
								<%--<span class="choose">--%>
                            		<%--<input type="checkbox" name="applicant.longTermEffective" id="cov_734" class="unCheckBox personInfo" value="off">--%>
								<%--</span>--%>
							<%--</dd>--%>
							<%--<span class="errorMsg"></span>--%>
						<%--</dl>--%>
						<%--<div id="xlq_bcx" style="display: none;">--%>
							<%--<dl class="clearfix borBot1 dlSec">--%>
								<%--<dt class="w35 l-float">&nbsp;修理费用(元)</dt>--%>
								<%--<dd class="w65 l-float txtR hasArrow" style="box-sizing: border-box;">--%>
									<%--<input type="text" class="textfield txtR personInfo" id="policyName" name="applicant.appntName" value="" placeholder="0">--%>
								<%--</dd>--%>
								<%--<span class="errorMsg"></span>--%>
							<%--</dl>--%>
							<%--<dl class="clearfix borBot1 dlSec">--%>
								<%--<dt class="w35 l-float">&nbsp;修理天数(天)</dt>--%>
								<%--<dd class="w65 l-float txtR hasArrow" style="box-sizing: border-box;">--%>
									<%--<input type="text" class="textfield txtR personInfo" id="policyName1" name="applicant.appntName" value="" placeholder="0">--%>
								<%--</dd>--%>
								<%--<span class="errorMsg"></span>--%>
							<%--</dl>--%>
						<%--</div>--%>
						<%--<dl class="clearfix borBot1 dlSec">--%>
							<%--<dt class="w35 l-float">新增设备损失险</dt>--%>
							<%--<dd class="w30 l-float c_da251d">0.00元<i class="editor" id="xzsb"></i></dd>--%>
							<%--<dd class="w35 l-float txtR hasArrow"><span id="cov_650_v">不投保</span>--%>
								<%--<span class="choose">--%>
                            	<%--<input type="checkbox" name="applicant.longTermEffective" id="cov_650" class="unCheckBox personInfo" value="off">--%>
							<%--</span>--%>
							<%--</dd>--%>
							<%--<span class="errorMsg"></span>--%>
						<%--</dl>--%>
						<%--<div id="xzsb_ssx" style="display: none;">--%>
							<%--<dl class="clearfix borBot1 dlSec">--%>
								<%--<dt class="w35 l-float">&nbsp;名称</dt>--%>
								<%--<dd class="w65 l-float txtR hasArrow" style="box-sizing: border-box;">--%>
									<%--<input type="text" class="textfield txtR personInfo" id="xzsbName" name="xzsbName" value="" placeholder="请输入设备名称">--%>
								<%--</dd>--%>
								<%--<span class="errorMsg"></span>--%>
							<%--</dl>--%>
							<%--<dl class="clearfix borBot1 dlSec">--%>
								<%--<dt class="w35 l-float">&nbsp;数量</dt>--%>
								<%--<dd class="w65 l-float txtR hasArrow" style="box-sizing: border-box;">--%>
									<%--<input type="text" class="textfield txtR personInfo" id="xzsbCount" name="xzsbCount" value="" placeholder="请输入设备数量">--%>
								<%--</dd>--%>
								<%--<span class="errorMsg"></span>--%>
							<%--</dl>--%>
							<%--<dl class="clearfix borBot1 dlSec">--%>
								<%--<dt class="w35 l-float">&nbsp;新建重置价小计</dt>--%>
								<%--<dd class="w65 l-float txtR hasArrow" style="box-sizing: border-box;">--%>
									<%--<input type="text" class="textfield txtR personInfo" id="xzsbTotal" name="xzsbTotal" value="" placeholder="请输入设备价格">--%>
								<%--</dd>--%>
								<%--<span class="errorMsg"></span>--%>
							<%--</dl>--%>
							<%--<dl class="clearfix borBot1 dlSec">--%>
								<%--<dt class="w35 l-float">&nbsp;购置日期</dt>--%>
								<%--<dd class="w65 l-float txtR hasArrow" style="box-sizing: border-box;">--%>
									<%--<input type="text" class="textfield txtR personInfo" id="xzsbTime" name="xzsbTime" value="" placeholder="选择日期">--%>
								<%--</dd>--%>
								<%--<span class="errorMsg"></span>--%>
							<%--</dl>--%>
						<%--</div>--%>
						<%--<dl class="clearfix borBot1 dlSec">--%>
							<%--<dt class="w35 l-float">机动车第三者责任保险法定节假日限额翻倍险</dt>--%>
							<%--<dd class="w30 l-float c_da251d">0.00</dd>--%>
							<%--<dd class="w35 l-float txtR hasArrow"><span id="cov_666_v">不投保</span>--%>
								<%--<span class="choose">--%>
                            		<%--<input type="checkbox" name="applicant.longTermEffective" id="cov_666" class="unCheckBox personInfo" value="off">--%>
								<%--</span>--%>
							<%--</dd>--%>
							<%--<span class="errorMsg"></span>--%>
						<%--</dl>--%>
						<%--<dl class="clearfix borBot1 dlSec">--%>
							<%--<dt class="w35 l-float">不计免赔</dt>--%>
							<%--<dd class="w30 l-float c_da251d">0.00</dd>--%>
							<%--<dd class="w35 l-float txtR hasArrow">--%>
							<%--</dd>--%>
							<%--<span class="errorMsg"></span>--%>
						<%--</dl>--%>
					</div>
				</div>
            </section>

			<section class="infoList checkoutBox">

				<div class="isbox d_boxS hasArrow">
					<span class="title">交强险</span>
					<div class="name">按国家规定交强险与车船税同时购买</div>
					<div class="check">
						<label for="jqx_checkboxs" class="longTime">是否投保</label>
						<span class="choose">
                            <input type="checkbox" checked="checked" name="jqx_checkboxs" id="jqx_checkboxs" class="checkBox personInfo" value="on">
                        </span>
					</div>
				</div>

				<div class="jqx" style="display: block;">
					<div class="infoSec pl pr bgColor borTop1 borBot1">
						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">交强险生效日期</dt>
							<dd class="w65 l-float txtR hasArrow">
								<input type="text" class="textfield txtR personInfo c_da251d" readonly="readonly" id="effective_date" name="effective_date" value="" placeholder="请输入有效期">
								<i class="arrow"></i>
							</dd>
							<span class="errorMsg"></span>
						</dl>

						<dl class="clearfix borBot1 dlSec">
							<dt class="w35 l-float">交强险+车船税</dt>
							<dd class="w35 l-float c_da251d"><fmt:formatNumber type="number" value="${force.forcePremium.premium/100}" pattern="0.00" />元+<fmt:formatNumber type="number" value="${force.vehicleTaxPremium.premium/100}" pattern="0.00" />元</dd>
							<dd class="w30 l-float txtR hasArrow">
							</dd>
							<span class="errorMsg"></span>
						</dl>
						<div class="txtbox">
							<div class="line">
								<div class="w35 l-float name">今年应缴</div>
								<div class="w65 l-float type" ><fmt:formatNumber type="number" value="${force.thisYearSubmitted.premium/100}" pattern="0.00" />元</div>
							</div>
							<div class="line">
								<div class="w35 l-float name">去年应缴</div>
								<div class="w65 l-float type" ><fmt:formatNumber type="number" value="${force.lastYearSubmitted.premium/100}" pattern="0.00" />元</div>
							</div>
							<div class="line">
								<div class="w35 l-float name">滞纳金</div>
								<div class="w65 l-float type" ><fmt:formatNumber type="number" value="${force.lateFee.premium/100}" pattern="0.00" />元</div>
							</div>
							<div class="line">
								<div class="w35 l-float name">出险次数</div>
								<div class="w65 l-float type" ><fmt:formatNumber type="number" value="${force.claimNum.premium/100}" pattern="0.00" />次</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="infoList product">
                <p class="ml">保单形式</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
			        <dl class="clearfix borBot1 dlSec" id="select_cov_700">
				        <dt class="w35 l-float">商业保单形式</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <span class="" id="cov_700" style="padding-right: 1.25rem;" data-id="0.00"> 电子保单</span>
						   <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">交强保单形式</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <span class=""  style="padding-right: 1.25rem;" data-id="0.00">电子保单</span>
						   <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
					<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">发票形式</dt>
				        <dd class="w65 l-float txtR hasArrow">
					       <span class=""  style="padding-right: 1.25rem;" data-id="0.00">电子发票</span>
						   <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">发票抬头</dt>
				        <dd class="w65 l-float txtR hasArrow">
							<input type="text" class="myinput" style="width: 75%;text-align: right !important;padding-right: 0.2rem;" id="invoiceTitle" name="invoiceTitle" value="" placeholder="请输入发票抬头">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">投保人邮箱</dt>
				        <dd class="w65 l-float txtR hasArrow">
				        	<input type="text" class="myinput" style="width: 75%;text-align: right !important;padding-right: 0.2rem;" id="appntMail" name="appntMail" placeholder="请输入邮箱地址">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			    </div>
            </section>
			<section class="infoList checkoutBox">
				<div class="isbox d_boxS hasArrow">
					<span class="title">车主、投保人、被保人修改</span>
					<div class="check">
						<label for="jqx_checkboxs1" class="longTime"></label>
						<span class="choose">
                            <input type="checkbox" id="jqx_checkboxs1" name="jqx_checkboxs1" class="personInfo unCheckBox" value="off">
                        </span>
					</div>
				</div>
	                <div class="jqx1" style="display: none;">
						<div class="infoSec pl pr bgColor borTop1 borBot1">
							<dl class="clearfix borBot1 dlSec">
								<dt class="w35 l-float">姓名:</dt>
								<dd class="w65 l-float txtR hasArrow">
									<input type="text" readonly class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="ownerName" name="ownerName" placeholder="请输入姓名" value="${ownerInfo.ownerName.value}">
								</dd>
							</dl>
							<dl class="clearfix borBot1 dlSec">
								<dt class="w35 l-float">身份证号:</dt>
								<dd class="w65 l-float txtR hasArrow">
									<input type="text" readonly class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="ownerIdNo" name="ownerIdNo"  placeholder="请输入身份证号" value="${ownerInfo.ownerIdNo.value}">
								</dd>
								<span class="errorMsg"></span>
								<!-- <i class="arrow"></i> -->
							</dl>
							<dl class="clearfix borBot1 dlSec">
								<dt class="w35 l-float">联系人手机号:</dt>
								<dd class="w65 l-float txtR hasArrow">
									<input type="text" readonly class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="ownerMobile" name="ownerMobile" placeholder="请输入联系人手机号" value="${ownerInfo.ownerMobile.value}">
								</dd>
							</dl>
						</div>
						<section class="infoList checkoutBox">
							<div class="isbox d_boxS hasArrow">
								<span class="title">投保人</span>
								<div class="check">
									<label for="jqx_checkboxs2" class="longTime">同车主</label>
									<span class="choose">
			                            <input type="checkbox" checked="checked" id="jqx_checkboxs2" name="jqx_checkboxs2" class="personInfo checkBox" value="no">
			                        </span>
								</div>
							</div>
							<div class="jqx2" style="display: none;">
								<div class="infoSec pl pr bgColor borTop1 borBot1">
								<dl class="clearfix borBot1 dlSec"><p>投保人是为汽车办理保险并支付保费的人,<span>保费发票抬头为投保人</span></p></dl>
									<dl class="clearfix borBot1 dlSec">
										<dt class="w35 l-float">姓名:</dt>
										<dd class="w65 l-float txtR hasArrow">
											<input type="text" class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="appntName" name="appntName" placeholder="请输入中文名字" value="${applicantInfo.applicantName.value}">
										</dd>
									</dl>
									<dl class="clearfix borBot1 dlSec">
										<dt class="w35 l-float">身份证号:</dt>
										<dd class="w65 l-float txtR hasArrow">
											<input type="text" class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="appntId" name="appntId" placeholder="请输入身份证号" value="${applicantInfo.applicantIdNo.value}">
										</dd>
									</dl>
									<dl class="clearfix borBot1 dlSec">
										<dt class="w35 l-float">联系人手机号:</dt>
										<dd class="w65 l-float txtR hasArrow">
											<input type="text" class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="appntMobile" name="appntMobile" placeholder="必填" value="${applicantInfo.applicantMobile.value}">
										</dd>
									</dl>
								</div>
							</div>
						</section>

						<section class="infoList checkoutBox">
							<div class="isbox d_boxS hasArrow">
								<span class="title">被保险人</span>
								<div class="check">
									<label for="jqx_checkboxs3" class="longTime">同车主</label>
									<span class="choose">
			                            <input type="checkbox" checked="checked" id="jqx_checkboxs3" name="jqx_checkboxs3" class="personInfo checkBox" value="on">
			                        </span>
								</div>
							</div>

							<div class="jqx3" style="display: none;">
								<div class="infoSec pl pr bgColor borTop1 borBot1" style="border-bottom: none;">
								<dl class="clearfix borBot1 dlSec"><p>被保险人通常就是车主，理赔款将支付给被保险人</p></dl>
									<dl class="clearfix borBot1 dlSec">
										<dt class="w35 l-float">姓名:</dt>
										<dd class="w65 l-float txtR hasArrow">
											<input type="text" class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="insuredName" name="insuredName" placeholder="请输入中文名字" value="${insuredInfo.insuredName.value}">
										</dd>
									</dl>
									<dl class="clearfix borBot1 dlSec">
										<dt class="w35 l-float">身份证号:</dt>
										<dd class="w65 l-float txtR hasArrow">
											<input type="text" class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="insuredIdNo" name="insuredIdNo" placeholder="请输入有效期" value="${insuredInfo.insuredIdNo.value}">
										</dd>
									</dl>
									<dl class="clearfix borBot1 dlSec">
										<dt class="w35 l-float">联系人手机号:</dt>
										<dd class="w65 l-float txtR hasArrow">
											<input type="text" class="myinput" style="text-align: right !important;margin-right: 0.3rem;" id="insuredMobile" name="insuredMobile" placeholder="必填" value="${insuredInfo.insuredMobile.value}">
										</dd>
									</dl>
								</div>
							</div>
						</section>
					</div>
				<div class="infoSec pl pr bgColor borTop1 borBot1">
					<div class="prompt1 bottom-0">1.&nbsp;&nbsp;车主、投保人、被投保人信息默认一致，修改后保费或许发生变化。</div>
					<div class="prompt1 bottom-0">2.&nbsp;&nbsp;投保人应对投保人、被保险人、保险标的等相关信息做到如实填录。</div>
					<div class="prompt">注意：您当前交强险尚未到期，请在交强险到期前90天再来投保。</div>
				</div>
			</section>
        </form>

        <!--投保按钮-->
        <div class="bgColor fixedBox w100" style="display: block" id="toSave">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC" id="sureToSave">确认报价</div>
				</dd>
            </dl>
        </div>

		<!--重新报价按钮-->
        <div class="bgColor fixedBox w100" style="display: none" id="reSave">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC" id="sureReSave">重新报价</div>
				</dd>
            </dl>
        </div>
        
    </article>
    
    <div class="loading">
        <div class="sk-circle">
         <img alt="" class="img" src="../../images/car/guodu.gif">
           <!--  <div class="sk-circle1 sk-child"></div>
            <div class="sk-circle2 sk-child"></div>
            <div class="sk-circle3 sk-child"></div>
            <div class="sk-circle4 sk-child"></div>
            <div class="sk-circle5 sk-child"></div>
            <div class="sk-circle6 sk-child"></div>
            <div class="sk-circle7 sk-child"></div>
            <div class="sk-circle8 sk-child"></div>
            <div class="sk-circle9 sk-child"></div>
            <div class="sk-circle10 sk-child"></div>
            <div class="sk-circle11 sk-child"></div>
            <div class="sk-circle12 sk-child"></div> -->
        </div>
    </div>
    <!--弹窗-->
    <div class="mask">
        <div class="pop repeat">
            <span>失败提示</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
    <div class="forSelfMask">
        <div class="forSelfPop forSelfRepeat">
            <p>是否确认投保？</p>
            <span>说明：根据相关规定，您作为投保人或被保险人购买产品将无法获得平台推广费和推荐奖励。</span>
            <div class="forSelfBtn">
                <a href="javascript:void(0);" class="forSelfUnsure">取消</a>
                <a href="javascript:void(0);" class="forSelfSure">确定</a>
            </div>
        </div>
    </div>
    </article>
<script>

    var cov_600 = document.querySelector('#cov_600');
    var select_cov_600 = document.querySelector('#select_cov_600');

    cov_600.addEventListener('click', function () {

        var bankId = cov_600.dataset['id'];
        var bankName = cov_600.dataset['value'];

        var bankSelect = new IosSelect(1,
            [cov_600_data],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_cov_600.value = selectOneObj.id;
                    cov_600.innerHTML = selectOneObj.value;
                    cov_600.dataset['id'] = selectOneObj.id;
                    cov_600.dataset['value'] = selectOneObj.value;
                    $("#cov_600_v").val(selectOneObj.id);
                    reButton();
                }
            });
    });

    var cov_701 = document.querySelector('#cov_701');
    var select_cov_701 = document.querySelector('#select_cov_701');

    cov_701.addEventListener('click', function () {

        var bankId = cov_701.dataset['id'];
        var bankName = cov_701.dataset['value'];

        var bankSelect = new IosSelect(1,
            [cov_701_data],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_cov_701.value = selectOneObj.id;
                    cov_701.innerHTML = selectOneObj.value;
                    cov_701.dataset['id'] = selectOneObj.id;
                    cov_701.dataset['value'] = selectOneObj.value;
                    $("#cov_701_v").val(selectOneObj.id);
                    reButton();
                }
            });
    });

    var cov_702 = document.querySelector('#cov_702');
    var select_cov_702 = document.querySelector('#select_cov_702');

    cov_702.addEventListener('click', function () {

        var bankId = cov_702.dataset['id'];
        var bankName = cov_702.dataset['value'];

        var bankSelect = new IosSelect(1,
            [cov_702_data],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_cov_702.value = selectOneObj.id;
                    cov_702.innerHTML = selectOneObj.value;
                    cov_702.dataset['id'] = selectOneObj.id;
                    cov_702.dataset['value'] = selectOneObj.value;
                    $("#cov_702_v").val(selectOneObj.id);
                    reButton();
                }
            });
    });

    var cov_231 = document.querySelector('#cov_231');
    var select_cov_231 = document.querySelector('#select_cov_231');

    cov_231.addEventListener('click', function () {

        var bankId = cov_231.dataset['id'];
        var bankName = cov_231.dataset['value'];

        var bankSelect = new IosSelect(1,
            [cov_231_data],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_cov_231.value = selectOneObj.id;
                    cov_231.innerHTML = selectOneObj.value;
                    cov_231.dataset['id'] = selectOneObj.id;
                    cov_231.dataset['value'] = selectOneObj.value;
                    $("#cov_231_v").val(selectOneObj.id);
                    reButton();
                }
            });
    });

    var cov_210 = document.querySelector('#cov_210');
    var select_cov_210 = document.querySelector('#select_cov_210');

    cov_210.addEventListener('click', function () {

        var bankId = cov_210.dataset['id'];
        var bankName = cov_210.dataset['value'];

        var bankSelect = new IosSelect(1,
            [cov_210_data],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_cov_210.value = selectOneObj.id;
                    cov_210.innerHTML = selectOneObj.value;
                    cov_210.dataset['id'] = selectOneObj.id;
                    cov_210.dataset['value'] = selectOneObj.value;
                    $("#cov_210_v").val(selectOneObj.id);
                    reButton();
                }
            });
    });
</script>
</body>
</html>