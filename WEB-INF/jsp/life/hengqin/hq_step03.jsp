<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
    <link rel="stylesheet" href="../../css/hengqin/statement.css?v=180413">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180413"></script>
    <script src="../../js/hengqin/statement.js?v=180413"></script>
</head>
<body>
	<div>
		<div class="content">
			<p>1. 被保险人是否曾经在投保本公司或其他保险公司产品时被拒绝投保？</p>
			<p>2. 被保险人现在是否从事以下职业？
				<br />矿工、海上救护及潜水人员、爆破工、采掘工、化工产品生产工人、伐木工、木材装运工、拆屋工、凿岩工、火药爆竹制造及加工工人、高压电工程作业人员、高空作业人员、战地记者、特技演员、动物园驯兽师、
				高空杂技、飞车、飞人演员、特种兵（伞兵、海军陆战队、化学兵、负有布雷爆破任务之士兵）、空中或海上作业人员、前线军人、消防队员、防暴警察、运动员（滑雪、散打、拳击）。
			</p>
			<p>3. 被保险人是否目前患有或曾经患过如下疾病？
				<br />智能障碍、恶性肿瘤、冠心病、心绞痛、心律失常、先天性心脏病、风湿性心脏病、心肌病、心力衰竭、帕金森氏症、脑梗塞、脑出血、重症肌无力、多发性硬化、呼吸衰竭、肺心病、肝硬化、尿毒症、肾病、
				肾脏功能障碍、慢性肾炎、再生障碍性贫血、白血病、淋巴瘤、艾滋病或艾滋病毒携带、系统性红斑狼疮、精神疾患、畸形或残疾。
			</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
			<input type="hidden" name="getyear" id="getyear" value="${getyear}">
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