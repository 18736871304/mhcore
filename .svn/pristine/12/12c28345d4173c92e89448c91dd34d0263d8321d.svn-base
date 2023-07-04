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
    	sendRequest("../../life/anxin/toldinfo_save.do",{"orderNo":$("#orderNo").val()},function(data)
    	{
    		var obj = JSON.parse(data);
    		console.log(obj);
        	if(obj.code == 0)
        	{
        		var orderNo = obj.orderNo;
        		if($("#aliasname").val()=='bwylPlus')
        		{
        			window.location.href = "../../life/anxin/nc_ax_bwylPlus_03.do?socialInsuFlag="+$('#socialInsuFlag').val()+"&prem="+$('#prem').val()
        		}
        		else if($("#aliasname").val()=='axys')
        		{
        			window.location.href = "../../life/anxin/nc_ax_axys.do?prem="+$('#prem').val()+"&source="+$('#source').val()
        		}
        		else if($("#aliasname").val()=='qnbbwylx')
        		{
        			window.location.href = "../../life/anxin/nc_ax_qnbbwylx.do?socialInsuFlag="+$('#socialInsuFlag').val()+"&prem="+$('#prem').val()
        			+"&aliascode="+$('#aliascode').val()
        			
        		}else if($("#aliasname").val()=='lnrywx'){
        			window.location.href = "../../life/anxin/nc_ax_lnrywx.do?prem="+$("#prem").val()+"&plan="+$("#plan").val()
        		}
        		else if($("#aliasname").val()=='axes2')
        		{
        			console.log("axes2");
        			window.location.href = "../../life/anxin/nc_ax_axes2.do?socialInsuFlag="+$('#socialInsuFlag').val()+"&prem="+$('#prem').val()
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