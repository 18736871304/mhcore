<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>复星联合超越保2020医疗保险</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=180428">
	<link rel="stylesheet" href="../../css/hengqin/iosSelect.css?v=180428">
	<script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180428"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=180428" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect_2.js?v=180428" type="text/javascript"></script>
    <script src=" ../../js/hengqin/areaData_v2.js?v=180428"></script>
    <script src=" ../../js/hengqin/zepto.js?v=180428"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180428"></script>
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
    </style>
</head>
<body>
	<div class="index_wrapper">
		<div class="main_wrapper">
			<div class="banner_wrapper">
				<img src="../../images/fuxinglhjk/110084/110084_plus_01.jpg?v=20200828"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">出生满30天-60周岁</span></p>
					<p><span class="left">保障期限</span><span class="right">1年</span></p>
					<p><span class="left">最高保障</span><span class="right">400万</span></p>
				</div>
			</div>
			<div class="product_wrapper">
				<div id="nav">
					<div class="product_nav">
						<a href="javascript:;" class="active_nav"><span>产品介绍</span></a>
						<a href="javascript:;"><span>投保案例</span></a>
						<a href="javascript:;"><span>理赔流程</span></a>
						<a href="javascript:;"><span>承保公司</span></a>
					</div>
				</div>
				<div id="nav1" class="product_desc">
					<img src="../../images/fuxinglhjk/110084/110084_plus_02.jpg?v=20200828" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/fuxinglhjk/110084/110084_plus_03.jpg?v=20200828" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/fuxinglhjk/110084/110084_plus_04.jpg?v=20200828" alt="">
					<div class="recommend_wrapper">
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/fuxinglhjk/110084/110084_plus_05.jpg?v=20200828" alt="">
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
		                <dl class="clearfix infoDl borBot1 dlSec"  id="select_productplan">
		                	<dt class="w35 l-float">计划类型</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span id="show_productplan" style="padding-right: 0.75rem;" data-id = 'null'>特需版（免赔额1.5万）</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
		                
		                <dl class="clearfix infoDl borBot1 dlSec"  id="select_shaoer">
		                	<dt class="w65 l-float">少儿可选责任</dt>
		                	<dd class="w35 l-float txtR hasArrow">
		                        <span id="show_shaoer" style="padding-right: 0.75rem;" data-id = 'null'>否</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
		                
		                <dl class="clearfix infoDl borBot1 dlSec"  id="select_hassocialinsurance">
		                	<dt class="w35 l-float">是否有社保</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span id="show_hassocialinsurance" style="padding-right: 0.75rem;" data-id = 'null'>有</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
	                </div>
	            </section>   
				<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
			            <dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;">
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				            <!-- <input type="text" readonly="" class="insurePrice w100" id="insurePrice" value="305.00元"> -->
				            <span readonly="" class="insurePrice" id="insurePrice" >136.00</span><span>元/年起</span>
				            <input type="hidden" value = '136.00' id = 'insurePrice_trans'>
			            </dt>
						<dd class="w35 r-float">
						    <div class="insureBtn txtC footer_go">立即投保</div>
						</dd>
		            </dl>
		        </div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/common/insure_include.jsp"%>
	<script type="text/javascript">

	var healthno = '${healthno}';
    
    $(function () 
    {
    	if(healthno!=null&&healthno!="")
    	{
    		alert("智能核保未通过，核保编号为"+healthno+"，请重新投保！");
    	}
    })
	
		function showprem()
		{
			var age = '30';
			var productplan = '02';
			var isshaoer = 'N';
			var hassocialinsurance = 'Y';
			
			if($("#showDate").attr("data-year")!='null')
			{
				age = getAgeByBirthDay($("#showDate").attr("data-year")+"-"+$("#showDate").attr("data-month")+"-"+$("#showDate").attr("data-date"));
			}
			
			if($("#show_productplan").attr("data-id")!='null')
			{
				productplan = $("#show_productplan").attr("data-id");
			}
			
			if($("#show_shaoer").attr("data-id")!='null')
			{
				isshaoer = $("#show_shaoer").attr("data-id");
			}
			
			if($("#show_hassocialinsurance").attr("data-id")!='null')
			{
				hassocialinsurance = $("#show_hassocialinsurance").attr("data-id");
			}
			
			var premdata = 
			{
				"relation":'00',
				"insorgancode":'fuxingjk',
				"riskcode":'110084',
				"age":age,
				"productplan":productplan,
				"isshaoer":isshaoer,
				"hassocialinsurance":hassocialinsurance,
			};
			
			console.log(premdata)
			sendPriceRequest("../../life/fxlhjk/calprem.do",premdata,function (data) 
			{
			   	var obj = JSON.parse(data);
//			   	console.log(obj);
			   	if(obj.code == 0)
			   	{
			   		$('#insurePrice').html(Number(obj.sumPrem).toFixed(2));
			   		$('#insurePrice_trans').val(Number(obj.sumPrem).toFixed(2));
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
	    
	    showDateDom.attr('data-year', '2000');
	    showDateDom.attr('data-month', '02');
	    showDateDom.attr('data-date', '23');
	    // 数据初始化
	    function formatYear (nowYear) {
	        var arr = [];
	        for (var i = nowYear; i >= nowYear-61; i--) {
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
    	
	    
	  	//保额
    	var data_productplan = [
	  		    {'id': '02', 'value': '特需版（免赔额1.5万）'},
	  		];
    	
    	var show_productplan = document.querySelector('#show_productplan');
    	var select_productplan = document.querySelector('#select_productplan');
    	
    	show_productplan.addEventListener('click', function () {
    		
            var bankId = show_productplan.dataset['id'];
            var bankName = show_productplan.dataset['value'];
            var bankSelect = new IosSelect(1, 
	                [data_productplan],
	                {
	                    container: '.container',
	                    title: '',
	                    headerHeight: 50,itemHeight: 36,
	                    itemShowCount: 5,
	                    oneLevelId: bankId,
	                    callback: function (selectOneObj) {
	                    	select_productplan.value = selectOneObj.id;
	                        show_productplan.innerHTML = selectOneObj.value;
	                        show_productplan.dataset['id'] = selectOneObj.id;
	                        show_productplan.dataset['value'] = selectOneObj.value;
	                        
	                        showprem();
	                    }
	            });
            
        });
    	
    	//保额
    	var data_shaoer = [
	  		    {'id': 'N', 'value': '否'},
	  		  	{'id': 'Y', 'value': '是'},
	  		];
    	
    	var show_shaoer = document.querySelector('#show_shaoer');
    	var select_shaoer = document.querySelector('#select_shaoer');
    	
    	show_shaoer.addEventListener('click', function () {
    		
            var bankId = show_shaoer.dataset['id'];
            var bankName = show_shaoer.dataset['value'];
            var bankSelect = new IosSelect(1, 
	                [data_shaoer],
	                {
	                    container: '.container',
	                    title: '',
	                    headerHeight: 50,itemHeight: 36,
	                    itemShowCount: 5,
	                    oneLevelId: bankId,
	                    callback: function (selectOneObj) {
	                    	select_shaoer.value = selectOneObj.id;
	                        show_shaoer.innerHTML = selectOneObj.value;
	                        show_shaoer.dataset['id'] = selectOneObj.id;
	                        show_shaoer.dataset['value'] = selectOneObj.value;
	                        
	                        showprem();
	                    }
	            });
            
        });
    	
    	//保额
    	var data_hassocialinsurance = [
	  		    {'id': 'Y', 'value': '有'},
	  		  	{'id': 'N', 'value': '没有'},
	  		];
    	
    	var show_hassocialinsurance = document.querySelector('#show_hassocialinsurance');
    	var select_hassocialinsurance = document.querySelector('#select_hassocialinsurance');
    	
    	show_hassocialinsurance.addEventListener('click', function () {
    		
            var bankId = show_hassocialinsurance.dataset['id'];
            var bankName = show_hassocialinsurance.dataset['value'];
            var bankSelect = new IosSelect(1, 
	                [data_hassocialinsurance],
	                {
	                    container: '.container',
	                    title: '',
	                    headerHeight: 50,itemHeight: 36,
	                    itemShowCount: 5,
	                    oneLevelId: bankId,
	                    callback: function (selectOneObj) {
	                    	select_hassocialinsurance.value = selectOneObj.id;
	                        show_hassocialinsurance.innerHTML = selectOneObj.value;
	                        show_hassocialinsurance.dataset['id'] = selectOneObj.id;
	                        show_hassocialinsurance.dataset['value'] = selectOneObj.value;
	                        
	                        showprem();
	                    }
	            });
            
        });
	</script>
	<script>
        $('.footer_go').click(function()
        {
        	//window.location.href = "./toldinfo.do?riskCode=110048";
        	
        	if($(".hq-mask,.trialCon").css("display")!='block')
        	{
        		$('.hq-mask,.trialCon').css('display','block');		
        	}
        	else
        	{
    			var prem = "136.00";
    			var productplan = '02';
    			var hassocialinsurance = 'Y';
    			var isshaoer = 'N';
    			var age = '30';
    			
    			if($('#insurePrice_trans').val()!=null&&$('#insurePrice_trans').val()!="")
    			{
    				prem = $('#insurePrice_trans').val();
    			}
    			
    			if($("#show_productplan").attr("data-id")!='null')
    			{
    				productplan = $("#show_productplan").attr("data-id");
    			}
    			
    			if($("#show_shaoer").attr("data-id")!='null')
    			{
    				isshaoer = $("#show_shaoer").attr("data-id");
    			}
    			
    			if($("#show_hassocialinsurance").attr("data-id")!='null')
    			{
    				hassocialinsurance = $("#show_hassocialinsurance").attr("data-id");
    			}
    			
    			if($("#showDate").attr("data-year")!='null')
    			{
    				age = getAgeByBirthDay($("#showDate").attr("data-year")+"-"+$("#showDate").attr("data-month")+"-"+$("#showDate").attr("data-date"));
    			}
    			
    			if(age>=19&&isshaoer=='Y')
    			{
    				alert("18岁以上不能选择【少儿可选责任】!");
    				return;
    			}
    			
        		window.location.href = "./toldinfo.do?riskCode=110084&prem="+prem+"&productplan="+productplan+"&hassocialinsurance="+hassocialinsurance+"&isshaoer="+isshaoer;
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