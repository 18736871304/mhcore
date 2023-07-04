<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>保单详情</title>
    <!-- 
    <link rel="icon" href="https://www.dahuobaoxian.com/order/shopping/images/favicon.ico">
     -->
    <link rel="stylesheet" href="../../css/anbang/payment.css?v=180504">
    <script src="../../js/anbang/jquery-1.10.1.min.js?v=180504"></script>
    <script src="../../js/anbang/payment.js?v=180504"></script>
</head>
<body style="">
    <header class="header borTop1 pl pr bgColor">
        <h3 class="">${riskname}</h3>
        <c:if test="${state=='00'||state=='01'||state=='10'||state=='20'||state=='31'}">
        
        </c:if>
        <div class="headerDetails w100">
        	<input type="hidden" name="orderNo" id="orderNo" value=${orderNo}>
            <dl class="insureDetails">
            	<span class="headerLeft">保单号：${contno}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">投保人：${appntname}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft">投保额度：${amnt}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft">保险期限：${insuyear}</span><span class="headerRight"></span>	
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft">缴费年期：${payendyear}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft">附加豁免保费轻症疾病保险：${huomian}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">应缴费用：${sumprem} 元</span><span class="headerRight"></span>
            </dl>
        </div>
    </header>
    <article class="infodetail">
        <!--保障责任-->
        <section class="pl pr pt bgColor">
            <p class="borBot1 secTitle">保障责任</p>
            <div class="orderDetails w100">
            	<dl>
	                <span class="orderLeft">轻症疾病保险金：</span><span class="orderRight">${amnt_20}</span>
	            </dl>
	            <c:if test="${riskcode=='2140142'||riskcode=='2140152'}">
                <dl>
	                <span class="orderLeft">癌症保险金：</span><span class="orderRight">${amnt_200}</span>
	            </dl>
	            </c:if>
                <c:if test="${riskcode=='2140142'||riskcode=='2140152'}">
                <dl>
	                <span class="orderLeft">特定心脑血管疾病保险金：</span><span class="orderRight">${amnt_200}</span>
	            </dl>
	            </c:if>
	            <c:if test="${riskcode=='2140142'||riskcode=='2140152'}">
                <dl>
	                <span class="orderLeft">护理关爱保险金：</span><span class="orderRight">${amnt}</span>
	            </dl>
	            </c:if>
	            <c:if test="${riskcode=='2140142'||riskcode=='2140152'}">
                <dl>
	                <span class="orderLeft">全残保险金：</span><span class="orderRight">${amnt}</span>
	            </dl>
	            </c:if>
                <dl>
	                <span class="orderLeft">身故保险金：</span><span class="orderRight">${amnt}</span>
	            </dl>
                <dl>
	                <span class="orderLeft">重大疾病保险金：</span><span class="orderRight">${amnt}</span>
	            </dl>
	            <c:if test="${riskcode=='2140242'||riskcode=='2140252'}">
	            <dl>
	                <span class="orderLeft">长期护理保费豁免：</span><span class="orderRight">${addamnt}</span>
	            </dl> 
	            </c:if>
                <dl>
	                <span class="orderLeft">轻症疾病保费豁免：</span><span class="orderRight">${addamnt}</span>
	            </dl>    
            </div>
        </section>
        <!--投保人信息-->
	    <section class="pl pr pt bgColor">
	        <p class="borBot1 secTitle">投保人信息</p>
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
                    <span class="orderLeft">证件类型：身份证</span><span class="orderRight"></span>
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
	            <dl>
                    <span class="orderLeft">职业：${appntjobcode}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">邮编：${zipcode}</span><span class="orderRight"></span>
                </dl>
            </div>
	    </section>
	    
        <!--被保人信息-->
        <section class="pl pr pt bgColor">
            <p class="borBot1 secTitle">被保人信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft">姓名：${insuame}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">性别：${insusex}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">生日：${insubirthday}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件类型：身份证</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${insuidno}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">邮箱：${insuemail}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">手机：${insumobile}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">地址：${insuaddress}</span>
                    <span class="orderRight">
                    </span>
                </dl>
                <dl>
                    <span class="orderLeft">职业：${insujobcode}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">邮编：${insuzipcode}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">身高：${height} CM</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">体重：${weight} KG</span><span class="orderRight"></span>
                </dl>
            </div>
        </section>
	    
        <!--其他信息-->
        <section class="pl pr pt bgColor">
            <p class="borBot1 secTitle">其他信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft policyType">保单类型：</span><span class="orderRight">电子保单(理赔时只需要提供身份证即可)</span>
                </dl>
            </div>
        </section>
    </article>
</body>
</html>