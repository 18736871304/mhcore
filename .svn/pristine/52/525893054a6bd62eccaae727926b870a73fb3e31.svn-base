<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html  style="font-size: calc(100vw/ 18.75);">
	<head>
		<meta charset="utf-8" />
		<title>保单详情</title>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<meta name="format-detection" content="telephone=no" />
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="full-screen" content="yes">
		<meta name="x5-fullscreen" content="true">
		<link rel="stylesheet" href="../../css/mypolicy/public.css?v=20180703_01" />
		<link rel="stylesheet" href="../../css/mypolicy/policy.css?v=20191218_01" />
	</head>
	<body>
		<div class="main d_footback policyDetailBox">
			<!--START  标题-->
			
			<div class="policyNumBox d_boxSz d_mb15">
					<img src="${typeinlogo}" />
					<h1>${mainrisk.riskname}</h1>
					<br />
					<p>保单号：<span>${mainrisk.contno}</span></p>
			</div>
			
			<!--END    标题-->
			<!--START  日期-->
			<div class="timeBox d_boxSz d_mb15">
				<div class="left">
					<p><span>生效日期</span>${mainrisk.cvalidate}</p>
					<p><span>缴费方式</span>${mainrisk.payintvvalue}</p>
					<p><span>缴费年期</span>${mainrisk.payendyearvalue}</p>
				</div>
				<div class="right d_table">
					<div class="d_cell img">
						<c:if test="${mainrisk.state==40}">
							<i class="protection"></i>
						</c:if>
						<c:if test="${mainrisk.state==74}">
							<i class="renewal"></i>
						</c:if>
						<c:if test="${mainrisk.state==70||mainrisk.state==72||mainrisk.state==73||mainrisk.state==75}">
							<i class="failure"></i>
						</c:if>
						<!--
							protection：保障中
							failure：失效
							pending：待处理
							renewal：可续保
						-->
					</div>
				</div>
			</div>
			<!--END    日期-->
			<!--START  投保人-->
			<div class="policyHolderBox d_boxSz d_mb15">
				<h1 class="title d_boxSz">投保人信息</h1>
				<div class="box d_boxSz">
					<div class="line"><span>姓名</span><p>${mainrisk.appname}</p></div>
					<div class="line"><span>性别</span><p>${mainrisk.appsexname}</p></div>
					<div class="line"><span>身份证</span><p>${mainrisk.appidno}</p></div>
					<div class="line"><span>出生日期</span><p>${mainrisk.appbirthday}</p></div>
					<div class="line"><span>手机号</span><p>${mainrisk.appphone}</p></div>
					<div class="line"><span>地址</span><p>${mainrisk.appprovincename}${mainrisk.appcityname}${mainrisk.appcountryname}${mainrisk.appaddress}</p></div>
				</div>
			</div>
			<!--END    投保人-->
			<!--START  被保险人-->
			<div class="policyHolderBox d_boxSz d_mb15">
				<h1 class="title d_boxSz">被保人信息</h1>
				<div class="box d_boxSz">
					<div class="line"><span>投被保人关系</span><p>${mainrisk.relaname}</p></div>
					<div class="line"><span>姓名</span><p>${mainrisk.insname}</p></div>
					<div class="line"><span>性别</span><p>${mainrisk.inssexname}</p></div>
					<div class="line"><span>身份证</span><p>${mainrisk.insidno}</p></div>
					<div class="line"><span>出生日期</span><p>${mainrisk.insbirthday}</p></div>
					<div class="line"><span>手机号</span><p>${mainrisk.insphone}</p></div>
					<div class="line"><span>地址</span><p>${mainrisk.insprovincename}${mainrisk.inscityname}${mainrisk.inscountryname}${mainrisk.insaddress}</p></div>
				</div>
			</div>
			
			<div class="policyHolderBox d_boxSz d_mb15">
				<h1 class="title d_boxSz">主险信息</h1>
				<div class="box d_boxSz">
					<div class="line"><span>险种名称</span><p>${mainrisk.riskname}</p></div>
					<div class="line"><span>保险金额</span><p>${mainrisk.amnt}</p></div>
					<div class="line"><span>保障期限</span><p>${mainrisk.insuyearvalue}</p></div>
					<div class="line"><span>保费</span><p>${mainrisk.prem}</p></div>
					<div class="line"><span>缴费方式</span><p>${mainrisk.payintvvalue}</p></div>
					<div class="line"><span>缴费年期</span><p>${mainrisk.payendyearvalue}</p></div>
				</div>
			</div>
			
			<c:forEach items="${subrisklist}" var="subrisk" varStatus = "status">
				<div class="policyHolderBox d_boxSz d_mb15">
					<h1 class="title d_boxSz">附加险信息</h1>
					<!--  <h1 class="title d_boxSz">附加险信息 ${status.count}</h1> -->
					<div class="box d_boxSz">
						<div class="line"><span>险种名称</span><p>${subrisk.riskname}</p></div>
						<div class="line"><span>保险金额</span><p>${subrisk.amnt}</p></div>
						<div class="line"><span>保障期限</span><p>${subrisk.insuyearvalue}</p></div>
						<div class="line"><span>保费</span><p>${subrisk.prem}</p></div>
						<div class="line"><span>缴费方式</span><p>${subrisk.payintvvalue}</p></div>
						<div class="line"><span>缴费年期</span><p>${subrisk.payendyearvalue}</p></div>
					</div>
				</div>
			</c:forEach>
			
			<!--END    被保险人-->
			<!--START  保险条款-->
			<!-- 
			<c:if test="${empty policyurl}">
				<div class="termsBox d_boxSz d_mb15">
					<a href="./policy_contract.do?orderid=${orderid}">保险条款<i class="icon_right"></i></a>
				</div>
			</c:if>
			
			<c:if test="${!empty policyurl}">
				<div class="termsBox d_boxSz d_mb15">
					<a href="${policyurl}">保单下载<i class="icon_right"></i></a>
				</div>
			</c:if>
			 -->
			<!--END    保险条款-->
		</div>
	</body>
	<script></script>
</html>
