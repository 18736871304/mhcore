<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<title>美华保险服务</title>
	<link rel="stylesheet" href="../../css/life/box.css?v=180509">
	<script src="../../js/jquery/jquery-3.6.0.min.js"></script>
	<style>
	  html{
	       font-size: calc(100vw/18.75)!important;
	  }
	</style>
</head>
<body>
<div class="success-wrap">
   <div class="top-wrap textAlgin-center">
        <img src="../../images/life/tz-success-icon.png" alt="">
     <p class="txt-1">投保申请成功</p>
     <div class="txt-2">
                   <p>您已经投保：${riskname}</p>
                   <p>温馨提示： 您的保单已进入审核期，稍后会有工作人员与你核实，请您耐心等待，具体以我的保单显示为准</p>
     </div>
   </div>
   <div class="mid-wrap">
     <div>
       <span class="detail-name">投保单号</span>
       <span>${contno}</span>
     </div>
     <div>
       <span class="detail-name">投保人</span>
       <span>${appname}</span>
     </div>
   </div>
   <div class="bot-wrap textAlgin-center">
     <img src="../../images/life/mhwx.png" alt="">
     <p class="txt-1">查看您的保单</p>
     <p class="txt-2">您可以长按或扫描二维码关注美华保险微信公众号</p>
   </div>
</div>
</body>
</html>