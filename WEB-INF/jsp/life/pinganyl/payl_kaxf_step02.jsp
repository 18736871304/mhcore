<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>健康告知</title>
	<link rel="stylesheet" href="../../css/hengqin/statement.css?v=20180416">
	<script src="../../js/hengqin/jquery-1.10.1.min.js?v=20180416"></script>
	<script src="../../js/pinganyl/statement.js?v=20180710"></script>
</head>
<body>
<div>
	<div class="content">
        <p>1、曾经被其他保险公司拒保，延期或加费。</p>
        <p>2、近亲属（父母子女兄弟姐妹）有2个及以上在60周岁前患同一癌症。</p>
        <p>3、曾经或正患有下列任一疾病，体征或检查异常：</p>
            <p>1). 肿瘤指标*检查异常。</p>
            <p>2). 手术后组织病理活检异常（恶性/交界性)。</p>
            <p>3). 近两年发现肿块/息肉/结节/肿瘤/新生物且未手术。</p>
          	<p>4). 恶性肿瘤（包括白血病）、癌前病变、原位癌、肝硬化、慢性活动性肝炎、慢性萎缩性胃炎、恶性葡萄胎。 </p>
            <p>5). 乙肝指标*大三阳(HBeAg+且HBsAg+)。</p>
            <p>6). 子宫颈疾病，且宫颈上皮内瘤变检测CIN III或HPV阳性。</p>
            <p>7). 吞咽困难、咳血，吐血、便血或黑便，血尿，贫血，半年内体重减少5公斤以上。</p>
        <p>注：</p>
        <p>• 肿瘤指标*： 甲胎蛋白（AFP）、癌胚抗原（CEA）、前列腺特异性抗原（PSA）、癌抗原125（CA125）、癌抗原199（CA199）</p>
        <p>• 乙肝指标*：表面抗原(HBsAg)、e抗原(HBeAg)和 e抗体(HBeAb)、核心抗原(HBcAg)和核心抗体(HBcAb)、HBV-DNA</p>
        <p>4、吸烟每天超过40支。</p>
        <p>5、每周饮酒单位大于等于50（每一个饮酒单位相当于12g酒精。 例如，1杯（300ml）啤酒，半杯葡萄酒，45ml 白酒）。</p>
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