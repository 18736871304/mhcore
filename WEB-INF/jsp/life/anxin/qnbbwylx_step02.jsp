<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
    <link rel="stylesheet" href="../../css/hengqin/statement.css?v=20180314_01">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=20180227"></script>
    <script src="../../js/anxin/statement.js"></script>
</head>
<body>
	<div>
		<div class="content">
			<p>1.被保险人过去是否被保险公司解除合同或在投保、复效时被延期、拒保、附加条件承保？或曾经申请过重大疾病的理赔？ </p>
			<p>被保险人一年内是否去医院进行过门诊的检查、服药、手术或其他治疗但不包括普通感冒、流感或敏感症；或是否曾考虑短期内寻求诊疗、检查、测试、住院治疗或外科手术；是否过去三年内曾有医学检查
			（包括健康体检）结果异常；是否过去五年曾住院治疗检查或治疗（包括入住疗养院、康复医院等医疗机构）？ </p>
			<p>3.被保险人是否目前或过去患有下列疾病、症候？脑、神经系统及精神方面疾病，心血管疾病，呼吸系统疾病，消化系统疾病，泌尿系统疾病，骨骼、肌肉、结缔组织的疾病，内分泌、血液系统疾病，
			五官科疾病，以上未提及的肿瘤和癌症，原因不明的发热、消瘦（体重一年内下降超过5公斤）、肥胖等，有无职业病、酒精中毒、其他药品中毒。 
			</p>
			<p>4.被保险人是否有智能障碍？是否有五官、脊柱、胸廓、四肢、手指、足趾缺损、畸形或功能障碍？</p>
			<p>5.女性告知（系统自动识别身份证信息，如年满18周岁女性，则显示该问题）：</p>
				<p>被保险人目前是否怀孕？</p>
				<p>被保险人目前或既往怀孕及生产期间是否有合并症？</p>
				<p>例如：蛋白尿、血尿、高血压、糖尿病等。被保险人是否曾有阴道不规则流血、乳房肿块、溢乳、腋下淋巴结肿大、乳腺增生或纤维瘤、其他乳腺疾病？
				被保险人是否曾有子宫肌瘤、内膜异位症、子宫颈上皮不典型增生、卵巢囊肿、畸胎瘤等？</p>
			<p>6.未成年人告知（系统自动识别身份证信息，如未满14周岁，则显示该问题）：</p>
			<p> i.被保险人出生时是否体重低于2.5公斤，是否有早产、难产、窒息和抢救史？</p>
			<p> ii.被保险人是否存在先天性或遗传性疾病或畸形?是否有生长发育异常？是否有心脏、血管、神经、运动或智力方面异常？是否因病住院治疗或手术？</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">
			<input type="hidden" name="aliasname" id="aliasname" value="qnbbwylx">
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
			<input type="hidden" name="prem" id="prem" value="${prem}">
            <input type="hidden" name="aliascode" id="aliascode" value="${aliascode}">
			<input type="hidden" name="socialInsuFlag" id="socialInsuFlag" value="${socialInsuFlag}">
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