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
			<p>1.被保险人最近1年内，在其他保险公司投保时是否被拒保或被告知延期承保？</p>
			<p>2.被保险人在最近一年内，是否在其他保险公司曾经或正在投保人身保险（包括自驾车意外险），且合计保险金额超过100万？
			</p>
			<p>3.被保险人是否曾经患过或正患有下列任一疾病或手术史？<br />
				恶性肿瘤、良性脑肿瘤、原位癌、白血病、风湿性心脏病、冠心病、心肌梗塞、严重高血压（收缩压≥160mmHg和（或）舒张压≥100mmHg）、脑中风、
				脑动脉瘤、颅脑损伤、肺源性心脏病、呼吸衰竭、肺动脉高压、肺栓塞、肝功能衰竭、肝硬化、急性坏死性胰腺炎、肾功能衰竭、尿毒症、糖尿病伴并发症、
				甲亢性心脏病、系统性红斑狼疮并发肾功能损害、重症肌无力、再生障碍性贫血、淋巴瘤、恶性组织细胞增生症、骨髓增生异常综合症、接受器官移植或骨髓移植、身体功能障碍或残疾、智能障碍或精神疾病。</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
			<input type="hidden" name="insuyear" id="insuyear" value="${insuyear}">
			<input type="hidden" name="prem" id="prem" value="${prem}">
			<input type="hidden" name="amnt" id="amnt" value="${amnt}">
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
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