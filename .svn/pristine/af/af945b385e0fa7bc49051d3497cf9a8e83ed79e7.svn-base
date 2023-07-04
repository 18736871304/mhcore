$(document).ready(function() {
	$(".btn button").click(function(){
		$(this).siblings("button").removeClass("active");
		$(this).addClass("active");
	});
	$(".pop-sure").on("click",function(){
        $(".pop").hide();
        $(".mask").hide();
    });
    $(".inconformity").click(function(){
        $(".pop").show();
        $(".mask").show();
    	$(".pop span").text("对不起，您的健康状况不符合本产品的要求，不能投保本产品！");
    });
    console.log("coincidence")
    $(".coincidence").click(function(){
    	//alert($("#orderNo").val());
    	
    	//alert($("#riskCode").val());
    	sendRequest("../../life/hq/toldinfo_save.do",{"orderNo":$("#orderNo").val()},function(data)
    	{
    		var obj = JSON.parse(data);
    		console.log(obj);
        	if(obj.code == 0)
        	{
        		var orderNo = obj.orderNo;
        		if($("#riskCode").val()=='14040')
        		{
        			console.log(14040);
        			window.location.href = "../../life/hq/nc_hq_jxnn.do?payendyear="+$("#payendyear").val()
        				+"&getyear="+$("#getyear").val()
        				+"&prem="+$("#prem").val()
        		}
        		else if($("#riskCode").val()=='34010')
        		{
        			window.location.href = "../../life/hq/nc_hq_yjwn.do"
        		}
        		else if($("#riskCode").val()=='16050'){
        			window.location.href = "../../life/hq/nc_hq_ykb.do?payendyear="+$("#payendyear").val()
        			+"&prem="+$("#prem").val()+"&amnt="+$("#amnt").val()
        		}
        		else if($("#riskCode").val()=='17040'){
        			window.location.href = "../../life/hq/nc_hq_bwyl.do?prem="+$("#prem").val()+"&plan="+$("#plan").val()
        			+"&socialInsuFlag="+$("#socialInsuFlag").val()
        		}
        		else if($("#riskCode").val()=='11010'){
        			window.location.href = "../../life/hq/nc_hq_yab.do?payendyear="+$("#payendyear").val()
        			+"&prem="+$("#prem").val()+"&amnt="+$("#amnt").val()
        		}
        		else if($("#riskCode").val()=='13020'){
        			window.location.href = "../../life/hq/nc_hq_bwlt.do?payendyear="+$("#payendyear").val()
        			+"&prem="+$("#prem").val()+"&amnt="+$("#amnt").val()+"&insuyear="+$("#insuyear").val()
        		}
        		else if($("#riskCode").val()=='12030'){
        			window.location.href = "../../life/hq/nc_hq_yabds.do?payendyear="+$("#payendyear").val()
        			+"&prem="+$("#prem").val()+"&amnt="+$("#amnt").val()+"&insuyear="+$("#insuyear").val()
        		}
//        		else{
//        			window.location.href = "../../life/hq/nc_hq_jxnn.do"
//        		}
        		//window.location.href = "../../life/hq/contractpay.do?orderNo="+orderNo;
            }
        	else
        	{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
    	},function(){})
    	
    });
    
});
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