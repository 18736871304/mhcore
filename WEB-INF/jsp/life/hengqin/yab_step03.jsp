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
			<p>1.您最近一年内是否在其他保险公司曾经或正在投保人身保险，且合计保险金额大于100万？</p>
			<p>2.您是否目前或过去曾进行过以下检查或治疗？
				<br />a.近半年内曾去医院进行过门诊的检查、服药、手术或其他治疗，且目前尚未痊愈。
				<br />b.一年内曾有医学检查（包括健康体检）结果异常，且被医生建议做进一步检查、复查或治疗。
				<br />c.三年内曾住院检查或治疗（包括入住疗养院、康复医院等医疗机构）。
			</p>
			<p>3.您是否目前或过去一年内曾有过下列症状？
				<br />反复头痛或眩晕、晕厥、咯血、胸痛、呼吸困难、呕血、黄疸、便血、听力下降、耳鸣、复视、
				视力明显下降、原因不明皮肤病和粘膜及齿龈出血、原因不明的发热、体重下降超过5公斤、原因不明的肌肉萎缩、原因不明的包块或肿物、
				身体的其他感觉异常或活动障碍。
			</p>
			<p>4.您在其他保险公司投的人身保险投保申请或复效申请是否曾被拒保、推迟、加费或作任何形式修改？或被解除过保险合同？或申请过重大疾病理赔？</p>
			<p>5.您是否有下述的身体残障情况：
				<br /> a.四肢、五官、手指、足趾缺损；
 				<br />b.视力、听力、语言能力或中枢神经系统障碍；
				<br />c.脊柱、胸廓、四肢或手指、足趾畸形、跛行、脊髓灰质炎所致的缺陷及其它缺陷 。
			</p>
			<p>6.您最近两年的平均固定年收入是否在4万元以内？</p>
			<p>7.您是否目前患有或过去曾经患过下列疾病或手术史？
				<br />a.脑、神经系统及精神方面疾病，例如：癫痫、脑中风、脑炎、脑膜炎、脑血管瘤、运动神经元病、阿尔茨海默氏症、帕金森氏综合症、
				脊髓疾病、重症肌无力、多发性硬化、抑郁症、精神病、脑部手术史。
				<br />b.心血管系统疾病，例如：高血压、冠心病、心绞痛、心律失常、心肌梗塞、先天性心脏病、风湿性心脏病、心肌病、室壁瘤、动脉瘤、心脏瓣膜病、主动脉疾病。
				<br />c.呼吸系统疾病，例如：慢性支气管炎、肺气肿、肺心病、哮喘、肺结核、肺栓塞、支气管扩张、尘肺、间质性肺病、肺纤维化。
				<br />d.消化系统疾病，例如：胃和/或十二指肠溃疡、胰腺炎、慢性肝炎、丙肝病毒携带、多囊肝、肝内胆管炎、肝硬化、慢性或溃疡性结肠炎、克隆病、腹部手术史。
				<br />e.泌尿系统疾病， 例如：血尿、蛋白尿、尿路畸形、肾炎、肾病、肾脏功能不全、尿毒症、肾移植、肾积水、肾囊肿、泌尿系统手术史。
				<br />f.骨骼、肌肉、结缔组织的疾病，例如：类风湿性关节炎、强直性脊柱炎、椎管狭窄、脊柱裂、股骨头坏死、骨性关节炎、骨髓炎、皮肌炎、肌营养不良症、干燥综合症、系统性红斑狼疮。
				<br />g.内分泌、血液系统、免疫系统疾病，例如：糖尿病、痛风、甲状腺结节、甲状腺或甲状旁腺疾病、白血病、血友病、再生障碍性贫血、地中海贫血、艾滋病或艾滋病病毒（HIV）携带。
				<br />h.五官科疾病，例如：视网膜出血或剥离、青光眼、高度近视（800度以上）、美尼尔病、五官手术史。
				<br />i.以上未提及的肿瘤，包括：肉瘤、癌、良性肿瘤、息肉、囊肿。
				<br />j.酒精或药物滥用成瘾。
			</p>
			<p>8.您是否在银行有贷款或向其他人有借贷，且近半年内未能如期还款？</p>
			<p>9.您是否存在下列习惯或爱好：
				<br /> a.吸烟，且平均每日吸烟2包以上。
				<br /> b.饮酒，且平均每日饮酒白酒1斤以上，或啤酒8瓶，或红酒2瓶以上。 
				<br />c.参加赛车、赛马、搏击类运动、攀岩、潜水、滑雪、蹦极、飞行、探险、特技活动及其它高风险活动。
			</p>
			<p>10.您是否目前或过去曾进行过以下检查或治疗？
				<br />a.近半年内曾去医院进行过门诊的检查、服药、手术或其他治疗，且目前尚未痊愈。
				<br />b.一年内曾有医学检查（包括健康体检）结果异常，且被医生建议做进一步检查、复查或治疗。
				<br />c.三年内曾住院检查或治疗（包括入住疗养院、康复医院等医疗机构）。
			</p>
			<p>11.成年女性适用: (投保保额80万以上告知)
				<br />a.您是否正处于妊娠期或产后一个月？
				<br />b.您是否曾有阴道异常流血、畸胎瘤、葡萄胎、盆腔炎或其他任何乳房、子宫、卵巢的疾病？
			 </p>
			<p>12.二岁以下（含二岁）儿童填写
				<br />a.是否为低体重儿（出生时体重为2.5公斤以下）或早产儿（出生孕周<37周）？出生时候是否曾有产伤、窒息等异常情况？ 
				<br />b.是否有畸形、发育迟缓、惊厥、抽搐、脑瘫、智能障碍、先天性和遗传性疾病？
			</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
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