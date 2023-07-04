<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>投保信息</title>
    <link rel="stylesheet" href="../../css/abzong/infos.css?v=20180504">
    <link rel="stylesheet" href="../../css/abzong/layer.css">
    <script src=" ../../js/abzong/jquery-1.7.2.min.js"></script>
    <script src=" ../../js/abzong/mobiscroll-2.13.2.full.min.js" type="text/javascript"></script>
    <script src=" ../../js/abzong/scroll.js" type="text/javascript"></script>
    <script src=" ../../js/abzong/iscroll.js" type="text/javascript"></script>
    <script src=" ../../js/abzong/iosSelect.js" type="text/javascript"></script>
    <script src=" ../../js/abzong/checkFn.js"></script>
    <script src=" ../../js/abzong/insuranceInformation.js"></script>
    <script src=" ../../js/abzong/layer.js"></script>
    <script src=" ../../js/abzong/mask.js?v=1"></script>
    <script src=" ../../js/abzong/workData.js"></script>
	<script type="text/javascript">
		var path = "https://www.dahuobaoxian.com/order";
 		var provinces=[{"id":"110000","codeValue":"110000","value":"北京市","parentId":"0"},
			{"id":"130000","codeValue":"130000","value":"河北省","parentId":"0"},
			{"id":"210000","codeValue":"210000","value":"辽宁省","parentId":"0"},
			{"id":"230000","codeValue":"230000","value":"黑龙江省","parentId":"0"},
			{"id":"310000","codeValue":"310000","value":"上海市","parentId":"0"},
			{"id":"320000","codeValue":"320000","value":"江苏省","parentId":"0"},
			{"id":"330000","codeValue":"330000","value":"浙江省","parentId":"0"},
			{"id":"340000","codeValue":"340000","value":"安徽省","parentId":"0"},
			{"id":"370000","codeValue":"370000","value":"山东省","parentId":"0"},
			{"id":"420000","codeValue":"420000","value":"湖北省","parentId":"0"},
			{"id":"440000","codeValue":"440000","value":"广东省","parentId":"0"},
			{"id":"510000","codeValue":"510000","value":"四川省","parentId":"0"},
			{"id":"120000","codeValue":"120000","value":"天津市","parentId":"0"},
			{"id":"140000","codeValue":"140000","value":"山西省","parentId":"0"},
			{"id":"220000","codeValue":"220000","value":"吉林省","parentId":"0"},
			{"id":"360000","codeValue":"360000","value":"江西省","parentId":"0"},
			{"id":"410000","codeValue":"410000","value":"河南省","parentId":"0"},
			{"id":"430000","codeValue":"430000","value":"湖南省","parentId":"0"},
			{"id":"220000","codeValue":"220000","value":"吉林省","parentId":"0"},
			{"id":"999999","codeValue":"999999","value":"其他","parentId":"0"}
		];
	</script>
    <script>
        $(function () {
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
    <header class="header w100 pl bgColor">
        <span>安邦随e乐两全保险</span>
    </header>
    <article class="info">
        <form id="formId" name="formName" method="post">
            <input type="hidden" id="lateDayInt" name="lateDayInt" value="365">
            <input type="hidden" id="earlyDayInt" name="earlyDayInt" value="1">
            
            <input type="hidden" class="personInfo" id="productNo" name="orderProduct.productCode" value="sel">
            <input type="hidden" class="personInfo" id="insOrganCode" value="anbang">
            <input type="hidden" class="personInfo" id="mainPrice" value="${mainPrice}">
<%--        <input type="hidden" class="personInfo" id="hmPrice" value="${hmPrice}"> --%> 
           <input type="hidden" class="personInfo" id="oldorderNo" value="">
			<!--产品投保要素信息-->
            <section class="infoList product">
                <p class="ml">产品投保要素</p>
                
                <div class="infoSec pl pr bgColor borTop1 borBot1">
					<!-- <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">缴费年期</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id = "payendyear" class="premium txtR iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1"">
								<option value="20Y">20年交</option>
						        <option value="15Y">15年交</option>
						        <option value="10Y">10年交</option>
						        <option value="0Y">趸交</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
					</dl> -->
					
					<dl class="clearfix infoDl borBot1 dlSec">
						<dt class="w35 l-float">购买金额(元)：</dt>
						<dd class="w65 l-float txtR">
						<input type="text" class="getPrice textfield txtR personInfo" id="amnt" placeholder="100整数倍，最高500万" value="${amnt}" onblur="amntBlur(this)">
						</dd>
					</dl>
					
					<dl class="clearfix borBot1 dlSec">
						<dt class="w35 l-float">保险期间：</dt>
						<dd class="w65 l-float txtR hasArrow">
					        <select id = "insuyear" class="premium txtR iFactor dw-hsel" tabindex="-1">
								<option value="10Y">10年</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
					</dl>
					
	               <!--  <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">保险期限</dt>
					    <dd class="w65 l-float txtR hasArrow">
					        <select id = "insuyear" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
								<option value="106A">终身</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
			        </dl> -->
                	<!-- <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">投保金额</dt>
						<dd class="w65 l-float txtR hasArrow">
					        <select id = "amnt" class="premium txtR iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
								<option value="10000">1万</option>
						        <option value="20000">2万</option>
						        <option value="30000">3万</option>
						        <option value="40000">4万</option>
						        <option value="50000">5万</option>
						        <option value="60000">6万</option>
						        <option value="70000">7万</option>
						        <option value="80000">8万</option>
						        <option value="90000">9万</option>
						        <option value="100000">10万</option>
						        <option value="110000">11万</option>
						        <option value="120000">12万</option>
						        <option value="130000">13万</option>
						        <option value="140000">14万</option>
						        <option value="150000">15万</option>
						        <option value="160000">16万</option>
						        <option value="170000">17万</option>
						        <option value="180000">18万</option>
						        <option value="190000">19万</option>
						        <option value="200000">20万</option>
						        <option value="210000">21万</option>
						        <option value="220000">22万</option>
						        <option value="230000">23万</option>
						        <option value="240000">24万</option>
						        <option value="250000">25万</option>
						        <option value="260000">26万</option>
						        <option value="270000">27万</option>
						        <option value="280000">28万</option>
						        <option value="290000">29万</option>
						        <option value="300000">30万</option>
						        <option value="310000">31万</option>
						        <option value="320000">32万</option>
						        <option value="330000">33万</option>
						        <option value="340000">34万</option>
						        <option value="350000">35万</option>
						        <option value="360000">36万</option>
						        <option value="370000">37万</option>
						        <option value="380000">38万</option>
						        <option value="390000">39万</option>
						        <option value="400000">40万</option>
						        <option value="410000">41万</option>
						        <option value="420000">42万</option>
						        <option value="430000">43万</option>
						        <option value="440000">44万</option>
						        <option value="450000">45万</option>
						        <option value="460000">46万</option>
						        <option value="470000">47万</option>
						        <option value="480000">48万</option>
						        <option value="490000">49万</option>
						        <option value="500000">50万</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
				        <span class="errorMsg"></span>
			        </dl> -->
					
			     <!--    <dl class="clearfix borBot1 dlSec">
			            <dt class="w35 l-float">附加豁免保费轻症疾病保险</dt>
			            <dd class="w65 l-float txtR hasArrow">
			                <select id = "ishuanmian" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
						        <option value="Y">投保</option>
				               	<option value="N">不投保</option>
				            </select>
			                <i class="arrow"></i>
						</dd>
		                    <span class="errorMsg"></span>
			        </dl> -->
			    </div>
            </section>   

 <!--投保人信息-->
                      <section class="infoList">
            	<p class="ml">投保人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
              	<dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">姓名</dt>
                    <dd class="w65 l-float txtR">
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
                	    <select name="applicant.appntIdcardType" id="cardType" class="cardType txtR personInfo dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
                  	        <option value="0">身份证</option>
                        </select>
                        <i class="arrow"></i>
                    </dd>
                      <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                    <dt class="w35 l-float">证件号码</dt>
                    <dd class="w65 l-float txtR">
                  	    <input type="text" class="textfield txtR personInfo idNo_compare" id="idNo" name="applicant.appntIdcardNo" value="" placeholder="请输入证件号码">
                    </dd>
                	    <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">证件有效期</dt>
                    <dd class="w65 l-float txtR">
	                    <span class="l-float w60">
	                  	    <input type="text" class="textfield txtR personInfo" readonly="" id="idDate" name="applicant.appntIdcardExpireEnd" value="" placeholder="请输入有效期">
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
                <dl class="clearfix infoDl borBot1 dlSec">
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
                <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">性别</dt>
                    <dd class="w65 l-float txtR hasArrow">
                  	    <input type="hidden" name="applicant.appntSexName" id="applicantSex" value="">
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
                  <dd class="w65 l-float txtR">
                  	<input type="tel" class="textfield txtR personInfo" id="tel" name="applicant.appntMobile" value="" placeholder="用于接收投保信息">
                  </dd>
                  <span class="errorMsg"></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec">
                  <dt class="w35 l-float">电子邮箱</dt>
                  <dd class="w65 l-float txtR">
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
                        <dd class="w65 l-float txtR">
                            <input type="text" class="textfield txtR personInfo" id="address" name="applicant.appntAddress" value="" placeholder="请具体至门牌号">
                        </dd>
                        <span class="errorMsg"></span>
                 </dl>
                 <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">邮政编码</dt>
                        <dd class="w65 l-float txtR">
                            <input type="number" class="textfield txtR personInfo" id="postalCode" name="applicant.appntZipCode" value="" placeholder="请输入邮编">
                        </dd>
                        <span class="errorMsg"></span>
                 </dl>
                 <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">职业</dt>
                        <dd class="w65 l-float txtR hasArrow">
                        <input type="text" id="Tb_appntOccupation3" class="textfield txtR personInfo tmp occ tb" placeholder="请选择" readonly="" style="color: rgb(153, 153, 153);">
                        <input type="text" style="display:none" class="personInfo" id="Tb_occupationType" name="applicant.occupationtype" value="">
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
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">投被保人关系</dt>
                        <dd class="w65 l-float txtR hasArrow">
                            <!-- 
                            <input type="text" id="relation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                             -->
                            <select id="relation" name="insuredList[0].relationShip" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
                                <option value="00">本人</option>
                            </select> 
                                <i class="arrow"></i>
                        </dd>
                            <span class="errorMsg"></span>
                    </dl>
                </div>
            </section>
 <!--受益人信息-->
            <section class="infoList">
                <p class="ml">受益人信息</p>
                <div class="infoSec pl pr pt pb bgColor borTop1 borBot1">
                    <p class="title">法定受益人</p>
                    <a class="content pl pr" href="tel:95569">
                        法定受益人（如需变更请携带身份证件原件到安邦保险柜面处理，详情请咨询95569）
                    </a>
                </div>
            </section> 
<!--责任信息-->
            <!-- <section class="infoList" id="guarantee">
                <p class="ml hideGuarantee">保障项目/额度</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
	                <dl class="clearfix borBot1 dlSec">
	                    <dt class="w65 l-float">重大疾病保险金</dt>
	                    <dd class="w35 l-float txtR hasArrow">
	                       <textarea readonly="" class="only textfield txtR insurInfo change_3101010118" name="duty_3101010118" id="duty_3101010118" data-code="3101010118" data-value="0" data-ispremcal="Y" data-prem="">100%保额</textarea>
						</dd>
                        <span class="errorMsg"></span>
	                </dl>
	                <dl class="clearfix borBot1 dlSec">
	                    <dt class="w65 l-float">轻症疾病保险金</dt>
	                    <dd class="w35 l-float txtR hasArrow">
	                        <textarea readonly="" class="only textfield txtR insurInfo change_3101010111" name="duty_3101010111" id="duty_3101010111" data-code="3101010111" data-value="0" data-ispremcal="N" data-prem="">20%*保额*5</textarea>
						</dd>
                        <span class="errorMsg"></span>
	                </dl>
	                <dl class="clearfix borBot1 dlSec">
	                    <dt class="w65 l-float">轻症疾病保费豁免</dt>
	                    <dd class="w35 l-float txtR hasArrow">
	                        <textarea readonly="" class="only textfield txtR insurInfo change_3101010119" name="duty_3101010119" id="duty_3101010119" data-code="3101010119" data-value="2@3101010118@1" data-ispremcal="Y" data-prem="">豁免保费</textarea>
						</dd>
                        <span class="errorMsg"></span>
	                </dl>
	                <dl class="clearfix borBot1 dlSec">
	                    <dt class="w65 l-float">全残保险金</dt>
	                    <dd class="w35 l-float txtR hasArrow">
	                        <textarea readonly="" class="only textfield txtR insurInfo change_3101010116" name="duty_3101010116" id="duty_3101010116" data-code="3101010116" data-value="0" data-ispremcal="N" data-prem="">100%保额</textarea>
						</dd>
                        <span class="errorMsg"></span>
	                </dl>
	                <dl class="clearfix borBot1 dlSec">
	                    <dt class="w65 l-float">身故保险金</dt>
	                    <dd class="w35 l-float txtR hasArrow">
	                        <textarea readonly="" class="only textfield txtR insurInfo change_3101010117" name="duty_3101010117" id="duty_3101010117" data-code="3101010117" data-value="0" data-ispremcal="N" data-prem="">100%保额</textarea>
						</dd>
                        <span class="errorMsg"></span>
	                </dl>
	                <dl class="clearfix borBot1 dlSec">
	                    <dt class="w65 l-float">疾病终末期保险金</dt>
	                    <dd class="w35 l-float txtR hasArrow">
	                        <textarea readonly="" class="only textfield txtR insurInfo change_3101010113" name="duty_3101010113" id="duty_3101010113" data-code="3101010113" data-value="0" data-ispremcal="N" data-prem="">100%保额</textarea>
						</dd>
                        <span class="errorMsg"></span>
	                </dl>
	            </div>
            </section>  --> 
<!--续缴账户信息-->
            <section class="infoList  renewalSec">
                <p class="ml">缴费账户信息</p>
                <span class="tip ml">*为确保缴费成功，请准确填写如下信息</span>
                <div class="infoSec pl pr bgColor borTop1 borBot1  checkRenewal">
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">开户名</dt>
                        <dd class="w65 l-float txtR">
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
                                <option value="102">工商银行</option>
                                <option value="103">农业银行</option>
                                <option value="104">中行</option>    
                                <option value="105">建设银行</option>
                                <option value="301">交行</option>
                                <option value="403">邮政储蓄银行</option>
                                                            
                            </select>
                            <i class="arrow"></i>
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                    <dl class="clearfix infoDl borBot1 dlSec">
		            <dt class="w35 l-float">开户省</dt>
		                <dd class="w65 l-float txtR hasArrow">
		                        <select name="renewalBank.bankProvince" id="bankProvince" class="bankprovince txtR personInfo dw-hsel" tabindex="-1">
		                                <option value="">请选择</option>
		                                <option value="110000">北京市</option>
		                                <option value="120000">天津市</option>
		                                <option value="130000">河北省</option>
		                                <option value="140000">山西省</option>
		                                <option value="150000">内蒙古自治区</option>
		                                <option value="210000">辽宁省</option>
		                                <option value="220000">吉林省</option>
		                                <option value="230000">黑龙江省</option>
		                                <option value="310000">上海市</option>
		                                <option value="320000">江苏省</option>
		                                <option value="330000">浙江省</option>
		                                <option value="340000">安徽省</option>
		                                <option value="350000">福建省</option>
		                                <option value="360000">江西省</option>
		                                <option value="370000">山东省</option>
		                                <option value="410000">河南省</option>
		                                <option value="420000">湖北省</option>
		                                <option value="430000">湖南省</option>
		                                <option value="440000">广东省</option>
		                                <option value="450000">广西壮族自治区</option>
		                                <option value="460000">海南省</option>
		                                <option value="500000">重庆市</option>
		                                <option value="510000">四川省</option>
		                                <option value="520000">贵州省</option>
		                                <option value="530000">云南省</option>
		                                <option value="540000">西藏自治区</option>
		                                <option value="610000">陕西省</option>
		                                <option value="620000">甘肃省</option>
		                                <option value="630000">青海省</option>
		                                <option value="640000">宁夏回族自治区</option>
		                                <option value="650000">新疆维吾尔自治区</option>
		                                <option value="810000">香港特别行政区</option>
		                        </select>
		                    <i class="arrow"></i>
		                </dd>
		                    <span class="errorMsg"></span>
		       		</dl>
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">银行卡号</dt>
                        <dd class="w65 l-float txtR">
                            <input type="text" class="textfield txtR personInfo" name="renewalBank.accountCode" id="cardNo" placeholder="请输入卡号" value=${cardNo}>
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section>  
			<section class="infoList">
		        <div class="ml whetherRead">
		            <i id="whetherCheck" class="checkBox"></i>
		           <span >本人已认真阅读并同意<br>
		            <a href="<%=request.getContextPath()%>/contract/abz/sel/pro_clause_01.html">《产品条款》</a>
					<a href="<%=request.getContextPath()%>/contract/abz/sel/pro_clause_04.html">《产品说明书》</a>
					<a href="<%=request.getContextPath()%>/contract/abz/sel/pro_clause_07.html">《风险保费表》</a><br>
					<a href="<%=request.getContextPath()%>/contract/abz/sel/pro_clause_06.html">《投保提示》</a>
					<a href="<%=request.getContextPath()%>/contract/abz/sel/pro_clause_05.html">《人身投保提示书》</a>
					<a href="<%=request.getContextPath()%>/contract/abz/sel/pro_clause_02.html">《投保声明》</a>
					<a href="<%=request.getContextPath()%>/contract/common/kehugaozhishu/ab_customerNotification.pdf">《客户告知书》</a>
		        </div>
		    </section>
        </form>
        <!--投保按钮-->
        <div class="pl bgColor fixedBox w100">
            <dl class="clearfix infoDl w100">
				<dt class="w65 l-float font16" style="padding-left: 3rem;position: relative;box-sizing: border-box;">
	            	<%-- 保费：<input type="text" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}"> --%>
	            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				    <span readonly="" class="insurePrice" id="insurePrice" >${insurePrice}</span><span>元/年起</span>
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
</body>
</html>