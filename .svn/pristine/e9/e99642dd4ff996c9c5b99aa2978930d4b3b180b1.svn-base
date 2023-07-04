<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>投保信息</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180504">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180227"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180227" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180227" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180227" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20180227"></script>
    <script src=" ../../js/anxin/insuranceInformation.js?v=20180731"></script>
<script type="text/javascript">

 var provinces=[
				{'id':'110000','codeValue':'110000','value':'北京市','parentId':'0'},
				{'id':'120000','codeValue':'120000','value':'天津市','parentId':'0'},
				{'id':'130000','codeValue':'130000','value':'河北省','parentId':'0'},
				{'id':'140000','codeValue':'140000','value':'山西省','parentId':'0'},
				{'id':'150000','codeValue':'150000','value':'内蒙古自治区','parentId':'0'},
				{'id':'210000','codeValue':'210000','value':'辽宁省','parentId':'0'},
				{'id':'220000','codeValue':'220000','value':'吉林省','parentId':'0'},
				{'id':'230000','codeValue':'230000','value':'黑龙江省','parentId':'0'},
				{'id':'310000','codeValue':'310000','value':'上海市','parentId':'0'},
				{'id':'320000','codeValue':'320000','value':'江苏省','parentId':'0'},
				{'id':'330000','codeValue':'330000','value':'浙江省','parentId':'0'},
				{'id':'340000','codeValue':'340000','value':'安徽省','parentId':'0'},
				{'id':'350000','codeValue':'350000','value':'福建省','parentId':'0'},
				{'id':'360000','codeValue':'360000','value':'江西省','parentId':'0'},
				{'id':'370000','codeValue':'370000','value':'山东省','parentId':'0'},
				{'id':'410000','codeValue':'410000','value':'河南省','parentId':'0'},
				{'id':'420000','codeValue':'420000','value':'湖北省','parentId':'0'},
				{'id':'430000','codeValue':'430000','value':'湖南省','parentId':'0'},
				{'id':'440000','codeValue':'440000','value':'广东省','parentId':'0'},
				{'id':'450000','codeValue':'450000','value':'广西壮族自治区','parentId':'0'},
				{'id':'460000','codeValue':'460000','value':'海南省','parentId':'0'},
				{'id':'500000','codeValue':'500000','value':'重庆市','parentId':'0'},
				{'id':'510000','codeValue':'510000','value':'四川省','parentId':'0'},
				{'id':'520000','codeValue':'520000','value':'贵州省','parentId':'0'},
				{'id':'530000','codeValue':'530000','value':'云南省','parentId':'0'},
				{'id':'540000','codeValue':'540000','value':'西藏自治区','parentId':'0'},
				{'id':'610000','codeValue':'610000','value':'陕西省','parentId':'0'},
				{'id':'620000','codeValue':'620000','value':'甘肃省','parentId':'0'},
				{'id':'630000','codeValue':'630000','value':'青海省','parentId':'0'},
				{'id':'640000','codeValue':'640000','value':'宁夏回族自治区','parentId':'0'},
				{'id':'650000','codeValue':'650000','value':'新疆维吾尔自治区','parentId':'0'}
               ]

</script>
    <script>
    
    /* var productCode = '${productCode}';
    var productName = '${productName}';
    var aliascode='${aliascode}'; */
    var socialInsuFlag = '${socialInsuFlag}';
    
        $(function () {
        	
        	/* if(productCode!=null&&productCode!="")
        	{
        		$("#productCode").val(productCode);
        	}
        	
        	if(productName!=null&&productName!="")
        	{
        		$("#productName").val(productName);
        	}
        	
        	if(aliascode!=null&&aliascode!="")
        	{
        		$("#aliascode").val(aliascode);
        	}   */
        	
        	if(socialInsuFlag!=null&&socialInsuFlag!="")
        	{
        		$("#socialInsuFlag").val(socialInsuFlag);
        		$("#socialInsuFlag_dummy").val($("#socialInsuFlag").find("option:selected").text());
        	} 
        	
        	calPrice();
        	
        	var currYear = (new Date()).getFullYear();
            function addDay(dayNumber, date) {
                date = date ? date : new Date();
                var ms = dayNumber * (1000 * 60 * 60 * 24);
                var newDate = new Date(date.getTime() + ms);
                return newDate;
            }
            var birthdayObj = {
                theme: 'android-ics light', //皮肤样式
                display: 'bottom', //显示方式
                rtl:true,
                mode: 'scroller', //日期选择模式
                lang:'zh',
                dateFormat: 'yyyy-mm-dd',
                dateOrder: 'ddmmyy',
                startYear:currYear - 150, //开始年份
                endYear:currYear, //结束年份
                maxDate: addDay(0),
                onSelect:function(){
                	if($(this).attr("id") == "birthday"){
                		if($("#cardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 1){
                    		calPrice();
                    	}
                	}else if($(this).attr("id") == "insuredBirthday"){
                		if($("#insuredCardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 0){
                    		calPrice();
                    	}
                	}
                }
            };
            // 出生日期
            $(".birthdayChoose").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
            $(".insuredBirthdayChoose").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
            var dateObj = {
                theme: 'android-ics light', //皮肤样式
                display: 'bottom', //显示方式
                rtl:true,
                mode: 'scroller', //日期选择模式
                lang:'zh',
                dateFormat: 'yyyy-mm-dd',
                dateOrder: 'ddmmyy',
                startYear:currYear - 80, //开始年份
                endYear:currYear + 30, //结束年份
                minDate: addDay(1)
            };
            // 证件有效期
            $("#idDate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
            $("#insuredIdDate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
            
            var startDateObj = {
                    theme: 'android-ics light', //皮肤样式
                    display: 'bottom', //显示方式
                    rtl:true,
                    mode: 'scroller', //日期选择模式
                    lang:'zh',
                    dateFormat: 'yyyy-mm-dd',
                    dateOrder: 'ddmmyy',
                    startYear:currYear - 80, //开始年份
                    endYear:currYear + 30, //结束年份
                    minDate: addDay($("#earlyDayInt").val()),
                    maxDate: addDay($("#lateDayInt").val())
                };
                // 起保日期
                $("#startTime").scroller('destroy').scroller($.extend({preset : 'date'}, startDateObj));
        });
    </script>
</head>
<body style="">
    <header class="header w100 borTop1 borBot1 pl bgColor">
        <span>安享一生防癌险</span><br/>
        <span>本产品由安心保险有限公司承保</span>
        <img src="../../images/logo/anxin.png" />
    </header>
    <article class="info">
        <form id="formId" name="formName" method="post">
            <input type="text" style="display:none" id="lateDayInt" name="lateDayInt" value="365">
            <input type="text" style="display:none" id="earlyDayInt" name="earlyDayInt" value="1">
            <input type="text" style="display:none" class="personInfo" id="productNo" name="orderProduct.productCode" value="07P002_axys">
            <input type="text" style="display:none" class="personInfo" id="aliasname" value="axys">
            <input type="text" style="display:none" class="personInfo" id="insOrganCode" value="anxin">
            <input type="text" style="display:none" class="personInfo" id="aliascode" value="${aliascode}">
            <input type="text" style="display:none" class="personInfo" id="mainPrice" value="${mainPrice}">
            <input type="text" style="display:none" class="personInfo" id="oldorderNo" value="${orderNo}">
            <input type="text" style="display:none" class="personInfo" id="productCode" value="${productCode}">
            <input type="text" style="display:none" class="personInfo" id="productName" value="${productName}">
            <input type="text" style="display:none" class="personInfo" id="assesserialno" value="${assesserialno}">
            <input type="text" style="display:none" class="personInfo" id="source" value="${source}">
 			<!--投保人信息-->
            <section class="infoList product">
            <p class="ml">投保人信息</p>
            <div class="infoSec pl pr bgColor borTop1 borBot1">
            	<dl class="clearfix borBot1 dlSec" style="display: none;">
				        <dt class="w35 l-float">保险期间</dt>
					    <dd class="w65 l-float txtR hasArrow">
					        <select id = "insuyear" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
								<option value="1Y">1年</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
			    </dl>
		     	<dl class="clearfix borBot1 dlSec"  style="display: none;">
			        <dt class="w35 l-float">保额</dt>
					<dd class="w65 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					    <input id = "amnt" type="text" value = "2000000">
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
              	<dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">姓名</dt>
                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	    <input type="text" class="textfield txtR personInfo" id="policyName" name="applicant.appntName" value="${policyName}" placeholder="请输入投保人姓名">
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                	<dt class="w35 l-float">证件类型</dt>
                	<dd class="w65 l-float txtR hasArrow">
                		<!-- 
                	    <input type="text" id="cardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                	     -->
                	    <select name="applicant.appntIdcardType" id="cardType" class="cardType txtR personInfo  dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
                  	        <option value="120001">身份证</option>
                        </select>
                        <i class="arrow"></i>
                    </dd>
                      <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                    <dt class="w35 l-float">证件号码</dt>
                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	    <input type="text" class="textfield txtR personInfo idNo_compare" id="idNo" name="applicant.appntIdcardNo" value="" placeholder="请输入证件号码">
                    </dd>
                	    <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                	<dt class="w35 l-float">出生日期</dt>
                    <dd class="w65 l-float txtR hasArrow">
                  	<span class="birthday" id="birthdayChoose" style="display: none;">
                  		<input type="text" class="textfield txtR personInfo birthdayChoose" readonly="" id="birthday" value="" placeholder="请选择">
                   		<i class="arrow"></i>
                    </span>
                        <input type="text" class="textfield txtR birthdayReadonly personInfo" id = "birthdayReadonly" readonly="" value="">
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                	<dt class="w35 l-float">性别</dt>
                    <dd class="w65 l-float txtR hasArrow">
                  	    <input type="text" style="display:none" name="applicant.appntSexName" id="applicantSex" value="">
                            <div class="sex" id="sexChoose" style="display: none;">
	                            <!-- 
	                            <input type="text" id="sex_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
	                             -->
	                            <select name="applicant.appntSex" id="sex" class="sex txtR personInfo dw-hsel" tabindex="-1" style="display: none;">
	                    	        <option value="1">男</option>
	                    	        <option value="2" selected="">女</option>
	                            </select>
	                            <i class="arrow"></i>
                            </div>
                        <input type="text" class="textfield txtR sexReadonly personInfo" value="" readonly="">
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                  <dt class="w35 l-float">手机号码</dt>
                  <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	<input type="tel" class="textfield txtR personInfo" id="tel" name="applicant.appntMobile" value="" placeholder="用于接收投保信息">
                  </dd>
                  <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec bottom-0">
                  <dt class="w35 l-float">电子邮箱</dt>
                  <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	<input type="email" class="textfield txtR personInfo" id="email" name="applicant.appntEmail" value="" placeholder="用于接收电子保单">
                  </dd>
                  <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                        <dt class="w35 l-float">职业</dt>
                        <dd class="w65 l-float txtR hasArrow">
                            <select id="appntOccupation3" class="appntOccupation txtR personInfo dw-hsel" tabindex="-1">
                                <option value="">请选择</option>
                                <option value="060201" selected="selected">一般工作人员</option>
                        	</select>
                            <i class="arrow"></i>
                        </dd>
                            <span class="errorMsg"></span>
                </dl>
                </div>
            </section>

<!--被保人信息-->
            <section class="infoList" id="scrollTop">
	            <p class="ml">被保人信息</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl borBot1 dlSec bottom-0">
			            <dt class="w40 l-float">与投保人一致</dt>
			            <dd class="w60 l-float txtR hasArrow">
				            <i id="switch" class="turnOn"></i>
				            <input type="radio" id = 'switchradio' style="display: none;">
							<input type="text" style="display:none" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
			            </dd>
			            <input type="radio" style="display: none;">
						<input type="text" style="display:none" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
		            </dl>
<!--不一致时被保人信息-->
                    <div class="insured" style="display: none;">
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <!-- 
                                <input type="text" id="relation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="relation" name="insuredList[0].relationShip" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
                                    <!-- <option value="00">本人</option>
                                    <option value="601002">子女</option>
                                    <option value="601003">父母</option>
                                    <option value="601004">配偶</option>
                                     -->
                                    <option value="00">本人</option>
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName" name="insuredList[0].insuredName" value="" placeholder="请输入被保人姓名">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">
                            	<!-- 
                                <input type="text" id="insuredCardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="insuredCardType" name="insuredList[0].insuredIdcardType" class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="120001">身份证</option>
                                </select>
                                <i class="arrow"></i> 
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                                <input class="textfield txtR mySelf idNo_compare" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <span class="insuredBirthday" id="insuredBirthdayChoose">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span> 
                                <input type="text" class="textfield txtR insuredBirthdayReadonly personInfo" id="insuredBirthday1" value="" readonly=""> 
                                <input class="textfield txtR mySelf" value="" id="insuredBirthday2" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex" id="insuredSexChoose">
                                    <!-- 
                                    <input type="text" id="insuredSex_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                     -->
                                        <select name="insuredList[0].insuredSex" id="insuredSex" class="sex txtR personInfo dw-hsel" tabindex="-1" style="display: none;">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                                    <input type="text" class="textfield txtR insuredSexReadonly personInfo" id="insuredSex1" value="" readonly="">
                                    <input class="textfield txtR mySelf" id="insuredSex2" value="" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile" name="insuredList[0].insuredMobile" value="" placeholder="请输入手机号码">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec bottom-0">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail" name="insuredList[0].insuredEmail" value="" placeholder="请输入邮箱">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">职业</dt>
	                        <dd class="w65 l-float txtR hasArrow">
	                            <!-- 
	                            <input type="text" id="occupation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(153, 153, 153);">
	                             -->
	                            <select id="occupation" name="insuredList[0].insuredOccupation3" class="occupation txtR personInfo dw-hsel" tabindex="-1">
	                            	<option value="">请选择</option>
	                        		<option value="060201" selected="selected">一般工作人员</option>
	                            </select>
	                            <i class="arrow"></i>
	                        </dd>
                        <span class="errorMsg"></span>
                   	 	</dl>
                    </div>
						<dl class="clearfix borBot1 dlSec" style="display: none;">
							<dt class="w35 l-float">有无社保</dt>
								<dd class="w65 l-float txtR hasArrow">
								<select id = "socialInsuFlag" class="premium txtR iFactor getPrice dw-hsel personInfo" tabindex="-1">
								<option value="Y" selected="selected">有社保</option>
								<option value="N">无社保</option>
								</select>
								<i class="arrow"></i>
								</dd>
							<span class="errorMsg"></span>
						</dl>
                        <!-- <dl class="clearfix infoDl borBot1 dlSec">
        			        <dt class="w35 l-float">
        				        身高<span class="space"></span>(CM)
        			        </dt>
        			        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
        				        <input type="number" class="textfield txtR personInfo" id="height" name="insuredList[0].insuredHeight" value="" placeholder="请输入">
        			        </dd>
        			        <span class="errorMsg"></span>
        	            </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                			<dt class="w35 l-float">
                				体重<span class="space"></span>(KG)
                			</dt>
                			<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                				<input type="number" class="textfield txtR personInfo" id="weight" name="insuredList[0].insuredBodyWeight" value="" placeholder="请输入">
                			</dd>
                			<span class="errorMsg"></span>
                		</dl> -->
                </div>
            </section>
 <!--受益人信息-->
            <section class="infoList">
                <p class="ml">受益人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">受益人</dt>
                        <dd class="w65 l-float txtR">
                            <input type="text" class="textfield txtR personInfo" readonly value="法定收益人" >
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section> 
<!--续缴账户信息-->
           <%--  <section class="infoList  renewalSec" style="display: none;">
                <p class="ml">缴费账户信息</p>
                <span class="tip ml">*为确保缴费成功，请准确填写如下信息</span>
                <div class="infoSec pl pr bgColor borTop1 borBot1  checkRenewal">
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">开户名</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                            <input type="text" class="textfield txtR personInfo" name="renewalBank.accountName"
                             readonly="" id="accountName" placeholder="请输入开户名" value="${accountName}">
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                    <!-- 
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">证件号码</dt>
                        <dd class="w65 l-float txtR">
                            <input type="text" class="textfield txtR personInfo" id="idCardNo" name="bankIdcardNo" readonly="" value="" placeholder="请输入证件号码">
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                     -->
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">开户行</dt>
                        <dd class="w65 l-float txtR hasArrow">
                            <!-- 
                            <input type="text" id="accountBank_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(153, 153, 153);">
                             -->
                            <select name="renewalBank.bankCode" id="accountBank" class="accountBank txtR personInfo dw-hsel" tabindex="-1">
                                <option value="">请选择</option>
                                <option value="0101">工商银行</option>
                                <option value="0102">农业银行</option>
                                <option value="0103">中国银行</option>
                                <option value="0104">中国建设银行</option>
                                <option value="0108">交通银行</option>
                                <option value="0109">中信银行</option>    
                                <option value="0111">华夏银行</option>
                                <option value="0112">民生银行</option>
                                <option value="0113">广发银行</option>
                                <option value="0198">深发/平安银行</option>
                                <option value="0116">兴业银行</option>
                                <option value="0117">浦东发展银行</option>
                            </select>
                            <i class="arrow"></i>
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">银行卡号</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                            <input type="text" class="textfield txtR personInfo" name="renewalBank.accountCode" id="cardNo" placeholder="请输入卡号" value=${cardNo}>
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section>   --%>
			<section class="infoList">
		        <div class="ml whetherRead">
		            <i id="whetherCheck" class="checkBox"></i>
		            <span >我已查看并同意
		            <a href="<%=request.getContextPath()%>/contract/anxin/axys/insurancePolicy.pdf">《投保须知》</a>
		            <a href="<%=request.getContextPath()%>/contract/anxin/axys/insuranceClauses.pdf">《保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/anxin/axys/declarationsConfirm.pdf">《投保声明》</a>
		            <a href="<%=request.getContextPath()%>/contract/anxin/axys/lipeiliucheng.pdf">《理赔流程》</a>
		            <a href="<%=request.getContextPath()%>/contract/common/kehugaozhishu/anxin_customerNotification.pdf">《客户告知书》</a>
		            </span>
		        </div>
		    </section>
        </form>
        <!--投保按钮-->
        <div class="pl bgColor borTop1 borBot1 fixedBox w100" >
            <dl class="clearfix infoDl w100">
	            <dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
	            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
	            	
	            	<input type="text" style="display:none" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}">
	            	 
	            	<span readonly="" class="insurePrice" id="disprice" >${insurePrice}</span><span id = "priceunit">元/年</span>
	            </dt>
				<dd class="w35 l-float">
				    <div class="insureBtn txtC" id="sureToSave">立即投保</div>
				</dd>
            </dl>
        </div>
    </article>
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
    <!--弹窗-->
    <div class="mask">
        <div class="pop repeat">
            <span>失败提示</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
    <div class="forSelfMask">
        <div class="forSelfPop forSelfRepeat">
            <p>是否确认投保？</p>
            <span>说明：根据相关规定，您作为投保人或被保险人购买产品将无法获得平台推广费和推荐奖励。</span>
            <div class="forSelfBtn">
                <a href="javascript:void(0);" class="forSelfUnsure">取消</a>
                <a href="javascript:void(0);" class="forSelfSure">确定</a>
            </div>
        </div>
    </div>
    </article>
</body>

<script type="text/javascript">
$(function(){
	$('#switch').on('click',function(){
		$(this).hasClass('turnOn')?$(this).parents('.dlSec').addClass('bottom-0'):$(this).parents('.dlSec').removeClass('bottom-0')
	})
});
</script> 

</html>