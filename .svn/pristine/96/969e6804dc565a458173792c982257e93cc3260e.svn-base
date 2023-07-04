var insured_index=2;
var familympehm = 'N';

var currYear = (new Date()).getFullYear();
function addDay(dayNumber, date) {
    date = date ? date : new Date();
    var ms = dayNumber * (1000 * 60 * 60 * 24);
    var newDate = new Date(date.getTime() + ms);
    return newDate;
}
var birthdayObj = 
{
	theme: 'android-ics light', //皮肤样式
    display: 'bottom', //显示方式
    rtl:true,
    mode: 'scroller', //日期选择模式
    lang:'zh',
    dateFormat: 'yyyy-mm-dd',
    dateOrder: 'ddmmyy',
    startYear:currYear - 61, //开始年份
    endYear:currYear, //结束年份
    maxDate: addDay(0),
};

$(function ()
{
	$("#insuredBirthday").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
	
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
	
	$("#insuredCardType").on("change", function () {
        $("#insuredBirthday").val("");
        $("#insuredIdNo").focus();
        
        changeInsuredCardType();
    });
	
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
        
        calPrice1();
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
    	
    	calPrice1();
    });
	
	$("#sureToSave").click(function() 
	{
		if(!checkAll()) return;
		var transData = {"jsonStr":getData()};
    	
    	sendRequest("../../life/zhongan_h/newcontract_save.do",transData,function (data) 
    	{
        	console.log(data);
        	var obj = JSON.parse(data);
        	
        	if(obj.code == 0)
        	{
        		var orderNo = obj.orderNo;
        		console.log(orderNo);
        		
        		window.location.href = "../../life/zhongan_h/contractpay.do?orderid="+orderNo;
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
		addOneInsured();
	});
	
	$(".insured_change").change(function()
	{
		calPrice1();
	});
	
	if($('#uwid').val()!=null&&$('#uwid').val()!='')
	{
		//初始化数据的代码
		sendRequest("../../life/zhongan_h/getInitData.do",{"uwid":$('#uwid').val()},function (data) 
		{
			var obj = JSON.parse(data);
			console.log(obj);
			
			if(obj.code == 0)
			{
				$('#policyName').val(obj.appnt.name);
				$('#idNo').val(obj.appnt.idno);
				$('#idNo').change();
				
				//$("#switch").removeClass("turnOn").addClass("turnOff").siblings("input").prop("checked",true);
				if(obj.insuredList.length>0)
				{
					if(obj.insuredList[0].relatoappnt!='00')
					{
						$("#switch").click();
						
						$("#relation").val(obj.insuredList[0].relatoappnt);
		        		$("#relation_dummy").val($("#relation").find("option:selected").text());
		        		
		        		$("#insuredName").val(obj.insuredList[0].name);
		    			$("#insuredIdNo").val(obj.insuredList[0].idno);
		    			
		    			$("#insuredIdNo").change();
					}
				}
				
				if(obj.insuredList.length>1)
				{
					for(var i=1;i<obj.insuredList.length;i++)
					{
						var initindex = i+1;
						initindex = '0'+initindex;
						
						addOneInsured();
						
						$("#relation"+initindex).val(obj.insuredList[i].relatoappnt);
						$("#relation"+initindex+"_dummy").val($("#relation"+initindex).find("option:selected").text());
						
						$("#insuredName"+initindex).val(obj.insuredList[i].name);
		    			$("#insuredIdNo"+initindex).val(obj.insuredList[i].idno);
		    			
		    			$("#insuredIdNo"+initindex).change();
					}
				}
			}
			else
			{
				$(".pop").show();
			    $(".mask").show();
			    $(".pop span").text(obj.msg);
			}
		},function(){});
	}
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

function addOneInsured()
{
	let indexUpper = getIndexUpper(insured_index);
    let NewSectionContent = _templet.addinsured_template.replace(/{index}/ig, '0'+insured_index)
                                                        .replace(/{index_num}/ig, insured_index)
                                                        .replace(/{indexUpper}/ig, indexUpper);
    let NewSection = $(NewSectionContent);
    
    $("#addinsured_div").append(NewSection);
	
    initSelect($("#relation0"+insured_index));
    initSelect($("#insuredCardType0"+insured_index));
    initSelect($("#insuredSex0"+insured_index));
    
    initSelect($("#zdjb0"+insured_index));
    initSelect($("#zjzyjt0"+insured_index));
    initSelect($("#txyl0"+insured_index));
    initSelect($("#hwyl0"+insured_index));
    
    initSelect($("#socialinsuflag0"+insured_index));
    initSelect($("#issmoke0"+insured_index));
    
    console.log('birthdayObj',birthdayObj);
    
    $("#insuredBirthday0"+insured_index).scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
    
	insured_index++;
	
	if(insured_index>7)
	{
		$('#addinsured_model').hide();
	}
	else
	{
		$('#addinsured_model').show();
	}
	
	$('#product_plan').val('尊享e生2020版');
	familympehm = 'Y'
	calPrice1();
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
		$("#insuredCardType"+next_index).attr("onchange", "checkInsIdtype('"+cur_index+"')");
		$("#insuredName"+next_index).attr("onchange", "checkInsName('"+cur_index+"')");
		$("#insuredIdNo"+next_index).attr("onchange", "checkInsIdno('"+cur_index+"')");
		$("#insuredMobile"+next_index).attr("onchange", "checkInsMobile('"+cur_index+"')");
		
		$("#insuredBirthday"+next_index).attr("onchange", "chg_calprice2('"+cur_index+"')");
		$("#insuredSex"+next_index).attr("onchange", "chg_calprice2('"+cur_index+"')");
		
		//替换各种change计算保费的index
		$("#socialinsuflag"+next_index).attr("onchange", "calprice2('"+i+"')");
		$("#issmoke"+next_index).attr("onchange", "calprice2('"+i+"')");
		$("#zdjb"+next_index).attr("onchange", "calprice2('"+i+"')");
		$("#zjzyjt"+next_index).attr("onchange", "calprice2('"+i+"')");
		$("#txyl"+next_index).attr("onchange", "calprice2('"+i+"')");
		$("#hwyl"+next_index).attr("onchange", "calprice2('"+i+"')");
		
		
		//删除的时候，替换各种id的index
		//替换div的index
		$("#addinsured_list_"+next_index).attr('id', 'addinsured_list_' + cur_index);
		$("#indured_info_"+next_index).attr('id', 'indured_info_' + cur_index);
		
		//替换被保险人信息id的index
		$("#relation"+next_index).attr('id', 'relation' + cur_index);
		$("#insuredName"+next_index).attr('id', 'insuredName' + cur_index);
		$("#insuredCardType"+next_index).attr('id', 'insuredCardType' + cur_index);
		$("#insuredIdNo"+next_index).attr('id', 'insuredIdNo' + cur_index);
		$("#ins_birthday"+next_index).attr('id', 'ins_birthday' + cur_index);
		$("#insuredBirthday"+next_index).attr('id', 'insuredBirthday' + cur_index);
		$("#ins_sex"+next_index).attr('id', 'ins_sex' + cur_index);
		$("#insuredSex"+next_index).attr('id', 'insuredSex' + cur_index);
		$("#insuredSex"+next_index+"_dummy").attr('id', 'insuredSex' + cur_index + "_dummy");
		$("#insuredMobile"+next_index).attr('id', 'insuredMobile' + cur_index);
		
		//替换保费计算因子id的index
		$("#socialinsuflag"+next_index).attr('id', 'socialinsuflag' + cur_index);
		$("#issmoke"+next_index).attr('id', 'issmoke' + cur_index);
		$("#zdjb"+next_index).attr('id', 'zdjb' + cur_index);
		$("#zjzyjt"+next_index).attr('id', 'zjzyjt' + cur_index);
		$("#txyl"+next_index).attr('id', 'txyl' + cur_index);
		$("#hwyl"+next_index).attr('id', 'hwyl' + cur_index);
		
		//替换隐藏域id的index
		$("#productcode"+next_index).attr('id', 'productcode' + cur_index);
		$("#prem"+next_index).attr('id', 'prem' + cur_index);
		
		//替换删除按钮id的index
		$("#shanchu"+next_index).attr('id', 'shanchu' + cur_index);
	}
	
	if(insured_index==2)
	{
		$('#product_plan').val('尊享e生2020版');
		familympehm = 'N'
		calPrice1();
	}
	
	$('#addinsured_model').show();
}

function calPrice1()
{
	var transData = '';
	
	if($("#relation").find("option:selected").val()=='00')
	{
		if($("#birthday").val()==null||$("#birthday").val()=='') 
		{
            return;
        }
		
		var insage = getAgeByBirthDay($("#birthday").val());
		
		transData = {
				   "insbirthday":$("#birthday").val(),
				   "inssex":$("#sex").find("option:selected").val(),
				   "insage":insage,
		           "socialinsuflag":$("#socialinsuflag").find("option:selected").val(),
		           "issmoke":$("#issmoke").find("option:selected").val(),
	       		   "zdjb":$("#zdjb").find("option:selected").val(),
	       		   "zjzyjt":$("#zjzyjt").find("option:selected").val(),
	       		   "txyl":$("#txyl").find("option:selected").val(),
	       		   "hwyl":$("#hwyl").find("option:selected").val(),
	       		   "mpehm":familympehm
	       		  }
	}
	else
	{
		if($("#insuredBirthday").val()==null||$("#insuredBirthday").val()=='') 
		{
            return;
        }
		
		var insage = getAgeByBirthDay($("#insuredBirthday").val());
		
		transData = {
					"insbirthday":$("#insuredBirthday").val(),
					"inssex":$("#insuredSex").find("option:selected").val(),
					"insage":insage,
				    "socialinsuflag":$("#socialinsuflag").find("option:selected").val(),
				    "issmoke":$("#issmoke").find("option:selected").val(),
	       		    "zdjb":$("#zdjb").find("option:selected").val(),
	       		    "zjzyjt":$("#zjzyjt").find("option:selected").val(),
	       		    "txyl":$("#txyl").find("option:selected").val(),
	       		    "hwyl":$("#hwyl").find("option:selected").val(),
	       		    "mpehm":familympehm
	       		  }
	}
	
	sendRequest("../../life/zhongan_h/calprem.do",transData,function (data) 
	{
	  	var obj = JSON.parse(data);
	   	console.log(obj);
	    	
	   	if(obj.code == 0)
	   	{
	   		$("#productcode").val(obj.productcode);	   		
			$("#prem").val(obj.prem);
			
			sumPrem();
	   	}
	   	else
	   	{
	   		$(".pop").show();
	        $(".mask").show();
	        $(".pop span").text(obj.msg);
	   	}
	},function(){});
}

function calprice2(calindex)
{
	if($("#insuredBirthday0"+calindex).val()==null||$("#insuredBirthday0"+calindex).val()=='') 
	{
        return;
    }
	
	var insage = getAgeByBirthDay($("#insuredBirthday0"+calindex).val());
	
	var transData = {
		            "insbirthday":$("#insuredBirthday0"+calindex).val(),
	                "inssex":$("#insuredSex0"+calindex).val(),
	                "insage":insage,
    			    "socialinsuflag":$("#socialinsuflag0"+calindex).find("option:selected").val(),
    			    "issmoke":$("#issmoke0"+calindex).find("option:selected").val(),
		            "zdjb":$("#zdjb0"+calindex).find("option:selected").val(),
		            "zjzyjt":$("#zjzyjt0"+calindex).find("option:selected").val(),
		            "txyl":$("#txyl0"+calindex).find("option:selected").val(),
		            "hwyl":$("#hwyl0"+calindex).find("option:selected").val(),
		            "mpehm":familympehm
		          }
		          
    sendRequest("../../life/zhongan_h/calprem.do",transData,function (data) 
	{
		var obj = JSON.parse(data);
		console.log(obj);
		
		if(obj.code == 0)
		{	
			$("#productcode0"+calindex).val(obj.productcode);	   		
			$("#prem0"+calindex).val(obj.prem);
			
			sumPrem();
		}
		else
		{
			$(".pop").show();
		    $(".mask").show();
		    $(".pop span").text(obj.msg);
		}
	},function(){});
}

function sumPrem()
{
	var sumprem = Number($("#prem").val());
	
	for(var i=2;i<insured_index;i++)
    {
		sumprem = Number(sumprem) + Number($("#prem0"+i).val());
    }
	
	$("#insurePrice").html(Number(sumprem).toFixed(2));
	$("#sumprem").val(Number(sumprem).toFixed(2));
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
        
        //手机号码校验
        if ($("#insuredMobile"+cur_index).length>0) {
            if (!checkTel($("#insuredMobile"+cur_index))) {
                flag = false;
            }
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
	var jsonStr = '{"appntinfo":{"appname":"'+$("#policyName").val()+'","appcardno":"'+$("#idNo").val()+'","appcardtype":"0","appmobile":"'+$("#tel").val()+'",'
	                          +'"appmail":"'+$("#email").val()+'","appbirthday":"'+$("#birthday").val()+'","appsex":"'+$("#sex").find("option:selected").val()+'"},'
	            +'"sumprem":"'+$("#sumprem").val()+'",'
	            +'"uwid":"'+$("#uwid").val()+'",'
                +'"insuredinfo":['
    
    if($("#relation").find("option:selected").val()=='00')
    {
    	var insage = getAgeByBirthDay($("#birthday").val());
    	
    	jsonStr = jsonStr + '{"insrealtion":"'+$("#relation").find("option:selected").val()+'","insname":"'+$("#policyName").val()+'","inscardno":"'+$("#idNo").val()+'","inscardtype":"0",'
        				+ '"insmobile":"'+$("#tel").val()+'","insbirthday":"'+$("#birthday").val()+'","inssex":"'+$("#sex").find("option:selected").val()+'",'
        				+ '"insage":"'+insage+'","mpehm":"'+familympehm+'",'
        				+ '"socialinsuflag":"'+$("#socialinsuflag").find("option:selected").val()+'","issmoke":"'+$("#issmoke").find("option:selected").val()+'",'
        				+ '"productcode":"'+$("#productcode").val()+'","prem":"'+$("#prem").val()+'","amnt":"3000000",'
        				+ '"zdjb":"'+$("#zdjb").find("option:selected").val()+'","zjzyjt":"'+$("#zjzyjt").find("option:selected").val()+'","txyl":"'+$("#txyl").find("option:selected").val()+'","hwyl":"'+$("#hwyl").find("option:selected").val()+'"'
        				+ '},'
    }
    else
    {
    	var insage = getAgeByBirthDay($("#insuredBirthday").val());
    	
    	jsonStr = jsonStr + '{"insrealtion":"'+$("#relation").find("option:selected").val()+'","insname":"'+$("#insuredName").val()+'","inscardno":"'+$("#insuredIdNo").val()+'","inscardtype":"'+$("#insuredCardType").val()+'",'
        		        + '"insmobile":"'+$("#insuredMobile").val()+'","insbirthday":"'+$("#insuredBirthday").val()+'","inssex":"'+$("#insuredSex").find("option:selected").val()+'",'
        		        + '"insage":"'+insage+'","mpehm":"'+familympehm+'",'
        		        + '"socialinsuflag":"'+$("#socialinsuflag").find("option:selected").val()+'","issmoke":"'+$("#issmoke").find("option:selected").val()+'",'
        		        + '"productcode":"'+$("#productcode").val()+'","prem":"'+$("#prem").val()+'","amnt":"3000000",'
        		        + '"zdjb":"'+$("#zdjb").find("option:selected").val()+'","zjzyjt":"'+$("#zjzyjt").find("option:selected").val()+'","txyl":"'+$("#txyl").find("option:selected").val()+'","hwyl":"'+$("#hwyl").find("option:selected").val()+'"'
        		        + '},'
    }
                
    for(var i=2;i<insured_index;i++)
    {
    	var cur_index = '0'+i;
    	
    	var insage = getAgeByBirthDay($("#insuredBirthday"+cur_index).val());
    	
    	jsonStr = jsonStr + '{"insrealtion":"'+$("#relation"+cur_index).find("option:selected").val()+'","insname":"'+$("#insuredName"+cur_index).val()+'","inscardno":"'+$("#insuredIdNo"+cur_index).val()+'","inscardtype":"'+$("#insuredCardType"+cur_index).val()+'",'
    	                + '"insmobile":"'+$("#insuredMobile"+cur_index).val()+'","insbirthday":"'+$("#insuredBirthday"+cur_index).val()+'","inssex":"'+$("#insuredSex"+cur_index).val()+'",'
    	                + '"insage":"'+insage+'","mpehm":"'+familympehm+'",'
    	                + '"socialinsuflag":"'+$("#socialinsuflag"+cur_index).find("option:selected").val()+'","issmoke":"'+$("#issmoke"+cur_index).find("option:selected").val()+'",'
    	                + '"productcode":"'+$("#productcode"+cur_index).val()+'","prem":"'+$("#prem"+cur_index).val()+'","amnt":"3000000",'
    	                + '"zdjb":"'+$("#zdjb"+cur_index).find("option:selected").val()+'","zjzyjt":"'+$("#zjzyjt"+cur_index).find("option:selected").val()+'","txyl":"'+$("#txyl"+cur_index).find("option:selected").val()+'","hwyl":"'+$("#hwyl"+cur_index).find("option:selected").val()+'"'
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

//checkbox选择去掉input盒子下面的边框
/*
$(function(){
	$('#switch').on('click',function(){
		$(this).hasClass('turnOn')?$(this).parents('.dlSec').addClass('bottom-0'):$(this).parents('.dlSec').removeClass('bottom-0')
	})
});
*/
function checkInsName(name_index)
{
	 checkName($("#insuredName"+name_index));
}

function checkInsIdtype(idtype_index)
{
	var cardType = $("#insuredCardType"+idtype_index).find("option:selected").text();
    if (cardType == "身份证") 
    {
        //$("#ins_birthday"+idtype_index).hide();
        //$("#ins_sex"+idtype_index).hide();
    }
    else 
    {
        $("#ins_birthday"+idtype_index).show();
        $("#ins_sex"+idtype_index).show();
    }
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
    	    $("#insuredSex"+idno_index+"_dummy").val($("#insuredSex"+idno_index).find("option:selected").text());
    	} 
	    else
	    {
	    	//身份证错误时清空生日和性别
	        $("#insuredBirthday"+idno_index).val("");
	        $("#insuredSex"+idno_index).val("");
	        $("#insuredSex"+idno_index+"_dummy").val($("#insuredSex"+idno_index).find("option:selected").text());
	    }
	}
  	
  	calprice2(Number(idno_index));
}

function chg_calprice2(chg_index)
{
	if($("#insuredCardType"+chg_index).find("option:selected").text() != "身份证")
	{
		calprice2(Number(chg_index));
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
                <select id="insuredCardType{index}" onchange = "checkInsIdtype('{index}');" class="cardType txtR personInfo dw-hsel insured_cardtype" tabindex="-1">
                    <option value="0">身份证</option>
                    <option value="4">户口本</option>
                    <option value="7">出生证</option>
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
        
        <dl class="clearfix infoDl borBot1 dlSec" id="ins_birthday{index}" style="display: none;">
            <dt class="w35 l-float">出生日期</dt>
            <dd class="w65 l-float txtR pr hasArrow" style="box-sizing: border-box;">
                <span>
	                <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday{index}" onchange = "chg_calprice2('{index}');" value="" placeholder="请选择">
	                <i class="arrow"></i> 
	            </span> 
            </dd>
            <span class="errorMsg"></span>
        </dl>
        <dl class="clearfix infoDl borBot1 dlSec" id="ins_sex{index}" style="display: none;">
            <dt class="w35 l-float">性别</dt>
            <dd class="w65 l-float txtR pr hasArrow" style="box-sizing: border-box;">
                <div>
	                <select id="insuredSex{index}" class="sex txtR personInfo dw-hsel" tabindex="-1" onchange = "chg_calprice2('{index}');">
	                    <option value="1">男</option>
	                    <option value="2">女</option>
	                </select> 
	                <i class="arrow"></i>
	            </div>
            </dd>
            <span class="errorMsg"></span>
        </dl>
        
        <dl class="clearfix infoDl borBot1 dlSec">
            <dt class="w35 l-float">手机号</dt>
            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                <input type="tel" class="textfield txtR personInfo insured_mobile" id="insuredMobile{index}" onchange = "checkInsMobile('{index}');" value="" placeholder="请输入手机号码">
            </dd>
            <span class="errorMsg"></span>
        </dl>
        
        <dl class="clearfix infoDl borTop1 dlSec">
	       	<dt class="w55 l-float">是否有社保</dt>
	       	<dd class="w40 l-float txtR pr hasArrow">
	        	<select id="socialinsuflag{index}" class="cardType txtR personInfo dw-hsel" onchange = "calprice2('{index_num}')" tabindex="-1">
	            	<option value="Y">有</option>
	                <option value="N">无</option>
				</select>
	            <i class="arrow"></i> 
	        </dd>
	    	<span class="errorMsg"></span>
	    </dl>
	    
	    <dl class="clearfix infoDl borTop1 dlSec">
	       	<dt class="w55 l-float">有无吸烟习惯/吸烟史</dt>
	       	<dd class="w40 l-float txtR pr hasArrow">
	        	<select id="issmoke{index}" class="cardType txtR personInfo dw-hsel" onchange = "calprice2('{index_num}')" tabindex="-1">
	            	<option value="N">无</option>
	            	<option value="Y">有</option>
				</select>
	            <i class="arrow"></i> 
	        </dd>
	    	<span class="errorMsg"></span>
	    </dl>
        
        <dl class="clearfix infoDl borTop1 dlSec">
        	<dt class="w55 l-float">重大疾病保险金</dt>
        	<dd class="w40 l-float txtR pr hasArrow">
            	<select id="zdjb{index}" class="cardType txtR personInfo dw-hsel" onchange = "calprice2('{index_num}')" tabindex="-1">
	            	<option value="Y">投保</option>
	                <option value="N">不投保</option>
                </select>
                <i class="arrow"></i> 
                </dd>
            <span class="errorMsg"></span>
         </dl>
         
         <dl class="clearfix infoDl borTop1 dlSec">
	     	<dt class="w55 l-float">重大疾病住院津贴保险金</dt>
	     	<dd class="w40 l-float txtR pr hasArrow">
	         	<select id="zjzyjt{index}" class="cardType txtR personInfo dw-hsel" onchange = "calprice2('{index_num}')" tabindex="-1">
		         	<option value="Y">投保</option>
	                <option value="N">不投保</option>
	            </select>
	            <i class="arrow"></i> 
	            </dd>
	         <span class="errorMsg"></span>
	      </dl>
	      
	      <dl class="clearfix infoDl borTop1 dlSec">
	     	<dt class="w55 l-float">指定疾病及手术扩展特需医疗</dt>
	     	<dd class="w40 l-float txtR pr hasArrow">
	         	<select id="txyl{index}" class="cardType txtR personInfo dw-hsel" onchange = "calprice2('{index_num}')" tabindex="-1">
		         	<option value="Y">投保</option>
	                <option value="N">不投保</option>
	            </select>
	            <i class="arrow"></i> 
	            </dd>
	         <span class="errorMsg"></span>
	      </dl>
	      
	      <dl class="clearfix infoDl borTop1 dlSec">
	     	<dt class="w55 l-float">恶性肿瘤海外医疗责任</dt>
	     	<dd class="w40 l-float txtR pr hasArrow">
	         	<select id="hwyl{index}" class="cardType txtR personInfo dw-hsel" onchange = "calprice2('{index_num}')" tabindex="-1">
		         	<option value="Y">投保</option>
	                <option value="N">不投保</option>
	            </select>
	            <i class="arrow"></i> 
	            </dd>
	         <span class="errorMsg"></span>
	      </dl>
	      
	      <input hidden id="productcode{index}">
		  <input hidden id="prem{index}" value = '0'>
</div>
<div class="clearfix infoDl dingwei fl">
      <div class="shanchu" id="shanchu{index}" onclick = "removeinsured('{index_num}')"; style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">删除</div>                        
</div>
</section>`
}

function changeInsuredCardType() {
    var cardType = $("#insuredCardType").find("option:selected").text();
    if (cardType == "身份证") {
        $(".insuredBirthday").hide();
        $(".insuredBirthdayReadonly").show();
        $(".insuredSex").hide();
        $(".insuredSexReadonly").show();
        $("#ins_birthday").hide();
        $("#ins_sex").hide();
    } else {
        $(".insuredBirthday").show().css("display", "inline-block");
        $(".insuredBirthdayReadonly").hide();
        $(".insuredSex").show().css("display", "inline-block");
        $(".insuredSexReadonly").hide();
        $("#ins_birthday").show();
        $("#ins_sex").show();
    }
}