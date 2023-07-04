<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
    <link rel="stylesheet" href="../../css/hengqin/statement.css?v=180413">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180413"></script>
    <script src="../../js/hengqin/statement.js?v=180423"></script>
</head>
<body>
	<div>
		<div class="content">
			<p>1. 您是否在投保或复效时被拒保、延期、加费或除外责任承保？或被解除过保险合同？或申请过重大疾病理赔？</p>
			<p>2. 您最近1年内是否因健康异常发生过住院或手术,或由医师给您提出进一步检查、住院或手术的建议?
			此处所述住院治疗或手术不包含阑尾炎、脂肪瘤、肺炎、上呼吸道感染、骨折、颈椎疾病、急性胃炎或非萎缩性胃炎、顺产、胆囊炎。
			</p>
			<p>3. 您是否目前或过去一年内曾有过下列症状？
			反复头痛或眩晕、晕厥、咯血、胸痛、呼吸困难、呕血、黄疸、便血、听力下降、耳鸣、复视、视力明显下降、原因不明皮肤病和粘膜及齿龈出血、原因不明的发热、原因不明的体重下降超过5公斤、原因不明的肌肉萎缩、原因不明的包块或肿物。
			</p>
			<p>4. 您是否目前患有或过去曾经患过下列疾病？
			智能障碍、恶性肿瘤、冠心病、心绞痛、心律失常、先天性心脏病、风湿性心脏病、心肌病、心力衰竭、帕金森氏症、脑梗塞、脑出血、高血压（收缩压≥160mmHg或舒张压≥100mmHg）、糖尿病、重症肌无力、多发性硬化、呼吸衰竭、肺心病、
				肝硬化、尿毒症、肾病、肾脏功能障碍、慢性肾炎、再生障碍性贫血、白血病、淋巴瘤、艾滋病或艾滋病毒携带、系统性红斑狼疮、精神疾患、酒精或药物滥用成瘾、身体功能障碍或残疾（包括视力、听力、脊柱、胸廓、四肢）？
			</p>
			<p>5. 成年女性适用:
				<br/>a. 您是否正处于妊娠期？
				<br/>b. 您是否曾有阴道异常流血、畸胎瘤、葡萄胎、子宫颈重度不典型增生、卵巢肿瘤？

			</p>
			<p>6. 您是否存在下列习惯或爱好：
				<br/>	a. 吸烟，且平均每日吸烟2包以上。
				<br/>	b. 饮酒，且平均每日饮酒白酒1斤以上，或啤酒8瓶，或红酒2瓶以上。
				<br/>	c. 参加赛车、赛马、搏击类运动、攀岩、潜水、滑雪、蹦极、飞行、探险、特技活动及其它高风险活动。

			</p>
			<p>7. 您近半年内是否在其他保险公司投保过大于100万保额的人身保险（不包括航空意外、公共交通意外和医疗险）？(投保保额＞100万元时适用)
			</p>
			<p>8. 您近半年内是否有未如期归还的银行贷款或其他借贷？(投保保额＞100万元时适用)
			</p>
			
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			<input type="hidden" name="insuyear" id="insuyear" value="${insuyear}">
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
			<input type="hidden" name="getyear" id="getyear" value="${getyear}">
			<input type="hidden" name="prem" id="prem" value="${prem}">
			<input type="hidden" name="amnt" id="amnt" value="${amnt}">
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