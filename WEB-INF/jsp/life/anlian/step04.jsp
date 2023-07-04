<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>确认并支付</title>
    <!-- 
    <link rel="icon" href="https://www.dahuobaoxian.com/order/shopping/images/favicon.ico">
     -->
    <link rel="stylesheet" href="../../css/hengqin/payment.css?v=180504">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180504"></script>
    <script src="../../js/anlian/payment.js?v=180413"></script>
</head>
<style>
	.my_img{
		width: 22%;
    /* display: block; */
    margin-top: 0.3rem;
	}
</style>
<body style="">
    <header class="header bgColor">
        <h3 class="pl pr">${riskname}</h3>
        
        <div class="headerDetails pl pr  w100">
            <dl class="insureDetails">
            	<span class="headerLeft">投保单号：${proposalprtno}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">投保人：${appntname}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft" id ="insudays">保险期限：${insuyear}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">应缴保费：${sumprem} 元</span><span class="headerRight"></span>
            </dl>
        </div>
    </header>
    <div class="order txtC bgColor">
        <span class="hideOrder">显示订单详情 </span>
    </div>
    <article class="info">
        <!--投保人信息-->
	    <section class="pl pr bgColor">
	        <p class="secTitle">投保人信息</p>
	        <div class="orderDetails w100">
	            <dl>
	                <span class="orderLeft">姓名：${appntname}</span><span class="orderRight"></span>
	            </dl>
                <dl>
                    <span class="orderLeft">性别：${appntsex}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">生日：${appntbirthday}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件类型：${appntidtype}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${appntidno}</span><span class="orderRight"></span>
                </dl>
	            <dl>
                    <span class="orderLeft">邮箱：${appntemail}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">手机：${appntmobile}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">地址：${appntaddress}</span><span class="orderRight"></span>
                </dl>
            </div>
	    </section>
	    
          <!--被保人信息-->
        <section class="pl pr pt bgColor">
            <p class="secTitle">被保人信息</p>
            <div class="orderDetails w100">
            <c:forEach items="${tinsList}" var="insList" varStatus = "status">
                <dl>
                    <span class="orderLeft">姓名：${insList.name}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">性别：${insList.sex}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">生日：${insList.birthday}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件类型：${insList.idtype}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${insList.idno}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">手机：${insList.mobile}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">地址：${insList.address}</span>
                </dl>
                <c:if test="${status.count!=fn:length(tinsList)}">
                <br>
                </c:if>
           	</c:forEach>
            </div>
        </section>
	    
        <!--其他信息-->
        <section class="pl pr pt bgColor">
            <p class="secTitle">其他信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft policyType">保单类型：</span><span class="orderRight">电子保单(理赔时只需要提供身份证即可)</span>
                </dl>
            </div>
        </section>
    </article>

        <!--支付方式-->
    <section class="pt borBot1 bgColor">
	    <form id="payTypeForm" action="" method="post">
	        <input type="hidden" name="orderNo" id="orderNo" value=${orderNo}>
	        <p class="pl borTop1 payTitle">支付方式</p>
	        <div class="pl pr borTop1 borBot1 largePay">
	            <dl class="clearfix infoDl borBot1 w100 depositCard payMethod">
	                <dt class="w60 l-float"><span class="payicon nocard"></span>储蓄卡支付</dt>
	                <dd class="w40 r-float choose">
	                </dd>
	            </dl>
	        </div>
		</form>
    </section>

    <!--勾选同意-->
     <section class="infoList">
        <div class="ml whetherRead pr">
            <i id="whetherCheck" class="checkBox whetherCheck" ></i>
            <span syle="display: inline-block;"><img src="../../images/anlian/weixing.png" class="my_img"></span>
        </div>
    </section> 
    
     <form hidden="" id="anlianPayForm" action="<%=request.getContextPath()%>/life/anlian/contractpay_save.do" method="post">
            <input type="hidden" name="policyRef" value=${contno}>
            <input hidden="" name="paymodel" id="paymodel" value="wxpay">
             <input type="hidden" name="orderNo" id="orderNo" value=${orderNo}>
            <Input type="submit" value="Submit"/>
    </form>
    
    <%--  <section class="infoList">
        <div class="ml whetherRead pr">
            <i id="whetherCheck" class="unCheckBox whetherCheck"></i>
            <span>我已认真阅读
				<a href="<%=request.getContextPath()%>/contract/ab/common/payment.html">《扣款知情同意书》</a>并同意上述协议规定。
			</span>
        </div>
    </section> --%>

    <!--支付按钮-->
    <div class="pl bgColor fixedBox w100 hq-productBottom">
		<dl class="clearfix  w100">
			<dt class="w65 l-float font16"
				style="padding-left: 2.3rem; text-align: center; position: relative; box-sizing: border-box;">
				<p class="kf_p">
				<input hidden="" name="policyRef" id="policyRef" value=${contno}> 
				<input hidden="" name="paymodel" id="paymodel" value="wxpay"> 
					<img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;">
				</p>
				<span class="insurePrice" id="insurePrice" style="color: #333333">${sumprem}<span>
			</dt>
			<dd class="w35 r-float">
				<div class="insureBtn txtC">立即支付</div>
			</dd>
		</dl>
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
	<div class="payLoading">
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
        <div class="sk-text">处理中...</div>
	</div>
    <!--弹窗-->
    <div class="mask">
        <div class="pop repeat">
            <span>对不起，您的核保未通过XXX</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
   <div class="cover" id="declareCover">
        <div class="declareBox">
            <div class="closeBtn"></div>
            	<div class="declareContent declare_26" style="display:none;">
	            	<h2>投保须知</h2>
            		<div class="declareText">
		            	<p>1.本电子投保单是保险合同的重要组成部分，投保单中相关内容须由投保人与被保险人本人如实告知并确认；被保险人为未成年人时，应由其监护人如实告知并确认。当您（投保人）收到保险单时，请再次确认保险合同内容是否属实。</p>
	                    <p>2.请您详细阅读所投保险种的相关保险条款，特别提请您注意保险责任、责任免除、犹豫期、保险合同的生效、中止及终止、解除等条款内容，还要了解保险期间、续保、退保、等待期等内容。</p>
	                    <p>3.以死亡为给付保险金条件的合同，未经被保险人书面同意并认可保险金额的，合同无效。父母为其未成年子女投保的人身保险不受此限制。</p>
	                    <p>4.根据国务院保险监督管理机构的规定：父母为其未成年子女投保的人身保险，在被保险人成年之前，各保险合同约定的被保险人死亡给付的保险金额总和、被保险人死亡时各保险公司实际给付的保险金总和应符合中国保监会的有关规定。请您仔细计算并如实填写被保险人可投保的身故责任保险金额，以免在申请给付身故保险金时影响您和受益人的合法权益。</p>
	                    <p>5.请您根据自身财务状况，选择合适的交费期限和交费金额，如果无法持续交纳保险费可能导致合同效力中止或保险合同解除。</p>
	                    <p>6.我公司采集客户信息特别是联系电话和联系地址的用途，包括但不限于计算保费、核保、寄送保单和客户回访等方面。请您务必填写真实联系方式，确保重要信息能得到及时通知。</p>
	                    <p>7.为了维护您的合法权益，请您务必准确填写本投保单列示的各项信息，包括投保人、被保险人和指定受益人的姓名、性别、出生日期、身份证件或身份证明文件的类别、号码、职业，以及投保人的联系电话、联系地址和被保险人与投保人的关系等。如上述信息发生缺失或错误，应补充或更正，否则我公司无法受理您的投保申请。如您提供的客户信息不真实、不完整，将有可能无法有效获得我公司提供的服务，甚至导致保险合同的解除。</p>
	                    <p>8.我公司承诺：未经客户同意，不会将客户信息用于我公司和第三方机构的销售活动。</p>
	                    <p>9.请您注意一切口头的与本投保单各事项及保险条款内容不符的说明、承诺或解释，均属无效。</p>
	                    <p>10.保险合同自我公司同意承保、收取首期保险费并签发保险单次日零时起开始生效，具体生效日期以保险单载明的日期为准。</p>
	                    <p>11.在您成功支付保费并且我们审核您的投保信息无误同意承保之后，我们将在投保成功提示界面返回给您电子保单信息，并将您的电子保险合同发送到您在投保时预留的电子邮箱，并以短信的形式通知到您，请注意查收。如有疑问，请您及时致电95569与我们联系。</p>
	                    <p>12.保险在承保时仅提供电子合同，若您需要纸质保单，可通过我公司柜面申请保全变更，具体请咨询我公司客服电话95569。</p>
	           		</div>
		        </div>
         </div>
     </div>
</body>
<%@ include file="/WEB-INF/common/insure_include.jsp"%>
<script>

var sumprem = '${sumprem}';

$(function () 
{
	$("#insurePrice").html(Number(sumprem).toFixed(2)+'<span style="font-size:0.65rem">元</span>');	
})
</script>
</html>