<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
    <link rel="stylesheet" href="../../css/hengqin/statement.css?v=180413">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180413"></script>
    <script src="../../js/sunlife/statement.js?v=180413"></script>
</head>
<body>
	<div>
		<div class="content">
			<p>1. 您在过去投保人身保险时，或在申请保全复效时，曾否被拒保、延期、加费或对条款做特别约定？</p>
			<p>2. 您曾否使用任何成瘾药物、麻醉剂或接受戒毒治疗？</p>
			<p>3. 您是否每日饮啤酒大于3瓶或者白酒3两？</p>
			<p>4. 您是否每日吸烟大于20支/日？</p>
			<p>5. 您有无职业病，如尘肺、矽肺、石棉肺、各种慢性中毒等？</p>
			<p>6. 您在过去投保人身保险时，曾否申请过理赔（不包括普通感冒、意外碰伤已完全愈合、猫狗抓咬伤门诊治疗）？</p>
			<p>7. 您在过去一年内是否有反复头痛、胸痛、咳血、痰中带血、鼻出血、吞咽困难、气喘、肝区不适、腹痛、黄疸、血尿、便血、紫癜等情况？是否有体重减轻超过5公斤（非健身或减肥原因）？是否有体表或体内肿块、息肉、结节、黑痣增大、淋巴结肿大、贫血、脾大？</p>
			<p>8. 您在过去两年内是否因健康检查（包括单位组织体检）或身体异常而被医生建议定期复查、进一步诊治、住院或手术（包括住院手术、门诊手术、内窥镜手术，且不包括正常剖腹产、顺产、阑尾炎、上呼吸道感染）？</p>
			<p>9. 是否曾存在或被告知怀疑存在下列症状或疾病：
				<br />（1）甲状腺结节；
				<br />（2）先天性疾病，遗传性疾病，五官、脊柱、胸廓、四肢畸形、残疾或功能障碍、失聪、失明，瘫痪，Ⅲ度烧伤；
				<br />（3）智能障碍，精神疾病，癫痫，脑肿瘤，脑炎后遗症或脑膜炎后遗症，脑损伤，脑血管瘤，脑动脉瘤，脑囊肿，深度昏迷，多发性硬化，重症肌无力，运动神经元病，阿尔茨海默病，帕金森病，脊髓灰质炎；
				<br />（4）恶性肿瘤，原位癌，艾滋病及HIV呈阳性，吸食、注射成瘾性药物或毒品，红斑狼疮，曾经接受或需要接受开颅、开胸手术，骨髓移植手术，器官移植手术或器官切除手术；
				<br />（5）呼吸系统疾病（终末期肺病，肺纤维化，肺动脉高压，支气管扩张，慢性肺结核，哮喘，慢性支气管炎，肺气肿）；
				<br />（6）心脑血管疾病（高血压，冠心病，心绞痛，心肌梗塞，心肌炎，心肌病，肺心病，风湿性心脏病，心功能不全，主动脉瘤，脑梗塞，脑出血，心脏瓣膜病，心律失常，心包炎，心内膜炎）；
				<br />（7）肝脏疾病（肝炎，肝炎病毒携带，乙肝大三阳，转氨酶高于正常值2倍以上，丙肝，酒精性肝炎，肝硬化，肝功能衰竭）；
				<br />（8）肾脏疾病（肾病综合征，肾功能不全，尿毒症，慢性肾炎，慢性肾盂肾炎，多囊肾，肾上腺疾病）；
				<br />（9）糖尿病，空腹血糖异常，白血病，血友病，凝血功能障碍，再生障碍性贫血，骨髓增生异常综合征，淋巴瘤，川崎病，类风湿性关节炎，硬皮病，肌营养不良症，坏死性筋膜炎，登革热；
				<br />（10）胰腺疾病，溃疡性结肠炎，克罗恩病（Crohn病），硬化性胆管炎，萎缩性胃炎，肠息肉。</p>
			<p>10. 女性适用：您是否存在以下情况：
				<br />（1）怀孕28周以上或产后不满一个月？
				<br />（2）过去两年内是否进行以下任何检查且结果异常：宫颈细胞检查、乳腺超声或红外线检查、妇科超声检查？
				<br />（3）过去一年内是否存在阴道不规则出血、宫颈糜烂？</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			<input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
			<input type="hidden" name="amnt" id="amnt" value="${amnt}">
			
			<input type="hidden" name="prem" id="prem" value="${prem}">
			<input type="hidden" name="plan" id="plan" value="${plan}">
			<input type="hidden" name="huomian" id="huomian" value="${huomian}">
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