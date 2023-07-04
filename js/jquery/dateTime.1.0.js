 /*日期范围*/
   $(function () {
     var now = new Date();
     var currYear = now.getFullYear();
     var currMon = now.getMonth();
     var currDate =now.getDate();
//     var currHour = now.getHours()+1;
     var opt1={};
     opt1.datetime = { preset : 'datetime',stepMinute: 60} 
     opt1.time = {preset : 'time'};
     opt1.default = {
          theme: 'android-ics light', //皮肤样式
          display: 'modal', //显示方式
          mode: 'scroller', //日期选择模式
          lang:'zh',
          startYear: currYear-50,
          endYear:currYear+50, //结束年份
          dateOrder: 'yymmdd',
          dateFormat: 'yyyy-mm-dd',
      };
        var optDateTime1 = $.extend(opt1['datetime'], opt1['default']);

        var optTime1 = $.extend(opt1['time'], opt1['default']);
       
        $("#receiptDate").mobiscroll(optDateTime1).date(optDateTime1);
    	if($("#isNewOrOld").val() != '00'){
           $("#firstRegisterDate").mobiscroll(optDateTime1).date(optDateTime1);
    	}
        $("#transferDate").mobiscroll(optDateTime1).date(optDateTime1);
        $("#issuerDate").mobiscroll(optDateTime1).date(optDateTime1);
        $("#certificateDate").mobiscroll(optDateTime1).date(optDateTime1);
        
        
        var opt2={};
        if($("#timelyDate_jq").val()=="01" && $("#provinceCode").val() != "110000"){
        	 opt2.datetime = { preset : 'datetime', minDate: new Date(currYear,currMon,currDate),stepMinute: 60} 
        }else{
        	  opt2.datetime = { preset : 'datetime', minDate: new Date(currYear,currMon,currDate+1),stepMinute: 60} 
        }
        opt2.time = {preset : 'time'};
        opt2.default = {
             theme: 'android-ics light', //皮肤样式
             display: 'modal', //显示方式
             mode: 'scroller', //日期选择模式
             lang:'zh',
             showNow: true,
             startYear: 1900,
             endYear:currYear+100, //结束年份
             dateOrder: 'yymmdd',
             dateFormat: 'yyyy-mm-dd',
         };
           var optDateTime2 = $.extend(opt2['datetime'], opt2['default']);

           var optTime2 = $.extend(opt2['time'], opt2['default']);
           $("#startDate_jq").mobiscroll(optDateTime2).date(optDateTime2);
 });
   
   
   
   
   
   
   /**
    * 验证
   */
   function checkInsurDate(){
	   	var error = "";
	   	var insurance_start = $("#startDate_sy").val();
	   	var isDate_start = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-9]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/.test(insurance_start);
	   	var startDate = Date.format(insurance_start);
	   	var endDate = startDate.addYears(1).addDays(-1).pattern("yyyy-MM-dd");
	   	var startDate = startDate.pattern("yyyy-MM-dd");
		$("#endTime_sy").val(endDate.toString());
		$("#business_end").val(endDate);
		$("#business_start").val(startDate);
	   	var today_min = new Date(sysTime);
	   	var today_max = new Date(sysTime);  
	   	if(isDate_start){		
	   		var maxDate = Date.format(today_max.addDays(0).pattern("yyyy-MM-dd"));
	   		if(startDate<maxDate){
	   			error = "起保日期不能小于当前日期";
	   			$("#errorInfo").text(error);
	   			$("#error_mask").css({display: "block"});
	   			return false;
	   		}
	   	}else{
	   		error = "请输入正确的日期";
	   		$("#errorInfo").text(error);
   			$("#error_mask").css({display: "block"});
   			return false;
	   	}	
   }  
   
   
   