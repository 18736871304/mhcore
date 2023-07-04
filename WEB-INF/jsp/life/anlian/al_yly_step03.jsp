<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>投保信息</title>
    <link rel="stylesheet" href="../../css/hezhong/infos.css?v=20190328">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180522"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180522" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180522" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180522" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20180522"></script>
    <script src=" ../../js/anlian/insuranceInformation.js?v=20190328"></script>
<script type="text/javascript">
var num=0;
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
    var amnt = '${amnt}';
    var insuDay = '${insuDay}';
        $(function () {
        	
        	if(amnt!=null&&amnt!="")
        	{
        		console.log(amnt)
        		$("#amnt").val(amnt);
        		$("#amnt_dummy").val($("#amnt").find("option:selected").text());
        		$("#bz_amnt").val($("#amnt").find("option:selected").text());
        		
        		$("#insuDay").val(insuDay);
        		$("#insuDay_dummy").val($("#insuDay").find("option:selected").text());
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
                   onSelect:function(){}
               };
               // 出生日期
               $(".birthdayChoose").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
               $(".insuredBirthdayChoose").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
           
            var startDateObj = {
                    theme: 'android-ics light', //皮肤样式
                    display: 'bottom', //显示方式
                    rtl:true,
                    mode: 'scroller', //日期选择模式
                    lang:'zh',
                    dateFormat: 'yyyy-mm-dd',
                    dateOrder: 'ddmmyy',
                    startYear:currYear, //开始年份
                    endYear:currYear + 1, //结束年份
                    minDate: addDay($("#earlyDayInt").val()),
                    maxDate: addDay($("#lateDayInt").val())
                };
                // 起保日期
                $("#startTime").scroller('destroy').scroller($.extend({preset : 'date'}, startDateObj));
                $("#insBeginDate").scroller('destroy').scroller($.extend({preset : 'date'}, startDateObj));
        });
    </script>
    <style type="text/css">
    	.backBg{
			  /* background: rgba(255,255,255,.0); */ 
			  	background: red;
			    width: 100%;
			    height: 100%;
			    position: fixed;
			    top: 0;
			    left: 0;
			    display: none;
			}
    	.ozyshow {
  		       margin-left: 0.2rem;
			   border-bottom: 1px dashed #dedede;
			   overflow: hidden;
			   color: #a2a2a2;
			   line-height: 0.8rem;
			   padding-right: 0.3rem;
			   width: 230px;
			   height: 25px;
	      }
	     .hide{display:none !important}
	     .newxian {
	     	      margin-top: 3rem;
	     }
	     .dingwei {
	     	    width: 28%;
			  
	     }
	     .shanchu{
	     	font-size: 0.9rem;
		    text-align: center;
		    background: #fff;
		    line-height: 2.1rem;
	     }
	     /* .my_clearfix:after{
		     content:".";display:block;
		     height:0;clear: both;
		     visibility:hidden;
	     }
		.my_clearfix{
			*zoom:1;
		} */
			.fl{float:left;}
			.fr{float:right;}	
		.tianjia{
			width: 28%;		   
		    display: inline-block;
			font-size: 0.9rem;
		    text-align: center;
		    background: #fff;
		    line-height: 2.1rem;
		    position: absolute;
		    bottom: 9.3rem;
		    right: 0px;
		    display: block;
		}
		
		.whetherRead1{
			height: 3rem;
    		position: relative;
		}
	
		
		.whetherRead1 span {
		    padding-left: 1.6rem;
		    font-size: 0.625rem;
		    position: relative;
		}
		.whetherRead1 span a {
		    color: #dc220d;
		}
		.whetherRead1 .checkBox {
		    width: 1.1rem;
		    height: 1.1rem;
		    display: inline-block;
		    background: url(../../images/anbang/checked.png);
		    background-size: 100%;
		    -webkit-background-size: 100%;
		    position: absolute; 
		        top: 0.2rem !important;
		    right: 0.425rem;
		}
    </style>
</head>
<body style="">
    <header class="header w100 borTop1 borBot1 pl bgColor">
        <span>碧海蓝天境外邮轮旅行险</span><br/>
        <span>本产品由安联保险有限公司承保</span>
        <img src="../../images/logo/anlian.png" />
    </header>
    <article class="info">
        <form id="formId" name="formName" method="post" style="position: relative;">
            <input type="text" style="display:none" id="lateDayInt" name="lateDayInt" value="365">
            <input type="text" style="display:none" id="earlyDayInt" name="earlyDayInt" value="1">
            <input type="text" style="display:none" class="personInfo" id="productNo" name="orderProduct.productCode" value=${productNo }>
            <input type="text" style="display:none" class="personInfo" id="aliasname" value="lnrywx">
            <input type="text" style="display:none" class="personInfo" id="insOrganCode" value="anxin">
            <%-- <input type="text" style="display:none" class="personInfo" id="aliascode" value="${aliascode}"> --%>
            <input type="text" style="display:none" class="personInfo" id="mainPrice" value="${insurePrice}">
            <%-- <input type="text" style="display:none" class="personInfo" id="oldorderNo" value="${orderNo}">
            <input type="text" style="display:none" class="personInfo" id="productCode" value="${productCode}">
            <input type="text" style="display:none" class="personInfo" id="productName" value="${productName}">
            <input type="text" style="display:none" class="personInfo" id="assesserialno" value="${assesserialno}"> --%>
            
            <section class="infoList product">
        	<p class="ml">产品投保要素</p>
            <div class="infoSec pl pr bgColor borTop1 borBot1">
            
             <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">起保日期</dt>
                    <dd class="w65 l-float txtR pr hasArrow" style="box-sizing: border-box;">
	                    <span class="l-float w60">
	                  	    <input type="text" class="textfield txtR personInfo iFactor  " readonly="" id="insBeginDate"  value="" 
	                  	    placeholder="请选择">
                        </span>
                        <i class="arrow"></i>
                    </dd>
                        <span class="errorMsg"></span>
                </dl>
                
                 <!-- <dl class="clearfix infoDl borBot1 dlSec" >
			        <dt class="w35 l-float">终保日期</dt>
					<dd class="w65 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					    <input class="textfield txtR personInfo" id = "insEndDate" type="text" value = "" readonly="">
					</dd>
			        <span class="errorMsg"></span>
		        </dl> -->
		         <input class="textfield txtR personInfo" id = "insEndDate" type="text" value = "" hidden="">
		         
			    <dl class="clearfix borBot1 dlSec" >
				        <dt class="w35 l-float">保障计划</dt>
					    <dd class="w65 l-float txtR hasArrow">
					        <select id = "amnt" class="premium txtR iFactor getPrice dw-hsel getAmntDesc" tabindex="-1" >
								<option value="333000">基本计划</option>
								<option value="222000">全面计划</option>
								<option value="111000">尊贵计划</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
			    </dl>
			    <dl class="clearfix borBot1 dlSec" >
				        <dt class="w35 l-float">保障期限</dt>
					    <dd class="w65 l-float txtR hasArrow">
					        <select id = "insuDay" class="premium txtR iFactor getPrice dw-hsel getAmntDesc" tabindex="-1" >
								<option value="35">35天</option>
								<option value="34">34天</option>
								<option value="33">33天</option>
								<option value="32">32天</option>
								<option value="31">31天</option>
								<option value="30">30天</option>
								<option value="29">29天</option>
								<option value="28">28天</option>
								<option value="27">27天</option>
								<option value="26">26天</option>
								<option value="25">25天</option>
								<option value="24">24天</option>
								<option value="23">23天</option>
								<option value="22">22天</option>
								<option value="21">21天</option>
								<option value="20">20天</option>
								<option value="19">19天</option>
								<option value="18">18天</option>
								<option value="17">17天</option>
								<option value="14">14天</option>
								<option value="10">10天</option>
								<option value="7">7天</option>
								<option value="5">5天</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
			    </dl>
			   <!--  <div id="plan1amnt"> -->
			    <dl class="clearfix infoDl borBot1 dlSec" >
			        <dt class="w35 l-float">保障责任</dt>
					<dd class="w65 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					    <input class="textfield txtR personInfo" id = "bz_amnt" type="text" value = "基本计划" readonly="">
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
		        </div>
		    <!-- </div> -->
			</section>
		    <!--投保人信息-->
           <section class="infoList product">
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
                	<dd class="w65 l-float txtR hasArrow">
                		<!-- 
                	    <input type="text" id="cardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                	     -->
                	    <select name="applicant.appntIdcardType" id="cardType" class="cardType txtR personInfo  dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
                  	        <option value="0" selected="selected">身份证</option>
                            <option value="1">护照</option>
                            <option value="8">其他</option>
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
                <dl class="clearfix infoDl borBot1 dlSec yingchang2" style="display: none;">
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
                <dl class="clearfix infoDl borBot1 dlSec xingbie" style="display: none;">
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
                <dl class="clearfix infoDl borBot1 dlSec">
                  <dt class="w35 l-float">电子邮箱</dt>
                  <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                  	<input type="email" class="textfield txtR personInfo" id="email" name="applicant.appntEmail" value="" placeholder="用于接收电子保单">
                  </dd>
                  <span class="errorMsg"></span>
                </dl>
                 <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">通讯地址</dt>
                    <dd class="w65 l-float txtR hasArrow">
                  	<input type="hidden" name="" id="" value="3">
                    <input type="hidden" class="personInfo" id="appntProvince" name="applicant.appntProvince" value="">
                    <input type="hidden" class="personInfo" id="appntCity" name="applicant.appntCity" value="">
                    <input type="hidden" class="personInfo" id="appntCounty" name="applicant.appntCounty" value="">
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
             <section class="infoList my_clearfix" id="scrollTop">
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
                                    <option value="00">本人</option>
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                    <option value="06">其他</option>
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
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">
                            	<!-- 
                                <input type="text" id="insuredCardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="insuredCardType" name="insuredList[0].insuredIdcardType" class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
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
                        <dl class="clearfix infoDl borBot1 dlSec yingchang4" style="display: none;">
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
                        <dl class="clearfix infoDl borBot1 dlSec xingbie2" style="display: none;">
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
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail" name="insuredList[0].insuredEmail" value="" placeholder="请输入邮箱">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty" value=""> 
                                <input type="text" style = "width:100%" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea" value="">
                                <i class="arrow"></i> <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress" name="insuredList[0].insuredAddress" value="" placeholder="请具体至门牌号">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                    </div>
                </div>
            </section>
            
             <!--被保人信息1-->
            <section class="infoList newxian hide canping my_clearfix yanzheng1" id="scrollTop">
	            <p class="ml">被保人信息一</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation1" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName1" value="" placeholder="请输入被保人姓名">
                                <!-- <input class="textfield txtR mySelf" readonly=""> -->
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">
                               <!--  <input type="text" id="insuredCardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">   -->                              
                                <select id="insuredCardType1"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                                <!-- <input class="textfield txtR mySelf" readonly=""> -->
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo1" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                                <!-- <input class="textfield txtR mySelf idNo_compare" readonly=""> -->
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao1" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday1" id="insuredBirthdayChoose1">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday11" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb1" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex1" id="insuredSexChoose1">
                                        <select id="insuredSex1" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile1" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail1"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince1" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity1" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty1" value=""> 
                               <input type="text" style = "width:100%" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea1" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress1" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       
                    </div>
                     
                </div>
                <div class="clearfix infoDl dingwei1 dingwei fl">
                      <div class="shanchu " >删除</div>                          
                  </div>
            </section>

            <!--被保人信息2-->
            <section class="infoList newxian canping hide my_clearfix yanzheng2" id="scrollTop">
	            <p class="ml">被保人信息二</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation2" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName2" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType2"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo2" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                                <!-- <input class="textfield txtR mySelf idNo_compare" readonly=""> -->
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao2" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday2" id="insuredBirthdayChoose2">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday22" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb2" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex2" id="insuredSexChoose2">
                                        <select id="insuredSex2" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile2" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail2"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince2" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity2" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty2" value="">  
                               <input type="text" style = "width:100%" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea2" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress2" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                    </div>
                </div>
                <div class="clearfix infoDl dingwei fl">
                      <div class="shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                    
                  </div>
            </section>
            
            <!--被保人信息3-->
            <section class="infoList newxian canping hide my_clearfix yanzheng3" id="scrollTop">
	            <p class="ml">被保人信息三</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation3" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName3" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType3"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo3" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao3" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday3" id="insuredBirthdayChoose3">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday3" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb3" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex3" id="insuredSexChoose3">
                                        <select id="insuredSex3" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile3" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail3"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince3" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity3" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty3" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea3" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress3" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                    </div>
                </div>
                <div class="clearfix infoDl dingwei fl">
                      <div class=" shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                      
                  </div>
            </section>
            
             <!--被保人信息4-->
            <section class="infoList newxian canping hide my_clearfix yanzheng4" id="scrollTop">
	            <p class="ml">被保人信息四</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation4" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName4" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType4"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo4" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao3" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday4" id="insuredBirthdayChoose4">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday4" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb4" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex4" id="insuredSexChoose4">
                                        <select id="insuredSex4" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile4" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail4"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince4" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity4" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty4" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea4" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress4" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                      
                    </div>
                </div>
                  <div class="clearfix infoDl dingwei fl">
                      <div class=" shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>
                  </div>
            </section>
            
             <!--被保人信息5-->
            <section class="infoList hide newxian canping yanzheng5" id="scrollTop">
	            <p class="ml">被保人信息五</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation5" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName5" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType5"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo5" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao5" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday5" id="insuredBirthdayChoose5">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday5" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb5" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex5" id="insuredSexChoose5">
                                        <select id="insuredSex5" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile5" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail5"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince5" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity5" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty5" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea5" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress5" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                      
                    </div>
                </div>
                  <div class="clearfix infoDl dingwei fl">
                      <div class="  shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                        
                  </div>
            </section>
            
            <!--被保人信息6-->
            <section class="infoList hide newxian canping yanzheng6" id="scrollTop">
	            <p class="ml">被保人信息六</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation6" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName6" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType6"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo6" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao6" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday6" id="insuredBirthdayChoose6">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday6" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb6" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex6" id="insuredSexChoose6">
                                        <select id="insuredSex6" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile6" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail6"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince6" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity6" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty6" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea6" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress6" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                      
                    </div>
                </div>
                  <div class="clearfix infoDl dingwei fl">
                      <div class="  shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                         
                  </div>
            </section>
            
            <!--被保人信息7-->
            <section class="infoList hide newxian canping yanzheng7" id="scrollTop">
	            <p class="ml">被保人信息七</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation7" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName7" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType7"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo7" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao7" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday7" id="insuredBirthdayChoose7">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday7" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb7" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex4" id="insuredSexChoose7">
                                        <select id="insuredSex7" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile7" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail7"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince7" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity7" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty7" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea7" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress7" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                      
                    </div>
                </div>
                  <div class="clearfix infoDl dingwei fl">
                      <div class="  shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                         
                  </div>
            </section>
            
            <!--被保人信息8-->
            <section class="infoList hide newxian canping yanzheng8" id="scrollTop">
	            <p class="ml">被保人信息八</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation8" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName8" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType8"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo8" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao8" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday8" id="insuredBirthdayChoose8">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday8" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb8" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex8" id="insuredSexChoose8">
                                        <select id="insuredSex8" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile8" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail8"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince8" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity8" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty8" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea8" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress8" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                      
                    </div>
                </div>
                  <div class="clearfix infoDl dingwei fl">
                      <div class="  shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                        
                  </div>
            </section>
            
            <!--被保人信息9-->
            <section class="infoList hide newxian canping jili yanzheng9" id="scrollTop">
	            <p class="ml">被保人信息九</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <div class="insured1" style="display: block;"> 
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation9" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">                                    
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                     <option value="06">其他</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName9" value="" placeholder="请输入被保人姓名">                               
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">                                                         
                                <select id="insuredCardType9"  class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="8">其他</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                         <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo9" name="insuredList[0].insuredIdcardNo" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                       
                         <dl class="clearfix infoDl borBot1 dlSec beibao9" style="display:none;">
                            <dt class="w35 l-float">出生日期</dt>
                            <dd class="w65 l-float  hasArrow">
                                <span class="insuredBirthday9" id="insuredBirthdayChoose9">
                                    <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday9" name="insuredList[0].insuredBirthday" value="" placeholder="请选择">
                                    <i class="arrow"></i> 
                                </span>                                
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec beiabo_xb9" style="display: none;">
                            <dt class="w35 l-float">性别</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <div class="insuredSex4" id="insuredSexChoose9">
                                        <select id="insuredSex9" class="sex txtR personInfo dw-hsel" tabindex="-1">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select> 
                                    <i class="arrow"></i>
                                </div>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile9" value="" placeholder="请输入手机号码">                             
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">电子邮箱</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="email" class="textfield txtR personInfo" id="insuredEmail9"  value="" placeholder="请输入邮箱">                              
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                           <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">通讯地址</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <input type="hidden" name="" id="" value="3"> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredProvince" id = "insuredProvince9" value="">
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCity" id = "insuredCity9" value=""> 
                                <input type="hidden" class="personInfo" name="insuredList[0].insuredCounty" id = "insuredCounty9" value="">  
                               <input type="text" class="chosen txtR pr" style="width: 100%!important;" readonly="" placeholder="请选择" id="insuredArea9" value="">
                                <i class="arrow"></i> 
                               
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                       <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">详细地址</dt>
                         <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredAddress9" value="" placeholder="请具体至门牌号">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                      
                    </div>
                </div>
                  <div class="clearfix infoDl dingwei fl">
                      <div class="  shanchu" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                        
                  </div>
            </section>
            
             <span class="clearfix infoDl my_yingchang tianjia" >增加</span>
            <!--受益人信息-->
            <section class="infoList" style="    margin-top: 3rem;height: 5.5rem;">
                <p class="ml" style="height: 2.58rem;">受益人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1" style="height: 2.58rem;">
                    <dl class="clearfix infoDl borBot1 " >
                        <dt class="w35 l-float" style="line-height: 2.5rem;">受益人</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box; ">
                            <input type="text" class="textfield txtR personInfo" style="line-height: 2.5rem;" readonly value="法定收益人">
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section> 
			<section class="infoList">
		        <div class="ml whetherRead1">
		            <i id="whetherCheck" class="checkBox"></i>
		            <span >我已查看并同意
		            <a href="<%=request.getContextPath()%>/contract/anlian/yly/yly_bxtk.pdf">《碧海蓝天境外邮轮旅行险保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/anlian/common/khgzs.pdf">《客户告知书》</a>
		            </span>
		        </div>
		    </section>
        </form>
        <!--投保按钮-->
        <div class="pl bgColor borTop1 borBot1 fixedBox w100" >
            <dl class="clearfix infoDl w100">
	            <dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
				<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
            	 <span readonly="" class="insurePrice" id="insurePrice" >${insurePrice}</span><span>元</span>
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
</html>