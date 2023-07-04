<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>综合意外险</title>
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
				<img src="../../images/zhongan/zhyw/zhyw_01.png?v=20180513_01"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">18-65周岁</span></p>
					<p><span class="left">保障期限</span><span class="right">1年</span></p>
					<p><span class="left">最高保障</span><span class="right">30万</span></p>
				</div>
			</div>
			<div class="product_wrapper">
				<div id="nav">
					<div class="product_nav">
						<a href="javascript:;" class="active_nav"><span>产品介绍</span></a>
						<a href="javascript:;"><span>保障责任</span></a>
						<a href="javascript:;"><span>理赔流程</span></a>
						<a href="javascript:;"><span>承保公司</span></a>
					</div>
				</div>
				<div id="nav1" class="product_desc">
					<img src="../../images/zhongan/zhyw/zhyw_02.png?v=20180513_01" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/zhongan/zhyw/zhyw_03.png?v=20180513_01" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/zhongan/zhyw/zhyw_04.png?v=20180513_01" alt="">
					<div class="recommend_wrapper" style="padding: 0 0 0.7rem 0;">
						 
						<a href="javascript:;"></a>
						<a href="../../contract/zhongan/zhyw/zhyw04.pdf"></a>
						<a href="javascript:;"></a>
						
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/zhongan/zhyw/zhyw_05.png?v=20180513_01" alt="">
				</div>
			</div>
			
			<div class="footer_wrapper" id="footer_wrapper">
				<div data-v-30b26e3d="" class="hq-mask"  style="display: none"></div> 
				<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
						<dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
			            	<%-- 保费：<input type="text" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}"> --%>
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
						    <span readonly="" class="insurePrice" id="insurePrice" >100.00</span><span>元/年</span>
			            </dt>
						<dd class="w35 r-float">
						    <div class="insureBtn txtC footer_go">立即投保</div>
						</dd>
		            </dl>
		        </div>
			</div>
		</div>
	</div>
	<script>
    $('.footer_go').click(function()
    {	
     	window.location.href = "./zhyw_02.do"
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