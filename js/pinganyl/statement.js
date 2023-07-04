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
    	sendRequest("../../life/pinganyl/toldinfo_save.do",{"orderNo":$("#orderNo").val()},function(data)
    	{
    		var obj = JSON.parse(data);
    		console.log(obj);
        	if(obj.code == 0)
        	{
        		// var orderNo = obj.orderNo;
                console.log(111);
                var a =$("#riskCode").val();
                console.log(a);
				if($("#riskCode").val()=="P0352"){
        			window.location.href = "../../life/pinganyl/pinganyl_kaxf_step03.do?insuyear="+$("#insuyear").val()+"&amnt="+$("#amnt").val()+"&prem="+$("#prem").val()
        		 }else if($("#riskCode").val()=="P0450J05"){
        		 	window.location.href = "../../life/pinganyl/pinganyl_czwy_step03.do?insuyear="+$("#insuyear").val()+"&amnt="+$("#amnt").val()+"&prem="+$("#prem").val()
        		 }else{}
            }else{
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