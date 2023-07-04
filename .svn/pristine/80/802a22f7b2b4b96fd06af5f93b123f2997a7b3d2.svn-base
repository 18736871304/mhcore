<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>投保信息</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180504">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js"></script>
    <!-- <script src=" ../..//js/car/suncar/chengshi.js"></script> -->
    
    <script src=" ../../js/xintai/insuranceInformation.js?v=20180914_01"></script>
	<script type="text/javascript">
 		var provinces=[
			{'id':'110000','codeValue':'110000','value':'北京市','parentId':'0'},
			{'id':'130000','codeValue':'130000','value':'河北省','parentId':'0'},
			{'id':'210000','codeValue':'210000','value':'辽宁省','parentId':'0'},
			{'id':'230000','codeValue':'230000','value':'黑龙江省','parentId':'0'},
			{'id':'310000','codeValue':'310000','value':'上海市','parentId':'0'},
			{'id':'320000','codeValue':'320000','value':'江苏省','parentId':'0'},
			{'id':'330000','codeValue':'330000','value':'浙江省','parentId':'0'},
			{'id':'350000','codeValue':'350000','value':'福建省','parentId':'0'},
			{'id':'360000','codeValue':'360000','value':'江西省','parentId':'0'},
			{'id':'370000','codeValue':'370000','value':'山东省','parentId':'0'},
			{'id':'410000','codeValue':'410000','value':'河南省','parentId':'0'},
			{'id':'420000','codeValue':'420000','value':'湖北省','parentId':'0'},
			{'id':'440000','codeValue':'440000','value':'广东省','parentId':'0'},
		];
 		 var provinces2=[
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
 		  		]; 
	</script>
    <script>
    
    var payendyear = '${payendyear}';
    var amnt = '${amnt}';
    var ishuomian = '${ishuomian}';
    var prem = '${prem}';
    var addinsureyear = '${addinsureyear}';
    var age = '${age}';
   
        $(function () {
        	//缴费方式
        	if(payendyear!=null&&payendyear!="")
        	{
        		$("#payendyear").val(payendyear);
        		$("#payendyear_dummy").val($("#payendyear").find("option:selected").text());
        	}
     	    
     	   //设置附加险
        	if(ishuomian!=null&&ishuomian!=""&&ishuomian=='N')
        	{
        		$("#ishuanmian").find("option[value="+ishuomian+"]").attr("selected",true);
        		$("#ishuanmian_dummy").val($("#ishuanmian").find("option:selected").text());
        		$("#inyeardiv").css("display","none");
        	}else if(ishuomian=='Y'){
        		$("#ishuanmian").find("option[value="+ishuomian+"]").attr("selected",true);
        		$("#ishuanmian_dummy").val($("#ishuanmian").find("option:selected").text());
        		
        		$("#addinyear").find("option[value="+addinsureyear+"]").attr("selected",true);
        		$("#addinyear_dummy").val($("#addinyear").find("option:selected").text());
        		//$("#inyeardiv").css("display","none");
        	}
        	
        	//显示隐藏附加险保险期间
            $('#ishuanmian').change(function(){
				 if($('#ishuanmian option:selected').val()=='N'){
					 $("#inyeardiv").css("display","none");
				 }else{
					$("#inyeardiv").css("display","block"); 
				 }
            });
        	
        	if(amnt!=null&&amnt!="")
        	{
        		$("#amnt").val(amnt);
        	}
        	
        	if(prem!=null&&prem!="")
        	{
        		$("#insurePrice").text(prem);	
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
                onSelect:function(){}
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
    
<style type="text/css">
   #bankArea{
	width:100%;
	display:block;
	}
</style>
</head>
<body style="">
    <header class="header w100 pl bgColor">
        <span>信泰健康无忧重大疾病</span>
        <br />
        <span>本产品由信泰人寿保险股份有限公司承保</span>
        <img src="../../images/logo/xintai_typein.png" />
    </header>
    <article class="info" style="margin-top: 5.2rem;">
        <form id="formId" name="formName" method="post">
            <input type="hidden" class="personInfo" id="productNo" name="orderProduct.productCode" value="${productNo}">
            <input type="hidden" class="personInfo" id="mainPrice" value="${mainPrem}">
            <input type="hidden" class="personInfo" id="hmPrice" value="${addPrem}">
            <%-- <input type="hidden" id="lateDayInt" name="lateDayInt" value="365">
            <input type="hidden" id="earlyDayInt" name="earlyDayInt" value="1">
            <input type="hidden" class="personInfo" id="insOrganCode" value="xintai">
            <input type="hidden" class="personInfo" id="oldorderNo" value="${orderNo}"> --%>
			<!--产品投保要素信息-->
            <section class="infoList product">
                <p class="ml">产品投保要素</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                	<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">投保额度</dt>
						<dd class="w65 l-float txtR hasArrow pr" style="box-sizing: border-box;">
						    <input id = "amnt" type="text" value = "" 
						    class="only txtR iFactor getPrice numInput import" 
						    placeholder="10000起,1000元整数倍递增"  style="text-overflow: unset;width: 100%;">
						</dd>
				        <span class="errorMsg"></span>
			        </dl>
					<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">保险期限</dt>
					    <dd class="w65 l-float txtR hasArrow">
					        <select id = "insuyear" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
								<option value="1000">终身</option>
						    </select> 
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec" id="select_JFTime">
				        <dt class="w35 l-float">缴费年期</dt>
				        <dd class="w65 l-float txtR hasArrow" id="show_JFTime">
					       <select id = "payendyear" class="premium txtR iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
								<option value="30Y">30年</option>
								<option value="20Y">20年</option>
						        <option value="15Y">15年</option>
						        <option value="10Y">10年</option>
						        <option value="5Y">5年</option>
						        <option value="3Y">3年</option>
						        <option value="1000Y">趸交</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
			            <dt class="w35 l-float">附加健康无忧两全保险</dt>
			            <dd class="w65 l-float txtR hasArrow">
			                <select id = "ishuanmian" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
						        <option value="Y">投保</option>
				               	<option value="N">不投保</option>
				            </select>
			                <i class="arrow"></i>
						</dd>
		                    <span class="errorMsg"></span>
			        </dl>
			        
			         <dl class="clearfix borBot1 dlSec" id="inyeardiv">
			            <dt class="w35 l-float">附加险保险期间</dt>
			            <dd class="w65 l-float txtR hasArrow">
			                <select id = "addinyear" class="premium txtR iFactor getPrice dw-hsel" tabindex="-1">
				               	<option value="75Y">至75周岁</option>
				               	<option value="70Y">至70周岁</option>
						        <option value="65Y">至65周岁</option>
				            </select>
			                <i class="arrow"></i>
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
                	<dd class="w65 l-float txtR hasArrow">
                		<!-- 
                	    <input type="text" id="cardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                	     -->
                	    <select name="applicant.appntIdcardType" id="cardType" class="cardType txtR personInfo  dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
                  	        <option value="0" selected="selected">身份证</option>
                            <option value="1">护照</option>
                            <option value="2">军官证</option>
                            <option value="7">出生医学证</option>
                            <option value="4">户口簿</option>
                            <option value="F">港、澳、台居民来往内地通行证</option>
                            <option value="8">外国人永久居留身份证</option>
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
                <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">证件有效期</dt>
                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
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
                <dl class="clearfix infoDl borBot1 dlSec yingchang2" style="display:none">
                	<dt class="w35 l-float">出生日期</dt>
                    <dd class="w65 l-float txtR hasArrow">
                  	<span class="birthday" id="birthdayChoose" style="display: none;">
                  		<input type="text" class="textfield txtR personInfo birthdayChoose" readonly="" id="birthday" value="" placeholder="请选择">
                   		<i class="arrow"></i>
                    </span>
                        <input type="text" class="textfield txtR birthdayReadonly personInfo" id = "birthdayReadonly" readonly="" value="">
                    </dd>
                        <span class="errorMsg" ></span>
                </dl>
                <dl class="clearfix infoDl borBot1 dlSec xingbie" style="display:none">
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
                 <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">职业大类</dt>
	                	<dd class="w65 l-float txtR hasArrow">
	                		<select id="onelevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value='中国共产党中央委员会和地方各级党组织负责人'>中国共产党中央委员会和地方各级党组织负责人</option>
								<option value='国家机关及其工作机构负责人'>国家机关及其工作机构负责人</option>
								<option value='民主党派和社会团体及其工作机构负责人'>民主党派和社会团体及其工作机构负责人</option>
								<option value='事业单位负责人'>事业单位负责人</option>
								<option value='企业负责人'>企业负责人</option>
								<option value='科学研究人员' selected="selected">科学研究人员</option>
								<option value='工程技术人员'>工程技术人员</option>
								<option value='农业技术人员'>农业技术人员</option>
								<option value='飞机和船舶技术人员'>飞机和船舶技术人员</option>
								<option value='卫生专业技术人员'>卫生专业技术人员</option>
								<option value='经济业务人员'>经济业务人员</option>
								<option value='金融业务人员'>金融业务人员</option>
								<option value='法律专业人员'>法律专业人员</option>
								<option value='教学人员'>教学人员</option>
								<option value='文学艺术工作人员'>文学艺术工作人员</option>
								<option value='体育工作人员'>体育工作人员</option>
								<option value='新闻出版、文化工作人员'>新闻出版、文化工作人员</option>
								<option value='宗教职业者'>宗教职业者</option>
								<option value='行政办公人员'>行政办公人员</option>
								<option value='安全保卫和消防人员'>安全保卫和消防人员</option>
								<option value='邮政和电信业务人员'>邮政和电信业务人员</option>
								<option value='广告从业人员'>广告从业人员</option>
								<option value='购销人员'>购销人员</option>
								<option value='仓储人员'>仓储人员</option>
								<option value='餐饮服务人员'>餐饮服务人员</option>
								<option value='饭店、旅游及健身娱乐场所服务人员'>饭店、旅游及健身娱乐场所服务人员</option>
								<option value='运输服务人员'>运输服务人员</option>
								<option value='医疗卫生辅助服务人员'>医疗卫生辅助服务人员</option>
								<option value='社会服务和居民生活服务人员'>社会服务和居民生活服务人员</option>
								<option value='其他商业、服务业人员'>其他商业、服务业人员</option>
								<option value='种植业生产人员'>种植业生产人员</option>
								<option value='林业生产及野生动植物保护人员'>林业生产及野生动植物保护人员</option>
								<option value='畜牧业生产人员'>畜牧业生产人员</option>
								<option value='渔业生产人员'>渔业生产人员</option>
								<option value='水利设施管理养护人员'>水利设施管理养护人员</option>
								<option value='其他农、林、牧、渔、水利业生产人员'>其他农、林、牧、渔、水利业生产人员</option>
								<option value='勘测及矿物开采人员'>勘测及矿物开采人员</option>
								<option value='金属冶炼、轧制人员'>金属冶炼、轧制人员</option>
								<option value='化工产品生产人员'>化工产品生产人员</option>
								<option value='机械制造加工人员'>机械制造加工人员</option>
								<option value='机电产品装配人员'>机电产品装配人员</option>
								<option value='机械设备修理人员'>机械设备修理人员</option>
								<option value='电力设备安装、运行、检修及供电人员'>电力设备安装、运行、检修及供电人员</option>
								<option value='电子元器件与设备制造、装配调试及维修人员'>电子元器件与设备制造、装配调试及维修人员</option>
								<option value='橡胶和塑料制品生产人员'>橡胶和塑料制品生产人员</option>
								<option value='纺织、针织、印染人员'>纺织、针织、印染人员</option>
								<option value='裁剪缝纫和皮革、毛皮制品加工制作人员'>裁剪缝纫和皮革、毛皮制品加工制作人员</option>
								<option value='粮油、食品、饮料生产加工及饲料生产加工人员'>粮油、食品、饮料生产加工及饲料生产加工人员</option>
								<option value='烟草及其制品加工人员'>烟草及其制品加工人员</option>
								<option value='药品生产人员'>药品生产人员</option>
								<option value='木材加工、人造板生产及木材制品制作人员'>木材加工、人造板生产及木材制品制作人员</option>
								<option value='制浆、造纸和纸制品生产加工人员'>制浆、造纸和纸制品生产加工人员</option>
								<option value='建筑材料生产加工人员'>建筑材料生产加工人员</option>
								<option value='玻璃、陶瓷、搪瓷及其制品生产加工人员'>玻璃、陶瓷、搪瓷及其制品生产加工人员</option>
								<option value='广播影视制品制作、播放及文物保护作业人员'>广播影视制品制作、播放及文物保护作业人员</option>
								<option value='印刷人员'>印刷人员</option>
								<option value='工艺、美术品制作人员'>工艺、美术品制作人员</option>
								<option value='文化教育、体育用品制作人员'>文化教育、体育用品制作人员</option>
								<option value='工程施工人员'>工程施工人员</option>
								<option value='运输设备操作人员及有关人员'>运输设备操作人员及有关人员</option>
								<option value='环境监测与废物处理人员'>环境监测与废物处理人员</option>
								<option value='检验、计量人员'>检验、计量人员</option>
								<option value='其他生产运输设备操作人员及有关人员'>其他生产运输设备操作人员及有关人员</option>
								<option value='军人'>军人</option>
								<option value='其他从业人员'>其他从业人员</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
		           <dl class="clearfix borBot1 dlSec">
			        <dt class="w35 l-float">职业小类</dt>
                	<dd class="w65 l-float txtR hasArrow">
                		<select id="twolevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
                  	        <option value='历史学研究人员'>历史学研究人员</option>
                        </select>
                        <i class="arrow"></i>
                    </dd>
                      <span class="errorMsg"></span>
		        </dl>
		        <dl class="clearfix borBot1 dlSec">
			        <dt class="w35 l-float">职业细类</dt>
                	<dd class="w65 l-float txtR hasArrow">
                		<select id="threelevel" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
                  	        <option value='2010801'>历史学研究人员</option>
                        </select>
                        <i class="arrow"></i>
                    </dd>
                      <span class="errorMsg"></span>
		        </dl>
                   <dl class="clearfix borBot1 dlSec">
                    <dt class="w35 l-float">税收身份类型</dt>
                    <dd class="w65 l-float txtR hasArrow">
                        <select id = "appntss" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
                            <option value="1">中国税收居民</option>
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
                    <dl class="clearfix infoDl borBot1 dlSec">
			            <dt class="w40 l-float">与投保人一致</dt>
			            <dd class="w60 l-float txtR hasArrow">
				            <i id="switch" class="turnOn"></i>
				            <input type="radio" id = 'switchradio' style="display: none;">
							<input type="hidden" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
			            </dd>
			            <input type="radio" style="display: none;">
						<input type="hidden" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
		            </dl>
<!--不一致时被保人信息-->
                    <div class="insured" style="display: none;">
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">被保人是您的</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <!-- 
                                <input type="text" id="relation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="relation" name="insuredList[0].relationShip" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
                                    <option value="00">本人</option>
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
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">证件类型</dt>
                            <dd class="w65 l-float txtR hasArrow">
                            	<!-- 
                                <input type="text" id="insuredCardType_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(34, 34, 34);">
                                 -->
                                <select id="insuredCardType" name="insuredList[0].insuredIdcardType" class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0" selected="selected">身份证</option>
                                    <option value="1">护照</option>
                                    <option value="2">军官证</option>
                                    <option value="7">出生医学证</option>
                                    <option value="4">户口簿</option>
                                    <option value="F">港、澳、台居民来往内地通行证</option>
                                    <option value="8">外国人永久居留身份证</option>
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
                                <span class="errorMsg" ></span>
                        </dl>
                        <dl class="clearfix infoDl borBot1 dlSec">
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
                        <dl class="clearfix infoDl borBot1 dlSec yingchang4" style="display:none">
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
                        <dl class="clearfix infoDl borBot1 dlSec xingbie2" style="display:none">
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
                        <dl class="clearfix infoDl borBot1 dlSec">
                            <dt class="w35 l-float">职业</dt>
                            <dd class="w65 l-float txtR hasArrow">
                                <!-- 
                                <input type="text" id="occupation_dummy" class="tmp" placeholder="" readonly="" style="color: rgb(153, 153, 153);">
                                 -->
                                <select id="occupation" name="insuredList[0].insuredOccupation3" class="occupation txtR personInfo dw-hsel" tabindex="-1">
                                    <option value="">请选择</option>
                                    <option value="2099908">学龄前儿童</option>
                                    <option value="2099907">一般学生</option>
                                </select>
                                <i class="arrow"></i>
                            </dd>
                            <span class="errorMsg"></span>
                        </dl>
                    </div>
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
 <!--受益人信息-->
            <section class="infoList">
                <p class="ml">受益人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl borBot1 dlSec">
                        <dt class="w35 l-float">受益人</dt>
                        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                            <input type="text" class="textfield txtR personInfo" readonly value="法定收益人">
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                </div>
            </section> 
<!--责任信息-->
            
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
                                <option value="104">中国银行</option>    
                                <option value="105">建设银行</option>
                                <option value="302">中信银行</option>
                                <option value="303">光大银行</option>
                                <option value="305">民生银行</option>
                                <option value="306">广东发展银行</option>
                                <option value="308">招商银行</option>
                                <option value="309">兴业银行</option>
                                <option value="310">上海浦东发展银行</option>
                                <option value="403">邮政储蓄银行</option>
                                                            
                            </select>
                            <i class="arrow"></i>
                        </dd>
                        <span class="errorMsg"></span>
                    </dl>
                   <dl class="clearfix infoDl borBot1 dlSec">
                	<dt class="w35 l-float">开户城市</dt>
                    <dd class="w65 l-float txtR hasArrow">
                  	<input type="hidden" name="" id="" value="2">
                    <input type="hidden" class="personInfo" id="bankProvince" name="applicant.bankProvince" value="">
                    <input type="hidden" class="personInfo" id="bankCity" name="applicant.bankCity" value="">
                   <!--  <input type="hidden" class="personInfo" id="appntCounty" name="applicant.appntCounty" value=""> -->
                    <input type="text" class="chosen txtR pr" readonly="" placeholder="请选择" id="bankArea" value="">
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
            </section>  
			<section class="infoList">
		        <div class="ml whetherRead">
		            <i id="whetherCheck" class="checkBox"></i>
		            <span >我已查看并同意<a href="<%=request.getContextPath()%>/contract/xintai/jkwy/zhongji_clauses.pdf">《健康无忧重疾险产品条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/xintai/jkwy/liangquan_clauses.pdf">《健康无忧两全险产品条款》</a>
		            <a href="<%=request.getContextPath()%>/contract/xintai/jkwy/tbxz.pdf">《投保须知》</a>
		            <a href="<%=request.getContextPath()%>/contract/xintai/jkwy/tbtss.pdf">《投保提示书》</a>
		            <a href="<%=request.getContextPath()%>/contract/xintai/jkwy/smysq.pdf">《声明与授权》</a>
		            <a href="<%=request.getContextPath()%>/contract/hengqin/taxResident.html" >《中国税收居民声明》</a>
		            	和<a href="<%=request.getContextPath()%>/contract/xintai/jkwy/khgzs.pdf" >《客户告知书》</a></span>
		        </div>
		    </section>
        </form>
        <!--投保按钮-->
        <div class="pl bgColor fixedBox w100">
            <dl class="clearfix infoDl w100">
				<dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
	            	<%-- 保费：<input type="text" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}"> --%>
	            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				    <span readonly="" class="insurePrice" id="insurePrice" ></span><span>元/年</span>
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
    <%@ include file="/WEB-INF/common/insure_include.jsp"%>
</body>
</html>