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
            calPrice();
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
    $("#idNo").on("blur", function () 
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
    
    //手机号码校验
    $("#tel").on("blur", function () {
        checkTel($(this));
        $("#insuredMobile").siblings(".mySelf").val($(this).val());
    });
    
    //姓名校验
    $("#insuredName").on("blur", function () {
        checkName($(this));
    });
    
    //手机号码校验
    $("#insuredMobile").on("blur", function () {
        checkTel($(this));
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
    
    //第二被保险人校验
    //姓名校验
    $("#insuredName02").on("blur", function () {
        checkName($(this));
    });
    
    //手机号码校验
    $("#insuredMobile02").on("blur", function () {
        checkTel($(this));
    });
    
    $("#insuredIdNo02").change(function()
    {
      	$(this).val($(this).val().toUpperCase());
      	if($("#insuredCardType02").find("option:selected").text() == "身份证")
      	{
        	checkID($(this));
    	    if (checkID($(this))) 
    	    {
	    	    //带出生日和性别
	    	    $("#insuredBirthday02").val(getBirthdayByIDCard($(this).val().trim()));
	    	    $("#insuredSex02").val(getSexByIDCard($(this).val().trim()));
	    	} 
    	    else
    	    {
    	    	//身份证错误时清空生日和性别
    	        $("#insuredBirthday02").val("");
    	        $("#insuredSex02").val("");
    	        return;
    	    }
    	}
    });
    
    //第三被保险人校验
    //姓名校验
    $("#insuredName03").on("blur", function () {
        checkName($(this));
    });
    
    //手机号码校验
    $("#insuredMobile03").on("blur", function () {
        checkTel($(this));
    });
    
    $("#insuredIdNo03").change(function()
    {
      	$(this).val($(this).val().toUpperCase());
      	if($("#insuredCardType03").find("option:selected").text() == "身份证")
      	{
        	checkID($(this));
    	    if (checkID($(this))) 
    	    {
	    	    //带出生日和性别
	    	    $("#insuredBirthday03").val(getBirthdayByIDCard($(this).val().trim()));
	    	    $("#insuredSex03").val(getSexByIDCard($(this).val().trim()));
	    	} 
    	    else
    	    {
    	    	//身份证错误时清空生日和性别
    	        $("#insuredBirthday03").val("");
    	        $("#insuredSex03").val("");
    	        return;
    	    }
    	}
    });
	
    //第四被保险人校验
    //姓名校验
    $("#insuredName04").on("blur", function () {
        checkName($(this));
    });
    
    //手机号码校验
    $("#insuredMobile04").on("blur", function () {
        checkTel($(this));
    });
    
    $("#insuredIdNo04").change(function()
    {
      	$(this).val($(this).val().toUpperCase());
      	if($("#insuredCardType04").find("option:selected").text() == "身份证")
      	{
        	checkID($(this));
    	    if (checkID($(this))) 
    	    {
	    	    //带出生日和性别
	    	    $("#insuredBirthday04").val(getBirthdayByIDCard($(this).val().trim()));
	    	    $("#insuredSex04").val(getSexByIDCard($(this).val().trim()));
	    	} 
    	    else
    	    {
    	    	//身份证错误时清空生日和性别
    	        $("#insuredBirthday04").val("");
    	        $("#insuredSex04").val("");
    	        return;
    	    }
    	}
    });
    
	
	$("#sureToSave").click(function() 
	{
    	if(!checkAll()) return;
    	
    	sendRequest("../../life/zhongan/newcontract_save.do",getData(),function (data) 
    	{
        	console.log(data);
        	var obj = JSON.parse(data);
        	
        	if(obj.code == 0)
        	{
        		var orderNo = obj.orderNo;
        		console.log(orderNo);
        		
        		window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx37a5a6ceced4f359&redirect_uri=http://insure.meihualife.com/life/zhongan/contractpay.do&response_type=code&scope=snsapi_base&state="+orderNo+"#wechat_redirect"
        		
        		//window.location.href = "../../life/zhongan/contractpay.do?orderNo="+orderNo;
            }
        	else
        	{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){});
	})
	
	$("#onelevel").change(function()
    {
		distwolevel("onelevel","twolevel","threelevel");
		
    })
    
    $("#onelevel02").change(function()
    {
		distwolevel("onelevel02","twolevel02","threelevel02");
		
    })
    
    $("#onelevel03").change(function()
    {
		distwolevel("onelevel03","twolevel03","threelevel03");
		
    })
    
    $("#onelevel04").change(function()
    {
		distwolevel("onelevel04","twolevel04","threelevel04");
		
    })
    
    $("#twolevel").change(function()
    {
    	disthreelevel("twolevel","threelevel");
    })
    
    $("#twolevel02").change(function()
    {
    	disthreelevel("twolevel02","threelevel02");
    })
    
    $("#twolevel03").change(function()
    {
    	disthreelevel("twolevel03","threelevel03");
    })
    
    $("#twolevel04").change(function()
    {
    	disthreelevel("twolevel04","threelevel04");
    })
    
    $("#threelevel").change(function()
    {
    	$("#threelevel_dummy").val($("#threelevel").find("option:selected").text());
    	$("#threelevel").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    })
    
    $("#threelevel02").change(function()
    {
    	$("#threelevel02_dummy").val($("#threelevel02").find("option:selected").text());
    	$("#threelevel02").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    })
    
    $("#threelevel03").change(function()
    {
    	$("#threelevel03_dummy").val($("#threelevel03").find("option:selected").text());
    	$("#threelevel03").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    })
    
    $("#threelevel04").change(function()
    {
    	$("#threelevel04_dummy").val($("#threelevel04").find("option:selected").text());
    	$("#threelevel04").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    });
    
    $("#insplan").change(function()
    {
    	var prem = ywpriceCanShu($("#productNo").val(),$("#insplan").val(),$("#isextend").val());
    	
    	$("#insurePrice").html(Number(prem).toFixed(2));
    });
    
    $("#isextend").change(function()
    {
    	var prem = ywpriceCanShu($("#productNo").val(),$("#insplan").val(),$("#isextend").val());
    	
    	$("#insurePrice").html(Number(prem).toFixed(2));
    });
});

/*
function ywprice()
{
	if($("#productNo").val()=="zhongan_jtyw3")
	{
		if($("#insplan").val()=="silver")
		{
			if($("#isextend").val()=="Y")
			{
				$("#insurePrice").html("398.00");
			}
			else if($("#isextend").val()=="N")
			{
				$("#insurePrice").html("365.00");
			}
		}
		else if($("#insplan").val()=="gold")
		{
			if($("#isextend").val()=="Y")
			{
				$("#insurePrice").html("988.00");
			}
			else if($("#isextend").val()=="N")
			{
				$("#insurePrice").html("915.00");
			}
		}
		else if($("#insplan").val()=="diamond")
		{
			if($("#isextend").val()=="Y")
			{
				$("#insurePrice").html("1988.00");
			}
			else if($("#isextend").val()=="N")
			{
				$("#insurePrice").html("1815.00");
			}
		}
	}
	else if($("#productNo").val()=="zhongan_jtyw4")
	{
		if($("#insplan").val()=="silver")
		{
			if($("#isextend").val()=="Y")
			{
				$("#insurePrice").html("518.00");
			}
			else if($("#isextend").val()=="N")
			{
				$("#insurePrice").html("495.00");
			}
		}
		else if($("#insplan").val()=="gold")
		{
			if($("#isextend").val()=="Y")
			{
				$("#insurePrice").html("1288.00");
			}
			else if($("#isextend").val()=="N")
			{
				$("#insurePrice").html("1215.00");
			}
		}
		else if($("#insplan").val()=="diamond")
		{
			if($("#isextend").val()=="Y")
			{
				$("#insurePrice").html("2588.00");
			}
			else if($("#isextend").val()=="N")
			{
				$("#insurePrice").html("2415.00");
			}
		}
	}
}
*/

function ywpriceCanShu(productno,insplan,isextend)
{
	if(productno=="zhongan_jtyw3")
	{
		if(insplan=="silver")
		{
			if(isextend=="Y")
			{
				return "398.00";
			}
			else if(isextend=="N")
			{
				return "365.00";
			}
		}
		else if(insplan=="gold")
		{
			if(isextend=="Y")
			{
				return "988.00";
			}
			else if(isextend=="N")
			{
				return "915.00";
			}
		}
		else if(insplan=="diamond")
		{
			if(isextend=="Y")
			{
				return "1988.00";
			}
			else if(isextend=="N")
			{
				return "1815.00";
			}
		}
	}
	else if(productno=="zhongan_jtyw4")
	{
		if(insplan=="silver")
		{
			if(isextend=="Y")
			{
				return "518.00";
			}
			else if(isextend=="N")
			{
				return "495.00";
			}
		}
		else if(insplan=="gold")
		{
			if(isextend=="Y")
			{
				return "1288.00";
			}
			else if(isextend=="N")
			{
				return "1215.00";
			}
		}
		else if(insplan=="diamond")
		{
			if(isextend=="Y")
			{
				return "2588.00";
			}
			else if(isextend=="N")
			{
				return "2415.00";
			}
		}
	}
}

function calPrice()
{
	
}

function distwolevel(onelevel,twolevel,threelevel)
{
	sendRequest("../../life/zhongan/get_twolevel.do",{"onelevel":$("#"+onelevel+"").find("option:selected").val()},function (data) 
	{
	   	console.log(data);
	   	var obj = JSON.parse(data);
	   	if(obj.code == 0)
	   	{
	   		$("#"+twolevel+"").html('');
	   		
	   		$("#"+threelevel+"").html('')
	   		$("#"+threelevel+"").val('');
	   		$("#"+threelevel+"_dummy").val($("#"+threelevel+"").find("option:selected").text());
	   		
	   		for(var i=0;i<obj.twoList.length;i++)
	   		{
	   			$("#"+twolevel+"").append("<option value='"+obj.twoList[i]+"'>"+obj.twoList[i]+"</option>");
	   		}
	       		
	   		$("#"+twolevel+"").val(obj.twoList[0]);
	   		$("#"+twolevel+"_dummy").val($("#"+twolevel+"").find("option:selected").text());
	    }
	   	else
	   	{
	       	$(".pop").show();
	       	$(".mask").show();
	       	$(".pop span").text("网络出错！");
	    }
	},function(){});
}

function disthreelevel(twolevel,threelevel)
{
	$("#"+twolevel+"_dummy").val($("#"+twolevel+"").find("option:selected").text());
	
	sendRequest("../../life/zhongan/get_threelevel.do",{"twolevel":$("#"+twolevel+"").find("option:selected").val()},function (data) 
	{
	   	console.log(data);
	   	var obj = JSON.parse(data);
	   	if(obj.code == 0)
	   	{
	   		$("#"+threelevel+"").html('');
	     		
	   		for(var i=0;i<obj.threeList.length;i++)
	   		{
	   			$("#"+threelevel+"").append("<option value='"+obj.threeList[i].jobcode+"'>"+obj.threeList[i].jobname+"</option>");
	   		}
	        		
	   		$("#"+threelevel+"").val(obj.threeList[0].jobcode);
	   		$("#"+threelevel+"_dummy").val($("#"+threelevel+"").find("option:selected").text());
	   		
	   		$("#"+threelevel+"").parent().siblings(".errorMsg").css("display", "inline-block").text("");
	    }
	  	else
	  	{
	       	$(".pop").show();
	       	$(".mask").show();
	       	$(".pop span").text("网络出错！");
	    }
	},function(){});
}

function checkAll()
{
	var flag = true;
	
	if ($("#threelevel").find("option:selected").val()== null || $("#threelevel").find("option:selected").val() == "") 
    {
        $("#threelevel").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业!");
        flag = false;
    }
	
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
	
    //手机号码校验
    if ($("#tel").length>0) {
    	if (!checkTel($("#tel"))) {
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
            
            //手机号码校验
            if ($("#insuredMobile").length>0) {
                if (!checkTel($("#insuredMobile"))) {
                    flag = false;
                }
            }
        }
    }
    
    //第二被保险人人
    if ($("#insuredName02").length>0) 
	{
    	if ($("#threelevel02").find("option:selected").val()== null || $("#threelevel02").find("option:selected").val() == "") 
        {
            $("#threelevel02").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业!");
            flag = false;
        }
    	
        if (!checkName($("#insuredName02"))) 
        {
            flag = false;
        }
    }
    
    //证件号码校验
    if ($("#insuredIdNo02").length>0) {
        if (!($("#insuredCardType02").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo02")) : checkOtherId($("#insuredIdNo02")))) {
            flag = false;
        }
    }
    
    //手机号码校验
    if ($("#insuredMobile02").length>0) {
        if (!checkTel($("#insuredMobile02"))) {
            flag = false;
        }
    }
    
    //第三被保险人人
    if ($("#insuredName03").length>0) 
	{
    	if ($("#threelevel03").find("option:selected").val()== null || $("#threelevel03").find("option:selected").val() == "") 
        {
            $("#threelevel03").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业!");
            flag = false;
        }
    	
        if (!checkName($("#insuredName03"))) 
        {
            flag = false;
        }
    }
    
    //证件号码校验
    if ($("#insuredIdNo03").length>0) {
        if (!($("#insuredCardType03").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo03")) : checkOtherId($("#insuredIdNo03")))) {
            flag = false;
        }
    }
    
    //手机号码校验
    if ($("#insuredMobile03").length>0) {
        if (!checkTel($("#insuredMobile03"))) {
            flag = false;
        }
    }
    
    //第四被保险人人
    if ($("#insuredName04").length>0) 
	{
    	if ($("#threelevel04").find("option:selected").val()== null || $("#threelevel04").find("option:selected").val() == "") 
        {
            $("#threelevel04").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业!");
            flag = false;
        }
    	
        if (!checkName($("#insuredName04"))) 
        {
            flag = false;
        }
    }
    
    //证件号码校验
    if ($("#insuredIdNo04").length>0) {
        if (!($("#insuredCardType04").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo04")) : checkOtherId($("#insuredIdNo04")))) {
            flag = false;
        }
    }
    
    //手机号码校验
    if ($("#insuredMobile04").length>0) {
        if (!checkTel($("#insuredMobile04"))) {
            flag = false;
        }
    }
    
    //勾选阅读校验
    if ($("#whetherCheck").length>0) {
	    if (!$("#whetherCheck").hasClass("checkBox")) {
	        $(".pop").show().find("span").text("请阅读并同意相关条款");
	        $(".mask").show();
	        flag = false;
	    }
    }
    
	return flag;
}

//拼接传到后台的信息
function getData()
{    
	var data = 
	{
	};
	
    var oObj = {};
    $(".personInfo").each(function(index, el){
        if(el.tagName == "SELECT"){
            oObj[el.id] = $(this).find("option:selected").val();
        }else if(el.tagName == "INPUT"){
        	if(el.classList.toString().indexOf("occ") > -1){
        		oObj[el.id] = $(this).data("occcode");
        	}else{
                oObj[el.id] = $(this).val();
        	}
        }
    });
    
    var allData = $.extend(data, oObj);
    
    console.log(allData);
    
    return allData;
}

//checkbox选择去掉input盒子下面的边框
/*
$(function(){
	$('#switch').on('click',function(){
		$(this).hasClass('turnOn')?$(this).parents('.dlSec').addClass('bottom-0'):$(this).parents('.dlSec').removeClass('bottom-0')
	})
});
*/