<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
    <link rel="stylesheet" href="../../css/hengqin/statement.css?v=20180314_01">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=20180227"></script>
    <script src="../../js/anxin/statement.js?v=2018050801"></script>
</head>
<body>
	<div>
		<div class="content">
			<!-- <p>被保险人目前的身高和体重_________________ 厘米/cm____________________公斤/kg</p>
			<p>1、被保险人是否目前吸烟或曾经吸烟？若“是”，请告知每日吸烟量和吸烟年限。</p>
			<p>2、被保险人是否目前饮酒或曾经饮酒？若“是”，请告知每周饮酒量和饮酒年限。酒的种类有：①啤酒  ②葡萄酒 ③黄酒 ④白酒或洋酒等。</p> -->
			<p>1、被保险人是否曾有药物滥用或服用毒品？ </p>
			<p>2、被保险人目前或过去进行过以下检查或治疗？
			考虑短期内寻求诊疗、检测、测试、住院治疗或外科手术。一年内去医院进行过门诊的检查、服药、手术或其他治疗但不包括普通感冒、流感或敏感症。过去三年内曾有医学检查（包括健康体检）结果异常。过去五年曾住院治疗检查或治疗（包括入住疗养院、康复医院等医疗机构）。</p>
			<p>3、被保险人是否目前或过去患有下列疾病、症候？
			脑、神经系统及精神方面疾病(脑膜炎、脑性麻痹等)，心血管疾病，呼吸系统疾病(慢性肺炎、慢性支气管炎、气胸等)，消化系统疾病(慢性胆囊炎、慢性胃炎等)，泌尿系统疾病(尿道结石, 蛋白尿、血尿等)，骨骼、肌肉、结缔组织的疾病(骨盆腔发炎、肋膜炎、非意外性骨折、淋巴腺肿大、
			椎间盘突出、关节炎、良性肿瘤等)，内分泌、血液系统疾病(甲状腺肥大或发炎、甲状腺肿、肾上腺疾病等)，耳、鼻、喉科疾病(膜疾病，乳突炎、慢性中耳炎、梅尼尔氏症等)，等疾病，以上未提及的肿瘤和癌症，原因不明的发热、消瘦（体重一年内下降超过5公斤）、肥胖等，有无职业病、酒精中毒、其他药品中毒。 </p>
			<p>4、被保险人是否有智能障碍？是否有五官、脊柱、胸廓、四肢、手指、足趾缺损、畸形或功能障碍？  </p>
			<p>5、女性告知项（未满18周岁免告知）被保险人目前是否怀孕？被保险人目前或既往怀孕及生产期间是否有合并症？
			例如：蛋白尿、血尿、高血压、糖尿病等。被保险人是否曾有阴道不规则流血、乳房肿块、溢乳、腋下淋巴结肿大、乳腺增生或纤维瘤、其他乳腺疾病？被保险人是否曾有子宫肌瘤、内膜异位症、子宫颈上皮不典型增生、卵巢囊肿、畸胎瘤等？</p>
			<p>6、被保险人是否有参加赛车、赛马、搏击类运动、蹦极、滑雪、攀岩、潜水、探险或特技活动及其他高风险活动的爱好？ </p>
			<p>7、被保险人的父母、子女、兄弟姐妹是否患有血友病、多囊肝肾、其他遗传性疾病等？  </p>
			<p>8、被保险人过去是否被保险公司解除合同或在投保、复效时被延期、拒保、附加条件承保？或曾经申请过重大疾病的理赔？ </p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			<input type="hidden" name="aliasname" id="aliasname" value="${aliasname}">
			<input type="hidden" name="socialInsuFlag" id="socialInsuFlag" value="${socialInsuFlag}">
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