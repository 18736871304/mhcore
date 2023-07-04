<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人健康告知</title>
   <link rel="stylesheet" href="../../css/hengqin/statement.css?v=20191122">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=20191122"></script>
    <script src="../../js/hongkang/statement.js?v=20191122"></script>
</head>
<body>
	<div>
		<div class="content">
			<p>1、是否每日吸烟支数×烟龄（年）>400？</p>
			<p>2、是否参与跑酷、滑翔、攀岩、探险、搏击、赛车、蹦极等极限运动？</p>
			<p>3、最近1年，是否有淋巴结增大、胸痛、胸闷、气喘、咳血、痰中带血、呕血、持续吞咽困难或哽噎感、反复腹泻、腹痛、血尿、蛋白尿、便血、浮肿或水肿、皮肤出血点、反复头痛、眩晕、体重下降超过5公斤（非健身及减肥原因）？</p>
			<p>4、是否提交过人身保险理赔申请、或5年内有住院、或2年内有门诊就诊？</p>
			<p>本项不包括顺产、人工流产、龋齿、牙周炎、感冒、鼻炎、鼻窦炎、急性支气管炎、颈椎病、急性胃肠炎、胆囊炎、胆囊结石、阑尾炎、脂肪瘤、皮脂腺囊肿、皮炎、癣、皮疹。</p>
			<p>5、过去2年是否有心肺听诊、超声、心电图、脑电图、肌电图、X线、CT、造影、核磁共振、内窥镜、病理活检、眼底、血液、尿液、细胞学检查结果异常？</p>
			<p>6、是否被保险公司拒保、延期、加费或除外责任承保？</p>
			<p>7、是否有智能障碍？是否听力下降、耳聋、或高度近视1000度（含）以上？是否身体发育异常、残疾、畸形或功能障碍？</p>
			<p>8、是否曾经或目前有：</p>
			<p>（1）癌症、肿瘤、白血病、原位癌、非典型增生、黑痣增大或破溃；体表或体内肿块、息肉、结节、囊肿；器官移植；影像学检查异常密度影、低密度团块或磨玻璃密度影；</p>
			<p>（2）甲状腺结节、甲状腺功能亢进、甲状腺功能减低、甲状旁腺疾病；糖尿病、糖耐量异常、肾上腺疾病、库欣综合征；风湿病、类风湿性关节炎、痛风、红斑狼疮、强直性脊柱炎；</p>
			<p>（3）高血压病、心律失常、冠心病、心肌缺血、心绞痛、心肌梗塞、心功能不全；</p>
			<p>（4）心肌炎、心肌病、心脏瓣膜病、风湿性心脏病、肺动脉高压、肺源性心脏病、心内膜炎、心包炎、心包积液、川崎病、动脉瘤、动脉夹层、动脉粥样硬化、动脉斑块、静脉血栓；</p>
			<p>（5）脑中风、蛛网膜下腔出血、脑炎、脑膜炎、脑血管瘤、脑动静脉畸形、短暂脑缺血；抑郁症、焦虑症、精神分裂症、自闭症；</p>
			<p>（6）癫痫、帕金森氏病、肝豆状核变性、阿尔兹海默病（老年痴呆）、多发性硬化、肌无力、肢体麻木、脊髓疾病、垂体疾病、下丘脑疾病；</p>
			<p>（7）乙肝表面抗原阳性、肝炎、重度脂肪肝、丙肝抗体阳性、肝硬化、多囊肝、胆囊息肉、食管静脉曲张；</p>
			<p>（8）胰腺炎、萎缩性胃炎、消化道溃疡、肠梗阻、慢性肠炎、溃疡性结肠炎、克罗恩病；</p>
			<p>（9）肾炎、IgA肾病、肾小球疾病、肾病综合症、肾盂肾炎、肾功能不全、肾衰竭、尿毒症；</p>
			<p>（10）多囊肾、肾积水、肾结石、输尿管结石、肾动脉狭窄、肾切除、单肾；</p>
			<p>（11）慢性支气管炎、哮喘、肺气肿、支气管扩张、慢性阻塞性肺疾病、间质性肺病、肺纤维化、肺大泡、肺栓塞、结核病、结节病、胸膜炎；</p>
			<p>（12）贫血、再生障碍性贫血、蚕豆病、骨髓增生异常综合征、血友病、紫癜、脾大；</p>
			<p>（13）白内障、青光眼、弱视、视神经或视网膜疾病、眼底动脉硬化、梅尼埃病、慢性中耳炎；</p>
			<p>（14）先天性疾病、遗传性疾病、脑外伤后遗症；尘肺、矽肺、石棉肺、慢性中毒；烧烫伤（二度及以上）；艾滋病、艾滋病毒携带或性病？</p>
			<p>9、是否有酒精依赖、酗酒、药物滥用或使用镇静剂、麻醉剂（不包含治疗性麻醉）、迷幻剂、其他成瘾性药物或毒品，或者接受戒毒治疗？</p>
			<p>10、是否高危妊娠或孕检异常或孕周已超过28周？是否有乳腺包块、肿块或结节、子宫肌瘤、血性溢乳、阴道不规律出血、重度宫颈炎、TCT或HPV阳性？</p>
			<p>11、如为不满3周岁儿童：出生体重是否低于2.5公斤？是否为早产、难产、过期产？是否有抽搐、窒息、缺氧？</p>
			<p>12、您的父母是否患多囊肾病，是否在40岁前确诊结肠癌、直肠癌、乳腺癌或卵巢癌？</p>
		</div>
		<div class="clearfix bottomBtn-wrap">
			<button class="inconformity l-float">部分为是</button>
			<button class="coincidence r-float active">以上皆否</button>
			
			<input type="hidden" name="amnt" id="amnt" value="${amnt}">
			<input type="hidden" name="prem" id="prem" value="${prem}">
			<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
			<input type="hidden" name="insuyear" id="insuyear" value="${insuyear}">
			<input type="hidden" name="payintv" id="payintv" value="${payintv}">
			
			<input type="hidden" name="isabzkx" id="isabzkx" value="${isabzkx}">
			
			<input type="hidden" name="riskCode" id="riskCode" value="hongkang000015_nian">
			
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