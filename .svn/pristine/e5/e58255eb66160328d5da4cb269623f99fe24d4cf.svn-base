<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>安联申根之王境外旅行险</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=180420">
	<link rel="stylesheet" href="../../css/hengqin/iosSelect.css?v=180420">
	<script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180420"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180420"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=180420" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect_2.js?v=180420" type="text/javascript"></script>
    <script src=" ../../js/hengqin/areaData_v2.js?v=180420"></script>
    <script src=" ../../js/hengqin/zepto.js?v=180420"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180421"></script>
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
		#nav6 img {
		    display: block;
		    width: 100%;
		    margin: auto;
		}
		.dingwei{
			width: 5rem;
		    height: 1rem;
		    position: absolute;
		    top: 0.6rem;
		    left: 1.8rem;
		}
    </style>
</head>
<body>
	<div class="index_wrapper">
		<div class="main_wrapper">
			<div class="banner_wrapper">
				<img src="../../images/anlian/ozy/alsgzw_01.png?v=20190524"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">60天-90周岁</span></p>
					<p><span class="left">保障期限</span><span class="right">7天-1年</span></p>
					<p><span class="left">医疗费用最高保障</span><span class="right">40万</span></p>
				</div>
			</div>
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
					<img src="../../images/anlian/ozy/alsgzw_02.png?v=20190524" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/anlian/ozy/alsgzw_03.png?v=20190524" alt="">
				</div>
				<div id="nav6" class="product_desc">
					<img src="../../images/anlian/ozy/alsgzw_06.png?v=20190524" alt="">
					<a href="../../images/anlian/ozy/bzsy.png?v=20190524" class="dingwei"></a>
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/anlian/ozy/alsgzw_04.png?v=20190524" alt="">
					<div class="recommend_wrapper">
						<a href="../../contract/anlian/ozy/tbxz.pdf"></a>
						<a href="../..//contract/anlian/ozy/ozy_bxtk.pdf"></a>
						<a href="../../images/anlian/ozy/xxpl.png?v=20190524"></a>
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/anlian/ozy/alsgzw_05.png?v=20190524" alt="">
				</div>
			</div>
			
			<div class="footer_wrapper" id="footer_wrapper">
				<div data-v-30b26e3d="" class="hq-mask"  style="display: none"></div>
				<section class="infoList trialCon" style="display:none;">
	                <div class="infoSec pl pr bgColor borTop1">
	                	<dl class="clearfix infoDl borBot1 dlSec"  id = "select_amnt">
		                	<dt class="w65 l-float">保障计划</dt>
		                	<dd class="w35 l-float txtR hasArrow">
		                        <span  id="show_amnt" style="padding-right: 0.75rem;" data-id = 'null'>玛瑙计划</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
						<dl class="clearfix infoDl borBot1 dlSec"  id="select_BXTime" >
		                	<dt class="w35 l-float">保险期间</dt>
		                	<dd class="w65 l-float txtR hasArrow">
		                        <span  id="show_BXTime" style="padding-right: 0.75rem;" data-id = 'null'>1年:每次旅行最大天数183天</span>
		                        <i class="arrow"></i>
		                    </dd>
		                </dl>
	                </div>
	            </section>   
				<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
			            <dt class="w65 l-float  font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				            <span readonly="" class="insurePrice" id="insurePrice" >65.00</span><span>元起</span>
				            <input type="hidden" value = '65.00' id = 'insurePrice_trans'>
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
			var amnt = '333000';
			var insuDay = '1';
			
			if($("#show_amnt").attr("data-id")!='null')
			{
				amnt = $("#show_amnt").attr("data-id");
			} 
			
			if($("#show_BXTime").attr("data-id")!='null')
			{
				insuDay = $("#show_BXTime").attr("data-id");
			}
			
			
			var premdata = 
			{
				"productNo":'al_ozy',
				"amnt":amnt,
				"insuDay":insuDay
			};
			sendPriceRequest("../../life/anlian/getprice02.do",premdata,function (data) 
					{
					   	var obj = JSON.parse(data);
						console.log(obj);
						if(obj.code == 0)
						{
							$('#insurePrice').html(Number(obj.insurePrice).toFixed(2));
					   		$('#insurePrice_trans').val(Number(obj.insurePrice).toFixed(2));
						}
						else
						{
						}
					},function(){});
			
			
		}
    	/* 保险期间 */
    	var data2 = [
		    {'id': '1', 'value': '1年:每次旅行最大天数183天'},
		    {'id': '180', 'value': '180天'},
		    {'id': '60', 'value': '60天'},
		    {'id': '45', 'value': '45天'},
		    {'id': '30', 'value': '30天'},
		    {'id': '24', 'value': '24天'},
		    {'id': '18', 'value': '18天'},
		    {'id': '15', 'value': '15天'},
		    {'id': '10', 'value': '10天'},
		    {'id': '7', 'value': '7天'}
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
    	
    	/* 保险套餐 */
		var data_amnt = [
			{'id': '333000', 'value': '玛瑙计划'},
			{'id': '222000', 'value': '珍珠计划'},
			{'id': '111000', 'value': '钻石计划'}
		];
		
		var show_amnt = document.querySelector('#show_amnt');
    	var select_amnt = document.querySelector('#select_amnt');
    	
    	show_amnt.addEventListener('click', function () {
            var bankId = show_amnt.dataset['id'];
            var bankName = show_amnt.dataset['value'];
            var bankSelect = new IosSelect(1, 
                [data_amnt],
                {
                    container: '.container',
                    title: '',
                    headerHeight: 50,itemHeight: 36,
                    itemShowCount: 5,
                    oneLevelId: bankId,
                    callback: function (selectOneObj) {
                    	select_amnt.value = selectOneObj.id;
                    	show_amnt.innerHTML = selectOneObj.value;
                    	show_amnt.dataset['id'] = selectOneObj.id;
                    	show_amnt.dataset['value'] = selectOneObj.value;
                        
                    	showprem();
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
        		var amnt = '333000';
    			var prem = '65';
    			var insuDay = '1';
    			
    			if($("#show_amnt").attr("data-id")!='null')
    			{
    				amnt = $("#show_amnt").attr("data-id");
    			} 
    			if($("#show_BXTime").attr("data-id")!='null')
    			{
    				insuDay = $("#show_BXTime").attr("data-id");
    			}
    			
    			if($('#insurePrice_trans').val()!=null&&$('#insurePrice_trans').val()!="")
    			{
    				prem = $('#insurePrice_trans').val();
    			}
        		
    			window.location.href = "../../life/anlian/al_step03.do?prem="+prem+"&amnt="+amnt+"&insuDay="+insuDay+"&productNo="+"al_ozy"
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