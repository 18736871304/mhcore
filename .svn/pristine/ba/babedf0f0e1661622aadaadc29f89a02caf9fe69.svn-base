$(function () { 
/***************************投保人信息校验**************************/
//    姓名校验
    $("#policyName").on("blur", function (){
         checkName($(this));
        if (checkName($(this)))
         {
            $("#policyName").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
         else
        {
             $("#policyName").val($(this).val());
         }
 
    });
     //手机号码校验
    $("#tel").on("blur", function () {
         checkTel($(this));
         if (checkTel($(this))){
            $("#tel").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
         }
         else{
             $("#tel").val($(this).val());
         }
     });
    /* $("#tel1").on("blur", function () {
         checkTel($(this));
         if (checkTel($(this))){
             $("#tel1").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
         }
         else{
             $("#tel1").val($(this).val());
         }
     });*/
   //通讯地址校验
     $("#appntArea").on("blur", function () {
         if ($("#appntArea").val() == "") {
             $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
             flag = false;
         } else {
             $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
         }
     });
  
     //详细地址校验
     $("#address").on("blur", function () {
         checkAddress($(this));
         if (checkAddress($(this))){
             $("#address").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
         }
         else{
             $("#address").val($(this).val());
         }
     });

    $("#carEnd").on("click", function (){
    	if(!checkall()) return
    	/*fm.submit();*/
    	 
        if(checkall()){        	
            var premdata = {
                    "orderid":$("#orderid").val(),
                    "policyName":$("#policyName").val(),
                    "tel":$("#tel").val(),
                    "appntProvince":$("#appntProvince").val(),
                    "appntCity":$("#appntCity").val(),
                    "appntCounty":$("#appntCounty").val(),
                    "appntArea":$("#appntArea").val(),
                    "address":$("#address").val(),
                    "syProposalNo":$("#syProposalNo").val(),
                    "jqProposalNo":$("#jqProposalNo").val(),
                    "insranceName":$("#insranceName").val()
            };

            sendPriceRequest("../../car/sunCar/sun_05.do",premdata,function (data)
            {
                var obj = JSON.parse(data);
                if(obj.code == 0)
                {
                    window.location.href = "https://wxpartner.sinosig.com/netCarAppPayVerifyAction.action?" +
                        "proposalno="+obj.proposalNo+"&insrancename="+obj.insranceName;
                }
                else
                {
                    alert("订单编号获取异常,请联系相关人员!");
                }
            },function(){});
         }
    	
    
    })
});

function checkall()
{
	var flag = true;
	
	if(!checkName($("#policyName")))
	{
		flag = false;
	}
	if(!checkTel($("#tel")))
	{
		flag = false;
	}
	if(!checkTel($("#tel1")))
	{
		flag = false;
	}
	  
     if ($("#appntArea").val() == "") {
         $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
         flag = false;
     } else {
         $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
         flag = true;
     }
	     
	/*appntArea*/
	if(!checkAddress($("#address")))
	{
		flag = false;
	}

	
	return flag;
}

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