<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>投保信息</title>
    <link rel="stylesheet" href="../../css/hezhong/infos.css?v=20190328">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20190323"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20190323" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20190323" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20190323" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20191216_01"></script>
    <script src=" ../../js/fuxinglhjk/insuranceInformation.js?v=20200824_01"></script>
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
			{'id':'440000','codeValue':'440000','value':'广东省','parentId':'0'} ,
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
		];
	</script>
    <script>
        
    var prem = '${prem}';
    var productplan = '${productplan}';
    var isshaoer = '${isshaoer}';
    var hassocialinsurance = '${hassocialinsurance}';
    
	    $(function () 
        {
	    	if(prem!=null&&prem!="")
        	{
        		$("#prem").val(Number(prem).toFixed(2));
        		$("#sumPrem").val(Number(prem).toFixed(2));
        		$("#insurePrice").html(Number(prem).toFixed(2));
        	}
	    	
	    	if(productplan!=null&&productplan!="")
        	{
        		$("#productplan").val(productplan);
        		$("#productplan_dummy").val($("#productplan").find("option:selected").text());
        	}
	    	
	    	if(isshaoer!=null&&isshaoer!="")
        	{
        		$("#isshaoer").val(isshaoer);
        		$("#isshaoer_dummy").val($("#isshaoer").find("option:selected").text());
        	}
	    	
	    	if(hassocialinsurance!=null&&hassocialinsurance!="")
        	{
        		$("#hassocialinsurance").val(hassocialinsurance);
        		$("#hassocialinsurance_dummy").val($("#hassocialinsurance").find("option:selected").text());
        	}
	    	
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
            
            $("#cvalidate").val(getCvalidateDate());
            $("#enddate").val(getEndDate());
        });
	    
	    function getCvalidateDate()
	    {
	    	var date = new Date();
	    	date.setTime(date.getTime()+24*60*60*1000);
	    	
	        var seperator1 = "-";
	        var year = date.getFullYear();
	        var month = date.getMonth() + 1;
	        var strDate = date.getDate();
	        if (month >= 1 && month <= 9) {
	            month = "0" + month;
	        }
	        if (strDate >= 0 && strDate <= 9) {
	            strDate = "0" + strDate;
	        }
	        var cavlidate = year + seperator1 + month + seperator1 + strDate;
	        return cavlidate;
	    }
	    
	    function getEndDate()
	    {
	    	var date = new Date();
	    	date.setFullYear(date.getFullYear()+1);
	    	
	        var seperator1 = "-";
	        var year = date.getFullYear();
	        var month = date.getMonth() + 1;
	        var strDate = date.getDate();
	        if (month >= 1 && month <= 9) {
	            month = "0" + month;
	        }
	        if (strDate >= 0 && strDate <= 9) {
	            strDate = "0" + strDate;
	        }
	        var enddate = year + seperator1 + month + seperator1 + strDate;
	        return enddate;
	    }
    </script>
</head>
<body style="">
    <header class="header w100 pl bgColor">
        <span>复星联合超越保2020医疗保险</span>
        <br/>
        <span>本产品由复星联合健康保险股份有限公司承保</span>
        <img src="../../images/fuxinglhjk/fuxing_input_logo.png?v=20191216_01" />
    </header>
    
    <article class="info" style="margin-top: 5.2rem;">
        <form id="formId" name="formName" method="post">
            <input type="text" style="display:none" id="lateDayInt" name="lateDayInt" value="365">
            <input type="text" style="display:none" id="earlyDayInt" name="earlyDayInt" value="1">
            
            <input type="text" style="display:none" class="personInfo" id="productNo" value="110084">
            <input type="text" style="display:none" class="personInfo" id="riskcode" value="110084">
            <input type="text" style="display:none" class="personInfo" id="healthno" value="${healthno}">
            
            <input type="text" style="display:none" class="personInfo" id="insOrganCode" value="fuxingjk">
            <input type="text" style="display:none" class="personInfo" id="insorgancode" value="fuxingjk">
            <input type="text" style="display:none" class="personInfo" id="mainPrice" value="0">
            <input type="text" style="display:none" class="personInfo" id="duty01price" value="0">
            <input type="text" style="display:none" class="personInfo" id="duty02price" value="0">
            <input type="text" style="display:none" class="personInfo" id="duty03price" value="0">
            <input type="text" style="display:none" class="personInfo" id="duty04price" value="0">
            <input type="text" style="display:none" class="personInfo" id="duty05price" value="0">
            
            <input type="text" style="display:none" class="personInfo" id="sumPrem" value="0">
            <input type="text" style="display:none" class="personInfo" id="oldorderNo" value="${orderNo}">
			<!--产品投保要素信息-->
            <section class="infoList product">
                <p class="ml">产品投保要素</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
			        <dl class="clearfix borBot1 dlSec">
			            <dt class="w35 l-float">计划类型</dt>
			            <dd class="w60 l-float txtR pr hasArrow">
			                <select id = "productplan" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
								<option value="01">标准版（免赔额1万）</option>
				            </select>
			                <i class="arrow"></i>
						</dd>
		                    <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
			            <dt class="w35 l-float">少儿可选责任</dt>
			            <dd class="w60 l-float txtR pr hasArrow">
			                <select id = "isshaoer" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
								<option value="N">否</option>
								<option value="Y">是</option>
				            </select>
			                <i class="arrow"></i>
						</dd>
		                    <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
			            <dt class="w35 l-float">是否有社保</dt>
			            <dd class="w60 l-float txtR pr hasArrow">
			                <select id = "hassocialinsurance" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
								<option value="Y">有</option>
						        <option value="N">没有</option>
				            </select>
			                <i class="arrow"></i>
						</dd>
		                    <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">起保日期</dt>
	                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  	    <input type="text" class="textfield txtR" id="cvalidate" readonly>
	                    </dd>
	                    <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">终止日期</dt>
	                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  	    <input type="text" class="textfield txtR" id="enddate" readonly>
	                    </dd>
	                    <span class="errorMsg"></span>
			        </dl>
			        
                	<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">保费</dt>
	                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  	    <input type="text" class="textfield txtR" id="prem" readonly value = "${prem}">
	                    </dd>
	                    <span class="errorMsg"></span>
			        </dl>
			    </div>
            </section>   

 <!--投保人信息-->
            <section class="infoList">
            	
            	<p class="ml">投保人信息</p>
            	<div class="infoSec pl pr bgColor borTop1 borBot1">
              	<dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">姓名</dt>
                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	    <input type="text" class="textfield txtR personInfo" id="policyName" name="applicant.appntName" value="${policyName}" placeholder="请输入投保人姓名">
                    </dd>
                    <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">证件类型</dt>
                	<dd class="w60 l-float txtR pr hasArrow">
                		<select name="applicant.appntIdcardType" id="cardType" class="cardType txtR personInfo  dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
                  	        <option value="0">身份证</option>
                        </select>
                        <i class="arrow"></i>
                    </dd>
                      <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec ">
                    <dt class="w35 l-float">证件号码</dt>
                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	    <input type="text" class="textfield txtR personInfo idNo_compare" id="idNo" name="applicant.appntIdcardNo" value="" placeholder="请输入证件号码">
                    </dd>
                	    <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec  " >
                	<dt class="w35 l-float">证件有效期</dt>
                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                    <span class="l-float w60">
	                  	    <input type="text" class="textfield txtR personInfo"  id="idDate" name="applicant.appntIdcardExpireEnd" value="" placeholder="请输入有效期">
                        </span>
	                    <span class="choose">
	                  	    <input type="checkbox" name="applicant.longTermEffective" id="checkbox" class="unCheckBox personInfo" value="off">
	                    </span>
	                    <span class="">
	                  	    <label for="checkbox" class="longTime">长期</label>
	                    </span>
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec yingchang2" style="display: none;">
                	<dt class="w35 l-float">出生日期</dt>
                    <dd class="w65 l-float txtR hasArrow my_left">
                  	<span class="birthday" id="birthdayChoose" style="display: none;">
                  		<input type="text" class="textfield txtR personInfo birthdayChoose" readonly="" id="birthday" value="" placeholder="请选择">
                   		<i class="arrow"></i>
                    </span>
                        <input type="text" class="textfield txtR birthdayReadonly personInfo" id = "birthdayReadonly" readonly="" value="">
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec xingbie" style="display: none;">
                	<dt class="w35 l-float">性别</dt>
                    <dd class="w65 l-float txtR hasArrow my_left">
                  	    <input type="text" style="display:none" name="applicant.appntSexName" id="applicantSex" value="">
                            <div class="sex" id="sexChoose">
	                            <select name="applicant.appntSex" id="sex" class="sex txtR personInfo dw-hsel" tabindex="-1">
	                                <option value="1">男</option>
	                    	        <option value="2">女</option>
	                            </select>
	                            <i class="arrow"></i>
                            </div>
                        <input type="text" class="textfield txtR sexReadonly personInfo" value="" readonly="">
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                
				<dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">税收居民身份</dt>
                	<dd class="w60 l-float txtR pr hasArrow">
                		<select id="onlychinesetax" class="cardType txtR personInfo dw-hsel" tabindex="-1">
                  	        <option value="10">仅为中国大陆税收居民</option>
                  	        <option value="20">仅为非居民</option>
                  	        <option value="30">中国大陆及其他辖区税收居民</option>
                        </select>
                        <i class="arrow"></i>
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
                <dl class="clearfix infoDl borBot1 dlSec">
                  <dt class="w35 l-float">电子邮箱</dt>
                  <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	<input type="email" class="textfield txtR personInfo" id="email" name="applicant.appntEmail" value="" placeholder="用于接收电子保单">
                  </dd>
                  <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">通讯地址</dt>
                    <dd class="w60 l-float txtR pr hasArrow">
                  	<input type="text" style="display:none" name="" id="" value="3">
                    <input type="text" style="display:none" class="personInfo" id="appntProvince" name="applicant.appntProvince" value="">
                    <input type="text" style="display:none" class="personInfo" id="appntCity" name="applicant.appntCity" value="">
                    <input type="text" style="display:none" class="personInfo" id="appntCounty" name="applicant.appntCounty" value="">
                    <input type="text" class="chosen txtR pr" readonly="" placeholder="请选择" id="appntArea" value="">
                    <i class="arrow"></i>
                    </dd>
                    <span class="errorMsg"></span>
                 </dl>
                 <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">详细地址</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                            <input type="text" class="textfield txtR personInfo" id="address" name="applicant.appntAddress" value="" placeholder="请具体至门牌号">
                        </dd>
                        <span class="errorMsg"></span>
                 </dl>
                 <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">邮政编码</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                            <input type="number" class="textfield txtR personInfo" id="postalCode" name="applicant.appntZipCode" value="" placeholder="请输入邮编">
                        </dd>
                        <span class="errorMsg"></span>
                 </dl>
                </div>
            </section>

<!--被保人信息-->
            <section class="infoList" id="scrollTop">
	            <p class="ml">被保人信息</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl dlSec">
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
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <!-- 投保人是被保险人的 -->
                            <dd class="w60 l-float txtR pr hasArrow">
                                <!-- 
                                <input type="text" id="relation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="relation" name="insuredList[0].relationShip" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
                                    <option value="00">本人</option>
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName" name="insuredList[0].insuredName" value="" placeholder="请输入被保人姓名">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w60 l-float txtR pr hasArrow">
                            	<select id="insuredCardType" name="insuredList[0].insuredIdcardType" class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0">身份证</option>
                                    <option value="4">户口本</option>
                                    <option value="7">出生证</option>
                                </select>
                                <i class="arrow"></i> 
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                                <input class="textfield txtR mySelf idNo_compare" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borTop1 dlSec ">
                            <dt class="w35 l-float">证件有效期</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <span class="l-float w60"> 
                                    <input type="text" class="textfield txtR personInfo" readonly="" id="insuredIdDate" name="insuredList[0].insuredIdcardExpireEnd" value="" placeholder="请输入有效期">
                                </span>
                                <span class="choose">
                                    <input type="checkbox" name="insuredList[0].longTermEffective" id="insuredCheckbox" class="unCheckBox personInfo" value="off">
                                </span>
                                <span class="">
                                    <label for="checkbox" class="longTime">长期</label>
                                </span>
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borTop1 dlSec yingchang4" style="display: none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float txtR hasArrow my_left">
                                <span class="insuredBirthday" id="insuredBirthdayChoose">
                                    <input type="text" class="textfield txtR personInfo getPrice insuredBirthdayChoose" readonly="" id="insuredBirthday" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span> 
                                <input type="text" class="textfield txtR insuredBirthdayReadonly personInfo" id="insuredBirthday1" value="" readonly=""> 
                                <input class="textfield txtR mySelf" value="" id="insuredBirthday2" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec xingbie2" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w60 l-float txtR pr hasArrow my_left">
                                <div class="insuredSex" id="insuredSexChoose">
                                        <select name="insuredList[0].insuredSex" id="insuredSex" class="sex txtR getPrice personInfo dw-hsel" tabindex="-1" >
                                            <option value="1">男</option>
                                            <option value="2">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                                    <input type="text" class="textfield txtR insuredSexReadonly personInfo" id="insuredSex1" value="" readonly="">
                                    <input class="textfield txtR mySelf" id="insuredSex2" value="" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile" name="insuredList[0].insuredMobile" value="" placeholder="请输入手机号码">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail" name="insuredList[0].insuredEmail" value="" placeholder="请输入邮箱">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w60 l-float txtR pr hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty" value=""> 
                                <input type="text" style = "width:100%" class="chosen txtR pr" readonly="" placeholder="请选择" id="insuredArea" value="">
                                <i class="arrow"></i> <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress" name="insuredList[0].insuredAddress" value="" placeholder="请具体至门牌号">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borTop1 dlSec" style="display: none;">
                            <dt class="w35 l-float"></dt>
                            <dd class="w65 l-float txtR hasArrow my_left">                                
                        </dl>
                            
                    </div>
                    
                    <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业大类</dt>
	                	<dd class="w60 l-float txtR pr hasArrow">
	                		<select id="onelevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                			<option value="">请选择</option>
	                			<option value='00'>一般职业</option>
								<option value='01'>农牧业</option>
								<option value='02'>渔业</option>
								<option value='03'>木材森林业</option>
								<option value='04'>矿业采石业</option>
								<option value='05'>交通运输业</option>
								<option value='06'>餐旅业</option>
								<option value='07'>建筑工程业</option>
								<option value='08'>制造业</option>
								<option value='09'>新闻出版广告业</option>
								<option value='10'>卫生保健</option>
								<option value='11'>影视娱乐业</option>
								<option value='12'>科教文化</option>
								<option value='13'>宗教</option>
								<option value='14'>公共事业</option>
								<option value='15'>商业</option>
								<option value='16'>金融保险业</option>
								<option value='17'>服务业</option>
								<option value='18'>家庭管理</option>
								<option value='19'>治安人员、军人</option>
								<option value='20'>体育</option>
								<option value='21'>其他</option>                			
	                		</select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
                    
                    <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业小类</dt>
	                	<dd class="w60 l-float txtR pr hasArrow">
	                		<select id="twolevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="">请选择</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业分类</dt>
	                	<dd class="w60 l-float txtR pr hasArrow">
	                		<select id="occupation" name="insuredList[0].insuredOccupation3" class="occupation txtR personInfo dw-hsel" tabindex="-1">
	                  	        <option value="">请选择</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        
                    <dl class="clearfix infoDl borBot1 dlSec">
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
               		 </dl>
                </div>
            </section>
            
            <section class="infoList">
                <p class="ml">产品销售区域</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl borBot1 dlSec" style="padding-right:0.75rem;">
                        <dt class="w95 l-float">产品销售区域：广东省、四川省、江苏省、北京市、上海市辖区</dt>
                        <dd class="w5 l-float txtR">
                            <input type="text" class="textfield txtR personInfo" readonly value="" >
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section> 
            
 <!--受益人信息-->
           <section class="infoList" style="display: none;">
                <p class="ml">受益人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl borBot1 dlSec" style="padding-right:0.75rem;">
                        <dt class="w35 l-float">受益人</dt>
                        <dd class="w65 l-float txtR">
                            <input type="text" class="textfield txtR personInfo" readonly value="法定受益人" >
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section> 
<!--续缴账户信息-->
            <section class="infoList  renewalSec">
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
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">开户行</dt>
                        <dd class="w60 l-float txtR pr hasArrow">
                            <select name="renewalBank.bankCode" id="accountBank" class="accountBank txtR personInfo dw-hsel" tabindex="-1">
                                <option value="">请选择</option>
                                <option value="9001">工商银行</option>
								<option value="9003">民生银行</option>
								<option value="9004">中信银行</option>
								<option value="9006">中国银行</option>
								<option value="9007">交通银行</option>
								<option value="9008">建设银行</option>
								<option value="9010">农业银行</option>
								<option value="9011">浦发银行</option>
								<option value="9013">光大银行</option>
								<option value="9015">邮储银行</option>
								<option value="9020">广发银行</option>
								<option value="9021">上海银行</option>
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
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">是否连续续保</dt>
                        <dd class="w60 l-float txtR pr hasArrow">
                            <select id="autopayflag" class="txtR personInfo dw-hsel" tabindex="-1">
                                <option value="Y">是</option>
								<option value="N">否</option>
                            </select>
                            <i class="arrow"></i>
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section>  
			<section class="infoList">
		        <div class="ml whetherRead">
		            <i id="whetherCheck" class="checkBox"></i>
		            <span >我已查看并同意
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-tk.pdf">《超越保-保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-tbxz.pdf">《投保须知》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-tbts.pdf" >《投保提示书》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-zrmc.pdf" >《责任免除等重要事项说明书》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-zdxbxz.pdf" >《自动续保须知》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-gwjob.pdf" >《高危职业》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/tax.pdf" >《中国税收居民声明》</a>
		            <a href="<%=request.getContextPath()%>/contract/fuxinglhjk/110084/110084-kkzqs.pdf" >《扣款知情书》</a>
		            </span>
		        </div>
		    </section>
        </form>
        <!--投保按钮-->
        <div class="pl bgColor fixedBox w100">
            <dl class="clearfix infoDl w100">
				<dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
	            	<%-- 保费：<input type="text" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}"> --%>
	            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				    <span readonly="" class="insurePrice" id="insurePrice" >${insurePrice}</span><span id = "priceunit">元/年</span>
	            </dt>
				<dd class="w35 r-float">
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
</html>