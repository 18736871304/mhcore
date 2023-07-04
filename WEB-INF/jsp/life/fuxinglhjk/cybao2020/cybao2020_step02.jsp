<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
   <link rel="stylesheet" href="../../css/hengqin/statement.css?v=180413">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180413"></script>
    <script src="../../js/fuxinglhjk/statement.js?v=20191224_01"></script>
</head>
<body>
	<div>
		<div class="content">
			<p>请提供“是”或“否”的答案。对未成年被保险人，请被保险人的父母代为回答。投保人应在对所有被保险人健康和职业状况充分了解的基础上履行如实告知义务。本公司将根据投保人在本次投保中告知的信息作出承保结论。</p>
			<p>如被保险人健康和职业状况与下述告知内容不符，或者投保人以及被保险人在保单承保后又提出补充告知，且足以影响本公司决定是否同意承保或者提高保险费率的：</p>
			<p>（1）本公司有权不同意承保或解除合同；</p>
			<p>（2）如发生保险事故，本公司不承担赔偿或给付保险金的责任，对于故意不如实告知的，不退还保险费。</p>
			<p>投保人确认被保险人是否有以下情况：</p>
			<p>1、过去2年内投保人身保险或健康保险时，被保险公司拒保、延期、加费或者附加条件承保。</p>
			<p>2、目前从事高危职业 (<a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-gwjob.pdf">《高危职业表》</a>见附件)。</p>
			<p>3、过去1年内有健康检查结果异常或准备进行检查（如血液、超声、影像、内镜、病理检查）或连续服药超过30天；过去2年曾住院（不包括剖腹产/顺产/鼻炎/急性胃肠炎/肺炎/上呼吸道感染住院且已痊愈出院）或被医生建议进一步检查、手术或治疗。</p>
			<p>4、目前或过往患有下列疾病或症状：</p>
			<p>良/恶性肿瘤、白血病、原位癌、癌前病变、高血压（未服药情况下收缩压大于140mmHg，舒张压大于90mmHg）、糖尿病、冠心病/冠状动脉狭窄、心肌梗死/梗塞、心肌病、心瓣膜病、风湿性心脏病、心功能不全二级（含）以上、主动脉狭窄、肺动脉高压、脑梗死/脑出血、脑血管畸形、肾炎、肾功能不全、肝炎（包括肝炎病毒携带）、肝硬化、再生障碍性贫血、系统性红斑狼疮、类风湿性关节炎、痛风性关节炎、帕金森氏病、癫痫、精神疾病、肺结核、慢性支气管炎、慢性阻塞性肺病、肌无力、瘫痪、胆石症、胆囊息肉、胰腺炎、甲亢、甲状腺结节、传导性耳聋、胃/十二指肠溃疡、萎缩性胃炎、克罗恩病（节段性肠炎）、溃疡性结肠炎、椎间盘突出症、椎管狭窄、强直性脊柱炎、股骨头坏死、先天性疾病、法定传染病、职业病。</p>
			<p>5、过去1年内存在下列症状：反复头痛、晕厥、胸痛、气急、紫绀、持续反复发热、抽搐、不明原因皮下出血点、咯血、反复呕吐、进食梗噎感或吞咽困难、呕血、浮肿、腹痛、黄疸（新生儿黄疸且已治愈的除外）、便血、血尿、蛋白尿、性质不明肿块/结节/占位/息肉、黑痣增大、消瘦（3个月内体重减轻5公斤以上）、酒精中毒、药物滥用、智能障碍、五官/脊柱/胸廓/四肢/手指/足趾缺损/畸形、功能障碍或活动受限。</p>
			<p>6、16周岁（含）以上女性被保险人：目前在妊娠过程中，或有乳腺囊肿/结节、卵巢囊肿、子宫肌瘤、子宫肌腺症、宫外孕、葡萄胎或其他妊娠滋养细胞疾病、子宫内膜增生/异位、宫颈上皮内瘤变（CIN）；过去1年内存在阴道异常出血、乳头异常溢液/回缩/糜烂/疼痛，乳房皮肤皱缩/凹陷。</p>
			<p>7、2周岁（含）以下被保险人：出生时体重低于2.5公斤，或有早产/窒息/发育迟缓/脑瘫。</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">智能核保</button>
			<button class="coincidence r-float active">以上皆否</button>
			
			<input type="hidden" name="productplan" id="productplan" value="${productplan}">
			<input type="hidden" name="isshaoer" id="isshaoer" value="${isshaoer}">
			<input type="hidden" name="hassocialinsurance" id="hassocialinsurance" value="${hassocialinsurance}">
			<input type="hidden" name="prem" id="prem" value="${prem}">
			
			<input type="hidden" name="riskCode" id="riskCode" value="110084">
			
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