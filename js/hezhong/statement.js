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
    	sendRequest("../../life/hz/toldinfo_save.do",{"orderNo":$("#orderNo").val()},function(data)
    	{
    		var obj = JSON.parse(data);
    		console.log(obj);
        	if(obj.code == 0)
        	{
        		var orderNo = obj.orderNo;
				if($("#riskCode").val()=="634"){
        			window.location.href = "../../life/hz/nc_hz_abb.do?payendyear="+$("#payendyear").val()
        			+"&prem="+Number($("#prem").val()).toFixed(2)+"&insuyear="+$("#insuyear").val()+"&sex="+$("#sex").val()
                    +"&age="+$("#age").val()+"&mainPrem="+Number($("#mainPrem").val()).toFixed(2)+"&firstPrem="+Number($("#firstPrem").val()).toFixed(2)
                    +"&secondPrem="+Number($("#secondPrem").val()).toFixed(2)+"&getyear="+$("#getyear").val();
        		}else if($("#riskCode").val()=="636"){
        			window.location.href = "../../life/hz/nc_hz_acx.do?payendyear="+$("#payendyear").val()
        			+"&amnt="+$("#amnt").val()+"&insuyear="+$("#insuyear").val()+"&prem="+$("#prem").val()+"&riskCode="+$("#riskCode").val();
        		}else if($("#riskCode").val()=="637"){
        			window.location.href = "../../life/hz/nc_hz_awy.do?payendyear="+$("#payendyear").val()
        			+"&amnt="+$("#amnt").val()+"&insuyear="+$("#insuyear").val()+"&prem="+$("#prem").val()+"&riskCode="+$("#riskCode").val();
        		}else if($("#riskCode").val()=="256"){
        			window.location.href = "../../life/hz/nc_hz_fxjs.do?payendyear="+$("#payendyear").val()
        			+"&amnt="+Number($("#amnt").val()).toFixed(2)+"&insuyear="+$("#insuyear").val()+"&prem="
                        +Number($("#prem").val()).toFixed(2)+"&riskCode="+$("#riskCode").val()+"&sex="+$("#sex").val()+"&age="+$("#age").val();
        		}
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