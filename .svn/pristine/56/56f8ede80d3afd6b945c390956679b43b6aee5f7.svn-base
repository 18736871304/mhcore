/**
 * Created by sks on 2017/4/6.
 */
    $('body').on('click', '#cityInput', function () {
        var zid = $(this).attr('id');
        $('.city-container').show();
        $('.letter').show();

    });
//选择城市 start
    $('body').on('click', '.city-list p', function () 
    {
        var type = $('.city-container').data('type');
        $('#cityInput').val($(this).html());
        $('#cityInput_hidden').val($(this).attr('data-id'));
        $('.city-container').hide();
        $('.letter').hide();

    });
    $('body').on('click', '.letter a', function () {
        var s = $(this).html();
        $(window).scrollTop($('#' + s + '1').offset().top);
    });
//验证
//点击开关
   var carFlag=true;
  $('.no-carNUM').click(function () {
      if(carFlag){
          carFlag=!carFlag;
          $('.carnum-input').val('*-*').attr('readonly','readonly')
      }else{
          carFlag=!carFlag;
          $('.carnum-input').val('').removeAttr('readonly')
      }
  })
//表单验证
$("#signupForm").validate({
    rules: {
    	C_DPT_CDE: "required",
    	C_LCN_NO: {
            required:true,
        }
    },
    messages: {
    	C_DPT_CDE: "请选择投保城市",
    	C_LCN_NO:{
            required:'请输入正确的车牌',
        },
        
    },
    errorElement:'span',
    errorLabelContainer:"#messageBox",
    onfocusout:false,
    onkeyup:false,
    focusInvalid :true,
    focusCleanup:true,
    showErrors:function(errorMap,errorList) {
   // this.defaultShowErrors();
        var arr=[];
        for(var key in errorMap){
            arr.push(errorMap[key])
        }
       if(arr[0])alert(arr[0])

},
    submitHandler:function(form) {
        form.submit();
    }
   
})

$('#next_btn').click(function(){
	if($('.inputs').val()=="")
        return;
});