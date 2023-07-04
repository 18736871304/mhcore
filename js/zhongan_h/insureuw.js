var insured_index=2;

$(function ()
{
	//勾选同意
    $("#whetherCheck").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });
	
	$("#switch").on("click", function () 
	{
		if ($(this).hasClass("turnOn")) {
			
        	$(this).removeClass("turnOn").addClass("turnOff").siblings("input").prop("checked",true);
            $("#relation").find("option").each(function(){
            	if ($(this).text() == "本人") {
            		$(this).prop("selected", true).siblings("option").prop("selected",false);
            		$(this).parent().siblings("input").val("本人");
                    $("#insuredCheckbox").val($("#checkbox").val());
            	}
            });
            
            $(".insured").slideDown();
            $("#isSelf").val("0");
            //关闭开关后就将投保人的信息赋给被保人相应项
            $("#insuredName").siblings(".mySelf").val($("#policyName").val());
            $("#insuredCardType").siblings(".mySelf").val($("#cardType").find("option:selected").text());
            $("#insuredIdNo").siblings(".mySelf").val($("#idNo").val());
            
            if ($("#cardType").find("option:selected").text() == "身份证") {
                $(".insuredBirthdayReadonly").siblings(".mySelf").val($(".birthdayReadonly").val());
                $(".insuredSexReadonly").siblings(".mySelf").val($(".sexReadonly").val());
            } else {
                $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
                $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
            }
            
            if ($("#relation").find("option:selected").text() == "本人") {
                $(".insured .mySelf").show().siblings().hide();
                $(".insured .errorMsg").hide();
            } else {
                $(".insured .mySelf").hide().siblings().show();
                if ($("#insuredCardType").find("option:selected").text() == "身份证") {
                    $(".insuredBirthday").hide();
                    $(".insuredBirthdayReadonly").show();
                    $(".insuredSex").hide();
                    $(".insuredSexReadonly").show();
                }else {
                    $(".insuredBirthday").show().css("display", "inline-block");
                    $(".insuredBirthdayReadonly").hide();
                    $(".insuredSex").show();
                    $(".insuredSexReadonly").hide();
                }
            }
        } else {
        	
            $(this).removeClass("turnOff").addClass("turnOn").siblings("input").prop("checked",false);
            $("#insuredCheckbox").val($("#checkbox").val());
            $(".insured").slideUp();
            $("#isSelf").val("1");
        }
    });
	
	$("#relation").on("change", function () 
	{
        if ($("#relation").find("option:selected").text() == "本人") 
        {
            $("#insuredCheckbox").val($("#checkbox").val());
            $(".insured .mySelf").show().siblings().hide();
            $(".insured .errorMsg").hide();
        } 
        else 
        {
            $(".insured .mySelf").hide().siblings().show();
            
            if ($("#insuredCardType").find("option:selected").text() == "身份证") 
            {
                $(".insuredBirthday").hide();
                $(".insuredBirthdayReadonly").show();
                $(".insuredSex").hide();
                $(".insuredSexReadonly").show();
            }
            else 
            {
                $(".insuredBirthday").show().css("display", "inline-block");
                $(".insuredBirthdayReadonly").hide();
                $(".insuredSex").show();
                $(".insuredSexReadonly").hide();
            }
        }
    });
	
	if ($("input[type = radio]").prop("checked")) 
    {
        $("input[type = radio]").siblings("#switch").removeClass("turnOn").addClass("turnOff");
        $(".insured").show();
        if ($("#relation").find("option:selected").text() == "本人") 
        {
            $(".insured .mySelf").show().siblings().hide();
            $(".insured .errorMsg").hide();
            $("#insuredCheckbox").val($("#checkbox").val());
        }
        else 
        {
            $(".insured .mySelf").hide().siblings().show();
            if ($("#insuredCardType").find("option:selected").text() == "身份证") 
            {
                $(".insuredBirthday").hide();
                $(".insuredBirthdayReadonly").show();
                $(".insuredSex").hide();
                $(".insuredSexReadonly").show();
            }
            else 
            {
                $(".insuredBirthday").show().css("display", "inline-block");
                $(".insuredBirthdayReadonly").hide();
                $(".insuredSex").show();
                $(".insuredSexReadonly").hide();
            }
        }
    }
	else 
    {
        $("input[type = radio]").siblings("#switch").removeClass("turnOff").addClass("turnOn");
        $(".insured").hide();
        $("#insuredCheckbox").val($("#checkbox").val());
    }
	
	//证件号码校验
    $("#idNo").on("change", function () 
    {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#cardType").find("option:selected").text() == "身份证") 
        {    
        	if (checkID($(this))) 
            {
                //带出生日和性别
                $(".birthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#birthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".sexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#sex").find("option").eq(0).prop("selected",true):$("#sex").find("option").eq(1).prop("selected",true);
            }
            else 
            {
                //身份证错误时清空生日和性别
                $(".birthdayReadonly").val("");
                $("#birthday").val("");
                $(".sexReadonly").val("");
            }
            $(".insuredBirthdayReadonly").siblings(".mySelf").val($(".birthdayReadonly").val());
            $(".insuredSexReadonly").siblings(".mySelf").val($(".sexReadonly").val());
            //年龄判断
            if ($(".birthdayReadonly").val()== null || $(".birthdayReadonly").val() == "" || getAgeByBirthDay($(".birthdayReadonly").val()) < 18) 
            {
                $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("身份证号不能为空,并且年龄必须满18周岁！");
            }
            else
            {
                $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //护照或其他证件校验
        else {
            $(".birthdayReadonly").val("");
            $(".sexReadonly").val("");
            checkOtherId($(this));
        }
        $("#insuredIdNo").siblings(".mySelf").val($(this).val());
    });
    
    $("#policyName").on("blur", function () 
    {
    	checkName($(this));
        $("#insuredName").siblings(".mySelf").val($(this).val());
    });
    
    //姓名校验
    $("#insuredName").on("blur", function () {
        checkName($(this));
    });
    
    $("#insuredIdNo").change(function()
    {
    	$(this).val($(this).val().toUpperCase());
    	if($("#insuredCardType").find("option:selected").text() == "身份证" && $("#isSelf").val() == 0){
    		checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
                return;
            }
    	}
    });
	
	$("#sureToSave").click(function() 
	{
		if(!checkAll()) return;
		var transData = {"jsonStr":getData()};
    	
    	sendRequest("../../life/zhongan_h/newcontract_uw.do",transData,function (data) 
    	{
        	console.log(data);
        	var obj = JSON.parse(data);
        	
        	if(obj.code == 0)
        	{
        		var orderNo = obj.orderNo;
        		console.log(orderNo);
        		
        		window.location.href = obj.uwurl;
            }
        	else
        	{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){});
	});
	
	$("#addinsured_button").click(function(e) 
	{
		let indexUpper = getIndexUpper(insured_index);
	    let NewSectionContent = _templet.addinsured_template.replace(/{index}/ig, '0'+insured_index)
	                                                        .replace(/{index_num}/ig, insured_index)
	                                                        .replace(/{indexUpper}/ig, indexUpper);
	    let NewSection = $(NewSectionContent);
	    
	    $("#addinsured_div").append(NewSection);
		
	    initSelect($("#relation0"+insured_index));
	    initSelect($("#insuredCardType0"+insured_index));
	    
		insured_index++;
		
		if(insured_index>7)
		{
			$('#addinsured_model').hide();
		}
		else
		{
			$('#addinsured_model').show();
		}
	});
});

function initSelect(selectid)
{
	selectid.scroller('destroy').scroller($.extend({preset: 'select'}, {
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
}


function removeinsured(del_index)
{
	$("#addinsured_list_0"+del_index).remove();
	insured_index--;
	
	for(var i=del_index;i<insured_index;i++)
	{
		let next = i-0+1;
		let indexUpper = getIndexUpper(i);
		
		next_index = '0'+next;
		cur_index = '0'+i
		
		//所有的替换都是先替换方法，再替换id
		//替换汉字的index
		$("#indured_info_"+next_index).html("被保人信息"+indexUpper);
		
		//替换删除按钮方法的index
		$("#shanchu"+next_index).attr("onclick", "removeinsured('"+i+"')");
		
		//替换各种blur校验的index
		$("#insuredName"+next_index).attr("onchange", "checkInsName('"+cur_index+"')");
		$("#insuredIdNo"+next_index).attr("onchange", "checkInsIdno('"+cur_index+"')");
		
		//删除的时候，替换各种id的index
		//替换div的index
		$("#addinsured_list_"+next_index).attr('id', 'addinsured_list_' + cur_index);
		$("#indured_info_"+next_index).attr('id', 'indured_info_' + cur_index);
		
		//替换被保险人信息id的index
		$("#relation"+next_index).attr('id', 'relation' + cur_index);
		$("#insuredName"+next_index).attr('id', 'insuredName' + cur_index);
		$("#insuredCardType"+next_index).attr('id', 'insuredCardType' + cur_index);
		$("#insuredIdNo"+next_index).attr('id', 'insuredIdNo' + cur_index);
		$("#insuredBirthday"+next_index).attr('id', 'insuredBirthday' + cur_index);
		$("#insuredSex"+next_index).attr('id', 'insuredSex' + cur_index);
		
		//替换删除按钮id的index
		$("#shanchu"+next_index).attr('id', 'shanchu' + cur_index);
	}
	
	$('#addinsured_model').show();
}

function checkAll()
{
	var flag = true;
	
	if ($("#policyName").length>0) {
        if (!checkName($("#policyName"))) {
            flag = false;
        }
    }
	
	//证件号码校验
    if ($("#idNo").length>0) {
        if (!($("#cardType").find("option:selected").text() == "身份证" ? checkID($("#idNo")) : checkOtherId($("#idNo")))) {
            flag = false;
        }
    }
    
    if ($("#switch").hasClass("turnOff")) 
    {
        if ($("#relation").find("option:selected").text() != "本人") 
        {
        	if ($("#insuredName").length>0) 
        	{
                if (!checkName($("#insuredName"))) 
                {
                    flag = false;
                }
            }
        	
        	//证件号码校验
            if ($("#insuredIdNo").length>0) {
                if (!($("#insuredCardType").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo")) : checkOtherId($("#insuredIdNo")))) {
                    flag = false;
                }
            }
        }
    }
    
    for(var i=2;i<insured_index;i++)
    {
    	var cur_index = '0'+i;
    	
    	if ($("#insuredName"+cur_index).length>0) 
    	{
        	if (!checkName($("#insuredName"+cur_index))) 
            {
                flag = false;
            }
        }
        
        //证件号码校验
        if ($("#insuredIdNo"+cur_index).length>0) {
            if (!($("#insuredCardType"+cur_index).find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo"+cur_index)) : checkOtherId($("#insuredIdNo"+cur_index)))) {
                flag = false;
            }
        }
    }
    
	return flag;
}

//拼接传到后台的信息
function getData()
{
	var jsonStr = '{"appntinfo":{"appname":"'+$("#policyName").val()+'","appcardno":"'+$("#idNo").val()+'","appcardtype":"0",'
	                          +'"appbirthday":"'+$("#birthday").val()+'","appsex":"'+$("#sex").find("option:selected").val()+'"},'
	            +'"sumprem":"'+$("#sumprem").val()+'",'
                +'"insuredinfo":['
    
    if($("#relation").find("option:selected").val()=='00')
    {
    	var insage = getAgeByBirthDay($("#birthday").val());
    	
    	jsonStr = jsonStr + '{"insrealtion":"'+$("#relation").find("option:selected").val()+'","insname":"'+$("#policyName").val()+'","inscardno":"'+$("#idNo").val()+'","inscardtype":"0",'
        				+ '"insbirthday":"'+$("#birthday").val()+'","inssex":"'+$("#sex").find("option:selected").val()+'","age":"'+insage+'"'
        				+ '},'
    }
    else
    {
    	var insage = getAgeByBirthDay($("#insuredBirthday").val());
    	
    	jsonStr = jsonStr + '{"insrealtion":"'+$("#relation").find("option:selected").val()+'","insname":"'+$("#insuredName").val()+'","inscardno":"'+$("#insuredIdNo").val()+'","inscardtype":"0",'
        		        + '"insbirthday":"'+$("#insuredBirthday").val()+'","inssex":"'+$("#insuredSex").find("option:selected").val()+'","age":"'+insage+'"'
        		        + '},'
    }
                
    for(var i=2;i<insured_index;i++)
    {
    	var cur_index = '0'+i;
    	
    	var insage = getAgeByBirthDay($("#insuredBirthday"+cur_index).val());
    	
    	jsonStr = jsonStr + '{"insrealtion":"'+$("#relation"+cur_index).find("option:selected").val()+'","insname":"'+$("#insuredName"+cur_index).val()+'","inscardno":"'+$("#insuredIdNo"+cur_index).val()+'","inscardtype":"0",'
    	                + '"insbirthday":"'+$("#insuredBirthday"+cur_index).val()+'","inssex":"'+$("#insuredSex"+cur_index).val()+'","age":"'+insage+'"'
    	                + '}'
                        
        if(i!=insured_index-1)
        {
        	jsonStr = jsonStr + ',';
        }
    }
                
    jsonStr = jsonStr +']}';
    
	//alert(jsonStr);
	//console.log(jsonStr);
	
    return jsonStr;
}

function getIndexUpper(index) {
    return {
        '1': '一',
        '2': '二',
        '3': '三',
        '4': '四',
        '5': '五',
        '6': '六',
        '7': '七',
        '8': '八',
        '9': '九',
        '10': '十'
    }[index + ''] || '更多';
};

function checkInsName(name_index)
{
	 checkName($("#insuredName"+name_index));
}

function checkInsMobile(mobile_index)
{
	checkTel($("#insuredMobile"+mobile_index));
}

function checkInsIdno(idno_index)
{
	$("#insuredIdNo"+idno_index).val($("#insuredIdNo"+idno_index).val().toUpperCase());
  	if($("#insuredCardType"+idno_index).find("option:selected").text() == "身份证")
  	{
    	//checkID($(this));
	    if (checkID($("#insuredIdNo"+idno_index))) 
	    {
    	    //带出生日和性别
    	    $("#insuredBirthday"+idno_index).val(getBirthdayByIDCard($("#insuredIdNo"+idno_index).val().trim()));
    	    $("#insuredSex"+idno_index).val(getSexByIDCard($("#insuredIdNo"+idno_index).val().trim()));
    	} 
	    else
	    {
	    	//身份证错误时清空生日和性别
	        $("#insuredBirthday"+idno_index).val("");
	        $("#insuredSex"+idno_index).val("");
	        return;
	    }
	}
}

const _templet = {
addinsured_template:`
<section class="infoList addinsured_list" id = "addinsured_list_{index}">
<p class="ml" id="indured_info_{index}">被保人信息{indexUpper}</p>
<div class="infoSec pl pr bgColor borTop1 borBot1">
<dl class="clearfix infoDl borTop1 dlSec">
            <dt class="w55 l-float">投保人是被保人的</dt>
            <dd class="w40 l-float txtR pr hasArrow">
                <select id="relation{index}" name="" class="cardType txtR personInfo getPrice dw-hsel insured_realtion" tabindex="-1">
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
                <input type="text" class="textfield txtR personInfo insured_name" id="insuredName{index}" onchange = "checkInsName('{index}');" value="" placeholder="请输入被保人姓名">
            </dd>
                <span class="errorMsg"></span>
        </dl>
        <dl class="clearfix infoDl borTop1 dlSec">
            <dt class="w55 l-float">证件类型</dt>
            <dd class="w40 l-float txtR pr hasArrow">
                <select id="insuredCardType{index}" class="cardType txtR personInfo dw-hsel insured_cardtype" tabindex="-1">
                    <option value="0">身份证</option>
                </select>
                <i class="arrow"></i> 
            </dd>
                <span class="errorMsg"></span>
        </dl>
        
        <dl class="clearfix infoDl borTop1 dlSec">
	        <dt class="w35 l-float">证件号码</dt>
	        <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	            <input type="text" class="textfield txtR personInfo idNo_compare insured_cardno" id="insuredIdNo{index}" onchange = "checkInsIdno('{index}');" value="" placeholder="请输入证件号码">
	        </dd>
	            <span class="errorMsg"></span>
	    </dl>
        
        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
            <dt class="w35 l-float">出生日期</dt>
            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                <input type="text" class="textfield txtR personInfo insured_birtyday" id="insuredBirthday{index}" readonly value="" placeholder="请输入出生日期">
            </dd>
            <span class="errorMsg"></span>
        </dl>
        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
            <dt class="w55 l-float">性别</dt>
            <dd class="w40 l-float txtR pr" style="box-sizing: border-box;">
                <input type="text" class="textfield txtR personInfo insured_sex" id="insuredSex{index}" readonly value="" placeholder="请输入性别">
            </dd>
            <span class="errorMsg"></span>
        </dl>
</div>
<div class="clearfix infoDl dingwei fl">
      <div class="shanchu" id="shanchu{index}" onclick = "removeinsured('{index_num}')"; style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                        
</div>
</section>`
}