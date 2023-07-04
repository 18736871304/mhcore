<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>家庭联合意外险（3人版）</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180518_01">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180504"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20180504"></script>
    <script src="../../js/common/insuCommon.js?v=20180504"></script>
    <script src=" ../../js/zhongan/insuranceInformation.js?v=2180517_02"></script>
<script type="text/javascript">

var insplan = '${insplan}';
var isextend = '${isextend}';

$(function () 
{
	if(insplan!=null&&insplan!="")
	{
		$("#insplan").val(insplan);
		$("#insplan_dummy").val($("#insplan").find("option:selected").text());
	}
	
	if(isextend!=null&&isextend!="")
	{
		$("#isextend").val(isextend);
		$("#isextend_dummy").val($("#isextend").find("option:selected").text());
	}
	
	var prem = ywpriceCanShu($("#productNo").val(),$("#insplan").val(),$("#isextend").val());
	
	$("#insurePrice").html(Number(prem).toFixed(2));
	
	$("select").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text()=="请选择"){
	                $(this).siblings(".tmp").css("color","#999999");
	            }else{
	                $(this).siblings(".tmp").css("color","#222222");
	            }
	        }
	    }));
	});
	$(".tmp").each(function(){
	    if($(this).val()=="请选择"){
	        $(this).css("color","#999999");
	    }else{
	        $(this).css("color","#222222");
	    }
	});
	
	$('.pop-sure').click(function(){
		$('.mask').css("display","none");
	});
	
})

</script>
</head>
<body style="">
    <header class="header w100 pl bgColor">
        <span>家庭联合意外险（3人版）</span>
        <br/>
        <span>本产品由众安在线财产保险股份有限公司承保</span>
        <img src="../../images/zhongan/zhongan.png"/>
    </header>
    <article class="info" style="margin-top: 5.2rem;">
        <form id="formId" name="formName" method="post">
        	<input type="hidden" class="personInfo" id="productNo" value="zhongan_jtyw3">
        	<input type="hidden" id="mainPrice" value="100">
        	
        	<section class="infoList product">
        	<p class="ml">产品投保要素</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                	<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">投保计划</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id = "insplan" class="premium txtR personInfo iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
						        <option value="silver">白银版</option>
						        <option value="gold">黄金版</option>
						        <option value="diamond">钻石版</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">是否扩展</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id = "isextend" class="premium txtR personInfo iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
						        <option value="Y">是</option>
						        <option value="N" selected = "selected">否</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
                </div>
            </section>
        	
        	
            <section class="infoList product">
                <p class="ml">投保人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">姓名</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <input type="text" class="textfield txtR personInfo" id="policyName" value="" placeholder="请输入投保人姓名">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
					<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">证件类型</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="cardType" class="cardType txtR personInfo  dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
	                  	        <option value="1">身份证</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">证件号码</dt>
	                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  	    <input type="text" class="textfield txtR personInfo idNo_compare" id="idNo" value="" placeholder="请输入证件号码">
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
			    </div>
            </section>
            
            <section class="infoList" id="scrollTop">
	            <p class="ml">被保人信息一</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl dlSec bottom-1" id = "isyizhi">
			            <dt class="w40 l-float">与投保人一致</dt>
			            <dd class="w60 l-float txtR hasArrow">
				            <i id="switch" class="turnOn" ></i>
				            <input type="radio" id = 'switchradio' style="display: none;">
							<input type="text" style="display:none" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
			            </dd>
			            <input type="radio" style="display: none;">
						<input type="text" style="display:none" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
		            </dl>
		            
		            <div class="insured" style="display:'';">
		            	<dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <!-- 
                                <input type="text" id="relation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="relation" name="" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
                                    <option value="00">本人</option>
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                    <option value="06">其他</option>
                                    <!-- <option value="03">子女</option> -->
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
                            <dd class="w65 l-float txtR hasArrow">
                            	
                                <select id="insuredCardType" name="insuredList[0].insuredIdcardType" class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0">身份证</option>
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
		            </div>
		            <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业大类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="onelevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='机关'>机关</option>
								<option value='农副牧渔业'>农\副\牧\渔业</option>
								<option value='森林木材业'>森林木材业</option>
								<option value='地质矿产'>地质矿产</option>
								<option value='运输业'>运输业</option>
								<option value='工程施工'>工程施工</option>
								<option value='建筑材料'>建筑材料</option>
								<option value='钢铁业'>钢铁业</option>
								<option value='机械制造加工业'>机械制造加工业</option>
								<option value='电子业'>电子业</option>
								<option value='机电产品制造与装配'>机电产品制造与装配</option>
								<option value='塑胶橡胶业'>塑胶橡胶业</option>
								<option value='化学工业'>化学工业</option>
								<option value='纺织成衣鞋帽皮革业'>纺织成衣鞋帽皮革业</option>
								<option value='造纸纸产品'>造纸纸产品</option>
								<option value='电线电缆业'>电线电缆业</option>
								<option value='食品饮料制造业'>食品饮料制造业</option>
								<option value='玻璃陶瓷搪瓷制品制造业'>玻璃陶瓷搪瓷制品制造业</option>
								<option value='烟草制品加工业'>烟草制品加工业</option>
								<option value='医疗用品制药业'>医疗用品制药业</option>
								<option value='工艺美术品制作'>工艺美术品制作</option>
								<option value='文化体育用品制作'>文化体育用品制作</option>
								<option value='军工制造'>军工制造</option>
								<option value='新闻出版文化印刷业'>新闻出版文化印刷业</option>
								<option value='广告业'>广告业</option>
								<option value='卫生专业技术'>卫生专业技术</option>
								<option value='广播影视文艺'>广播影视文艺</option>
								<option value='服务业'>服务业</option>
								<option value='教育机构'>教育机构</option>
								<option value='邮政'>邮政</option>
								<option value='电信及电力'>电信及电力</option>
								<option value='水利'>水利</option>
								<option value='商业'>商业</option>
								<option value='金融法律行业'>金融法律行业</option>
								<option value='资讯业'>资讯业</option>
								<option value='安全保卫消防'>安全保卫消防</option>
								<option value='现役军人'>现役军人</option>
								<option value='体育'>体育</option>
								<option value='无业'>无业</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业小类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="twolevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='机关团体公司行号'>机关团体公司行号</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业细类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="threelevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='0001001'>内勤人员</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
		        </div>
            </section>
            
            <section class="infoList" id="scrollTop">
	            <p class="ml">被保人信息二</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
	            		<dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation02" name="" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
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
                                <input type="text" class="textfield txtR personInfo" id="insuredName02" value="" placeholder="请输入被保人姓名">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="insuredCardType02" class="cardType txtR personInfo dw-hsel" tabindex="-1">
                                    <option value="0">身份证</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo02" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">出生日期</dt>
	                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredBirthday02" readonly value="" placeholder="请输入出生日期">
                            </dd>
	                        <span class="errorMsg"></span>
	                    </dl>
	                    <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">性别</dt>
	                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredSex02" readonly value="" placeholder="请输入性别">
                            </dd>
	                        <span class="errorMsg"></span>
	                    </dl>
                        
                        
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile02" value="" placeholder="请输入手机号码">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                   	<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业大类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="onelevel02" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='机关'>机关</option>
								<option value='农副牧渔业'>农\副\牧\渔业</option>
								<option value='森林木材业'>森林木材业</option>
								<option value='地质矿产'>地质矿产</option>
								<option value='运输业'>运输业</option>
								<option value='工程施工'>工程施工</option>
								<option value='建筑材料'>建筑材料</option>
								<option value='钢铁业'>钢铁业</option>
								<option value='机械制造加工业'>机械制造加工业</option>
								<option value='电子业'>电子业</option>
								<option value='机电产品制造与装配'>机电产品制造与装配</option>
								<option value='塑胶橡胶业'>塑胶橡胶业</option>
								<option value='化学工业'>化学工业</option>
								<option value='纺织成衣鞋帽皮革业'>纺织成衣鞋帽皮革业</option>
								<option value='造纸纸产品'>造纸纸产品</option>
								<option value='电线电缆业'>电线电缆业</option>
								<option value='食品饮料制造业'>食品饮料制造业</option>
								<option value='玻璃陶瓷搪瓷制品制造业'>玻璃陶瓷搪瓷制品制造业</option>
								<option value='烟草制品加工业'>烟草制品加工业</option>
								<option value='医疗用品制药业'>医疗用品制药业</option>
								<option value='工艺美术品制作'>工艺美术品制作</option>
								<option value='文化体育用品制作'>文化体育用品制作</option>
								<option value='军工制造'>军工制造</option>
								<option value='新闻出版文化印刷业'>新闻出版文化印刷业</option>
								<option value='广告业'>广告业</option>
								<option value='卫生专业技术'>卫生专业技术</option>
								<option value='广播影视文艺'>广播影视文艺</option>
								<option value='服务业'>服务业</option>
								<option value='教育机构'>教育机构</option>
								<option value='邮政'>邮政</option>
								<option value='电信及电力'>电信及电力</option>
								<option value='水利'>水利</option>
								<option value='商业'>商业</option>
								<option value='金融法律行业'>金融法律行业</option>
								<option value='资讯业'>资讯业</option>
								<option value='安全保卫消防'>安全保卫消防</option>
								<option value='现役军人'>现役军人</option>
								<option value='体育'>体育</option>
								<option value='无业'>无业</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业小类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="twolevel02" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='机关团体公司行号'>机关团体公司行号</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业细类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="threelevel02" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='0001001'>内勤人员</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
	            </div>
	        </section>
            
            <section class="infoList" id="scrollTop">
	            <p class="ml">被保人信息三</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
	            		<dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">投被保人关系</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="relation03" name="" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
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
                                <input type="text" class="textfield txtR personInfo" id="insuredName03" value="" placeholder="请输入被保人姓名">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <select id="insuredCardType03" class="cardType txtR personInfo dw-hsel" tabindex="-1">
                                    <option value="0">身份证</option>
                                </select>
                                <i class="arrow"></i> 
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo03" value="" placeholder="请输入证件号码">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">出生日期</dt>
	                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredBirthday03" readonly value="" placeholder="请输入出生日期">
                            </dd>
	                        <span class="errorMsg"></span>
	                    </dl>
	                    <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">性别</dt>
	                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredSex03" readonly value="" placeholder="请输入性别">
                            </dd>
	                        <span class="errorMsg"></span>
	                    </dl>
                        
                        
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">手机号</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="tel" class="textfield txtR personInfo" id="insuredMobile03" value="" placeholder="请输入手机号码">
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                        
                   	<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业大类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="onelevel03" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='机关'>机关</option>
								<option value='农副牧渔业'>农\副\牧\渔业</option>
								<option value='森林木材业'>森林木材业</option>
								<option value='地质矿产'>地质矿产</option>
								<option value='运输业'>运输业</option>
								<option value='工程施工'>工程施工</option>
								<option value='建筑材料'>建筑材料</option>
								<option value='钢铁业'>钢铁业</option>
								<option value='机械制造加工业'>机械制造加工业</option>
								<option value='电子业'>电子业</option>
								<option value='机电产品制造与装配'>机电产品制造与装配</option>
								<option value='塑胶橡胶业'>塑胶橡胶业</option>
								<option value='化学工业'>化学工业</option>
								<option value='纺织成衣鞋帽皮革业'>纺织成衣鞋帽皮革业</option>
								<option value='造纸纸产品'>造纸纸产品</option>
								<option value='电线电缆业'>电线电缆业</option>
								<option value='食品饮料制造业'>食品饮料制造业</option>
								<option value='玻璃陶瓷搪瓷制品制造业'>玻璃陶瓷搪瓷制品制造业</option>
								<option value='烟草制品加工业'>烟草制品加工业</option>
								<option value='医疗用品制药业'>医疗用品制药业</option>
								<option value='工艺美术品制作'>工艺美术品制作</option>
								<option value='文化体育用品制作'>文化体育用品制作</option>
								<option value='军工制造'>军工制造</option>
								<option value='新闻出版文化印刷业'>新闻出版文化印刷业</option>
								<option value='广告业'>广告业</option>
								<option value='卫生专业技术'>卫生专业技术</option>
								<option value='广播影视文艺'>广播影视文艺</option>
								<option value='服务业'>服务业</option>
								<option value='教育机构'>教育机构</option>
								<option value='邮政'>邮政</option>
								<option value='电信及电力'>电信及电力</option>
								<option value='水利'>水利</option>
								<option value='商业'>商业</option>
								<option value='金融法律行业'>金融法律行业</option>
								<option value='资讯业'>资讯业</option>
								<option value='安全保卫消防'>安全保卫消防</option>
								<option value='现役军人'>现役军人</option>
								<option value='体育'>体育</option>
								<option value='无业'>无业</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业小类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="twolevel03" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='机关团体公司行号'>机关团体公司行号</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业细类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="threelevel03" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='0001001'>内勤人员</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
	            </div>
	        </section>
            
            <section class="infoList">
                <p class="ml">受益人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">受益人</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                            <input type="text" class="textfield txtR personInfo" readonly value="法定收益人" >
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section> 
            
            <section class="infoList">
		        <div class="ml whetherRead">
		            <i id="whetherCheck" class="checkBox"></i>
		            <span>我已查看并同意
		            <a href="<%=request.getContextPath()%>/contract/zhongan/jtyw/jtyw01.pdf">《团体人身意外伤害保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/zhongan/jtyw/jtyw02.pdf">《附加团体意外伤害医疗保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/zhongan/jtyw/jtyw03.pdf">《附加意外伤害救护车费用保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/zhongan/jtyw/jtyw04.pdf">《附加意外伤害医疗费用保险条款（C款）》</a>
		            <a href="<%=request.getContextPath()%>/contract/zhongan/jtyw/jtyw05.pdf">《附加意外伤害住院津贴保险条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/common/kehugaozhishu/zhongan_customerNotification.pdf">《客户告知书》</a>
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
				    <span readonly="" class="insurePrice" id="insurePrice" >100.00</span><span id = "priceunit">元</span>
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