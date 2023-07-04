	
$(function () 
{
	/*$("#insuredArea").val("上海"+'                 '+"上海");*/
	$("#insuredArea").val("上海");
	$("#my_insuredArea").val("上海");
	
	$("#cardType").change(function()
	    {
	    	$("#cardType_dummy").val($("#cardType").find("option:selected").text());
	    	
	    	getArea();
	    })

	
	getArea();
	
	$("#sureToSave").on("click", function () 
	{
		var val = $("#licenseNoPlat").text()+$("#licenseNoPlat1").text()+$("#plateno").val();
		$("#licenseNo_hide").val(val);
		if(!checkall())
		{
			return false;
		}
		
		fm.submit();
	})
	
	$("#plateno").on("blur", function () 
	{
		checkplateno($(this));
    });
	
	$("#mobile").on("blur", function () 
	{
        checkTel($(this));
    });
	
	$("#carowner").on("blur", function () 
	{
		checkName($(this));
	});
/*	$(".zimu li").on("click",function(){
		var text = $(this).text()
		$("#licenseNoPlat1").text(text);
		$(".zimu").addClass("donghua");
		$(".backBg2").hide();
	})*/
//	$("#licenseNoPlat1").on("click",function(){
//		$(".zimu").removeClass("donghua");
//		$(".zimu").addClass("donghua1");
//		$(".zimu").show();
//		$(".backBg2").show();
//		
//	})
	$("#licenseNoPlat").on("click",function(){
		$(".cutname").addClass("donghua1");
		$(".cutname").show();
		$(".backBg2").show();
		
	})
		$(".cutname li").on("click",function(){
		var text = $(this).text()
		$("#licenseNoPlat").text(text);
		$(".zimu").addClass("donghua1");
		$(".zimu").show();
		$(".cutname").addClass("donghua");
		$(".cutname").hide();
//		$(".backBg2").hide();
	})
	$(".zimu li").on("click",function(){
		var text = $(this).text()
		$("#licenseNoPlat1").text(text);
		$(".zimu").addClass("donghua");
		$(".zimu").hide();
		$(".backBg2").hide();
		$(".zimu").removeClass("donghua");
		$(".zimu").removeClass("donghua1");
		$(".cutname").removeClass("donghua");
		$(".cutname").removeClass("donghua1");
	})
})

function checkall()
{
	var flag = true;
	
	// if(!checkplateno($("#plateno")))
	// {
	// 	flag = false;
	// }
	
	if(!checkTel($("#mobile")))
	{
		flag = false;
	}
	
	if(!checkName($("#carowner")))
	{
		flag = false;
	}
	
	return flag;
}

function checkplateno(plateno)
{
	if(plateno.val().length != 5&&$("#plateno").val().length != 6)
	{
		plateno.parent().siblings(".errorMsg").css("display", "inline-block").text("车牌号码错误!");
		return false;
	}else{
		plateno.parent().siblings(".errorMsg").hide().text("");
        return true;s
	}
	
//	var result = "";
//	
//	var xreg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF]$)|([DF][A-HJ-NP-Z0-9][0-9]{4}$))/;
//	if(plateno.val().length == 6)
//	{
//		result = xreg.test(plateno.val());
//	}
//	
//	var creg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1}$/;
//	if(plateno.val().length == 5)
//	{
//		result = creg.test(plateno.val());
//	}
//	
//	if(!result)
//	{
//		plateno.parent().siblings(".errorMsg").css("display", "inline-block").text("车牌号码错误!");
//		return false;
//	}
//	else
//	{
//		plateno.parent().siblings(".errorMsg").hide().text("");
//	}	
	
}

function getArea(){
	 var cityurl = 'http://wxopenapi.sinosig.com/travelCity!getTravelCityForInterface.action?hotSign=2&limit=0&queryCon=01&encoding=GBK&callback=jsonp1045';
	 var url = ''
	$.ajax({
        url: cityurl,
        type: "post",
        async: false,//发送同步请求
        dataType:'jsonp',
        jsonpCallback:'jsonp1045',
        success: function (data) {
        	console.info(data);
        	for(var i=0;i<data.length;i++){
        		$.ajax({
        	        url: "http://wxopenapi.sinosig.com/travelCity!getTravelCityForInterface.action?hotSign=3&limit=0&queryCon="+data[i].id+"&encoding=GBK&callback=jsonp1045",
        	        type: "post",
        	        async: false,//发送同步请求
        	        dataType:'jsonp',
        	        jsonpCallback:'jsonp1045',
        	        success: function (data) {
        	        	console.info(data);
        	        	for(var i=0;i<data.length;i++){
        	        		var arry = [];
        	        		/*arry.append(data[i].ContName);*/
        	        		console.info(data[i].ContName);
        	        		$("#cardType").html='';
        	        		$("#cardType").append("<option value='"+data[i].id+"'>"+data[i].ContName+"</option>");
        	        	}
        	        	
        	        	
        	        },
        	       
        	    });
        	}
        	
        },
       
    });
	
	
	
	
    //ajax请求 默认发同步请求
    /*sendAreaRequest = function (url, data, success, error) {*/
       /* $.ajax({
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
        });*/
   /* };*/
    //初始获取省数据
   /* var iosProvinces = provinces;*/
    //var iosCitys = citys;
    
   /* this.citysObject = {
        selectedOneLevelId: {},
        iosCitys: citys,
        refreshCitys: function (oneLevelId) {
        	
        	var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                
                var cityurl = 'http://wxopenapi.sinosig.com/travelCity!getTravelCityForInterface.action?hotSign=3&limit=0&queryCon='+oneLevelId+'&contName=&encoding=GBK&callback=aa'
                
                $.ajax({
                    url: cityurl,
                    type: "post",
                    async: false,//发送同步请求
                    dataType:'jsonp',
                    jsonpCallback:'aa',
                    success: function (data) 
                    {
                    	for(var i=0;i<data.length;i++)
                    	{
                    		_this.iosCitys.push({
                                id: data[i].id,
                                value: data[i].ContName,
                                parentId:oneLevelId,
                                codeValue:data[i].id
                            });
                    	}
                    	//alert(JSON.stringify(provinces))
                    },
                    error: function (data) {
                        
                    }
                });
            }
            
        }
        
    };*/
    
/*    var that = this;
    $("#"+id).on("click", function () {
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);

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
        
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    })*/
}