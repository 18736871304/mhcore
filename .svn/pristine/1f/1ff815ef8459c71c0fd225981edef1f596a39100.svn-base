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
	<title>支付</title>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
	<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
	<script src="/js/activity/1yuango/common.js"></script>
	<script>
		var code = '${code}';
		if (code!='0'){
			alert('${msg}');
		}else{
			var openid = '${openid}';
			if(openid==null||openid=='')
			{
				var payno = '${payno}';
				window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx37a5a6ceced4f359&redirect_uri=http://insure.meihualife.com/mh/thirdpay/threepaygo.do&response_type=code&scope=snsapi_base&state=hd_pay#wechat_redirect&payno="+payno;
			}
			else
			{
				var repayjson = '${repayjson}';
				var payid = '${payid}';
				$(function () {

						WeixinJSBridge.invoke('getBrandWCPayRequest',repayjson,function(res)
						{

							if(res.err_msg == 'get_brand_wcpay_request:ok')
							{
								alert("支付成功");
								//window.location.href = "/life/activity/channelActivity.do?channelCode=0004&pageType=1yuango/0001&payid="+payid;
							}
							else
							{
								$(".pop").show();
								$(".mask").show();
								$(".pop span").text("没有支付成功，请重试");
							}
						});
					});

			}
		}

	</script>
</head>
<body>
</body>
</html>
