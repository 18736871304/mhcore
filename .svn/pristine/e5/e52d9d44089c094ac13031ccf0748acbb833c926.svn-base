<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no">
    <meta name="full-screen" content="yes">
	<meta name="viewport"
	      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<title>1元定制家庭保障方案</title>
	<link rel="stylesheet" href="/css/activity/1yuango/normalize.css?v=20200101_01">
    <link rel="stylesheet" href="/css/activity/1yuango/common.css?v=20200101_01">
	<link rel="stylesheet" href="/css/activity/1yuango/index.css?v=20200101_01">
	<script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script>
        (function (doc, win) {
            var htmlFont = function () {
                var docEl = doc.documentElement,cWidth = docEl.clientWidth, f;
                f =cWidth / 7.5;cWidth > 750 ? docEl.style.fontSize = 100 + "px" : docEl.style.fontSize = f + "px"
            };
            htmlFont();
            win.addEventListener("resize", htmlFont, false)
        })(document, window);
    </script>
</head>
<body>
<div class="main">
	<div class="content">
        <!--一元掌握start-->
        <div class="page page1">
                <img src="/images/activity/1yuango/yygm.png?v=20200819" alt="">
                <input type="button" class="buyService" >
        </div>
        <!--一元掌握end-->
        <!--如何购买保险start-->
        <div class="page page2">
            <div class="warp">
            <img src="/images/activity/1yuango/rhgm.png" alt="">
            </div>
        </div>
        <!--如何购买保险end-->
        <!--保险这么选start-->
        <div class="page page3">
            <div class="warp">
            <img src="/images/activity/1yuango/gzmx.png" alt="">
            </div>
        </div>
        <!--保险这么选end-->
        <!--案例分析start-->
        <div class="page page4">
            <div class="warp">
            <img src="/images/activity/1yuango/ajfx.png" alt="">
            </div>
        </div>
        <!--案例分析end-->
        <!--咨询顾问start-->
        <div class="page page5">
            <div class="warp">
            <img src="/images/activity/1yuango/zxgw.png" alt="">
            </div>
        </div>
        <!--咨询顾问end-->
        <!--你将获得start-->
        <div class="page page6">
            <div class="warp">
                <img src="/images/activity/1yuango/njhd.png" alt="">
            </div>

        </div>
        <!--你将获得end-->
        <!--用户评价start-->
        <div class="page page7">
            <div class="warp">
                <img src="/images/activity/1yuango/yhpj.png?v=20191230" alt="">
            </div>

        </div>
        <!--用户评价end-->
        <!--立即购买star-->
        <div class="flexFooter clearfix">
            <div class="wrap clearfix">
                <img src="/images/activity/1yuango/yygmf.png" alt="">
                <input type="button" class="buyService">
            </div>

        </div>
        <!--立即购买end-->
	</div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/activity/1yuango/common.js"></script>
<script>
var openid = '${openid}';

if(openid==null||openid=='')
{
	window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx37a5a6ceced4f359&redirect_uri=http://insure.meihualife.com/life/activity/oneyuango.do&response_type=code&scope=snsapi_base&state=hd_pay#wechat_redirect";
}
else
{
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
	        link: pyqlink, // 分享链接
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
	        link: hylink, // 分享链接
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
	  //alert(res.errMsg);
	});	
}

</script>
<script>

var repayjson = ${repayjson};
var payid = '${payid}';

$(function () {
	
	$('.buyService').on('click',function () {
		
		WeixinJSBridge.invoke('getBrandWCPayRequest',repayjson,function(res)
		{
			//alert(repayjson);
		    //alert(JSON.stringify(res));
		    
			if(res.err_msg == 'get_brand_wcpay_request:ok')
			{
				window.location.href = "/life/activity/channelActivity.do?channelCode=0004&pageType=1yuango/0001&payid="+payid;
			}
			else
			{
				$(".pop").show();
		    	$(".mask").show();
		    	$(".pop span").text("没有支付成功，请重试");
			}
		});
	});
});

</script>

</body>
</html>
