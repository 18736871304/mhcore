<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>尊享人生百万医疗险</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=180428">
	<link rel="stylesheet" href="../../css/hengqin/iosSelect.css?v=180428">
	<script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180428"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=180428" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect_2.js?v=180428" type="text/javascript"></script>
    <script src=" ../../js/hengqin/areaData_v2.js?v=180428"></script>
    <script src=" ../../js/hengqin/zepto.js?v=180428"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180426"></script>
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
				<img src="../../images/hengqin/bwyl/bwyl_01.png?v=20180420_01"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">28天-60周岁</span></p>
					<p><span class="left">保险期间</span><span class="right">1年</span></p>
					<p><span class="left">保障计划</span><span class="right">A</span></p>
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
					<img src="../../images/hengqin/bwyl/bwyl_02.png?v=20180420_01" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/hengqin/bwyl/bwyl_03.png?v=20180420_01" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/hengqin/bwyl/bwyl_04.png?v=20180420_01" alt="">
					<div class="recommend_wrapper">
						<a href="../../contract/hengqin/lptk.pdf"></a>
						<a href="../../contract/hengqin/bwyl/insuranceClauses.pdf"></a>
						<a href="../../contract/hengqin/bwyl/disclosure.pdf"></a>
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/hengqin/yjwn/yjwn_05.png?v=20180420_01" alt="">
				</div>
			</div>
			<div class="footer_wrapper" id="footer_wrapper">
				<div data-v-30b26e3d="" class="hq-mask"  style="display: none"></div>
				<section class="infoList trialCon" style="display:none;">
	                <div class="infoSec pl pr bgColor borTop1">
	               		<dl class="clearfix infoDl borBot1 dlSec" id="select_plan">
					        <dt class="w35 l-float">可选方案</dt>
					        <dd class="w65 l-float txtR hasArrow">
						        <!-- <select id = "plan"  style="padding-right: 0.75rem;" data-year = 'null'>
							        <option value="A">A计划</option>
							        <option value="B">B计划</option>
							    </select> -->
							     <span id="show_plan" style="padding-right: 0.75rem;" data-id = 'null'>A计划</span>
						        <i class="arrow"></i>
							</dd>
				        </dl>
	                	<dl class="clearfix infoDl borBot1 dlSec"  id="selectDate">
		                	<dt class="w35 l-float">出生日期</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="showDate" style="padding-right: 0.75rem;" data-year = 'null'>2000-02-23</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
		                <dl class="clearfix infoDl borBot1 dlSec"  id = "select_socialInsuFlag">
		                	<dt class="w35 l-float">医疗保险</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_socialInsuFlag" style="padding-right: 0.75rem;" data-id = 'null'>有社保</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
		                <!-- <dl class="clearfix infoDl borBot1 dlSec"  id="select_contact">
		                	<dt class="w35 l-float">地址</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_contact" style="padding-right: 0.75rem;">请选择所在地址</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl> -->
						<dl class="clearfix infoDl borBot1 dlSec"  id="select_JFTime">
		                	<dt class="w35 l-float">缴费期间</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_JFTime" style="padding-right: 0.75rem;" data-id = 'null'>一次性交清</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
						
						<dl class="clearfix infoDl borBot1 dlSec"  id="select_BXTime">
		                	<dt class="w35 l-float">保险期间</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_BXTime" style="padding-right: 0.75rem;" data-id = 'null'>1年</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
		                
		                <dl class="clearfix infoDl dlSec"  id="select_amnt">
		                	<dt class="w35 l-float">每份保额</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <input id = "amnt" class="w65" type="text" style="padding-right: 0.75rem;width: 100%;" 
		                        value="100万" readonly="">
		                    </dd>
		                </dl>
	                </div>
	            </section>   
				<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
			            <dt class="w65 l-float  font16" style="text-align:center;padding-left: 2.3rem;position: relative;">
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=180428" alt="" style="width: 1.5rem;"></p>
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
		
		function showprem()
		{
			var age = '30';
			var socialInsuFlag = '1';
			var payendyear = '1Y';
			var plan = 'A';
			var insuyear="1000Y";
			
			//alert($("#show_sex").attr("data-id"));
			//alert($("#show_sex").attr("data-id")=='undefined');
			
			if($("#show_plan").attr("data-id")!='null')
			{
				plan = $("#show_plan").attr("data-id");
			}
			
			if($("#show_socialInsuFlag").attr("data-id")!='null')
			{
				socialInsuFlag = $("#show_socialInsuFlag").attr("data-id");
			}
			
			if($("#show_JFTime").attr("data-id")!='null')
			{
				payendyear = $("#show_JFTime").attr("data-id");
			}
			
			if($("#show_BXTime").attr("data-id")!='null')
			{
				insuyear = $("#show_BXTime").attr("data-id");
			}
			
			if($("#showDate").attr("data-year")!='null')
			{
				age = getAgeByBirthDay($("#showDate").attr("data-year")+"-"+$("#showDate").attr("data-month")+"-"+$("#showDate").attr("data-date"));
			}
			
			
			/*
			alert(socialInsuFlag);
			alert(payendyear);
			alert(getyear);
			*/
			
			
			//if($('#amnt').val()==""||$('#amnt').val()==0)
			//{
				//alert(123);
				//return;
			//}
			
			
			//$('#show_zsj').html(Number($('#prem').val()*paycount).toFixed(2));
			//$('#insurePrice').html(Number($('#prem').val()).toFixed(2));
			
			
			var premdata = 
			{
				"productNo":'17040',
				"amnt":$("#amnt").val(),
				"age":age,
				"socialInsuFlag":socialInsuFlag,
				"payendyear":payendyear,
				"insuyear":insuyear,
				"relation":'00',
				"plan":plan
//				"ishuanmian":$("#ishuanmian").find("option:selected").val()
			};
			
			sendPriceRequest("../../life/hq/getprice02.do",premdata,function (data) 
			{
			   	var obj = JSON.parse(data);
			   	console.log(obj);
			   	if(obj.code == 0)
			   	{
			   		$('#show_zsj').html(Number(obj.mainPrice).toFixed(2));
			   		$('#insurePrice').html(Number(obj.insurePrice).toFixed(2));
			   		$('#insurePrice_trans').val(Number(obj.insurePrice).toFixed(2));
			   		
			   		$('#amnt').val(obj.amnt);
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
	                headerHeight: 50,
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
	    
	    /* 计划 */
	    var data_plan = [
  			{'id': 'A', 'value': 'A计划'}/* ,
  			{'id': 'B', 'value': 'B计划'} */
  		];
        		
      		var show_plan = document.querySelector('#show_plan');
          	var select_plan = document.querySelector('#select_plan');
          	
          	show_plan.addEventListener('click', function () {
                  var bankId = show_plan.dataset['id'];
                  var bankName = show_plan.dataset['value'];
                  var bankSelect = new IosSelect(1, 
                      [data_plan],
                      {
                          container: '.container',
                          title: '',
                          headerHeight: 50,itemHeight: 36,
                          itemShowCount: 5,
                          oneLevelId: bankId,
                          callback: function (selectOneObj) {
                        	select_plan.value = selectOneObj.id;
                        	show_plan.innerHTML = selectOneObj.value;
                        	show_plan.dataset['id'] = selectOneObj.id;
                        	show_plan.dataset['value'] = selectOneObj.value;
                              
                          	showprem();
                          }
                  });
              });
          	
	    /* 社保 */
		var data_socialInsuFlag = [
			{'id': '1', 'value': '有社保'},
			{'id': '0', 'value': '无社保'}
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
        });
	    
		/* 交费期间 */
		var data = [
		    {'id': '1000Y', 'value': '一次性交清'}
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
                    headerHeight: 50,itemHeight: 36,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                        select_JFTime.value = selectOneObj.id;
                        show_JFTime.innerHTML = selectOneObj.value;
                        show_JFTime.dataset['id'] = selectOneObj.id;
                        show_JFTime.dataset['value'] = selectOneObj.value;
                        
                        //showprem();
                    }
            });
        });
    	/* 保险期间 */
    	var data2 = [
		    {'id': '1000Y', 'value': '一年'}
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
                    headerHeight: 50,itemHeight: 36,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                        select_BXTime.value = selectOneObj.id;
                        show_BXTime.innerHTML = selectOneObj.value;
                        show_BXTime.dataset['id'] = selectOneObj.id;
                        show_BXTime.dataset['value'] = selectOneObj.value;
                        
                        //showprem();
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
        		var payendyear = '10Y';
    			var prem = '';
    			var insuyear="1000Y";
    			var plan="A";
    			var socialInsuFlag="1";
    			
    			if($("#show_plan").attr("data-id")!='null')
    			{
    				plan = $("#show_plan").attr("data-id");
    			}
    			
    			if($("#show_socialInsuFlag").attr("data-id")!='null')
    			{
    				socialInsuFlag = $("#show_socialInsuFlag").attr("data-id");
    			}
    			
    			if($("#show_BXTime").attr("data-id")!='null')
    			{
    				insuyear = $("#show_BXTime").attr("data-id");
    			}
    			
    			if($("#show_JFTime").attr("data-id")!='null')
    			{
    				payendyear = $("#show_JFTime").attr("data-id");
    			}
    			
    			if($('#insurePrice_trans').val()!=null&&$('#insurePrice_trans').val()!="")
    			{
    				prem = $('#insurePrice_trans').val();
    			}
        		window.location.href = "./toldinfo.do?riskCode=17040&prem="+prem+"&plan="+plan+"&socialInsuFlag="+socialInsuFlag
        	}	
		});
	</script>
	<script>
		var reuserid = '${reuserid}';
		var jsstr = ${jsstr};
		wx.config(jsstr);
	
		wx.ready(function () {	//朋友圈
	    	wx.onMenuShareTimeline({
		        title: '尊享人生百万医疗险', // 分享标题
		        link: 'http://insure.meihualife.com/life/hq/nc_hq_bwyl_01.do?reuserid='+reuserid, // 分享链接
		        imgUrl: 'http://insure.meihualife.com/images/hengqin/bwyl/bwyl_wx.png',
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
		        title: '尊享人生百万医疗险', // 分享标题
		        desc: '免体检的百万医疗险，各种费用都报销，还有增值服务', // 分享描述
		        link: 'http://insure.meihualife.com/life/hq/nc_hq_bwyl_01.do?reuserid='+reuserid, // 分享链接
		        imgUrl: 'http://insure.meihualife.com/images/hengqin/bwyl/bwyl_wx.png',
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