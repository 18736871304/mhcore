<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>分享信息展示</title>
    <!-- 
    <link rel="icon" href="https://www.dahuobaoxian.com/order/shopping/images/favicon.ico">
     -->
    <link rel="stylesheet" href="../../css/hengqin/payment.css?v=180504">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180504"></script>
    <script src="../../js/common/insuCommon.js?v=180504"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180504"></script>
</head>
<body style="">
    <header class="header borTop1 pl pr bgColor">
        <h3 class="">分享信息展示</h3>
        <br><br>
        <div class="headerDetails w100">
            <dl class="insureDetails">
            	<span class="headerLeft">手机号码：${mobile}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">保险公司：${insorganname}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">保险产品：${riskname}</span><span class="headerRight"></span>
            </dl>
        </div>
    </header>
    
    <article >
   		<section class="pl pr pt pb bgColor">
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft policyType">点击右上角，通过微信进行分享</span>
                </dl>
            </div>
        </section>
    </article>
    
    <br/>
    
    <!--弹窗-->
    <div class="mask">
        <div class="pop repeat">
            <span></span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
</body>
<script>

var sumprem = '${sumprem}';

$(function () 
{
	$("#insurePrice").html(Number(sumprem).toFixed(2)+" 元");	
})

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

</script>
</html>