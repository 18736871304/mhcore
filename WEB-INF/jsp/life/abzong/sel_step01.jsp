<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html style="font-size: calc(100vw/18.75);"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, width=device-width, user-scalable=no">
<title>安邦随e乐两全保险</title>
<link href="../../css/abzong/sel/pro-detail.css?v=20180308" rel="stylesheet" media="screen">
<link href="../../css/abzong/sel/self.css" rel="stylesheet" media="screen">
<script src="../../js/abzong/sel/hm.js"></script>
<script src="../../js/abzong/sel/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="../../js/abzong/sel/pro-detail.js" type="text/javascript"></script>
<script src="../../js/abzong/detail.js" type="text/javascript"></script>
<style type="text/css">
	.vs-wrap, .case-wrap, .buyFlow-wrap, .claimFlow-wrap, .QA-wrap, .select-us-wrap, .profit-wrap, .duty-wrap{
	width: 90%;
	margin: 0 auto;
	box-sizing: border-box;
}
</style>
</head>

<body>
<header>
	<img src="../../images/abzong/sel/title_750x360.png" alt="安邦随e乐两全保险">
</header>
<nav class="main-nav">
	<ul class="clearfix" id="mainNav">
		<li class="detail current">产品详情</li>
		<li class="feature">产品服务</li>
		<li class="question">常见问题</li>
	</ul>
</nav>
<div id="detail"></div>
<div class="banner" id="section0">
	<img src="../../images/abzong/sel/banner_750x344.jpg" alt="">
</div>
<article class="detail-wrap">
	<!-- 产品基本信息 -->
	<section class="brief-instr">
		<div class="item-list amount">
			<p class="item-label">投保金额</p>
			<p class="item-con">
				<span class="red-num">100
					<i class="yuanF">元起售，</i>1000
					<i class="yuanF">元递增</i>
				</span>
			</p>
		</div>
		<div class="item-list crowd">
			<p class="item-label">被保年龄</p>
			<p class="base-bg age-group-bg">
				<span class="show-box age-group w80">18-70周岁</span>
			</p>
		</div>
		<div class="item-list period">
			<p class="item-label">保险期间</p>
			<p class="base-bg"><span class="show-box year-time w20">10年</span></p>
		</div>
		<div class="item-list frofit">
			<p class="item-label">缴费方式</p>
            <p class="base-bg">
                <span class="show-box year-time w100">一次性交清（可追加）</span>
            </p>
		</div>
	</section><!-- /产品基本信息 -->
    
	<div id="feature"></div>
	<section class="feature-wrap" id="section1">
		<h2 class="headline title-red-mid-txt">
			<span>产品特色</span>
		</h2>
		<div class="feature-list-box">
			<ul class="feature-list clearfix tabTitle">
				<li class="">
					<div class="block-parts">
						<p class="icon-box touming">
							<span></span>
                            <i class="feature-ad-txt">透明</i>
						</p>
					</div>
				</li>
				<li class="">
					<div class="block-parts">
						<div class="icon-box bianjie">
							<span></span>
                            <i class="feature-ad-txt">便捷</i>
						</div>
					</div>
				</li>
			</ul><!-- /标题一 -->
			<div class="detail-box conBox">
				<div class="single-txt tabCon" style="display: none;">
					<span class="intro-txt icon-touming"><h4 class="fea-tit">费用低廉 高度透明</h4>零保单管理费，收取1%初始费用和一定比例的风险保险费，产品最低保证利率为3%</span>
					<span class="arrow-white"></span>
				</div> <!-- /透明 -->
				<div class="single-txt tabCon" style="display: none;">
					<span class="intro-txt icon-bianjie"><h4 class="fea-tit">部分领取 安全便捷</h4>在保险合同有效期内，犹豫期过后可申请部分领取保单账户价值，并且满两年后领取无手续费用，满足资金不时之需</span>
					<span class="arrow-white"></span>
				</div> <!-- /便捷 -->
			</div>
		</div><!-- /特色一 -->
		<div class="feature-list-box">
			<ul class="feature-list clearfix tabTitle">
				<li class="current">
					<div class="block-parts">
						<p class="icon-box liangquan">
							<span></span>
                            <i class="feature-ad-txt">两全</i>
						</p>
					</div>
				</li>
				<li class="">
					<div class="block-parts">
						<p class="icon-box chixu">
							<span></span>
                            <i class="feature-ad-txt">持续</i>
						</p>
					</div>
				</li>
			</ul><!-- /标题二 -->
			<div class="detail-box conBox">
				<div class="single-txt tabCon" style="display: block;">
					<span class="intro-txt icon-liangquan"><h4 class="fea-tit">两全保障 攻守兼备</h4>在保险合同有效期内，可获得不低于100%保单账户价值的身故保障（具体比例依据身故当时保单年度初年龄确定，最高可达160%保单账户价值）；满期还可获得等同于账户价值的满期保险金</span>
					<span class="arrow-white"></span>
				</div> <!-- /两全 -->
				<div class="single-txt tabCon" style="display: none;">
					<span class="intro-txt icon-chixu">本产品采用日复利计息，复利优势明显。若长期持有，第五个保单年度末，您还将获得1%保单账户价值的持续奖金</span>
					<span class="arrow-white"></span>
				</div> <!-- /持续 -->
			</div>
		</div><!-- /特色二 -->
	</section><!-- /产品特色 -->
    <section class="duty-wrap">
		<h2 class="headline title-red-mid-txt">
			<span>保险责任</span>
		</h2>
		<h3 class="item-name icon-sg">身故保险金</h3>
        <p class="item-intro">
        	在本主险合同有效期间内，被保险人身故的，本公司将按被保险人身故当时本主险合同保单账户价值乘以身故当时被保险人保单年度初年龄对应的账户价值比例给付“身故保险金”，本主险合同终止。
    	</p>
		<p class="item-intro">
			被保险人保单年度初年龄，指保单年度第一日被保险人当时的年龄。被保险人保单年度初年龄对应的账户价值比例如下：
		</p>
        <table class="light-red-tbl">
        	<tbody><tr>
            	<th>被保险人保单年度初年龄</th>
                <th>账户价值比例</th>
            </tr>
            <tr>
            	<td>已满18周岁但未满41周岁</td>
                <td>160%</td>
            </tr>
            <tr>
            	<td>已满41周岁但未满61周岁</td>
                <td>140%</td>
            </tr>
            <tr>
            	<td>已满61周岁</td>
                <td>120%</td>
            </tr>
        </tbody></table>
        <h3 class="item-name icon-qm mar-top">满期保险金</h3>
        <p class="item-intro">
        	保险期间届满时，被保险人仍然生存的，本公司按本保险合同保单账户价值给付“满期保险金”，本保险合同终止
        </p>
        <p class="item-intro">
        	退保或部分领取手续费，按保单账户价值或部分领取的保单账户价值，乘以下表所列手续费比例确定：
        </p>
        <p><img src="../../images/abzong/sel/table-670x320.gif" alt=""></p>
        <div class="example-txt">
            <p>
            	产品报备名称：安邦随e乐两全保险（万能型）<br>
            	批复文号：安邦人寿发【2017】333号-9<br>
            	备案编号：(安邦人寿)(备-两全保险）【2017】(主) 034号
            </p>
            <p class="redF mar-t1">
            	风险提示：结算利率超过最低保证利率的部分是不确定的。本资料仅供客户理解产品条款所用，有关产品的说明、解释、承诺或保证，如与产品条款不一致，均以产品条款为准。
            </p>
        </div>
	</section><!-- /保险责任 -->
	<section class="buyFlow-wrap">
		<h2 class="headline title-red-mid-txt"><span>购买流程</span></h2>
		<ul class="buy-flow clearfix">
			<li>
				<p class="buy-step-icon"></p>
				<span class="flow-arrow"></span>
				<p class="buy-step-txt">填写投保信息</p>
			</li>
			<li>
				<p class="buy-step-icon"></p>
				<span class="flow-arrow"></span>
				<p class="buy-step-txt">确认信息</p>
			</li>
			<li>
				<p class="buy-step-icon"></p>
				<span class="flow-arrow"></span>
				<p class="buy-step-txt">支付保费</p>
			</li>
			<li>
				<p class="buy-step-icon"></p>
				<p class="buy-step-txt">投保完成</p>
			</li>
		</ul>
	</section><!-- /购买流程 -->
	<section class="claimFlow-wrap">
		<h2 class="headline title-red-mid-txt"><span>理赔流程</span></h2>
		<ul class="claim-flow">
			<li><i></i>拨打<span class="arial"><a href="tel:95569">95569</a></span>申请理赔</li>
			<li><i></i>协助您递交理赔申请</li>
			<li><i></i>等待公司做核定</li>
			<li><i></i>查收理赔金</li>
		</ul>
		<div class="hotline">本产品由安邦人寿保险股份有限公司承保<br>全国7×24小时客服热线：<span class="red-tel"><a href="tel:95569">95569#3</a></span></div>
	</section><!-- /理赔流程 -->
    
	<div id="question"></div>
	<section class="QA-wrap omitCon2" id="section2">
		<h2 class="headline title-red-mid-txt"><span>常见问题</span></h2>
		<dl>
			<dt>Q：哪些地区可以投保？</dt>
			<dd>
				A：产品销售区域：本产品由安邦人寿保险股份有限公司承保，在北京、上海、广东、深圳、浙江、江苏、天津、河北、河南、山东、吉林、黑龙江、辽宁、湖南、湖北四川、江西、山西、安徽设有分公司。
			</dd>
		</dl>
		<dl>
			<dt>Q：如何追加保费？</dt>
			<dd>
				A：（1）在本保险合同保险期间内，您可以申请并经本公司审核同意后，向本公司交付追加保险费，每次追加保险费不得低于人民币1000元，且为1000元的整数倍。本公司有权调整交纳追加保险费的规定。对于每笔追加保险费，初始费用比例为1%。<br>（2）
           	在保单犹豫期结束日的次日，您可以进入安邦人寿官方微信号，点击“邦保单”—“我的保单”查看我的保单—“保单查询”，在此产品的“保全操作”项中点击“追加保费”按钮进行追加。
        	</dd>
		</dl>
		<dl>
			<dt>Q：保单账户如何结算？</dt>
			<dd>
				A：在保险合同有效期内，保单账户价值每月结算一次，保单账户结算日为每月1日。<br>
            	本公司每月根据国务院保险监督管理机构的有关规定，结合本公司万能账户的实际投资状况，确定上个月的结算利率，并在结算日起6个工作日内公布。结算利率不低于最低保证利率结算利率超过最低保证利率的部分是不确定的。 
	        </dd>
		</dl>
		<dl>
			<dt>Q：投保成功后，如何查询保单？</dt>
			<dd>
				A：（1）下载安邦金融app---首页---保单查询； <br>
            	（2）关注安邦保险微信公众号---微服务---我的保单；<br>
            	（3）关注安邦人寿微信公众号---我的安邦---我的保单---保单查询，或：邦保单---我
		        的保单---保单查询；<br>
		        （4）您可以拨打<a href="tel:95569">95569</a>电话查询保单。
        	</dd>
		</dl>
		<dl>
			<dt>Q：电子保单靠谱么？</dt>
			<dd>A：互联网上销售的本款保险采用电子保单，法律效力等同于纸质保单。</dd>
		</dl>
		<dl>
			<dt>Q：责任免除有哪些？</dt>
			<dd>
            	A：因下列情形之一导致被保险人身故的，本公司不承担给付保险金的责任：<br>
            	（1）投保人对被保险人的故意杀害、故意伤害；<br>
            	（2）被保险人故意犯罪或者抗拒依法采取的刑事强制措施；<br>
            3）被保险人主动吸食或注射毒品；<br>
            （4）被保险人酒后驾驶，无合法有效驾驶证驾驶或驾驶无有效行驶证的机动车；<br>
            （5）战争、军事冲突、暴乱或武装叛乱；<br>
            （6）核爆炸、核辐射或核污染；<br>
            （7）被保险人自本主险合同成立或者合同效力恢复之日起2年内自杀，但被保险人自杀时为无民事行为能力人的除外。<br>
            发生上述第（1）项情形导致被保险人身故的，本主险合同终止，本公司向其他权利人退还本主险合同的现金价值；发生上述其他情形导致被保险人身故的，本主险合同终止，本公司向您退还本主险合同的现金价值。
			</dd>
		</dl>
        <dl>
			<dt>Q：犹豫期及解除合同（退保）</dt>
			<dd>
				A：为了使您充分了解保险合同的保障范围，确定选择了合适的保险金额、交费期限和交费金额，自您签收保险合同次日零时起（我公司电子保单发送日为您的签收日期），有20个自然日的犹豫期。如果您在此期间提出解除保险合同（即退保），需要填写书面申请书，并提供您的有效身份证件，本公司会
			无息退还您所交的保险费自本公司收到您解除保险合同的书面申请时起，保险合同即被解除。对保险合同解除前发生的保险事故本公司不承担保险责任。<br>
            您在犹豫期后申请解除保险合同，请填写解除合同申请书并向本公司提供您的有效身份证件。自本公司收到解除合同申请书时起，保险合同终止。本公司自收到解除合同申请书之日起30日内向您退还本保险合同的现金价值。<br>
            在本主险合同结算日和结算利率公布日期间本公司不受理解除合同的申请。<br>
            您在犹豫期后解除合同会遭受一定损失，合同解除后，本公司不承担任何保险责任。
			</dd>
		</dl>
	</section><!-- /常见问题 -->
	<section class="recommend-wrap clearfix top-bor" style="display: none;">
		<form>
        <div class="clearfix">
			<label class="item-person">推荐人：</label>
			<p class="input-field"><input type="text" id="recommend" placeholder="一体化工号/安邦工号" class="inputxt"></p>
        </div>
		</form>
	</section><!-- /推荐人 -->
	<script type="text/javascript">
        var isRe = 'true';
        if (isRe === 'true')
            $('.recommend-wrap').hide();
    </script>
</article>
<footer class="footer-buy">
	<ul class="clearfix">
		<li class="qq">QQ客服</li>
		<li class="price">价格: 100元起</li>
		<li class="buy-btn" onclick="newcontractsel()">我要购买</li>
	</ul>
</footer>

<script type="text/javascript">
	var channel = 'ABJRYX';
	var loginFlag = '';
	if (channel === 'ABJRYX' && loginFlag === '1'){
		$("#footerForABJRYX").show();
	}else{
		$("#footerForOther").show();
	}
</script>
</body>
</html>