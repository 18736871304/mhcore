<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>宜家万能账户</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=180428_01">
	<link rel="stylesheet" href="../../css/hengqin/iosSelect.css?v=180428">
	<script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180428"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180428"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=180428" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect_2.js?v=180428" type="text/javascript"></script>
    <script src=" ../../js/hengqin/areaData_v2.js?v=180428"></script>
    <script src=" ../../js/hengqin/zepto.js?v=180428"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180428"></script>
    <style type="text/css">
    	#nav1,#nav2,#nav3,#nav4{
    	padding: 0;
    	}
		#nav1 img,#nav2 img,#nav3 img,#nav4 img{
			display: block;
			width: 100%;
			margin: auto;
		}
		
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
				<img src="../../images/hengqin/yjwn/yjwn_01.png?v=20180419_01"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">28天-65周岁</span></p>
					<p><span class="left">保险期间</span><span class="right">终身</span></p>
					<p><span class="left">起投金额</span><span class="right">10元</span></p>
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
					<img src="../../images/hengqin/yjwn/yjwn_02.png?v=20180419_01" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/hengqin/yjwn/yjwn_03.png?v=20180419_01" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/hengqin/yjwn/yjwn_04.png?v=20180419_01" alt="">
					<div class="recommend_wrapper" style="padding: 0 0 0.7rem 0;">
						<a href="../../contract/hengqin/lptk.pdf"></a>
						<a href="../../contract/hengqin/yjwn/insuranceClauses.pdf"></a>
						<a href="../../contract/hengqin/yjwn/disclosure.pdf"></a>
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/hengqin/yjwn/yjwn_05.png?v=20180419_01" alt="">
				</div>
			</div>
			
			<div class="footer_wrapper" id="footer_wrapper">
				<div data-v-30b26e3d="" class="hq-mask"  style="display: none"></div> 
				<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
						<dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
			            	<%-- 保费：<input type="text" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}"> --%>
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
						    <span readonly="" class="insurePrice" id="insurePrice" >10.00</span><span>元/年起</span>
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
	<script>
        $('.footer_go').click(function()
        {	
        	window.location.href = "./toldinfo.do?riskCode=34010"
		});
	</script>
	<script>
		var reuserid = '${reuserid}';
		var jsstr = ${jsstr};
		wx.config(jsstr);
	
		wx.ready(function () {	//朋友圈
	    	wx.onMenuShareTimeline({
		        title: '宜家万能账户', // 分享标题
		        link: 'http://insure.meihualife.com/life/hq/nc_hq_yjwn_01.do?reuserid='+reuserid, // 分享链接
		        imgUrl: 'http://insure.meihualife.com/images/hengqin/yjwn/yjwn_hq_wx.png',
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
		        title: '宜家万能账户', // 分享标题
		        desc: '享受日计息月复利，现行结算利率为5.5%，收益天天见', // 分享描述
		        link: 'http://insure.meihualife.com/life/hq/nc_hq_yjwn_01.do?reuserid='+reuserid, // 分享链接
		        imgUrl: 'http://insure.meihualife.com/images/hengqin/yjwn/yjwn_hq_wx.png',
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