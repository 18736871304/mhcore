$(function () {
	/*alert($("#insorgancode2_dummy").val());
	alert($("#riskcode2_dummy").val());
	alert($("#insureyear2_dummy").val());
	alert($("#payendyear2_dummy").val());*/
    
	$("#insuredage").change(function(){
	    if($("#insuredage").find("option:selected").text() != "请选择" && $("#insuredsex").find("option:selected").text() != "请选择" && $("#payendyear").find("option:selected").text() != "请选择" && $("#amnt").find("option:selected").text() != "请选择" && $("#risktype").find("option:selected").text() != "请选择"){
	        $(".queding").addClass("sure_color");
	    }else{
	        $(".queding").removeClass("sure_color");
	    }
	});
	$("#insuredsex").change(function(){
	    if($("#insuredsex").find("option:selected").text() != "请选择" && $("#insuredsex").find("option:selected").text() != "请选择" && $("#payendyear").find("option:selected").text() != "请选择" && $("#amnt").find("option:selected").text() != "请选择" && $("#risktype").find("option:selected").text() != "请选择"){
	        $(".queding").addClass("sure_color");
	    }else{
	        $(".queding").removeClass("sure_color");
	    }
	});
	$("#payendyear").change(function(){
		console.log($("#insuredage").find("option:selected").text())
	    if($("#insuredage").find("option:selected").text() != "请选择" && $("#insuredsex").find("option:selected").text() != "请选择" && $("#payendyear").find("option:selected").text() != "请选择" && $("#amnt").find("option:selected").text() != "请选择" && $("#risktype").find("option:selected").text() != "请选择"){
	        $(".queding").addClass("sure_color");
	    }else{
	        $(".queding").removeClass("sure_color");
	    }
	});
	$("#amnt").change(function(){
	    if($("#insuredage").find("option:selected").text() != "请选择" && $("#insuredsex").find("option:selected").text() != "请选择" && $("#payendyear").find("option:selected").text() != "请选择" && $("#amnt").find("option:selected").text() != "请选择" && $("#risktype").find("option:selected").text() != "请选择"){
	        $(".queding").addClass("sure_color");
	    }else{
	        $(".queding").removeClass("sure_color");
	    }
	});
	$("#risktype").change(function(){
	    if($("#insuredage").find("option:selected").text() != "请选择" && $("#insuredsex").find("option:selected").text() != "请选择" && $("#payendyear").find("option:selected").text() != "请选择" && $("#amnt").find("option:selected").text() != "请选择" && $("#risktype").find("option:selected").text() != "请选择"){
	        $(".queding").addClass("sure_color");
	    }else{
	        $(".queding").removeClass("sure_color");
	    }
	});
	
	})
	//校验
	$("#insuredage").on("blur", function() 
	{
		if($("#insuredage").val()==null || $("#insuredage").val()==""){
			$("#insuredage").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入年龄！");
		}else{
			$(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		}	
	})
	//保费
		$("#prem1").on("blur", function(){
			if ($("#prem1").val() == ""|| $("#prem1").val() == null) {
		        $("#prem1").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }			
		})
		$("#prem2").on("blur", function(){
			if ($("#prem2").val() == ""|| $("#prem3").val() == null) {
		        $("#prem2").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		})
		$("#prem3").on("blur", function(){
			if ($("#prem3").val() == ""|| $("#prem3").val() == null) {
		        $("#prem3").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		})
		$("#prem4").on("blur", function(){
			if ($("#prem4").val() == ""|| $("#prem4").val() == null) {
		        $("#prem4").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		})
	
	
		
		
	$("#insuredsex").on("change", function () {
	    if ($("#insuredsex").find("option:selected").text() == "请选择") {
	        $("#insuredsex").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择性别！");
	    } else {
	        $("#insuredsex").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	$("#payendyear").on("change", function () {
	    if ($("#payendyear").find("option:selected").text() == "请选择") {
	        $("#payendyear").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择缴费年限！");
	    } else {
	        $("#payendyear").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	
	$("#amnt").on("change", function () {
	    if ($("#amnt").find("option:selected").text() == "请选择") {
	        $("#amnt").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保额！");
	    } else {
	        $("#amnt").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	
	$(".next").on("click", function () {
		var flag = true;
		if($("#insuredage").val()==null || $("#insuredage").val()==""){
			$("#insuredage").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入年龄！");
			flag=false;
		}else{
			$(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		}
		
		if($("#insuredsex").find("option:selected").text() == "请选择"){
			$("#insuredsex").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择性别！");
			flag=false;
	    } else {
	        $("#insuredsex").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		}
		
		if($("#payendyear").find("option:selected").text() == "请选择"){
			$("#payendyear").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择缴费年限！");
			flag=false;
	    } else {
	        $("#payendyear").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		}
		
		if($("#amnt").find("option:selected").text() == "请选择"){
			$("#amnt").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保额！");
			flag=false;
	    } else {
	        $("#amnt").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		}
		if($("#risktype").find("option:selected").text() == "请选择"){
			$("#risktype").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品类型！");
			flag=false;
	    } else {
	        $("#risktype").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		}
		
		if (!flag) return;
		
		window.location.href = "./planrisk_step02.do?insuredage="+$("#insuredage").val()+"&insuredsex="+$("#insuredsex").find("option:selected").val()
		+"&payendyear="+$("#payendyear").find("option:selected").val()+"&amnt="+$("#amnt").find("option:selected").val();
//		sendRequest("../../life/planrisk/saveUserplan.do",getData(),function (data) {
//	    	console.log(data);
//	    	var obj = JSON.parse(data);
//	    	if(obj.code == 0){
//	    		var userplanid=obj.userplanid;
//	    		window.location.href = "./planrisk_step02.do?userplanid="+userplanid;
//	        }else{
//	        	$(".pop").show();
//	        	$(".mask").show();
//	        	$(".pop span").text(obj.msg);
//	        }
//	    },function(){});
	})
        
	function getData(){
		var data = 
		{
			"insuredage":$("#insuredage").val(),
			"insuredsex":$("#insuredsex").find("option:selected").val(),
			"payendyear":$("#payendyear").find("option:selected").val(),
			"amnt":$("#amnt").find("option:selected").val(),
			"risktype":$("#risktype").find("option:selected").val()
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
	

	
//	保险公司
	$("#insorgancode1").on("change", function () {
	    if ($("#insorgancode1").find("option:selected").text() == "请选择") {
	        $("#insorgancode1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
	    } else {
	        $("#insorgancode1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	    
	});
	$("#insorgancode2").on("change", function () {
	    if ($("#insorgancode2").find("option:selected").text() == "请选择") {
	        $("#insorgancode2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
	    } else {
	        $("#insorgancode2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	$("#insorgancode3").on("change", function () {
		if($(".canping3").hasClass("canping")){
		    if ($("#insorgancode3").find("option:selected").text() == "请选择") {
		        $("#insorgancode3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
		    } else {
		        $("#insorgancode3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		 }
	});
	$("#insorgancode4").on("change", function () {
		if($(".canping4").hasClass("canping")){
		    if ($("#insorgancode4").find("option:selected").text() == "请选择") {
		        $("#insorgancode4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
		    } else {
		        $("#insorgancode4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
	});
//	产品选择
	$("#riskcode1").on("change", function () {
		var year ='';
	    function getUrlParam(name) {
	        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) return unescape(r[2]); return null; //返回参数值
	    }
	     year = getUrlParam('payendyear');
		if ($("#riskcode1").find("option:selected").text() == "请选择") {
	        $("#riskcode1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
	        flag=false;
	    }else if($("#riskcode1").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode1").find("option:selected").text() == "长青树" && year == "30Y"){
	    	 $("#riskcode1").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
		        flag=false;
	    } else {
	        $("#riskcode1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	$("#riskcode2").on("change", function () {
		var year ='';
	    function getUrlParam(name) {
	        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) return unescape(r[2]); return null; //返回参数值
	    }
	     year = getUrlParam('payendyear');
		if ($("#riskcode2").find("option:selected").text() == "请选择") {
	        $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
	        flag=false;
	    }else if($("#riskcode2").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode2").find("option:selected").text() == "长青树" && year == "30Y"){
	    	 $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
		        flag=false;
	    } else {
	        $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	$("#riskcode3").on("change", function () {
		var year ='';
	    function getUrlParam(name) {
	        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) return unescape(r[2]); return null; //返回参数值
	    }
	     year = getUrlParam('payendyear');
	     if($(".canping3").hasClass("canping")){
			   if ($("#riskcode3").find("option:selected").text() == "请选择") {
			        $("#riskcode3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
			        flag=false;
			    } else if($("#riskcode3").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode3").find("option:selected").text() == "长青树" && year == "30Y"){
			    	 $("#riskcode3").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
				        flag=false;
			    }else {
			        $("#riskcode3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
			    }
			}
	});
	$("#riskcode4").on("change", function () {
		var year ='';
	    function getUrlParam(name) {
	        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) return unescape(r[2]); return null; //返回参数值
	    }
	     year = getUrlParam('payendyear');
	     if($(".canping4").hasClass("canping")){
			   if ($("#riskcode4").find("option:selected").text() == "请选择") {
			        $("#riskcode4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
			        flag=false;
			    }else if($("#riskcode4").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode4").find("option:selected").text() == "长青树" && year == "30Y"){
			    	 $("#riskcode4").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
				        flag=false;
			    }else {
			        $("#riskcode4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
			    }
			}
	});
	
	
	
//	保障期限
	$("#insureyear1").on("change", function () {
	    if ($("#insureyear1").find("option:selected").text() == "请选择") {
	        $("#insureyear1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
	    } else {
	        $("#insureyear1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	$("#insureyear2").on("change", function () {
	    if ($("#insureyear2").find("option:selected").text() == "请选择") {
	        $("#insureyear2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
	    } else {
	        $("#insureyear2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	});
	$("#insureyear3").on("change", function () {
		if($(".canping3").hasClass("canping")){
		    if ($("#insureyear3").find("option:selected").text() == "请选择") {
		        $("#insureyear3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
		    } else {
		        $("#insureyear3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		 }
	});
	$("#insureyear4").on("change", function () {
		if($(".canping4").hasClass("canping")){
		    if ($("#insureyear4").find("option:selected").text() == "请选择") {
		        $("#insureyear4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
		    } else {
		        $("#insureyear4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
	});
	
	
	
	if($(".canping3").hasClass("canping")){
	   if ($("#insorgancode3").find("option:selected").text() == "请选择") {
	        $("#insorgancode3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司3！");
	    } else {
	        $("#insorgancode3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	}
	if($(".canping4").hasClass("canping")){
	   if ($("#insorgancode4").find("option:selected").text() == "请选择") {
	        $("#insorgancode4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司4！");
	    } else {
	        $("#insorgancode4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
	}

	
	
	
	
	//选择保险公司 给产品赋值
	
	//下一步：
	$(".next02").on("click", function () {
		var year ='';
	    function getUrlParam(name) {
	        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) return unescape(r[2]); return null; //返回参数值
	    }
	     year = getUrlParam('payendyear');
		var flag = true;
		if ($("#insorgancode1").find("option:selected").text() == "请选择") {
	        $("#insorgancode1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
	        flag=false;
	    } else {
	        $("#insorgancode1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }

		if ($("#insorgancode2").find("option:selected").text() == "请选择") {
	        $("#insorgancode2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
	        flag=false;
	    } else {
	        $("#insorgancode2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
		
		if($(".canping3").hasClass("canping")){
		   if ($("#insorgancode3").find("option:selected").text() == "请选择") {
		        $("#insorgancode3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
		        flag=false;
		    } else {
		        $("#insorgancode3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		if($(".canping4").hasClass("canping")){
		   if ($("#insorgancode4").find("option:selected").text() == "请选择") {
		        $("#insorgancode4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保险公司！");
		        flag=false;
		    } else {
		        $("#insorgancode4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		//产品
		if ($("#riskcode1").find("option:selected").text() == "请选择") {
	        $("#riskcode1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
	        flag=false;
	    }else if($("#riskcode1").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode1").find("option:selected").text() == "长青树" && year == "30Y"){
	    	 $("#riskcode1").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
		        flag=false;
	    } else {
	        $("#riskcode1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
		if ($("#riskcode2").find("option:selected").text() == "请选择") {
	        $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
	        flag=false;
	    }else if($("#riskcode2").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode2").find("option:selected").text() == "长青树" && year == "30Y"){
	    	 $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
		        flag=false;
	    }else {
	        $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
		
	/*	if ($("#riskcode2").find("option:selected").text() == "请选择") {
	        $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
	        flag=false;
	    }else if($("#riskcode2").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode2").find("option:selected").text() == "长青树" && year == "30Y"){
	    	 $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
		        flag=false;
	    }else {
	        $("#riskcode2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }*/
		
		
		
		if($(".canping3").hasClass("canping")){
		   if ($("#riskcode3").find("option:selected").text() == "请选择") {
		        $("#riskcode3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
		        flag=false;
		    } else if($("#riskcode3").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode3").find("option:selected").text() == "长青树" && year == "30Y"){
		    	 $("#riskcode3").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
			        flag=false;
		    }else {
		        $("#riskcode3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		if($(".canping4").hasClass("canping")){
		   if ($("#riskcode4").find("option:selected").text() == "请选择") {
		        $("#riskcode4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择产品！");
		        flag=false;
		    }else if($("#riskcode4").find("option:selected").text() == "健康之家" && year == "30Y" || $("#riskcode4").find("option:selected").text() == "长青树" && year == "30Y"){
		    	 $("#riskcode4").parent().siblings(".errorMsg").css("display", "inline-block").text("不支持缴费期限30年");
			        flag=false;
		    }else {
		        $("#riskcode4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		//保费
		
		if($(".my_libiao1").hasClass("canpin")){			
			
		}else{
			if ($("#prem1").val() == ""|| $("#prem1").val() == null) {
		        $("#prem1").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		
		if($(".my_libiao2").hasClass("canpin")){			

				}else{
					if ($("#prem2").val() == ""|| $("#prem3").val() == null) {
				        $("#prem2").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
				        flag=false;
				    } else {
				        $("#prem2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
				    }
				}
		if($(".my_libiao3").hasClass("canpin")){			
			
		}else{
			if ($("#prem3").val() == ""|| $("#prem3").val() == null) {
		        $("#prem3").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		if($(".my_libiao4").hasClass("canpin")){			
			
		}else{
			if ($("#prem4").val() == ""|| $("#prem4").val() == null) {
		        $("#prem4").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入保费！");
		        flag=false;
		    } else {
		        $("#prem4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		
		
		//保障期间
		if ($("#insureyear1").find("option:selected").text() == "请选择") {
	        $("#insureyear1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保障期限！");
	        flag=false;
	    } else {
	        $("#insureyear1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
		
		if ($("#insureyear2").find("option:selected").text() == "请选择") {
	        $("#insureyear2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保障期限！");
	        flag=false;
	    } else {
	        $("#insureyear2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	    }
		
		if($(".canping3").hasClass("canping")){
		   if ($("#insureyear3").find("option:selected").text() == "请选择") {
		        $("#insureyear3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保障期限！");
		        flag=false;
		    } else {
		        $("#insureyear3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		if($(".canping4").hasClass("canping")){
		   if ($("#insureyear4").find("option:selected").text() == "请选择") {
		        $("#insureyear4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择保障期限！");
		        flag=false;
		    } else {
		        $("#insureyear4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
		    }
		}
		
		if (!flag) return;
		
		sendRequest("../../staff/saveUserplan.do",getData(),function (data) {
	    	/*console.log(data);*/
	    	var obj = JSON.parse(data);
	    	if(obj.code == 0){
	    		var userplanid=obj.userplanid;
	    		window.location.href = "../../staff/planrisk_step03.do?userplanid="+userplanid;
	        }else{
	        	alert(obj.msg)
//	        	$(".pop").show();
//	        	$(".mask").show();
//	        	$(".pop span").text(obj.msg);
	        }
	    },function(){});
	})
	
	//获取产品
    $(".getriskcode1").change(function(e){
    	if($("#insorgancode1").val() !="请选择"){
    		sendRequest("../../staff/getriskDetails.do",{"insorgancode":$("#insorgancode1").val()},function (data) 
    			{
    				var html = '';
    				var name='';
    				$("#riskcode1").html('');
	    			var obj = JSON.parse(data);
	    			for(var i=0;i<obj.length;i++){  
	    				html +="<option value='"+obj[i].riskcode+"'>"+obj[i].riskname+"</option>"  				
	    				/*console.log(obj);*/
	    				$("#riskcode1_dummy").val(obj[0].riskname);	    				
	    			}
	    			$("#riskcode1").append(html)	    			
    			})   			
    		}
    	$(".hao1").removeClass("canpin");
    	$(".border_b1").removeClass("my_border");
    	
    		
    		if($("#insorgancode1_dummy").val() == "弘康人寿"){
    			$("#insureyear1").html('');
    			$("#insureyear1_dummy").val('终身') 
    			var html1 = '<option value="106A">终身</option><option value="85A">保至85岁</option><option value="70A">保至70岁</option> '
    			$("#insureyear1").append(html1);
//    			缴费期限    			
    			$("#payendyear1").html('');    			 
    			$(".my_payendyear").html('');
    			$("#payendyear1_dummy").val('30年');
    			var html2 = '<option value="30Y">30年</option><option value="20Y">20年</option><option value="15Y">15年</option> '
    			$(".my_payendyear").append(html2);
    		}else if($("#insorgancode1_dummy").val() == "安邦"){
    			$("#insureyear1").html('')
    			$("#insureyear1_dummy").val('终身')    			
    			var html1 = '<option value="106A">终身</option>'
    			$("#insureyear1").append(html1);
//    			缴费期限
    			$(".my_payendyear").html('');
    			$("#payendyear1").html('');
    			
    			$("#payendyear1_dummy").val('20年');
    			var html2 = '<option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="0Y">一次性交清</option>'
    			$(".my_payendyear").append(html2);
    		}else{
    			$("#insureyear1").html('')
    			$("#insureyear1_dummy").val('终身')    			
    			var html1 = '<option value="106A">终身</option>'
    			$("#insureyear1").append(html1);
//    			缴费期限
    			$("#payendyear1").html('');
    			$(".my_payendyear").html('');
    			$("#payendyear1_dummy").val('30年');
    			var html2 = '<option value="30Y">30年</option><option value="25Y">25年</option><option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="3Y">3年</option><option value="0Y">一次性交清</option> '
    			$(".my_payendyear").append(html2);
    		}
		})
	$("#riskcode1").change(function(){
		$("#riskcode1_dummy").val($("#riskcode1").find("option:selected").text());
	})
	$("#insureyear1").change(function(){
		$("#insureyear1_dummy").val($("#insureyear1").find("option:selected").text());
	})
	
	$(".my_payendyear").change(function(){
		$("#payendyear1_dummy").val($(".my_payendyear").find("option:selected").text());
	})
	$(".getriskcode2").change(function(e){
		if($("#insorgancode2").val() !="请选择"){
			sendRequest("../../staff/getriskDetails.do",{"insorgancode":$("#insorgancode2").val()},function (data) 
	    			{
	    				var html = '';
	    				var name='';
	    				$("#riskcode2").html('');
		    			var obj = JSON.parse(data);
		    			for(var i=0;i<obj.length;i++){  
		    				html +="<option value='"+obj[i].riskcode+"'>"+obj[i].riskname+"</option>"  				
		    				/*console.log(obj);*/
		    				$("#riskcode2_dummy").val(obj[0].riskname);	    				
		    			}
		    			$("#riskcode2").append(html)	    			
	    			})   			
	    		}
			$(".hao2").removeClass("canpin");
	    	$(".border_b2").removeClass("my_border");
	    	if($("#insorgancode2_dummy").val() == "弘康人寿"){
    			$("#insureyear2").html('');
    			$("#insureyear2_dummy").val('终身') 
    			var html1 = '<option value="106A">终身</option><option value="85A">保至85岁</option><option value="70A">保至70岁</option> '
    			$("#insureyear2").append(html1);
//    			缴费期限    			
    			$("#payendyear2").html('');    			 
    			$(".my_payendyear2").html('');
    			$("#payendyear2_dummy").val('30年');
    			var html2 = '<option value="30Y">30年</option><option value="20Y">20年</option><option value="15Y">15年</option> '
    			$(".my_payendyear2").append(html2);
    		}else if($("#insorgancode2_dummy").val() == "安邦"){
    			$("#insureyear2").html('')
    			$("#insureyear2_dummy").val('终身')    			
    			var html1 = '<option value="106A">终身</option>'
    			$("#insureyear2").append(html1);
//    			缴费期限
    			$(".my_payendyear2").html('');
    			$("#payendyear2").html('');
    			
    			$("#payendyear2_dummy").val('20年');
    			var html2 = '<option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="0Y">一次性交清</option>'
    			$(".my_payendyear2").append(html2);
    		}else{
    			$("#insureyear2").html('')
    			$("#insureyear2_dummy").val('终身')    			
    			var html1 = '<option value="106A">终身</option>'
    			$("#insureyear2").append(html1);
//    			缴费期限
    			$("#payendyear2").html('');
    			$(".my_payendyear2").html('');
    			$("#payendyear2_dummy").val('30年');
    			var html2 = '<option value="30Y">30年</option><option value="25Y">25年</option><option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="3Y">3年</option><option value="0Y">一次性交清</option> '
    			$(".my_payendyear2").append(html2);
    		}
		
    });
	$("#riskcode2").change(function(){
		$("#riskcode2_dummy").val($("#riskcode2").find("option:selected").text());
	})
	$("#insureyear2").change(function(){
		$("#insureyear2_dummy").val($("#insureyear2").find("option:selected").text());
	})
	
	$(".my_payendyear2").change(function(){
		$("#payendyear2_dummy").val($(".my_payendyear2").find("option:selected").text());
	})
	$(".getriskcode3").change(function(e){
		if($("#insorgancode3").val() !="请选择"){
			sendRequest("../../staff/getriskDetails.do",{"insorgancode":$("#insorgancode3").val()},function (data) 
	    			{
	    				var html = '';
	    				var name='';
	    				$("#riskcode3").html('');
		    			var obj = JSON.parse(data);
		    			for(var i=0;i<obj.length;i++){  
		    				html +="<option value='"+obj[i].riskcode+"'>"+obj[i].riskname+"</option>"  				
		    			/*	console.log(obj);*/
		    				$("#riskcode3_dummy").val(obj[0].riskname);	    				
		    			}
		    			$("#riskcode3").append(html)	    			
	    			})   			
	    		}
			$(".hao3").removeClass("canpin");
			$(".border_b3").removeClass("my_border");
			if($("#insorgancode3_dummy").val() == "弘康人寿"){
    			$("#insureyear3").html('');
    			$("#insureyear3_dummy").val('终身') 
    			var html1 = '<option value="106A">终身</option><option value="85A">保至85岁</option><option value="70A">保至70岁</option> '
    			$("#insureyear3").append(html1);
//    			缴费期限    			
    			$("#payendyear3").html('');    			 
    			$(".my_payendyear3").html('');
    			$("#payendyear3_dummy").val('30年');
    			var html2 = '<option value="30Y">30年</option><option value="20Y">20年</option><option value="15Y">15年</option> '
    			$(".my_payendyear3").append(html2);
    		}else if($("#insorgancode3_dummy").val() == "安邦"){
    			$("#insureyear3").html('')
    			$("#insureyear3_dummy").val('终身')    			
    			var html1 = '<option value="106A">终身</option>'
    			$("#insureyear3").append(html1);
//    			缴费期限
    			$(".my_payendyear3").html('');
    			$("#payendyear3").html('');
    			
    			$("#payendyear3_dummy").val('20年');
    			var html2 = '<option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="0Y">一次性交清</option>'
    			$(".my_payendyear3").append(html2);
    		}else{
    			$("#insureyear3").html('')
    			$("#insureyear3_dummy").val('终身')    			
    			var html1 = '<option value="106A">终身</option>'
    			$("#insureyear3").append(html1);
//    			缴费期限
    			$("#payendyear3").html('');
    			$(".my_payendyear3").html('');
    			$("#payendyear3_dummy").val('30年');
    			var html2 = '<option value="30Y">30年</option><option value="25Y">25年</option><option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="3Y">3年</option><option value="0Y">一次性交清</option> '
    			$(".my_payendyear3").append(html2);
    		}
    });
    $("#riskcode3").change(function(){
		$("#riskcode3_dummy").val($("#riskcode3").find("option:selected").text());
	})
	$("#insureyear3").change(function(){
		$("#insureyear3_dummy").val($("#insureyear3").find("option:selected").text());
	})
	
	$(".my_payendyear3").change(function(){
		$("#payendyear3_dummy").val($(".my_payendyear3").find("option:selected").text());
	})
	$(".getriskcode4").change(function(e){
		if($("#insorgancode4").val() !="请选择"){
			sendRequest("../../staff/getriskDetails.do",{"insorgancode":$("#insorgancode4").val()},function (data) 
    			{
    				var html = '';
    				var name='';
    				$("#riskcode4").html('');
	    			var obj = JSON.parse(data);
	    			for(var i=0;i<obj.length;i++){  
	    				html +="<option value='"+obj[i].riskcode+"'>"+obj[i].riskname+"</option>"  				
	    				/*console.log(obj);*/
	    				$("#riskcode4_dummy").val(obj[0].riskname);	    				
	    			}
	    			$("#riskcode4").append(html)	    			
    			})   			
	    	
		}
		$(".hao4").removeClass("canpin");
    	$(".border_b4").removeClass("my_border");
   
    	if($("#insorgancode4_dummy").val() == "弘康人寿"){
			$("#insureyear4").html('');
			$("#insureyear4_dummy").val('终身') 
			var html1 = '<option value="106A">终身</option><option value="85A">保至85岁</option><option value="70A">保至70岁</option> '
			$("#insureyear4").append(html1);
//			缴费期限    			
			$("#payendyear4").html('');    			 
			$(".my_payendyear4").html('');
			$("#payendyear4_dummy").val('30年');
			var html2 = '<option value="30Y">30年</option><option value="20Y">20年</option><option value="15Y">15年</option> '
			$(".my_payendyear4").append(html2);
		}else if($("#insorgancode4_dummy").val() == "安邦"){
			$("#insureyear4").html('')
			$("#insureyear4_dummy").val('终身')    			
			var html1 = '<option value="106A">终身</option>'
			$("#insureyear4").append(html1);
//			缴费期限
			$(".my_payendyear4").html('');
			$("#payendyear4").html('');
			
			$("#payendyear4_dummy").val('20年');
			var html2 = '<option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="0Y">一次性交清</option>'
			$(".my_payendyear4").append(html2);
		}else{
			$("#insureyear4").html('')
			$("#insureyear4_dummy").val('终身')    			
			var html1 = '<option value="106A">终身</option>'
			$("#insureyear4").append(html1);
//			缴费期限
			$("#payendyear4").html('');
			$(".my_payendyear4").html('');
			$("#payendyear4_dummy").val('30年');
			var html2 = '<option value="30Y">30年</option><option value="25Y">25年</option><option value="20Y">20年</option><option value="15Y">15年</option><option value="10Y">10年</option><option value="5Y">5年</option><option value="3Y">3年</option><option value="0Y">一次性交清</option> '
			$(".my_payendyear4").append(html2);
		}
		
    });
    $("#riskcode4").change(function(){
		$("#riskcode4_dummy").val($("#riskcode4").find("option:selected").text());
	})
	$("#insureyear4").change(function(){
		$("#insureyear4_dummy").val($("#insureyear4").find("option:selected").text());
	})
	
	$(".my_payendyear4").change(function(){
		$("#payendyear4_dummy").val($(".my_payendyear4").find("option:selected").text());
	})
	
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