$(function () {
  var upForm = {}
  var uNameMaxLength = 4
  var uCodeMaxLength = 4
  var validate = {
    name: /[\u4e00-\u9fa5]/,
    phone: /^1[3456789]\d{9}$/
  }

  $('#upSub').click(function (e) {
    let flagName = true
    var postData = $("#upForm").serializeArray();
    $.each(postData, function () {
      upForm[this.name] = this.value;
    });

    if (!upForm.name) {
      flagName = false
      toast({
        message: '请输入姓名!',
        time: 1500
      })
    } else if (upForm.name.length > uNameMaxLength) {
      flagName = false
      toast({
        message: '姓名长度不合法!',
        time: 1500
      })
    } else {
      let arr = upForm.name.split('')
      $.each(arr, function (index, val) {
        flagName = validate.name.test(val)
        return flagName
      })
      if (!flagName) {
        toast({
          message: '请输入中文姓名!',
          time: 1500
        })
      }
    }

    if (!flagName) return false

    if (!upForm.phone) {
      flagName = false
      toast({
        message: '请输入手机号码!',
        time: 1500
      })
    } else {
      flagName = validate.phone.test(upForm.phone)
      if (!flagName) {
        flagName = false
        toast({
          message: '手机号码不符合规范!',
          time: 1500
        })
      }
    }
    if (!flagName) return false

    if (!upForm.code) {
      flagName = false
      toast({
        message: '请输入验证码!',
        time: 1500
      })
    } else if (upForm.code.length < uCodeMaxLength) {
      flagName = false
      toast({
        message: '验证码输入错误，请重新输入!',
        time: 1500
      })
    } else if (upForm.code.length > uCodeMaxLength) {
      flagName = false
      toast({
        message: '验证码不符合规范!',
        time: 1500
      })
    }

    if(!flagName) return false
    
    var transdata = 
	{
    	"landingpageurl":window.location.href,
		"name":upForm.name,
		"mobile":upForm.phone,
		"checkno":upForm.code,
		"channelCode":$('#channelCode').val(),
		"pageType":$('#pageType').val(),
		"planId":$('#planId').val(),
		"sex":upForm.gender,
		"age":upForm.age
	};
    
    sendRequest("/life/activity/getChannelData.do",transdata,function (data) 
	{
		var obj = JSON.parse(data);
	   	console.log(obj);
	   	if(obj.code == '00')
	   	{
	   		toast({message: '您已成功提交，稍后会有服务专员与您联系，请注意接听电话!',time: 1500});
	   		
	   		console.log(obj.transferid);
	   		
	   		if($('#channelCode').val()=="0001")
	   		{
	   			if(obj.transferid!=null&&obj.transferid!="")
	   			{
	   				meteor.track('form', {convert_id: obj.transferid })
	   			}
	   			else
	   			{
	   				meteor.track('form', {convert_id: '1649734242119693' })
	   			}
	   			
	   		}
	   		else if($('#channelCode').val()=="0002")
	   		{
	   			if(obj.transferid!=null&&obj.transferid!="")
	   			{
	   				//window._agl && window._agl.push(['track', ['success', {t: obj.transferid}]]);
	   			}
	   			else
	   			{
	   				window._agl && window._agl.push(['track', ['success', {t: '3'}]]);
	   			}	
	   		}
	   		else if($('#channelCode').val()=="0003")
	   		{	
	   			if(obj.transferid!=null&&obj.transferid!="")
	   			{
	   				_ks_trace.push({event: 'form', convertId: obj.transferid, cb: function(){
					    console.log('Your callback function here!'+obj.transferid)
					}})
	   			}
	   			else
	   			{
	   				_ks_trace.push({event: 'form', convertId: '2623', cb: function(){
					    console.log('Your callback function here!')
					}})
	   			}
	   		}
	   	}
	   	else
	   	{
	   		toast({message: obj.message,time: 1500});
	   	}
	},
	function(){});
    
    /*
    let old = JSON.parse(localStorage.getItem("myFormdata")||'{}');
    let isok = true
    console.log(old)
    if (JSON.stringify(old)!='{}') {
      $.each(upForm, function(key, val) {
        isok = old[key] === val
        return isok
      })
      if (!isok) {
        localStorage.setItem("myFormdata",JSON.stringify(upForm));
        toast({
          message: '您已成功提交，稍后会有服务专员与您联系，请注意接听电话!',
          time: 1500
        })
      } else {
        toast({
          message: '请勿重复提交!',
          time: 1500
        })
      }
    } else {
      localStorage.setItem("myFormdata",JSON.stringify(upForm));
      toast({
        message: '您已成功提交，稍后会有服务专员与您联系，请注意接听电话!',
        time: 1500
      })
    }
    */

  })

  $('#upForm .radio').on('click', 'div', function (e) {
    var val = e.currentTarget.dataset.type
    $('#upForm .radio input').val(val)
    $('#upForm .radio div').removeClass('active')
    var is = '#upForm .radio .' + val
    $(is).addClass('active')
  })

  var codeTime = 0;
  $('#upForm .get_code .btn').click(function () {
    
    let upForm = {}
    let flag = true
    let postData = $("#upForm").serializeArray();
    $.each(postData, function () {
      upForm[this.name] = this.value;
    });
    if (!upForm.phone) {
      flag = false
      toast({
        message: '请输入手机号码!',
        time: 1500
      })
    } else {
      flag = validate.phone.test(upForm.phone)
      if (!flag) {
        flag = false
        toast({
          message: '手机号码不符合规范!',
          time: 1500
        })
      }
    }
    if (!flag) return false
    
    var dom = $('#upForm .get_code .btn')
    var timing;
    if (codeTime > 0) {
      return false
    }
    codeTime = 60;
    // console.log('获取验证码');
    timing = setInterval(() => {
      if (codeTime <= 0) {
        $(dom).text('获取验证码').removeClass('code')
        clearInterval(timing)
        return false
      }
      codeTime -= 1
      $(dom).text(codeTime + 's')
      $(dom).addClass('code')
    }, 1000);

    sendRequest("/user/checkno.do?mobilenumber="+upForm.phone,null,function (data) 
    {
    },function(){});
    
  })

});