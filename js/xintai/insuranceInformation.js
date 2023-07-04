$(function () 
{
	 $("#LifetimeOrRegularasis01").on("click", function (){
    	insuyearChange();
    });
    
	//下拉选择样式
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
	$("select.appntOccupation").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text() == "请选择") {
	                $(this).siblings(".tmp").css("color","#999999");
	                $(".occupationReadonly").val("");
	            } else {
	                $(this).siblings(".tmp").css("color","#222222");
	                $(".occupationReadonly").val($(this).find("option:selected").text());
	                $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	            }
	        }
	    }));
	    if ($(this).find("option:selected").text() == "请选择") {
	        $(this).siblings(".tmp").css("color","#999999");
	    } else {
	        $(this).siblings(".tmp").css("color","#222222");
	    }
	});
	$("select.occupation").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text() != "请选择") {
	                $(this).siblings(".tmp").css("color","#222222");
	                $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	            }else {
	                $(this).siblings(".tmp").css("color","#999999");
	            }
	        }
	    }));
	    if ($(this).find("option:selected").text() != "请选择") {
	        $(this).siblings(".tmp").css("color","#222222");
	    }else {
	        $(this).siblings(".tmp").css("color","#999999");
	    }
	});
    //保障项目/额度显示隐藏
    /*$("#guarantee>p").on("click", function () {
        if ($(this).hasClass("hideGuarantee")) {
            $(this).siblings("div").show();
            $(this).removeClass("hideGuarantee").addClass("showGuarantee");
        } else {
            $(this).siblings("div").slideUp();
            $(this).removeClass("showGuarantee").addClass("hideGuarantee");
        }
        $("html body").animate({"scrollTop":$(this).offset().top+"px"},"swing");
    })*/
    
    //地区
    setTimeout(function(){
    	getArea("appntArea");
	    getArea("insuredArea");
	    getCity("bankArea");//新加
    },0);
    
    //改变银行发送数据
    $("#accountBank").change(function(){
        //$("#bankArea").val("");
        if($(this).find("option:selected").text() == "请选择"){
    		return;
    	};
    });
    //默认一加载就判断显示哪个
    if ($("#cardType").find("option:selected").text() == "身份证") {
        $(".birthday").hide();
        $(".birthdayReadonly").show();
        $(".sex").hide();
        $(".sexReadonly").show();
    } else {
        $(".birthday").show().css("display", "inline-block");
        $(".birthdayReadonly").hide();
        $(".sex").show().css("display", "inline-block");
        $(".sexReadonly").hide();
    }
    
    $("input[type = checkbox]").each(function () {
        if ($(this).prop("checked")) {
        	$(this).val("on");
            $(this).removeClass("unCheckBox").addClass("checkBox");
            $(this).parent().siblings("span").find("input[type = text]").hide();
        } else {
        	$(this).val("off");
            $(this).removeClass("checkBox").addClass("unCheckBox");
            $(this).parent().siblings("span").find("input[type = text]").show();
        }
    });
    
    $("#cardType").change(function(){
		if ($("#cardType").find("option:selected").text() == "身份证") {
			$(".yingchang1").show();
			$(".yingchang2").hide();
			$(".sex").hide();
			$(".xingbie").hide();
			
		}else{
			$(".yingchang2").show();
			$(".yingchang1").hide();
			$(".sex").show().css("display", "inline-block");
			$(".xingbie").show();
		}
		
    });
    
    if ($("input[type = radio]").prop("checked")) 
    {
        $("input[type = radio]").siblings("#switch").removeClass("turnOn").addClass("turnOff");
        $(".insured").show();
        if ($("#relation").find("option:selected").text() == "本人") {
            $(".insured .mySelf").show().siblings().hide();
            $(".insured .errorMsg").hide();
            $("#insuredCheckbox").val($("#checkbox").val());
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
        $("input[type = radio]").siblings("#switch").removeClass("turnOff").addClass("turnOn");
        $(".insured").hide();
        $("#insuredCheckbox").val($("#checkbox").val());
    }
    
    $("#scrollTop>div>dl .occupationReadonly").hide();
    $("#scrollTop>div>dl .mySelf").hide();
    
    //投保人被保人证件有效期是否长期--切换
    $("input[type = checkbox]").each(function () {
        $(this).on("click", function () {
            if ($(this).hasClass("unCheckBox")) {
            	$(this).val("on");
                $(this).removeClass("unCheckBox").addClass("checkBox").prop("checked",true);
                $(this).parent().siblings("span").find("input[type = text]").hide().val("");
                $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            } else {
            	$(this).val("off");
                $(this).removeClass("checkBox").addClass("unCheckBox").prop("checked",false);
                $(this).parent().siblings("span").find("input[type = text]").show();
                $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
            }
        });
    });
    //投被保人是否一致的按钮控制
    $("#switch").on("click", function () {
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
            $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
            $("#insuredAddress").siblings(".mySelf").val($("#address").val());
            $("#insuredZipCode").siblings(".mySelf").val($("#postalCode").val());
            $("#insuredMobile").siblings(".mySelf").val($("#tel").val());
            $("#insuredEmail").siblings(".mySelf").val($("#email").val());
            if ($(".appntOccupation").length > 0) {
            	if ($(".appntOccupation")[0].tagName == "INPUT"){
                    if ($(".appntOccupation").val() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").val());
                    }
                } else if ($(".appntOccupation")[0].tagName == "SELECT") {
                    if ($(".appntOccupation").find("option:selected").text() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").find("option:selected").text());
                    }
                }
            }
            if ($("#checkbox").hasClass("checkBox")) {
                $("#insuredCheckbox").parent().siblings(".mySelf").val($("#checkbox").parent().siblings("span").find("label").text());
            } else {
                $("#insuredCheckbox").parent().siblings(".mySelf").val($("#idDate").val());
            }
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
    //勾选同意
    $("#whetherCheck").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });
    
    $("#insuredCardType").change(function(){
		if ($("#insuredCardType").find("option:selected").text() == "身份证") {
			$(".yingchang4").hide();
			$(".yingchang3").show();
			$(".xingbie2").hide();
		}else{
			$(".yingchang4").show();
			$(".yingchang3").hide();
			$(".xingbie2").show();
		}
		
    });
   
    //当被保人为本人时，相应信息显示并只读,否则显示输入框
    $("#relation").on("change", function () {
        if ($("#relation").find("option:selected").text() == "本人") {
            $("#insuredCheckbox").val($("#checkbox").val());
            $(".insured .mySelf").show().siblings().hide();
            $(".insured .errorMsg").hide();
            if ($(".appntOccupation").length > 0) {
            	if ($(".appntOccupation")[0].tagName == "INPUT"){
                    if ($(".appntOccupation").val() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").val());
                    }
                } else if ($(".appntOccupation")[0].tagName == "SELECT") {
                    if ($(".appntOccupation").find("option:selected").text() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").find("option:selected").text());
                    }
                }
            }
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
            if ($("#insuredCheckbox").hasClass("unCheckBox")) {
            	$("#insuredCheckbox").val("off");
            }else{

            	$("#insuredCheckbox").val("on");
            }
        }
    });
    //被保人为本人时，改变输入框状态将投保人信息赋值给被保人对应项
    $("#cardType").on("change", function () {
        $("#birthday").val("");
        $("#idNo").focus();
        //清空年龄的错误信息提示
        $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        $("#insuredCardType").siblings(".mySelf").val($(this).find("option:selected").text());
        if ($("#cardType").find("option:selected").text() == "身份证") {
            $(".insuredBirthdayReadonly").siblings(".mySelf").val($(".birthdayReadonly").val());
            $(".insuredSexReadonly").siblings(".mySelf").val($(".sexReadonly").val());
        } else {
            $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
            $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
        }
    });
    $("#idDate").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        $("#insuredCheckbox").parent().siblings(".mySelf").val($(this).val());
    });
    $("#checkbox").on("click", function () {
        if ($(this).hasClass("checkBox")) {
            $("#insuredCheckbox").parent().siblings(".mySelf").val($(this).parent().siblings("span").find("label").text());

            if ($("#switch").hasClass("turnOn")) {
            	$("#insuredCheckbox").val("on");
            }else if ($("#relation").find("option:selected").text() == "本人") {
            	$("#insuredCheckbox").val("on");
            }else if ($("#insuredCheckbox").hasClass("unCheckBox")) {
            	$("#insuredCheckbox").val("off");
            }else {
            	$("#insuredCheckbox").val("on");
            }
            
        } else {
            $("#insuredCheckbox").parent().siblings(".mySelf").val($("#idDate").val());
            if ($("#switch").hasClass("turnOn")) {
            	$("#insuredCheckbox").val("off");
            }else if ($("#relation").find("option:selected").text() == "本人") {
            	$("#insuredCheckbox").val("off");
            }else if ($("#insuredCheckbox").hasClass("unCheckBox")) {
            	$("#insuredCheckbox").val("off");
            }else {
            	$("#insuredCheckbox").val("on");
            }
        }
        
    });
    $("#birthday").on("change", function () {
        //年龄判断
        if (getAgeByBirthDay($("#birthday").val()) < 18) {
            $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
        } else {
            $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
    });
    $("#sex").on("change", function () {
        $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
    });
    //改变下拉状态，错误提示信息消失
    $("#insuredIdDate").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#insuredBirthday").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#appntArea").on("touchend", function () {
        $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#insuredArea").on("touchend", function () {
        $("#insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#accountBank").on("change", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    
    $("#bankArea").on("touchend",function(){
        $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
   });

    //改变证件类型，焦点移到证件号码输入框
    $("#insuredCardType").on("change", function () {
        $("#insuredBirthday").val("");
        $("#insuredIdNo").focus();
    });
    //点击确定，弹窗消失
    $(".pop-sure").on("click", function () {
        $(".pop").hide();
        $(".mask").hide();
    });
    
    /***************************投保人信息校验**************************/
    $(".numInput").on("blur",function(){
    	checkNum($(this));
    });
    
    /***************************投保人信息校验**************************/
        //姓名校验
    $("#policyName").on("blur", function () 
    {
        checkName($(this));
        if (checkName($(this))) 
        {
            $("#accountName").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        else 
        {
            $("#accountName").val("");
        }
        $("#insuredName").siblings(".mySelf").val($(this).val());
    });
    //证件号码校验
    $("#idNo").on("blur", function () 
    {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#cardType").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) 
            {
                //带出生日和性别
                $(".birthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#birthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".sexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#sex").find("option").eq(0).prop("selected",true):$("#sex").find("option").eq(1).prop("selected",true);
              //年龄判断
                if (getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
                    $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                    return;
                } else {
                    $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
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
        }
        //护照或其他证件校验
        else {
            $(".birthdayReadonly").val("");
            $(".sexReadonly").val("");
            checkOtherId($(this));
        }
        $("#insuredIdNo").siblings(".mySelf").val($(this).val());
    });
    //手机号码校验
    $("#tel").on("blur", function () {
        checkTel($(this));
        $("#insuredMobile").siblings(".mySelf").val($(this).val());
    });
    //电子邮箱校验
    $("#email").on("blur", function () {
        checkEmail($(this));
        $("#insuredEmail").siblings(".mySelf").val($(this).val());
    });
    //详细地址校验
    $("#address").on("blur", function () {
        checkAddress($(this));
        $("#insuredAddress").siblings(".mySelf").val($(this).val());
    });
    //邮政编码校验
    $("#postalCode").on("blur", function () {
        checkPostalCode($(this));
        $("#insuredZipCode").siblings(".mySelf").val($(this).val());
    });

    /***************************被保人信息校验**************************/
        //姓名校验
    $("#insuredName").on("blur", function () {
        checkName($(this));
    });
    //证件号码校验
    $("#insuredIdNo").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday").val()) > 55 || getDayByBirthDay($("#insuredBirthday").val()) < 28) {
                    $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("证件号不能为空，且需在投保年龄范围");
                    return;
                }else if($("#relation").val() != "00" && getAgeByBirthDay($("#insuredBirthday").val()) > 17){
               	 $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("如果被保人是成年人 投被保人必须一致");
               	 return;
                } else {
                	$("#insuredIdNo").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly").val("");
            $(".insuredSexReadonly").val("");
            checkOtherId($(this));
        }
    });
    //身高校验
    $("#height").on("blur", function () {
        checkHeight($(this));
    });
    //体重校验
    $("#weight").on("blur", function () {
        checkWeight($(this));
    });
    //详细地址校验
    $("#insuredAddress").on("blur", function () {
        checkAddress($(this));
    });
    //邮政编码校验
    $("#insuredZipCode").on("blur", function () {
        checkPostalCode($(this));
    });
    //手机号码校验
    $("#insuredMobile").on("blur", function () {
        checkTel($(this));
    });
    /***************************续缴账户信息校验**************************/
        //开户名校验
    /*$("#accountName").on("blur", function () {
        checkName($(this));
    });*/
    //银行卡号校验
    $("#cardNo").on("blur", function () {
        checkCardNo($(this));
        calPrice();
    });
    
    //再次输入银行卡号校验
    $("#cardNoAgain").on("blur", function () {
        checkCardNoAgain($(this),$("#cardNo"));
    });

    if ($(".import").length>0) {
        $(".import").each(function(index, el) {
            if ($(this).val()) {
                $(this).data("value",$(this).val())
            };
        });
    };
    $("#idNo").change(function(){
        $(this).val($(this).val().toUpperCase());
    	if($("#cardType").find("option:selected").text() == "身份证" && ($("#isSelf").val() == 1 || $("#relation").find("option:selected").text() == "本人")){
    		checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".birthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#birthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".sexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#sex").find("option").eq(0).prop("selected",true):$("#sex").find("option").eq(1).prop("selected",true);
              //年龄判断
                if (getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
                    $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                    return;
                } else {
                    $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".birthdayReadonly").val("");
                $("#birthday").val("");
                $(".sexReadonly").val("");
                return;
            }
    	}
    });
    $("#insuredIdNo").change(function(){
        $(this).val($(this).val().toUpperCase());
    	if($("#insuredCardType").find("option:selected").text() == "身份证" && $("#isSelf").val() == 0){
    		checkID($(this));
            if (checkID($(this))) {
            	
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday").val()) > 55 || getDayByBirthDay($("#insuredBirthday").val()) < 28) {
                    $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("证件号不能为空，且需在投保年龄范围");
                    return;
                }else if($("#relation").val() != "00" && getAgeByBirthDay($("#insuredBirthday").val()) > 17){
               	 $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("如果被保人是成年人 投被保人必须一致");
               	 return;
                } else {
                	$("#insuredIdNo").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
                return;
            }
            if(getAgeByBirthDay($("#insuredBirthday").val())<=6){
            	$("#occupation").html('');
    			var html1 = '<option value="2099908" selected >学龄前儿童</option> '
    			$("#occupation").append(html1);
    			$("#occupation_dummy").val($("#occupation").find("option:selected").text());
            }else if(getAgeByBirthDay($("#insuredBirthday").val())<18){
            	$("#occupation").html('');
    			var html1 = '<option value="2099907" selected >一般学生</option> '
    			$("#occupation").append(html1);
    			$("#occupation_dummy").val($("#occupation").find("option:selected").text());
            }
    	}
    });
    
    $("#occupation").change(function(){
		$("#occupation_dummy").val($("#occupation").find("option:selected").text());
	})
	
    $("#sex").change(function(){
    	if($("#cardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 1){
    	}
    });
    $("#insuredSex").change(function(){
    	if($("#insuredCardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 0){
    	}
    });
    //房屋信息校验
    $("#propertyAddress").on("blur", function () {
        checkAddress($(this));
    });
    
    //自保件提示
    $(".forSelfUnsure").click(function(event) {
    	$(".forSelfMask").hide();
    });
    $(".forSelfSure").click(function(event) {
    	$(".forSelfMask").hide();
    	sendRequest(path +"/getSaveInfo",getData(),function (data) {
        	var obj = JSON.parse(data);
        	if(obj.code == 0){
        		var orderNo = obj.data.orderNo;
        		var returnPage = obj.data.returnPage;
        		window.location.href = path + returnPage + "?orderNo="+orderNo;
            }else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){});
    });
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

    //发送数据
    $("#sureToSave").click(function() {
    	
    	if(!checkAll()) return;
    	//自保件校验
    	var forSelfFlag = false;
    	if(!checkEmpty($("#memberIdCard").val())){
        	$(".idNo_compare").each(function(){
        		if(!forSelfFlag && $(this).val().trim() == $("#memberIdCard").val().trim()){
        			$(".forSelfMask").show();
        			forSelfFlag = true;
        		}
        	});
    	}
    	if(forSelfFlag) return;
    	/*sendRequest("../../life/xintai/newcontract_save.do",getData(),function (data) {
        	console.log(data);
        	var obj = JSON.parse(data);
        	if(obj.code == 0){
        		var orderNo = obj.orderNo;
        		console.log(orderNo);
        		window.location.href = "../../life/xintai/contractpay.do?orderNo="+orderNo;
        		
            }else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){});*/
    	sendRequest2("../../life/xintai/getprem.do",getData(),function (data) 
    	{
        	var obj = JSON.parse(data);
        	console.log(obj);
        	if(obj.code == 0)
        	{
        		$("#mainPrice").val(obj.mainPrem);
        		$("#hmPrice").val(obj.addPrem);
        		$("#insurePrice").html(Number(obj.sumPrem).toFixed(2));
        		
        		//核保
           	 sendRequest("../../life/xintai/newcontract_save.do",getData(),function (data) {
                	console.log(data);
                	var obj = JSON.parse(data);
                	if(obj.code == 0){
                		var orderNo = obj.orderNo;
                		console.log(orderNo);
                		window.location.href = "../../life/xintai/contractpay.do?orderNo="+orderNo;
                		
                    }else{
                    	$(".pop").show();
                    	$(".mask").show();
                    	$(".pop span").text(obj.msg);
                    }
                },function(){});
           	 
        	}else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text("试算失败，请重新填写信息或联系客服！");
            	$(".loading").hide();
            }
        	
        	
        },function(){});
    	
    });
    //续期控制
    $(".premium").change(function(){
    	if($(this).data("type") == "FeeYear"){
    		if($(this).find("option:selected").val() == "0Y"){
        		$(".renewalSec").hide();
    		}else{
    			$(".renewalSec").show();
    		}
    	}
    });
    $(".premium").each(function(){
    	if($(this).data("type") == "FeeYear"){
    		if($(this).find("option:selected").val() == "0Y"){
        		$(".renewalSec").hide();
    		}else{
    			$(".renewalSec").show();
    		}
    	}
    });
    //授权弹窗
    $(".authorization").on("click", function () {
        $("html,body").css({"position":"fixed","top":"0","height":"100%"});
        $("#declareCover").fadeIn();
    });
    $("#declareCover .closeBtn").on("click", function () {
        $("html,body").css({"position":"relative","top":"0","height":"auto"});
        $("html body").scrollTop($("html body").height());
        $("#declareCover").fadeOut();
    });
    //进入页面清空开户行和开户所在第内容
    $("#bankArea").val("");
    $("#accountBank_dummy").val("");
    $("#cardNo").val("");
    $("#cardNoAgain").val("");
    $("#accountBank_dummy").attr("placeholder","请选择");
    $("#accountBank").find("option").each(function(){
    	if($(this).text()=="请选择"){
    		$(this).prop("selected",true);
    		$(this).siblings().prop("selected",false);
    	}
    });
    $(".autoRenewal").change(function(){
    	if($(this).val() == "N"){
    		$(this).addClass("personInfo");
    		$(this).siblings("input").removeClass("personInfo");
    		$(this).parent().parent().siblings().hide();
    		$(this).siblings("label").find("i").removeClass("renewalCheckBox");
    		$(this).prev().find("i").addClass("renewalCheckBox");
    		$(this).parent().siblings(".errorMsg").show();
    	}else{
    		$(this).addClass("personInfo");
    		$(this).siblings("input").removeClass("personInfo");
    		$(this).parent().parent().siblings().show();
    		$(this).siblings("label").find("i").removeClass("renewalCheckBox");
    		$(this).prev().find("i").addClass("renewalCheckBox");
    		$("html body").animate({"scrollTop":$("html body").height()+"px"},"swing");
    		$(this).parent().siblings(".errorMsg").hide();
    	}
    });
    $(".renewalIcon").click(function(){
    	$(this).parent().click();
    });
});

/***************************提交校验方法**************************/
function checkAll() {
    var flag = true;
    //投保额度校验
    if ($(".numInput").length>0) {
    	$(".numInput").each(function(){
        	if (!checkNum($(this))) {
        		flag = false;
        	}
    	});
    }
    
    if($("#amnt").val()!=null && $("#amnt").val()!=""&&!isNaN($("#amnt").val())){
		$("#amnt").val(parseInt($("#amnt").val()));
	}
    
    if($("#amnt").val()<10000||$("#amnt").val()% 1000 != 0){
    	$(".numInput").parent().siblings(".errorMsg").css("display", "inline-block").text("不得小于10000元,且应为1000整数倍");
    	flag = false;
    }
    
//投保人信息
    //姓名校验
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
        if (!($("#cardType").find("option:selected").text() == "身份证")) {
        	if (getAgeByBirthDay($("#birthday").val()) < 18) {
                //年龄判断
                $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                flag = false;
            } else {
                $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if (getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
            //年龄判断
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
            flag = false;
        } else if($("#idNo").val().trim()==""){
        	$("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
            flag = false;
        } else {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        
    }
    //证件有效期
    if ($("#idDate").length>0) {
        if ($("#checkbox").hasClass("unCheckBox") && $("#idDate").val() == "") {
            $("#idDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
            flag = false;
        } else {
            $("#idDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //出生日期校验
    if ($("#birthday").length>0) {
        if (!($("#cardType").find("option:selected").text() == "身份证")) {
            if ($("#birthday").val() == "") {
                $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                flag = false;
            } else if (getAgeByBirthDay($("#birthday").val()) < 18) {
                //年龄判断
                $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                flag = false;
            } else {
                $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if ($("#idNo").val().trim() == "" || getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
            //年龄判断
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
            flag = false;
        } else if($("#idNo").val().trim()==""){
        	$("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
            flag = false;
        }else {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    
    //手机号码校验
    if ($("#tel").length>0) {
    	if (!checkTel($("#tel"))) {
    		flag = false;
    	}
    }
    //电子邮箱校验
    if ($("#email").length>0) {
        if (!checkEmail($("#email"))) {
            flag = false;
        }
    }
    //通讯地址校验
    if ($("#appntArea").length>0) {
        if ($("#appntArea").val() == "") {
            $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
            flag = false;
        } else {
            $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //详细地址校验
    if ($("#address").length>0) {
        if (!checkAddress($("#address"))) {
            flag = false;
        }
    }
    //邮政编码校验
    if ($("#postalCode").length>0) {
        if (!checkPostalCode($("#postalCode"))) {
            flag = false;
        }
    }
    //职业校验
    /*if ($(".appntOccupation").length>0) {
        if ($(".appntOccupation")[0].tagName == "INPUT") {
            if ($(".appntOccupation").val() == "") {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if ($(".appntOccupation")[0].tagName == "SELECT") {
        if ($(".appntOccupation").find("option:selected").text() == "请选择") {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
    }*/
    if ($("#threelevel").find("option:selected").val()== null || $("#threelevel").find("option:selected").val() == "") 
    {
        $("#threelevel").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业!");
        flag = false;
    }
	
	
    //被保人信息
    if ($("#switch").hasClass("turnOff")) {
        if ($("#relation").find("option:selected").text() != "本人") {
            //姓名校验
            if ($("#insuredName").length>0) {
                if (!checkName($("#insuredName"))) {
                    flag = false;
                }
            }
            //关系校验
            if ($("#relation").length>0) {
                if ($("#relation").find("option:selected").text() == "请选择") {
                    $("#relation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择投被保人关系！");
                    flag = false;
                } else {
                    $("#relation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            //证件号码校验
            if ($("#insuredIdNo").length>0) {
                if (!($("#insuredCardType").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo")) : checkOtherId($("#insuredIdNo")))) {
                    flag = false;
                }
                if (!($("#insuredCardType").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday").val()) > 55 || getDayByBirthDay($("#insuredBirthday").val()) < 28) {
                    //年龄判断
               		$("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }else if($("#relation").val() != "00" && getAgeByBirthDay($("#insuredBirthday").val()) > 17){
	            	 $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("如被保人是成年人 投被保人必须一致");
	            	 return;
	              }
               } else if (getAgeByBirthDay($(".insuredBirthdayReadonly").val()) > 55 || getDayByBirthDay($(".insuredBirthdayReadonly").val()) < 28) {
                   //年龄判断
            	   $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("证件号不能为空，且需在投保年龄范围");
                   flag = false;
               } else if($("#relation").val() != "00" && getAgeByBirthDay($(".insuredBirthdayReadonly").val()) > 17){
	            	 $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("如果被保人是成年人 投被保人必须一致");
	            	 return;
	           }else if($("#insuredIdNo").val().trim()==""){
               	$("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
                
            }
            //证件有效期
            if ($("#insuredIdDate").length>0) {
                if ($("#insuredCheckbox").hasClass("unCheckBox") && $("#insuredIdDate").val() == "") {
                    $("#insuredIdDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
                    flag = false;
                } else {
                    $("#insuredIdDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            //出生日期校验
            if ($("#insuredBirthday").length>0) {
                if (!($("#insuredCardType").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday").val() == "") {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo").val().trim() == "") {
                		$("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
                
            }
            //职业校验
            if ($(".occupation").length>0) {
                if ($(".occupation")[0].tagName == "INPUT") {
                    if ($(".occupation").val() == "") {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                        flag = false;
                    } else {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                } else if ($(".occupation")[0].tagName == "SELECT") {
                    if ($(".occupation").find("option:selected").text() == "请选择") {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                        flag = false;
                    } else {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            //通讯地址校验
            if ($("#insuredArea").length>0) {
                if ($("#insuredArea").val() == "") {
                    $("#insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            //详细地址校验
            if ($("#insuredAddress").length>0) {
                if (!checkAddress($("#insuredAddress"))) {
                    flag = false;
                }
            }
            //邮政编码校验
            if ($("#insuredZipCode").length>0) {
                if (!checkPostalCode($("#insuredZipCode"))) {
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
    //身高校验
    
    if ($("#height").length>0) {
        if (!checkHeight($("#height"))) {
            flag = false;
        }
    }
    
    //体重校验
    
    if ($("#weight").length>0) {
        if (!checkWeight($("#weight"))) {
            flag = false;
        }
    }
    
    //职业校验
    if ($("#scrollTop>div>dl .occupation").length>0) {
        if ($("#scrollTop>div>dl .occupation")[0].tagName == "INPUT") {
            if ($("#scrollTop>div>dl .occupation").val() == "") {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if ($("#scrollTop>div>dl .occupation")[0].tagName == "SELECT") {
            if ($("#scrollTop>div>dl .occupation").find("option:selected").text() == "请选择") {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
    }
    //通讯地址校验
    if ($("#scrollTop>div>dl #insuredArea").length>0) {
        if ($("#scrollTop>div>dl #insuredArea").val() == "") {
            $("#scrollTop>div>dl #insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
            flag = false;
        } else {
            $("#scrollTop>div>dl #insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //详细地址校验
    if ($("#scrollTop>div>dl #insuredAddress").length>0) {
        if (!checkAddress($("#scrollTop>div>dl #insuredAddress"))) {
            flag = false;
        }
    }
    //邮政编码校验
    if ($("#scrollTop>div>dl #insuredZipCode").length>0) {
        if (!checkPostalCode($("#scrollTop>div>dl #insuredZipCode"))) {
            flag = false;
        }
    }
    //手机号码校验
    if ($("#scrollTop>div>dl #insuredMobile").length>0) {
        if (!checkPostalCode($("#scrollTop>div>dl #insuredMobile"))) {
            flag = false;
        }
    }
    //社保情况校验
    if ($("#insuredSocialSecurity").length>0) {
        if ($("#insuredSocialSecurity").find("option:selected").text() == "请选择") {
            $("#insuredSocialSecurity").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户行！");
            flag = false;
        } else {
            $("#insuredSocialSecurity").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //房屋信息
    //坐落地址校验
    if ($("#propertyArea").length>0) {
        if ($("#propertyArea").val() == "") {
            $("#propertyArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
            flag = false;
        } else {
            $("#propertyArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //详细地址校验
    if ($("#propertyAddress").length>0) {
        if (!checkAddress($("#propertyAddress"))) {
            flag = false;
        }
    }
    //续缴账户信息
    if($(".PaymentDeadline").length>0){
    	if($(".PaymentDeadline").find("option:selected").val() != "0Y"){
    		checkBank();
    	}
    }
    //是否续保
    if($(".checkRenewal").length>0){
    	if($('input:radio[name="renewalBank.isRenewed"]').length>0){
        	if($('input:radio[name="renewalBank.isRenewed"]:checked').val() == "Y" && $(".PaymentDeadline").find("option:selected").val() != "0Y"){
        		checkBank();
        	}
    	}else{
    		if($(".PaymentDeadline").find("option:selected").val() != "0Y"){
        		checkBank();
        	}
    	}
    }
    //银行校验
    function checkBank(){
    	//开户所在地校验
        if ($("#bankArea").length>0) {
            if ($("#bankArea").val() == "") {
                $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户所在地！");
                flag = false;
            } else {
                $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //开户行校验
        if ($("#accountBank").length>0) {
            if ($("#accountBank").find("option:selected").text() == "请选择") {
                $("#accountBank").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户行！");
                flag = false;
            } else {
                $("#accountBank").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //开户省校验
        if ($("#bankProvince").length>0) {
        	if ($("#bankProvince").find("option:selected").text() == "请选择") {
        		$("#bankProvince").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户省！");
        		flag = false;
       	} else {
       		$("#bankProvince").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        	}
        }
      //开户支行校验
        if ($("#accountSubBank").length>0) {
            if ($("#accountSubBank").find("option:selected").text() == "请选择") {
                $("#accountSubBank").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户支行！");
                flag = false;
            } else {
                $("#accountSubBank").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //开户名校验
        if ($("#accountName").length>0) {
            if (!checkName($("#accountName"))) {
                flag = false;
            }
        }
        //银行卡号校验
        if ($("#cardNo").length>0) {
            if (!checkCardNo($("#cardNo"))) {
                flag = false;
            }
        }
        //再次输入银行卡号校验
        if ($("#cardNoAgain").length>0) {
            if (!checkCardNoAgain($("#cardNoAgain"), $("#cardNo"))) {
                flag = false;
            }
        }
    }
    //开户所在地校验
    if ($("#bankArea").length>0) {
        if ($("#bankArea").val() == "") {
            $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户所在地！");
            flag = false;
        } else {
            $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
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
    if(flag){//新加
    	if(!$("#switch").hasClass("turnOff")){
    		flag = checkAgeAgain(flag);
    	}else if( $("#relation").find("option:selected").val() == "00"){
    		flag = checkAgeAgain(flag);
    	}
    }
    
    if (!flag) return;
   
    var birth = "";
    if($("#switch").hasClass("turnOn")){
    	if($("#cardType").find("option:selected").text() == "身份证"){
    		birth = $('.birthdayReadonly').val();
    	}else{
    		birth = $('#birthday').val();
    	}
    }else{
    	if($("#relation").find("option:selected").text() == "本人"){
    		birth = $('#insuredBirthday2').val();
    	}else{
    		if($("#insuredCardType").find("option:selected").text() == "身份证"){
    			birth = $('#insuredBirthday1').val();
    		}else{
    			birth = $('#insuredBirthday').val();
    		}
    	}
    }
    var amntage = getAgeByBirthDay(birth);
    var amntageDays=getDayByBirthDay(birth);
    //新加
    if($("#productNo").val() == "risk02") { //jkwy
    	if( $("#amnt").val()<10000 || $("#amnt").val()%1000 !=0){
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，本产品投保金额要大于10000元，并且为1000元的整数倍。");
        	return;
    	}
    	if($("#relation").val() != "00" && getAgeByBirthDay($(".insuredBirthdayReadonly").val()) > 17){
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，如果被保人是成年人，投被保人必须一致。");
        	return;
       }
    	var getyear=$("#getyear").val();
    	if(amntage>55 || amntageDays<28){
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄不能小于28天或者大于55周岁。");
        	return;
    	}else if(amntage>=41 && amntage<=50 && $("#sex").val()=="2"){//女
    		if($("#payendyear").find("option:selected").val() == "30Y"){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text("尊敬的客户，女性被保险人年龄在41~50周岁，缴费期间只能为趸交、3年、5年、10年、15年、20年。");
            	return;
    		}
    	}else if(amntage>=51 && $("#sex").val()=="2"){//女
    		if($("#payendyear").find("option:selected").val() == "30Y" || $("#payendyear").find("option:selected").val() == "20Y"){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text("尊敬的客户，女性被保险人年龄在51~55周岁，缴费期间只能为趸交、3年、5年、10年、15年。");
            	return;
    		}
    	}else if(amntage>=41 && amntage<=45 && $("#sex").val()=="1"){
    		if($("#payendyear").find("option:selected").val() == "30Y"){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text("尊敬的客户，男性被保险人年龄在41~45周岁，缴费期间只能为趸交、3年、5年、10年、15年、20年。");
            	return;
    		}
    	}else if(amntage>=46 && amntage<=49 && $("#sex").val()=="1"){
    		if($("#payendyear").find("option:selected").val() == "30Y" || $("#payendyear").find("option:selected").val() == "20Y"){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text("尊敬的客户，男性被保险人年龄在46~49周岁，缴费期间只能为趸交、3年、5年、10年、15年。");
            	return;
    		}
    	}else if(amntage>=50 && amntage<=54 && $("#sex").val()=="1"){
    		if($("#payendyear").find("option:selected").val() == "30Y" || $("#payendyear").find("option:selected").val() == "20Y"
    			|| $("#payendyear").find("option:selected").val() == "15Y"){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text("尊敬的客户，男性被保险人年龄在50~54周岁，缴费期间只能为趸交、3年、5年、10年。");
            	return;
    		}
    	}else if(amntage>54 && $("#sex").val()=="1"){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，男性被保险人年龄最大为54周岁！");
        	return;
    	}
    }
    return true;
}
//根据生日获取年龄
function getAgeByBirthDay(birth){
    var returnAge = "";
    var aDate = new Date();
    var nowYear = aDate.getFullYear();
    var nowMonth = (aDate.getMonth()+1) < 10 ? '0'+(aDate.getMonth()+1) : (aDate.getMonth()+1);
    var nowDay = (aDate.getDate()) < 10 ? '0'+aDate.getDate() : aDate.getDate();

    var birthYear = birth.split("-")[0];
    var birthMonth = birth.split("-")[1];
    var birthDay = birth.split("-")[2];
    if(nowYear == birthYear){
        returnAge = 0;// 同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear ; // 年之差
        if (ageDiff > 0){
            if (nowMonth == birthMonth){
                var dayDiff = nowDay - birthDay;// 日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            } else {
                var monthDiff = nowMonth - birthMonth;// 月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            }
        }
    }
    return returnAge;
}

function checkAgeAgain(flag){//新加
	//年龄判断
    if (!($("#cardType").find("option:selected").text() == "身份证")) {
    	if (getAgeByBirthDay($("#birthday").val()) > 55) {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不能超过55岁！");
            flag = false;
        } else {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    } else if (getAgeByBirthDay($(".birthdayReadonly").val()) > 55) {
        $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不能超过55岁！");
        flag = false;
    } else {
        $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    }
    
    return flag;
}

//拼接传到后台的信息
function getData(){
	
	var data = 
	{
		"insurePrice":$("#insurePrice").html(), //总保费
		"mainPrice":$("#mainPrice").val(), //总保费
		"hmPrice":$("#hmPrice").val(), //总保费
		"amnt":$("#amnt").val(),
		"sex":$("#sex").val(),
		"insuyear":$("#insuyear").find("option:selected").val(),
		"payendyear":$("#payendyear").find("option:selected").val(), 
		"ishuomian":$("#ishuanmian").find("option:selected").val(),
		"addinsureyear":$("#addinyear").find("option:selected").val(),
		"appntArea":$("#appntArea").val(),
		"insuredArea":$("#insuredArea").val(),
		"productNo":$("#productNo").val()
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
//ajax
function sendRequest(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
           $(".loading").show();
        },
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        },
        complete:function(){
           $(".loading").hide();
        }
    });
}
//新加
function sendRequest2(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
           $(".loading").show();
        },
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        },
        complete:function(){
           //$(".loading").hide();
        }
    });
}
//计算价格ajax
function sendPriceRequest(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
        },
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        },
        complete:function(){
        }
    });
}

//计算保费
function calPrice()
{
	/*
	 * 各种校验，校验通过了，才进行保费计算
	 */
	
	if(!checkAll()) return;
	
	if($("#amnt").val()==null||$("#amnt").val()=="")
	{
		return;
	}
	
	if($("#insuyear").find("option:selected").val()==null
	 ||$("#insuyear").find("option:selected").val()=="")
	{
		return;
	}
	
	if($("#payendyear").find("option:selected").val()==null
	 ||$("#payendyear").find("option:selected").val()=="")
	{
		return;
	}
	
	if($("#ishuanmian").find("option:selected").val()==null
	 ||$("#ishuanmian").find("option:selected").val()=="")
	{
		return;
	}
	
	if($("#relation").find("option:selected").val()==null
	 ||$("#relation").find("option:selected").val()=="")
	{
		return;
	}
	
	if($("#relation").find("option:selected").val()=="00")
	{
		if($("#sex").val()==null||$("#sex").val()=="")
		{
			return;
		}
		
		if($("#birthday").val()==null||$("#birthday").val()=="")
		{
			return;
		}
	}
	
	sendPriceRequest("../../life/xintai/getprem.do",getData(),function (data) 
	{
    	var obj = JSON.parse(data);
    	console.log(obj);
    	if(obj.code == 0)
    	{
    		$("#mainPrice").val(obj.mainPrem);
    		$("#hmPrice").val(obj.addPrem);
    		$("#insurePrice").html(Number(obj.sumPrem).toFixed(2));
    	}
    	
    },function(){});
	
}
//选择投保人身份证时自动获取生日和性别
function changeCardType(cardVal) {
    var cardType = $("#cardType").find("option:selected").text();
    if (cardType == "身份证") {
        $(".birthday").hide();
        $(".birthdayReadonly").show();
        $(".sex").hide();
        $(".sexReadonly").show();
    } else {
        $(".birthday").show().css("display", "inline-block");
        $(".birthdayReadonly").hide();
        $(".sex").show().css("display", "inline-block");
        $(".sexReadonly").hide();
    }
}
//选择被保人身份证时自动获取生日和性别
function changeInsuredCardType(cardVal) {
    var cardType = $("#insuredCardType").find("option:selected").text();
    if (cardType == "身份证") {
        $(".insuredBirthday").hide();
        $(".insuredBirthdayReadonly").show();
        $(".insuredSex").hide();
        $(".insuredSexReadonly").show();
    } else {
        $(".insuredBirthday").show().css("display", "inline-block");
        $(".insuredBirthdayReadonly").hide();
        $(".insuredSex").show().css("display", "inline-block");
        $(".insuredSexReadonly").hide();
    }
}

//地区三级联动
function getArea(id){
    //ajax请求 默认发同步请求
    sendAreaRequest = function (url, data, success, error) {
        $.ajax({
            url: url,
            type: "post",
            async: false,//发送同步请求
            data: data ? data : {},
            success: function (data) {
                if (success) {
                    success(data);
                }
            },
            error: function (data) {
                if (error) {
                    error(data);
                }
            }
        });
    };
    //初始获取省数据
    var iosProvinces = provinces;
    //这个对象处理关于市的读取
    this.citysObject = {
        selectedOneLevelId: {},
        iosCitys: [],
        refreshCitys: function (oneLevelId) {
            var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                sendAreaRequest("../../life/common/getPlace.do", {
                    productNo : $("#productNo").val(),
                    parentId : oneLevelId,
                    placeType: 'city'
                }, function (successData) {
                	
                	//console.log(successData);
                	
                    var data =  JSON.parse(successData).data;
                    
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCitys.push({
                            id: data[i].id,
                            value: data[i].codeName,
                            parentId:data[i].parentId,
                            codeValue:data[i].codeValue
                        });
                    }
                }, function (errorData) {});
            }
        }
    };
    //这个对象处理关于区的读取
    this.countysObject = {
        selectedTwoLevelId: {},
        iosCountys: [],
        refreshCountys: function (oneLevelId, twoLevelId) {
            var _this = this;
            if (!(this.selectedTwoLevelId[twoLevelId])) {
                this.selectedTwoLevelId[twoLevelId] = true;
                //通过市id请求区
                sendAreaRequest("../../life/common/getPlace.do", {
                    productNo : $("#productNo").val(),
                    parentId : twoLevelId,
                    placeType: 'country'
                }, function (successData) {
                	//console.log(successData);
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCountys.push({
                            id: data[i].id,
                            value: data[i].codeName,
                            parentId:data[i].parentId,
                            codeValue:data[i].codeValue
                        })
                    }
                }, function (errorData){});
            }
        }
    };
    var that = this;
    $("#"+id).on("click", function () {
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);
        if ($this.siblings("input")[0].value == 2){
            var iosSelect = new IosSelect(2,
                [iosProvinces, that.citysObject.iosCitys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }else{
            var iosSelect = new IosSelect(3,
                [iosProvinces, that.citysObject.iosCitys, that.countysObject.iosCountys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    twoThreeRelation: 1,//第二列和第三列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    threeLevelId: threeLevelId,
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        $("#newCar_price_lable").attr('data-district-code', selectThreeObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $this.siblings("input")[3].value = selectThreeObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    })
}
//省市联动
function getCity(id){
    //ajax请求 默认发同步请求
    sendAreaRequest = function (url, data, success, error) {
        $.ajax({
            url: url,
            type: "post",
            async: false,//发送同步请求
            data: data ? data : {},
            success: function (data) {
                if (success) {
                    success(data);
                }
            },
            error: function (data) {
                if (error) {
                    error(data);
                }
            }
        });
    };
    //初始获取省数据
    var iosProvinces = provinces2;
    //这个对象处理关于市的读取
    this.citysObject = {
        selectedOneLevelId: {},
        iosCitys: [],
        refreshCitys: function (oneLevelId) {
            var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                sendAreaRequest("../../life/common/getPlace.do", {
                    productNo : $("#productNo").val(),
                    parentId : oneLevelId,
                    placeType: 'city'
                }, function (successData) {
                	
                	//console.log(successData);
                	
                    var data =  JSON.parse(successData).data;
                    
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCitys.push({
                            id: data[i].id,
                            value: data[i].codeName,
                            parentId:data[i].parentId,
                            codeValue:data[i].codeValue
                        });
                    }
                }, function (errorData) {});
            }
        }
    };
    //这个对象处理关于区的读取
    this.countysObject = {
        selectedTwoLevelId: {},
        iosCountys: [],
        refreshCountys: function (oneLevelId, twoLevelId) {
            var _this = this;
            if (!(this.selectedTwoLevelId[twoLevelId])) {
                this.selectedTwoLevelId[twoLevelId] = true;
                //通过市id请求区
                sendAreaRequest("../../life/common/getPlace.do", {
                    productNo : $("#productNo").val(),
                    parentId : twoLevelId,
                    placeType: 'country'
                }, function (successData) {
                	//console.log(successData);
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCountys.push({
                            id: data[i].id,
                            value: data[i].codeName,
                            parentId:data[i].parentId,
                            codeValue:data[i].codeValue
                        })
                    }
                }, function (errorData){});
            }
        }
    };
    var that = this;
    $("#"+id).on("click", function () {
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);
        if ($this.siblings("input")[0].value == 2){
            var iosSelect = new IosSelect(2,
                [iosProvinces, that.citysObject.iosCitys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }else{
            var iosSelect = new IosSelect(3,
                [iosProvinces, that.citysObject.iosCitys, that.countysObject.iosCountys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    twoThreeRelation: 1,//第二列和第三列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    threeLevelId: threeLevelId,
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        $("#newCar_price_lable").attr('data-district-code', selectThreeObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $this.siblings("input")[3].value = selectThreeObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    })
}
//银行地区
function getBankArea(id,bankCode){
    //ajax请求 默认发同步请求
	var comCode = $("#comCode").val();
    sendAreaRequest = function (url, data, success, error) {
        $.ajax({
            url: url,
            type: "post",
            async: false,//发送同步请求
            data: data ? data : {},
            success: function (data) {
                if (success) {
                    success(data);
                }
            },
            error: function (data) {
                if (error) {
                    error(data);
                }
            }
        });
    };
    //初始获取省数据
    var iosProvinces = provinces;
    //这个对象处理关于市的读取
    this.cityObject = {
        selectedOneLevelId: {},
        iosCitys: [],
        refreshCitys: function (oneLevelId) {
            var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                sendAreaRequest(path + "/pay/getBankAreaInfo", {
                	bankCode : bankCode,
                    parentId : oneLevelId
                }, function (successData) {
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCitys.push({
                        	id: data[i].areaNo,
                            value: data[i].name,
                            parentId:data[i].pAreaNo,
                            codeValue:data[i].areaNo
                        });
                    }
                }, function (errorData) {});
            }
        }
    };
    //这个对象处理关于区的读取
    this.countyObject = {
        selectedTwoLevelId: {},
        iosCountys: [],
        refreshCountys: function (oneLevelId, twoLevelId) {
            var _this = this;
            if (!(this.selectedTwoLevelId[twoLevelId])) {
                this.selectedTwoLevelId[twoLevelId] = true;
                //通过市id请求区
                sendAreaRequest(path + "/pay/getBankAreaInfo", {
                	bankCode : bankCode,
                    parentId : twoLevelId
                }, function (successData) {
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCountys.push({
                        	id: data[i].areaNo,
                            value: data[i].name,
                            parentId:data[i].pAreaNo,
                            codeValue:data[i].areaNo
                        })
                    }
                }, function (errorData){});
            }
        }
    };
    var that = this;
    if(!window.num){
        window.num = 0;
    }
    var flag = num;
	num++;
    $("#"+id).on("click", function () {
    	if(flag < num-1){
    		return
    	};
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);
        if ($this.siblings("input")[0].value == 2){
            var iosSelect01 = new IosSelect01(2,
                [iosProvinces, that.cityObject.iosCitys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        getSubBank(path +"/pay/getSubBankInfo",{
                        	comCode:comCode,
                        	bankCode:bankCode,
                        	banksProvince:selectOneObj.codevalue,
                        	banksCity:selectTwoObj.codevalue
                        },function(data){
                        	var obj = JSON.parse(data);
                        	$("#accountSubBank").html('<option value="">请选择</option>');
                        	var htm = "";
                        	for(var i = 0;i < obj.data.length;i++){
                        		htm += '<option value="'+obj.data[i].bankNo+'">'+obj.data[i].bankName+'</option>';
                        	}
                        	$("#accountSubBank").append(htm);
                        	$("#accountSubBank").scroller('destroy').scroller($.extend({preset: 'select'}, {
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
                        },function(){})
                    }
                });
        }else{
            var iosSelect01 = new IosSelect01(3,
                [iosProvinces, that.cityObject.iosCitys, that.countyObject.iosCountys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    twoThreeRelation: 1,//第二列和第三列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    threeLevelId: threeLevelId,
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        $("#newCar_price_lable").attr('data-district-code', selectThreeObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $this.siblings("input")[3].value = selectThreeObj.codevalue;
                    }
                });
        }
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    })
}
function getSubBank(url,data,success,error){
	$.ajax({
        url: url,
        type: "post",
        async: false,//发送同步请求
        data: data ? data : {},
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        }
    });
}
//计算对象长度
function getPropertyCount(o){  
   var n, count = 0;  
   for(n in o){  
      if(o.hasOwnProperty(n)){  
         count++;  
      }  
   }  
   return count;  
}
function distwolevel(onelevel,twolevel,threelevel)
{
    sendRequest("../../life/xintai/get_twolevel.do",{"onelevel":$("#"+onelevel+"").find("option:selected").val()},function (data)
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

    sendRequest("../../life/xintai/get_threelevel.do",{"twolevel":$("#"+twolevel+"").find("option:selected").val()},function (data)
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
