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
	<title>1元掌握全国产品对比</title>
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
                <img src="/images/activity/1yuango/yygm.png" alt="">
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

$(function () 
{
	
	$('.buyService').on('click',function () 
	{
		toast({message: '本页面无操作，仅进行展示',time: 1500});
	});
});

</script>

</body>
</html>
