$(function () 
{
	//$('#search-con-warp').show();
	$("#my_val").hide();
	$('#cartype').click(function()
	{
		$('#search-con-warp').show();
	});
	
	$('#vehicleModelName').click(function()
	{
		$('#search-con-warp').show();
		$(".my_next").hide();
		$(".my_sure").show();
	});
	$('#close-sW-wrap').click(function()
	{
		$('#search-con-warp').hide();
		$(".yingchang").show();
	})
	
	$('#serchBtn').click(function()
	{

		displaybrand();
	})
	
	$('.item').click(function()
	{
		var carName =$(this).text();
		$("#serchInput").val(carName);
		myCar();
	})
	
	
	$("#qbrand").change(function()
    {
		if(vehicleName_typein==null||vehicleName_typein=="")
		{
			$(".pop").show();
	    	$(".mask").show();
	    	$(".pop span").text("请选择或者搜索车辆品牌！");
	    	
	    	return;
		}
		
		$("#qbrand_dummy").val($("#qbrand").find("option:selected").text());
		
		displayfamily();
    })
    
    $("#qfamily").change(function()
    {
    	$("#qfamily_dummy").val($("#qfamily").find("option:selected").text());
    	
    	displayenginedesc();
    })
    
    
    $("#qenginedesc").change(function()
    {
    	$("#qenginedesc_dummy").val($("#qenginedesc").find("option:selected").text());
    	
    	displaygearboxtype();
    })
    
    $("#qgearboxtype").change(function()
    {
    	$("#qgearboxtype_dummy").val($("#qgearboxtype").find("option:selected").text());
    	
    	displayvehicle(pageno);
    })
    
    $("#qvehicle").change(function()
    {
    	$("#qvehicle_dummy").val($("#qvehicle").find("option:selected").text());
    })
    
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
	
	$(".my_sure").on("click", function () 
	{
		$("#search-con-warp").hide();
		var item = $("#qvehicle li").attr("value");
		var seats = $("#qvehicle li").attr("seats");		
		var my_car = $("#qvehicle li").attr("carname")
		$("#vehicleModelName").val($(".zhanshi").text());
		$("#my_val").attr("value",item);
		$("#seats").attr("value",seats);
		$("#carName").attr("value",my_car);
		
		$(".my_next").show();
		$(".my_sure").hide();
		$(".yingchang").show();
	})
	
	
    $("#sureToSave").on("click", function ()
    {
    	if($("#checkNo").val() == ''){
    		$(".loading").hide()
    		$(".errorMsg1").show()
    	}else{
    		$(".errorMsg1").hide();
    		$(".loading").hide()
    	}
        if(!checkAll()) return;
        fm.submit();
        if(checkAll()){
        	$(".loading").show();
        	$.ajax({
                //几个参数需要注意一下
                type: "post",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../../car/sunCar/car02save.do" ,//url
                data: $('#fm').serialize(),
                success: function (result) {                   
                    
                },
                error : function() {
                	$(".loading").hide();
                }
            }); 
        }
    })

    // if ($("input[type = radio]").prop("checked"))
    // {
    //     $("input[type = radio]").siblings("#gh").removeClass("turnOff").addClass("turnOn");
    //     $(".gh_date").show();
    // } else {
    //     $("input[type = radio]").siblings("#gh").removeClass("turnOn").addClass("turnOff");
    //     $(".gh_date").hide();
    // }

    $("#gh").on("click", function () {
        if ($(this).hasClass("turnOn")) {
            $(this).removeClass("turnOn").addClass("turnOff").siblings("input").prop("checked",true);
            $(".gh_date").slideUp();
            $("#specialCarFlag").val("0");
        } else {
            $(this).removeClass("turnOff").addClass("turnOn").siblings("input").prop("checked",false);
            $(".gh_date").slideDown();
            $("#specialCarFlag").val("1");
        }
    });

    //checkbox选择去掉input盒子下面的边框
    // $(function(){
	$('#gh').on('click',function(){
		$(this).hasClass('turnOff')?$(this).parents('.dlSec').addClass('bottom-0'):$(this).parents('.dlSec').removeClass('bottom-0')
	})
    // });
	
//	选择车的型号
	$(".zhanshi").on("click",function(){
		$(".xinghao").addClass("donghua");
		$(".mask").show();
		$(".xinghao").show();
		
	})
	$(".xinghao ul li").on("click",function(){
		$(this).addClass("addcolor").siblings().removeClass("addcolor");
	})
	$(".yanse").on("click",function(){
		$(this).addClass("addcolor").siblings().removeClass("addcolor");
	})
	$(".quxiao").on("click",function(){
		$(".mask").hide();
		$(".xinghao").hide();
		
	})

	//江苏验证码显示
    if($("#citycode").val().substring(0,2)=='03'){
        $(".checkNo").slideDown();
        $('#citycode').parents('.dlSec').removeClass('bottom-0')
	}else{
        $("#citycode").value = '';
        $(".checkNo").slideUp();
        $('#citycode').parents('.dlSec').addClass('bottom-0')
	}
	
});

function checkAll() {
    var flag = true;
    //姓名校验
    if ($("#ownerName").length>0) {
        if (!checkName($("#ownerName"))) {
            flag = false;
        }
    }
    //证件号码校验
    if ($("#ownerIdNo").length>0) {
        if (!checkID($("#ownerIdNo"))) {
            flag = false;
        }
    }
    //发动机号
    if ($("#engineNo").length>0) {
        if (!checkEasy($("#engineNo"))) {
            flag = false;
        }
    }
    //车架号
    if ($("#vehicleFrameNo").length>0) {
        if (!checkEasy($("#vehicleFrameNo"))) {
            flag = false;
        }
    }
    //注册登记日期
    if ($("#firstRegisterDate").length>0) {
        if (!checkEasy($("#firstRegisterDate"))) {
            flag = false;
        }
    }
    //品牌型号
    if ($("#vehicleModelName").length>0) {
        if (!checkEasy($("#vehicleModelName"))) {
            flag = false;
        }
    }
    //是否过户车
    if ($("#specialCarFlag").length>0) {
        if (!checkGhDate($("#specialCarFlag"),$("#specialCarDate"))) {
            flag = false;
        }
    }


    if (!flag) return;

    return true;
}

function displaybrand()
{
	if($('#serchInput').val()!=null&&$('#serchInput').val()!="")
	{
		vehicleName_typein = $('#serchInput').val();
		pageno = "1";
		
		var carTypeUrl = "https://wxthdpart.sinosig.com:1443/Net/netCarModelsDataWebAction.action?vehicleName="+vehicleName_typein+"&pageNo="+pageno;
		console.info(carTypeUrl);
		
		$.ajax({
            url: carTypeUrl,
            type: "post",
            async: false,//发送同步请求
            dataType:'jsonp',
            jsonpCallback:'aa',
            success: function (data) 
            {
            	console.info(data);
            	
            	$("#sousuo").hide();
            	$("#searchtypein").show();
            	
            	$("#qbrand").html("");
            	
            	$("#qbrand").append("<option value='0'>请选择</option>");
            	
            	for(var i=0;i<data.ProductResponses.brand.length;i++)
    	   		{
            		var brandobj = data.ProductResponses.brand[i];
            		
            		$("#qbrand").append("<option value='"+brandobj.BrandId+"'>"+brandobj.BrandName+"</option>");
    	   		}
            	
            	//$("#qbrand").val(data.ProductResponses.brand[0].BrandId);
    	   		//$("#qbrand_dummy").val($("#qbrand").find("option:selected").text());
            },
            error: function (data) {
                
            }
        });
		/*
		$(".pop").show();
    	$(".mask").show();
    	$(".pop span").text($('#serchInput').val());
    	*/
	}
}
//汽车选择
function myCar()
{

		vehicleName_typein = $('#serchInput').val();
		pageno = "1";
		
		var carTypeUrl = "https://wxthdpart.sinosig.com:1443/Net/netCarModelsDataWebAction.action?vehicleName="+vehicleName_typein+"&pageNo="+pageno;
		console.info(carTypeUrl);
		
		$.ajax({
            url: carTypeUrl,
            type: "post",
            async: false,//发送同步请求
            dataType:'jsonp',
            jsonpCallback:'aa',
            success: function (data) 
            {
            	console.info(data);
            	
            	$("#sousuo").hide();
            	$("#searchtypein").show();
            	
            	$("#qbrand").html("");
            	
            	$("#qbrand").append("<option value='0'>请选择</option>");
            	
            	for(var i=0;i<data.ProductResponses.brand.length;i++)
    	   		{
            		var brandobj = data.ProductResponses.brand[i];
            		
            		$("#qbrand").append("<option value='"+brandobj.BrandId+"'>"+brandobj.BrandName+"</option>");
    	   		}
            	
            	//$("#qbrand").val(data.ProductResponses.brand[0].BrandId);
    	   		//$("#qbrand_dummy").val($("#qbrand").find("option:selected").text());
            },
            error: function (data) {
                
            }
        });
		/*
		$(".pop").show();
    	$(".mask").show();
    	$(".pop span").text($('#serchInput').val());
    	*/
	
}


//-----------------------------------------------------------------------------------------------------------------------------------

function displayfamily()
{
	if($('#qbrand').val()!=null&&$('#qbrand').val()!=""&&$('#qbrand').val()!="0")
	{
		brand_typein = $('#qbrand').val();
		
		var carTypeUrl = "https://wxthdpart.sinosig.com:1443/Net/netCarModelsDataWebAction.action?vehicleName="+vehicleName_typein+"&BrandId="+brand_typein+"&pageNo="+pageno;
		console.info(carTypeUrl);
		
		$.ajax({
            url: carTypeUrl,
            type: "post",
            async: false,//发送同步请求
            dataType:'jsonp',
            jsonpCallback:'aa',
            success: function (data) 
            {
            	console.info(data);
            	
            	$("#qfamily").html("");
            	
            	$("#qfamily").append("<option value='0'>请选择</option>");
            	
            	for(var i=0;i<data.ProductResponses.family.length;i++)
    	   		{
            		var familyobj = data.ProductResponses.family[i];
            		
            		$("#qfamily").append("<option value='"+familyobj.FamilyId+"'>"+familyobj.FamilyName+"</option>");
    	   		}
            },
            error: function (data) {
                
            }
        });
	}
}

function displayenginedesc()
{
	if($('#qfamily').val()!=null&&$('#qfamily').val()!=""&&$('#qfamily').val()!="0")
	{
		family_typein = $('#qfamily').val();
		
		var carTypeUrl = "https://wxthdpart.sinosig.com:1443/Net/netCarModelsDataWebAction.action?vehicleName="+vehicleName_typein
		               +"&BrandId="+brand_typein+"&familyId="+family_typein+"&pageNo="+pageno;
		
		console.info(carTypeUrl);
		
		$.ajax({
            url: carTypeUrl,
            type: "post",
            async: false,//发送同步请求
            dataType:'jsonp',
            jsonpCallback:'aa',
            success: function (data) 
            {
            	console.info(data);
            	
            	$("#qenginedesc").html("");
            	
            	$("#qenginedesc").append("<option value='0'>请选择</option>");
            	
            	for(var i=0;i<data.ProductResponses.enginedesc.length;i++)
    	   		{
            		var enginedescobj = data.ProductResponses.enginedesc[i];
            		
            		$("#qenginedesc").append("<option value='"+enginedescobj[i]+"'>"+enginedescobj[i]+"</option>");
    	   		}
            },
            error: function (data) {
                
            }
        });
	}
}

function displaygearboxtype()
{
	if($('#qenginedesc').val()!=null&&$('#qenginedesc').val()!=""&&$('#qenginedesc').val()!="0")
	{
		qenginedesc_typein = $('#qenginedesc').val();
		
		var carTypeUrl = "https://wxthdpart.sinosig.com:1443/Net/netCarModelsDataWebAction.action?vehicleName="+vehicleName_typein
        +"&BrandId="+brand_typein+"&familyId="+family_typein+"&engineDesc="+qenginedesc_typein+"&pageNo="+pageno;

		console.info(carTypeUrl);
		
		$.ajax({
			url: carTypeUrl,
			type: "post",
			async: false,//发送同步请求
			dataType:'jsonp',
			jsonpCallback:'aa',
			success: function (data) 
			{
				console.info(data);
				
				$("#qgearboxtype").html("");
				
				$("#qgearboxtype").append("<option value='0'>请选择</option>");
				
				for(var i=0;i<data.ProductResponses.gearboxtype.length;i++)
				{
					var gearboxtypeobj = data.ProductResponses.gearboxtype[i];
					
					$("#qgearboxtype").append("<option value='"+gearboxtypeobj[i]+"'>"+gearboxtypeobj[i]+"</option>");
				}
			},
			error: function (data) {
			 
			}
		});
	}
}

function displayvehicle(vehiclepage)
{
	if($('#qgearboxtype').val()!=null&&$('#qgearboxtype').val()!=""&&$('#qgearboxtype').val()!="0")
	{
		gearboxtype_typein = $('#qgearboxtype').val();
		
		var carTypeUrl = "https://wxthdpart.sinosig.com:1443/Net/netCarModelsDataWebAction.action?vehicleName="+vehicleName_typein
        +"&BrandId="+brand_typein+"&familyId="+family_typein+"&engineDesc="+qenginedesc_typein
        +"&gearboxType="+gearboxtype_typein+"&pageNo="+vehiclepage;

		console.info(carTypeUrl);
		var html = '';
        var myxiangq ='';
		$.ajax({
			url: carTypeUrl,
			type: "post",
			async: false,//发送同步请求
			dataType:'jsonp',
			jsonpCallback:'aa',
			success: function (data) 
			{
				console.info(data);
				
				if(vehiclepage=="1")
				{
					$("#qvehicle").html("");
					/*$("#qvehicle").append("<option value='0'>请选择</option>");*/
				}
				
				if(data.ProductResponses.vehicle!=null)
				{
					for(var i=0;i<data.ProductResponses.vehicle.length;i++)
					{
						var vehicleobj = data.ProductResponses.vehicle[i];
						html +="<li class='pr' value='"+vehicleobj.VehicleCode+"' seats='"+vehicleobj.Seat+"' carname='"+vehicleobj.VehicleName+"'>"+vehicleobj.VehicleName+"&nbsp;&nbsp;"+vehicleobj.GearboxType+"&nbsp;&nbsp;"+vehicleobj.ConfigName+"&nbsp;&nbsp;"+vehicleobj.Seat+"座(参考价&nbsp￥&nbsp"+vehicleobj.PurchasePrice+")</li>";
						$("#qvehicle").append(html);
	            		/*$("#qvehicle").append("<option value='"+vehicleobj.VehicleCode+"'>"+vehicleobj.VehicleName+"</option>");*/
					}
					
					displayvehicle(vehiclepage-0+1);
				}
			},
			error: function (data) {
			 
			}
		});
	}
//	选择车的型号
	$(".zhanshi").on("click",function(){
		$(".mask").show();
		$(".xinghao").show();
		$(".xinghao").addClass("donghua");
	})
	$(".xinghao ul li").on("click",function(){
		$(this).addClass("addcolor").siblings().removeClass("addcolor");
		myxiangq = $(this).text();
		$(".zhuantai").hide();
		$(this).find(".zhuantai").show();
	})
	$(".yanse").on("click",function(){
		$(this).addClass("addcolor").siblings().removeClass("addcolor");
	})
	$(".quxiao").on("click",function(){
		$(".mask").hide();
		$(".xinghao").hide();		
	})
	$(".quding").on("click",function(){
		$(".xinghao").removeClass(".donghua");
		if(myxiangq == ""){
			/*alert("请选择车型")*/
		}else{
			$(".mask").hide();
			$(".xinghao").hide();
			$(".zhanshi").html('');
			$(".zhanshi").text(myxiangq);
		}
		
	})
	
	
}