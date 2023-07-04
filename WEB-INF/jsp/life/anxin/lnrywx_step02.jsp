<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
    <link rel="stylesheet" href="../../css/hengqin/statement.css?v=20180314_01">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=20180227"></script>
    <script src="../../js/anxin/statement.js?v=2018052101"></script>
</head>
<body>
	<div>
		<div class="content">
			<div align="center" >被保险人健康告知</div>
			<br/>
			<div>
				温馨提示：健康告知任意一项回答为“是”，则不接受其投保。
			</div>
			<br/>
			<p>1.被保险人目前及过往是否患有或被怀疑患有癌症、恶性肿瘤、白血病、原位癌、癌前病变、乙肝大三阳（HBeAg+且HBsAg+）、
			慢性乙型或丙型肝炎、肝硬化、慢性萎缩性胃炎、溃疡性结肠炎、克隆病、包块、肿块、息肉、囊肿、肿瘤标记物*或病理学检查异常。</p>
			<p>2.最近2年内被保险人是否患有以下不适或症状：反复头痛、长期发热、吞咽困难、咯血、呕血反复牙龈出血或鼻衄、肝区不适、甲状腺结节、
			淋巴结肿大、长期腹痛、腹水、血尿、便血或黑便、紫癜、消瘦（体重3个月内下降超过5公斤）。</p>
			<p>3.（女性适用）被保险人目前及过往是否有不规则阴道出血、乳头异常溢液、糜烂或回缩、乳房表面皮肤凹陷、皱褶或皮肤收缩、宫颈肿物/上皮内瘤样病变、畸胎瘤、葡萄胎、绒毛膜癌或其他滋养细胞疾病。
			</p>
			<p>4.被保险人目前及过往是否每天吸烟超过40支(包括但不限于香烟、雪茄、水烟、鼻烟等)，或者每周饮酒大于等于50个单位（每一个饮酒单位相当于1杯（300ml）啤酒,半杯葡萄酒,1两白酒）。</p>
			<p>5.被保险人直系亲属中目前患有或过往罹患癌症的人数是否达到2名或2名以上。</p>
			<p>6.被保险人在投保其他保险公司恶性肿瘤产品时是否被拒绝投保、延期、加费或除外。</p>
			<p>注：肿瘤标志物*：是指特征性存在于恶性肿瘤细胞或由恶性肿瘤细胞异常产生的物质，或是机体对肿瘤刺激反应而产生的物质，
			如甲胎蛋白（AFP）、癌胚抗原（CEA）、前列腺特异性抗原（PSA）、癌抗原125（CA125）、癌抗原199（CA199）、绒毛膜促性腺激素（HCG）等。</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			<input type="hidden" name="aliasname" id="aliasname" value="lnrywx">
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