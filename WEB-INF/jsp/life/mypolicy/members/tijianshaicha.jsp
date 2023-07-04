<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<title>体检筛查</title>
	<link rel="stylesheet" href="/css/mypolicy/members/common.css?v=20191218_01">
	<link rel="stylesheet" href="/css/mypolicy/members/list.css">
	<style>
		.header {
			background: url("/images/mypolicy/members/tijianshaicha-hbg.jpg") no-repeat center;
			background-size: cover;
		}
		.content {
			padding: 20px;
		}
		.intro-list {}
		.intro-list .intro-item{
			margin-top: 30px;
		}
		.intro-list .intro-item .item-header{}

		.intro-list .intro-item .item-header .logo-box{
			display: flex;
			justify-content: space-between;
		}
		.intro-list .intro-item .item-header .logo-box .item-title{
			font-size: 18px;
			border-bottom: 3px solid #dc220d;
			width: 100px;
		}
		.intro-list .intro-item .item-header .logo-box .item-logo{
			width: 69px;
		}

		.intro-list .intro-item .item-header .item-sub-title{
			font-size: 13px;
			color: #686868;
			margin-top: 15px;
		}

		.intro-list .intro-item .item-content{
			font-size: 13px;
			color: #979797;
			margin-top: 18px;
		}
		
		.contact-button {
            position: fixed;
            bottom: 0;
        }

	</style>
</head>
<body>
<div class="main">
	<div class="header">
		<div class="header-title opacity-title">
			体检筛查
		</div>
	</div>
	<div class="img-content">
		<img src="/images/mypolicy/members/tijianshaicha/tijianshaicha_1.jpg">
		<img src="/images/mypolicy/members/tijianshaicha/tijianshaicha_2.jpg">
		<img src="/images/mypolicy/members/tijianshaicha/tijianshaicha_3.jpg">
	</div>
	<div class="contact-button"><button id="contactBtn" onclick = "connect_us('tc')">立即联系</button></div>
</div>
<script src="/js/mypolicy/policytrust/lib/jquery1.12.4.min.js"></script>
<script src="/js/mypolicy/members/common.js?v=20191218"></script>
<script src="/js/common/insuCommon.js?v=20200228"></script>
<script>

</script>
</body>
</html>
