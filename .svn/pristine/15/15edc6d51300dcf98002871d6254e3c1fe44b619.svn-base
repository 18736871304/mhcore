<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html  style="font-size: calc(100vw/ 18.75);">
	<head>
		<meta charset="utf-8" />
		<title>保险条款</title>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<meta name="format-detection" content="telephone=no" />
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="full-screen" content="yes">
		<meta name="x5-fullscreen" content="true">
		<link rel="stylesheet" href="../../css/mypolicy/public.css?v=20180704_01" />
		<link rel="stylesheet" href="../../css/mypolicy/policy.css?v=20180704_01" />
	</head>
	<body>
		<div class="main d_footback clauseBox">
			<!--START  保险条款-->
			<div class="policyHolderBox d_boxSz">
				<h1 class="title d_boxSz">${riskname}</h1>
				<div class="box d_boxSz">
					<c:forEach items="${contractList}" var="contract">
						<a href="${contract.url}">
							<div class="line">${contract.contractname}<i class="icon_right"></i></div>
						</a>
					</c:forEach>
				</div>
			</div>
			<!--END    保险条款-->
		</div>
	</body>
	<script></script>
</html>
