<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no, email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <title>美华保险</title>
    <link rel="stylesheet" href="/fonts/lcl/iconfont.css">
    <link rel="stylesheet" href="/css/common/lcl/common.css">
    <link rel="stylesheet" href="/css/insureplan/index.css?v=20191201_02">
</head>

<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/common.js"></script>
<script src="/js/insureplan/index.js?v=20200306"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=20191201_01"></script>
<script>
var openid = '${openid}';
var tans_planid = '${planid}';

if(openid==null||openid=='')
{
	window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx37a5a6ceced4f359&redirect_uri=http://insure.meihualife.com/weixin/bindWxUser.do&response_type=code&scope=snsapi_userinfo&state=insureplan_"+tans_planid+"#wechat_redirect";
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
	
		var planid = '${planid}';
	
		wx.ready(function () {	//朋友圈
		   	wx.onMenuShareTimeline({
		        title: pyqtitle, // 分享标题
		        link: pyqlink+'&planid='+planid, // 分享链接
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
		        link: pyqlink+'&planid='+planid, // 分享链接
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
}
</script>

<body>
<input style="display:none" id="planid" value="${planid}">
<input style="display:none" id="openid" value="${openid}">
<div class="index-page main">
    <div class="index-page-loading" id="loading"><i class="weui-loading"></i></div>
    <div class="transition-box hide" id="transitionBox">
        <div class="enter-pic-box">
            <img src="/images/insureplan/enter.png" id="enterImg">
        </div>
        <div class="logo-box">
            <img src="/images/insureplan/logo.png">
        </div>
    </div>
    <div class="enter-box hide" id="enterBox">
<!--        <div class="enter-text">不一样的方案只为特别的你</div>-->
<!--        <div class="enter-button-box" id="enterBtn">-->
<!--            <div class="enter-button">亲启</div>-->
<!--        </div>-->
<!--        <img src="/images/insureplan/index.jpg" style="width: 100vw;height: 100vh;">-->
        <div class="enter-button-box-new" id="enterBtn">
            <div class="enter-button-new">亲启</div>
        </div>
    </div>
</div>
</body>
</html>
