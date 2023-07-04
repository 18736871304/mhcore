<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>安享一生防癌险</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=20180808">
	<link rel="stylesheet" href="../../css/hengqin/iosSelect.css?v=180420">
	<script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180420"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180420"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=180420" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect_2.js?v=180420" type="text/javascript"></script>
    <script src=" ../../js/hengqin/areaData_v2.js?v=180420"></script>
    <script src=" ../../js/hengqin/zepto.js?v=180420"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180420"></script>
    <style>
		.recommend_wrapper{
			position: absolute;
			left: 0;
			bottom: 1.5rem;
			width: 100%;
			overflow: hidden;
			padding: 0 0.75rem;
		}
		.recommend_wrapper a{
			display: block;
			width: 5.75rem;
			height: 4.5rem;
			float: left;
		}
		
		.mask {
			position: fixed;
			top: 0;
			left: 0;
			background: rgba(0, 0, 0, 0.5);
			width: 100%;
			height: 100%;
			z-index: 100000;
			display: none;
		}
		
		.pop {
			width: 12rem;
			border-radius: 5px;
			position: fixed;
			z-index: 5;
			left: 50%;
			margin-left: -6rem;
			top: 40%;
			margin-top: -75px;
			background: #fff;
			border: 1px solid #e1e1e1;
			/* display: none; */
			-webkit-animation: popZoom 0.2s ease-in-out both;
			animation: popZoom 0.2s ease-in-out both;
		}
		
		.pop span {
			max-height: 8rem;
			overflow-y: scroll;
			display: block;
			line-height: 160%;
			text-align: center;
			font-size: 0.65rem;
			padding: 1.4rem 0.6rem;
			color: #222;
		}
		
		.pop-sure {
			color: #ff2222;
			text-align: center;
			height: 43px;
			line-height: 43px;
			border-top: 0.025rem solid #e2e2e2;
			display: block;
			font-size: 0.8rem;
		}
    </style>
</head>
<body>
	<div class="index_wrapper">
		<div class="main_wrapper">
			<div class="banner_wrapper">
				<img src="../../images/anxin/axys/axysfax_01.png?v=20180531"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">28天-70周岁</span></p>
					<p><span class="left">保险期间</span><span class="right">1年</span></p>
					<p><span class="left">最高保额</span><span class="right">200万</span></p>
				</div>
			</div>
			<input type="hidden"  value = '${source }' id = 'source'>
			<div class="product_wrapper">
				<div id="nav">
					<div class="product_nav">
						<a href="javascript:;" class="active_nav"><span>产品介绍</span></a>
						<a href="javascript:;"><span>保障方案</span></a>
						<a href="javascript:;"><span>理赔流程</span></a>
						<a href="javascript:;"><span>承保公司</span></a>
					</div>
				</div>
				<div id="nav1" class="product_desc">
					<img src="../../images/anxin/axys/axysfax_02.png?v=20180531" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/anxin/axys/axysfax_03.png?v=20180531" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/anxin/axys/axysfax_04.png?v=20180531" alt="">
					<div class="recommend_wrapper">
						<a href="../../contract/anxin/axys/lipeiliucheng.pdf"></a>
						<a href="../../contract/anxin/axys/insuranceClauses.pdf"></a>
						<a href="../../contract/anxin/bwylPlus/disclosure.pdf"></a>
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/anxin/axys/axysfax_05.png?v=20180531" alt="">
				</div>
			</div>
			
			<div class="footer_wrapper" id="footer_wrapper">
				<div data-v-30b26e3d="" class="hq-mask"  style="display: none"></div>
				<section class="infoList trialCon" style="display:none;">
	                <div class="infoSec pl pr bgColor borTop1">
	                	<dl class="clearfix infoDl borBot1 dlSec"  id="selectDate">
		                	<dt class="w35 l-float">出生日期</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="showDate" style="padding-right: 0.75rem;" data-year = 'null'>2000-02-23</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
						<dl class="clearfix infoDl borBot1 dlSec"  id="select_BXTime" style="display: none;">
		                	<dt class="w35 l-float">保险期间</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_BXTime" style="padding-right: 0.75rem;" data-id = 'null'>1年</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
		                 <!-- <dl class="clearfix infoDl borBot1 dlSec"  id ="select_socialInsuFlag">
		                	<dt class="w35 l-float">有无社保</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span id="show_socialInsuFlag" style="padding-right: 0.75rem;" data-id = 'null'>有社保</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl> -->
		               <!--  <dl class="clearfix infoDl borBot1 dlSec"  id = "select_sex">
		                	<dt class="w35 l-float">性别</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_sex" style="padding-right: 0.75rem;" data-id = 'null'>男</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl> -->
		                <!-- <dl class="clearfix infoDl borBot1 dlSec"  id="select_contact">
		                	<dt class="w35 l-float">地址</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_contact" style="padding-right: 0.75rem;">请选择所在地址</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl> -->
						<!-- <dl class="clearfix infoDl borBot1 dlSec"  id="select_JFTime" >
		                	<dt class="w35 l-float">缴费期间</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_JFTime" style="padding-right: 0.75rem;" data-id = 'null'>1年</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl> -->
						<dl class="clearfix infoDl borBot1 dlSec"  id="select_prem" style="display: none">
		                	<dt class="w35 l-float">保费</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <input id = "prem" class="w65" type="number" style="padding-right: 0.75rem;" placeholder="填写金额">
		                    </dd>
		                </dl>
		                <dl class="clearfix infoDl borBot1 dlSec"  id="select_mobile" style="display: ''">
		                	<dt class="w35 l-float">手机号码</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <input id = "mobile" class="w65 typein" type="number" 
		                        style="padding-right: 0.75rem;width: 100%;" placeholder="请输入手机号码" > 
		                    </dd>
		                </dl>
	                </div>
	            </section>   
				<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
			            <dt class="w65 l-float  font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				            <span readonly="" class="insurePrice" id="insurePrice" >50.00</span><span>元/年起</span>
				            <input type="hidden" value = '50.00' id = 'insurePrice_trans'>
		            	</dt>
						<dd class="w35 r-float">
						    <div class="insureBtn txtC footer_go">立即投保</div>
						</dd>
		            </dl>
		        </div>
			</div>
		</div>
	</div>
	<div class="mask">
        <div class="pop repeat">
            <span>失败提示</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
	<script type="text/javascript">
		
	$(function () 
	{
		//点击确定，弹窗消失
	    $(".pop-sure").on("click", function () {
	        $(".pop").hide();
	        $(".mask").hide();
	    });
	})
	
	
		function showprem()
		{
			var age = '30';
			var sex = '1';
			var socialInsuFlag = 'Y';
			
			//alert($("#show_sex").attr("data-id"));
			//alert($("#show_sex").attr("data-id")=='undefined');
			
			/* if($("#show_sex").attr("data-id")!='null')
			{
				sex = $("#show_sex").attr("data-id");
			}
			
			if($("#show_JFTime").attr("data-id")!='null')
			{
				payendyear = $("#show_JFTime").attr("data-id");
			}*/
			
			/* if($("#show_socialInsuFlag").attr("data-id")!='null')
			{
				socialInsuFlag = $("#show_socialInsuFlag").attr("data-id");
			}  */
			
			if($("#showDate").attr("data-year")!='null')
			{
				age = getAgeByBirthDay($("#showDate").attr("data-year")+"-"+$("#showDate").attr("data-month")+"-"+$("#showDate").attr("data-date"));
			}
			
			
			/*
			alert(sex);
			alert(payendyear);
			alert(getyear);
			*/
			
			
			/* if($('#prem').val()==""||$('#prem').val()==0)
			{
				//alert(123);
				return;
			} */
			
			/* var paycount = 10;
			
			if(payendyear=="10Y")
			{
				paycount = 10;
			}
			else if(payendyear=="5Y")
			{
				paycount = 5;
			} 
			else if(payendyear=="3Y")
			{
				paycount = 3;
			} 
			else
			{
				paycount = 1;
			} */
			
			/* $('#show_zsj').html(Number($('#prem').val()*paycount).toFixed(2)); */
			$('#insurePrice').html(Number($('#prem').val()).toFixed(2));
			
			
			var premdata = 
			{
				"productNo":'07P002_axys',
				"age":age,
				"relation":'00',
				/* "socialInsuFlag":socialInsuFlag */
			};
			
			sendPriceRequest("../../life/anxin/getprice02.do",premdata,function (data) 
			{
			   	var obj = JSON.parse(data);
//			   	console.log(obj);
			   	if(obj.code == 0)
			   	{
			   		$('#insurePrice').html(Number(obj.mainPrice).toFixed(2));
			   		$('#prem').val(obj.mainPrice);
			   		$('#insurePrice_trans').val(Number(obj.mainPrice).toFixed(2));
			   	}
			   	else
			   	{
			  	}
			},function(){});
		
			
		}
	
		/* 出生日期选择 */
		var selectDateDom = $('#selectDate');
	    var showDateDom = $('#showDate');
	    // 初始化时间
	    var now = new Date();
	    var nowYear = now.getFullYear();
	    var nowMonth = now.getMonth() + 1;
	    var nowDate = now.getDate();
	    showDateDom.attr('data-year', nowYear);
	    showDateDom.attr('data-month', nowMonth);
	    showDateDom.attr('data-date', nowDate);
	    // 数据初始化
	    function formatYear (nowYear) {
	        var arr = [];
	        for (var i = nowYear; i >= nowYear-71; i--) {
	            arr.push({
	                id: i + '',
	                value: i + ''
	            });
	        }
	        return arr;
	    }
	    function formatMonth () {
	        var arr = [];
	        for (var i = 1; i <= 12; i++) {
	        	if(i < 10){
	        		i = '0'+ i;
	        	}
	            arr.push({
	                id: i + '',
	                value: i + ''
	            });
	        }
	        return arr;
	    }
	    function formatDate (count) {
	        var arr = [];
	        for (var i = 1; i <= count; i++) {
	        	if(i < 10){
	        		i = '0'+ i;
	        	}
	            arr.push({
	                id: i + '',
	                value: i + ''
	            });
	        }
	        return arr;
	    }
	    var yearData = function(callback) {
	        // settimeout只是模拟异步请求，真实情况可以去掉
	        // setTimeout(function() {
	            callback(formatYear(nowYear));
	        // }, 2000)
	    };
	    var monthData = function (year, callback) {
	        // settimeout只是模拟异步请求，真实情况可以去掉
	        // setTimeout(function() {
	            callback(formatMonth());
	        // }, 2000);
	    };
	    var dateData = function (year, month, callback) {
	        // settimeout只是模拟异步请求，真实情况可以去掉
	        // setTimeout(function() {
	            if (/^(01|03|05|07|08|10|12)$/.test(month)) {
	                callback(formatDate(31));
	            }
	            else if (/^(04|06|09|11)$/.test(month)) {
	                callback(formatDate(30));
	            }
	            else if (/^02$/.test(month)) {
	                if (year % 4 === 0 && year % 100 !==0 || year % 400 === 0) {
	                    callback(formatDate(29));
	                }
	                else {
	                    callback(formatDate(28));
	                }
	            }
	            else {
	                throw new Error('month is illegal');
	            }
	        // }, 2000);
	        // ajax请求可以这样写
	        /*
	        $.ajax({
	            type: 'get',
	            url: '/example',
	            success: function(data) {
	                callback(data);
	            }
	        });
	        */
	    };
	    selectDateDom.bind('click', function () {
	        var oneLevelId = showDateDom.attr('data-year');
	        var twoLevelId = showDateDom.attr('data-month');
	        var threeLevelId = showDateDom.attr('data-date');
	        var iosSelect = new IosSelect(3, 
	            [yearData, monthData, dateData],
	            {
	                title: '',
	                headerHeight: 50,itemHeight: 36,
	                itemShowCount: 5,
	                oneLevelId: oneLevelId,
	                twoLevelId: twoLevelId,
	                threeLevelId: threeLevelId,
	                showLoading: true,
	                callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
	                    showDateDom.attr('data-year', selectOneObj.id);
	                    showDateDom.attr('data-month', selectTwoObj.id);
	                    showDateDom.attr('data-date', selectThreeObj.id);
	                    showDateDom.html(selectOneObj.value + '-' + selectTwoObj.value + '-' + selectThreeObj.value);
	                    
	                    showprem();
	                }
	        });
	    });
	    
	    /* 性别 */
		/* var data_sex = [
			{'id': '1', 'value': '男'},
			{'id': '2', 'value': '女'}
		];
		
		var show_sex = document.querySelector('#show_sex');
    	var select_sex = document.querySelector('#select_sex');
    	
    	show_sex.addEventListener('click', function () {
            var bankId = show_sex.dataset['id'];
            var bankName = show_sex.dataset['value'];
            var bankSelect = new IosSelect(1, 
                [data_sex],
                {
                    container: '.container',
                    title: '',
                    itemHeight: 35,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                    	select_sex.value = selectOneObj.id;
                    	show_sex.innerHTML = selectOneObj.value;
                    	show_sex.dataset['id'] = selectOneObj.id;
                    	show_sex.dataset['value'] = selectOneObj.value;
                        
                        showamnt();
                    }
            });
        }); */
	    
		/* 交费期间 */
		/* var data = [
			{'id': '10Y', 'value': '10年'},
			{'id': '5Y', 'value': '5年'},
			{'id': '3Y', 'value': '3年'},
		    {'id': '1000Y', 'value': '趸交'}
		];
		
		var show_JFTime = document.querySelector('#show_JFTime');
    	var select_JFTime = document.querySelector('#select_JFTime');
    	
    	show_JFTime.addEventListener('click', function () {
            var bankId = show_JFTime.dataset['id'];
            var bankName = show_JFTime.dataset['value'];
            var bankSelect = new IosSelect(1, 
                [data],
                {
                    container: '.container',
                    title: '',
                    itemHeight: 35,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                        select_JFTime.value = selectOneObj.id;
                        show_JFTime.innerHTML = selectOneObj.value;
                        show_JFTime.dataset['id'] = selectOneObj.id;
                        show_JFTime.dataset['value'] = selectOneObj.value;
                        
                        showamnt();
                    }
            });
        }); */
    	/* 保险期间 */
    	var data2 = [
		    {'id': '1Y', 'value': '1年'}
		];
    	
		var show_BXTime = document.querySelector('#show_BXTime');
    	var select_BXTime = document.querySelector('#select_BXTime');
    	show_BXTime.addEventListener('click', function () {
            var bankId = show_BXTime.dataset['id'];
            var bankName = show_BXTime.dataset['value'];
            var bankSelect = new IosSelect(1, 
                [data2],
                {
                    container: '.container',
                    title: '',
                    itemHeight: 35,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                        select_BXTime.value = selectOneObj.id;
                        show_BXTime.innerHTML = selectOneObj.value;
                        show_BXTime.dataset['id'] = selectOneObj.id;
                        show_BXTime.dataset['value'] = selectOneObj.value;
                        
                        showprem();
                    }
            });
        });
    	/* 保额 */
    	/* var data3 = [
		    {'id': '60', 'value': '60周岁后的首个保单周年日'},
		    {'id': '65', 'value': '65周岁后的首个保单周年日'}
		];
		var show_BEMoney = document.querySelector('#show_BEMoney');
    	var select_BXTime = document.querySelector('#select_BEMoney');
    	show_BEMoney.addEventListener('click', function () {
            var bankId = show_BEMoney.dataset['id'];
            var bankName = show_BEMoney.dataset['value'];
            var bankSelect = new IosSelect(1, 
                [data3],
                {
                    container: '.container',
                    title: '',
                    itemHeight: 35,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                        select_BEMoney.value = selectOneObj.id;
                        show_BEMoney.innerHTML = selectOneObj.value;
                        show_BEMoney.dataset['id'] = selectOneObj.id;
                        show_BEMoney.dataset['value'] = selectOneObj.value;
                        
                        showamnt();
                    }
            });
        }); */
    	
    	/* 社保 */
		/* var data_socialInsuFlag = [
			{'id': 'Y', 'value': '有社保'},
			{'id': 'N', 'value': '无社保'}
		];
		
		var show_socialInsuFlag = document.querySelector('#show_socialInsuFlag');
    	var select_socialInsuFlag = document.querySelector('#select_socialInsuFlag');
    	
    	show_socialInsuFlag.addEventListener('click', function () {
            var bankId = show_socialInsuFlag.dataset['id'];
            var bankName = show_socialInsuFlag.dataset['value'];
            var bankSelect = new IosSelect(1, 
                [data_socialInsuFlag],
                {
                    container: '.container',
                    title: '',
                    headerHeight: 50,itemHeight: 36,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                    	select_socialInsuFlag.value = selectOneObj.id;
                    	show_socialInsuFlag.innerHTML = selectOneObj.value;
                    	show_socialInsuFlag.dataset['id'] = selectOneObj.id;
                    	show_socialInsuFlag.dataset['value'] = selectOneObj.value;
                        
                    	showprem();
                    }
            });
        }); */
    	
		/* 地址选择 */
	    var selectContactDom = $('#select_contact');
	    var showContactDom = $('#show_contact');
	    var contactProvinceCodeDom = $('#contact_province_code');
	    var contactCityCodeDom = $('#contact_city_code');
	    selectContactDom.bind('click', function () {
	        var sccode = showContactDom.attr('data-city-code');
	        var scname = showContactDom.attr('data-city-name');
	
	        var oneLevelId = showContactDom.attr('data-province-code');
	        var twoLevelId = showContactDom.attr('data-city-code');
	        var threeLevelId = showContactDom.attr('data-district-code');
	        var iosSelect = new IosSelect(3, 
	            [iosProvinces, iosCitys, iosCountys],
	            {
	                title: '',
	                itemHeight: 35,
	                itemShowCount: 5,
	                relation: [1, 1],
	                oneLevelId: oneLevelId,
	                twoLevelId: twoLevelId,
	                threeLevelId: threeLevelId,
	                callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
	                    contactProvinceCodeDom.val(selectOneObj.id); 
	                    contactProvinceCodeDom.attr('data-province-name', selectOneObj.value);
	                    contactCityCodeDom.val(selectTwoObj.id);
	                    contactCityCodeDom.attr('data-city-name', selectTwoObj.value);
	
	                    showContactDom.attr('data-province-code', selectOneObj.id);
	                    showContactDom.attr('data-city-code', selectTwoObj.id);
	                    showContactDom.attr('data-district-code', selectThreeObj.id);
	                    showContactDom.html(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
	                }
	        });
	    });
	</script>
	<script>
        $('.footer_go').click(function()
        {	
        	if($(".hq-mask,.trialCon").css("display")!='block')
        	{
        		$('.hq-mask,.trialCon').css('display','block');		
        	}
        	else
        	{ 
        		var socialInsuFlag = 'Y';
    			var prem = '50.00';
    			
    			/* if($("#show_socialInsuFlag").attr("data-id")!='null')
    			{
    				socialInsuFlag = $("#show_socialInsuFlag").attr("data-id");
    			}  */
    			
    			if($('#insurePrice_trans').val()!=null&&$('#insurePrice_trans').val()!="")
    			{
    				prem = $('#insurePrice_trans').val();
    			}
        		
    			var mobile = $('#mobile').val();
    			
    			if(mobile==null||mobile=="")
    			{
    				$(".pop").show();
    		       	$(".mask").show();
    		       	$(".pop span").text("手机号码不能为空");
    				return;
    			}
    			
    			var numReg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
    			
    			if(!numReg.test(mobile))
    			{
    				$(".pop").show();
    		       	$(".mask").show();
    		       	$(".pop span").text("请填写正确的电话号码");
    			    return;
    			}
    			
        		window.location.href = "./toldinfo.do?aliasname=axys&prem="+prem+"&source="+$('#source').val()+"&mobile="+mobile;
        	}
		});
	</script>
	<script>
	var jsstr = ${jsstr};
	wx.config(jsstr);

	var pyqtitle = '${pyqtitle}';
	var pyqlink = '${pyqlink}';
	var pyqimgurl = '${pyqimgurl}';

	var hytitle = '${hytitle}';
	var hydesc = '${hydesc}';
	var hylink = '${hylink}';
	var hyimgurl = '${hyimgurl}';

	var reuserid = '${reuserid}';
	var shareid = '${shareid}';

	wx.ready(function () {	//朋友圈
	   	wx.onMenuShareTimeline({
	        title: pyqtitle, // 分享标题
	        link: pyqlink+'&shareid='+shareid+'&reuserid='+reuserid, // 分享链接
	        imgUrl: pyqimgurl,
	        success: function (res) {
	            //alert(1);
	        },
	        cancel: function (res) {
	        	//alert(2);
	        },
	        fail: function (res) {
			            
	        }
	    });
	    //朋友
	    wx.onMenuShareAppMessage({
	        title: hytitle, // 分享标题
	        desc: hydesc, // 分享描述
	        link: hylink+'&shareid='+shareid+'&reuserid='+reuserid, // 分享链接
	        imgUrl: hyimgurl,
	        type: '', // 分享类型,music、video或link，不填默认为link
	        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	        success: function () {
	            // 用户确认分享后执行的回调函数
	        	//alert(2);
	        },
	        cancel: function () {
	            // 用户取消分享后执行的回调函数
	        	//alert(4);
	        }
	    });
	});
	wx.error(function (res) {
	  alert(res.errMsg);
	});
		
		function getAgeByBirthDay(birth){
		    var returnAge = "";
		    var aDate = new Date();
		    var nowYear = aDate.getFullYear();
		    var nowMonth = (aDate.getMonth()+1) < 10 ? '0'+(aDate.getMonth()+1) : (aDate.getMonth()+1);
		    var nowDay = (aDate.getDate()) < 10 ? '0'+aDate.getDate() : aDate.getDate();

		    var birthYear = birth.split("-")[0];
		    var birthMonth = birth.split("-")[1];
		    var birthDay = birth.split("-")[2];
		    if(nowYear == birthYear){
		        returnAge = 0;// 同年 则为0岁
		    } else {
		        var ageDiff = nowYear - birthYear ; // 年之差
		        if (ageDiff > 0){
		            if (nowMonth == birthMonth){
		                var dayDiff = nowDay - birthDay;// 日之差
		                if (dayDiff < 0) {
		                    returnAge = ageDiff - 1;
		                } else {
		                    returnAge = ageDiff ;
		                }
		            } else {
		                var monthDiff = nowMonth - birthMonth;// 月之差
		                if (monthDiff < 0) {
		                    returnAge = ageDiff - 1;
		                } else {
		                    returnAge = ageDiff ;
		                }
		            }
		        }
		    }
		    return returnAge;
		}
		
		function sendPriceRequest(url, data, success, error) {
		    $.ajax({
		        url: url,
		        type: "post",
		        async: true,
		        data: data ? data : {},
		        beforeSend:function(){
		        },
		        success: function (data) {
		            if (success) {
		                success(data);
		            }
		        },
		        error: function (data) {
		            if (error) {
		                error(data);
		            }
		        },
		        complete:function(){
		        }
		    });
		}
		
	</script>
</body>
</html>