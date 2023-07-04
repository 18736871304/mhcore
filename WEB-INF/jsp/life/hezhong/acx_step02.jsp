<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>健康告知</title>
	<link rel="stylesheet" href="../../css/hengqin/statement.css?v=20180416">
	<script src="../../js/hengqin/jquery-1.10.1.min.js?v=20180416"></script>
	<script src="../../js/hezhong/statement.js?v=20180515"></script>
</head>
<body>
<div>
	<div class="content">
		<p>1.您是否曾患有如下一种或多种疾病：
			<br />您是否曾患有如下一种或多种疾病：高血压、冠心病、脑梗塞等心血管疾病、精神类疾患、
			智力障碍、癫痫、恶性肿瘤、肝硬化、慢性肾炎及肾功能衰竭等肾脏疾病、艾滋病。
		</p>
		<p>2.您是否有酗酒或药物滥用成瘾。</p>
		<p>3.您目前是否存在累计自驾责任10万以上的有效保单或准备购买除本单以外的自驾责任保险</p>
	</div>
	<div class="clearfix bottomBtn-wrap">
		<button class="inconformity l-float">部分为是</button>
		<button class="coincidence r-float active">以上皆否</button>
		<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
		<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">

		<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
		<input type="hidden" name="insuyear" id="insuyear" value="${insuyear}">
		<input type="hidden" name="amnt" id="amnt" value="${amnt}">
		<input type="hidden" name="prem" id="prem" value="${prem}">

		<input type="hidden" class="personInfo" id="productNo" name="orderProduct.productCode" value="${productNo}">
	</div>
	<div class="mask">
		<div class="pop repeat">
			<span></span>
			<a href="javascript:void(0);" class="pop-sure">确定</a>
		</div>
	</div>
</div>
<!--加载动画-->
<div class="loading">
	<div class="sk-circle">
		<div class="sk-circle1 sk-child"></div>
		<div class="sk-circle2 sk-child"></div>
		<div class="sk-circle3 sk-child"></div>
		<div class="sk-circle4 sk-child"></div>
		<div class="sk-circle5 sk-child"></div>
		<div class="sk-circle6 sk-child"></div>
		<div class="sk-circle7 sk-child"></div>
		<div class="sk-circle8 sk-child"></div>
		<div class="sk-circle9 sk-child"></div>
		<div class="sk-circle10 sk-child"></div>
		<div class="sk-circle11 sk-child"></div>
		<div class="sk-circle12 sk-child"></div>
	</div>
</div>

</body>
</html>