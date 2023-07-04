<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>0费用选保险_免费领取</title>
		<meta charset="utf-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!-- <title>美华保险</title> -->
		<link rel="stylesheet" href="../../css/activity/0002/css.css?v=20191025" />
		<link rel="stylesheet" href="../../css/20190824/modal.css?v=190824" />
		<link rel="stylesheet" href="../../js/20190824/layui/css/layui.css">
		<link rel="stylesheet" href="../../js/20190824/layui/css/layui.mobile.css">
		<link rel="stylesheet" href="../../js/20190824/layui/css/modules/code.css">
		<link rel="stylesheet" href="../../js/20190824/layui/css/modules/laydate/default/laydate.css">
		<link rel="stylesheet" href="../../js/20190824/layui/css/modules/layer/default/layer.css">
		<!-- <link rel="stylesheet" href="css/test.css"> -->
		<script type="text/javascript" src="../../js/20190824/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="../../js/common/insuCommon.js"></script>

		<script>
		
		window._agl = window._agl || [];
        (function () {
            _agl.push(
                ['production', '_f7L2XwGXjyszb4d1e2oxPybgD']
            );
            (function () {
                var agl = document.createElement('script');
                agl.type ='text/javascript';
                agl.async = true;
                agl.src = 'https://fxgate.baidu.com/angelia/fcagl.js?production=_f7L2XwGXjyszb4d1e2oxPybgD';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(agl, s);
            })();
        })();
        
        (function(r,d,s,l){var meteor=r.meteor=r.meteor||[];meteor.methods=["track","off","on"];meteor.factory=function(method){return function(){
        	  var args=Array.prototype.slice.call(arguments);args.unshift(method);meteor.push(args);return meteor}};for(var i=0;i<meteor.methods.length;i++){
        	  var key=meteor.methods[i];meteor[key]=meteor.factory(key)}meteor.load=function(){var js,fjs=d.getElementsByTagName(s)[0];js=d.createElement(s);
        	  js.src="https://analytics.snssdk.com/meteor.js/v1/"+l+"/sdk";fjs.parentNode.insertBefore(js,fjs)};meteor.load();if(meteor.invoked){return}
        	  meteor.invoked=true;meteor.track("pageview")})(window,document,"script","108694470709");
        
				$(function(){
					$(".nnid").click(function () {
					$(this).siblings().removeClass('active')
					$(this).addClass('active')
					
					});
					$(".llbox").click(function () {
					$(this).siblings().removeClass('active')
					$(this).addClass('active')
					
					});

					$("#myform").on("submit", function(ev) {
						//阻止submit表单提交
						ev.preventDefault();
					},false)
						//默认弹框隐藏
					$('#modal1').hide();
						//点击显示弹框
						//点击确定弹框消失
					$('#sure').click(function(){
						$('#modal1').hide();
					})
					$("#myform1").on("submit", function(ev) {
						//阻止submit表单提交
						ev.preventDefault();
					},false)
						//默认弹框隐藏
					$('#modal1').hide();
						//点击显示弹框
						//点击确定弹框消失
					$('#sure').click(function(){
						$('#modal1').hide();
					})
					
				if (typeof can == "number"){
				//定时关闭提示
					setTimeout(function(){
						close_info();
					},can*1000);
				}
			})
			
			function checkno(type)
			{
				var mobile = "";
				var that = "";
				
				if(type == "01")
				{
					mobile = $("#tel1").val();
					that = $("#verify-button01")
				}
				else
				{
					mobile = $("#tel2").val();
					that = $("#verify-button02")
				}
				
				if(!validatemobile(mobile))
				{
					return false;	
				}
				
				var timeo = 60;
				var timeStop = setInterval(function()
				{
					timeo--;
					if (timeo>0) 
					{
						that.text('重新发送' + timeo +'s');
					    that.attr('disabled','disabled');//禁止点击
					}
					else
					{
						timeo = 60;//当减到0时赋值为60
					    that.text('获取验证码'); 
					    clearInterval(timeStop);//清除定时器
					    that.removeAttr('disabled');//移除属性，可点击
					}
				},1000);
				
				sendRequest("../../user/checkno.do?mobilenumber="+mobile,null,function (data) 
				{
				},function(){});
			}
			
			function getdata01()
			{
				// checkValidity
				if($('#name1').val() == '')
				{
					$('#errmsg').html("姓名不能为空！");
					$('#modal1').show();
					return;
				}
				
				var sex = getsex01();
				
				if(sex==null||sex=="")
				{
					$('#errmsg').html("性别不能为空！");
					$('#modal1').show();
					return;
				}
				
				if(!validatemobile($('#tel1').val()))
				{
					return false;	
				}
				
				if($('#code1').val() == '')
				{
					$('#errmsg').html("验证码不能为空！");
					$('#modal1').show();
					return;
				}
				
				var age = getage01();
				
				if(age==null||age=="")
				{
					$('#errmsg').html("测算年龄不能为空！");
					$('#modal1').show();
					return;
				}
				
				var transdata = 
				{
					"name":$('#name1').val(),
					"sex":sex,
					"mobile":$('#tel1').val(),
					"checkno":$('#code1').val(),
					"age":age,
					"channelCode":$('#channelCode').val(),
					"pageType":$('#pageType').val(),
					"planId":$('#planId').val()
				};
				
				sendRequest("../../life/activity/getChannelData.do",transdata,function (data) 
				{
					var obj = JSON.parse(data);
				   	console.log(obj);
				   	if(obj.code == '00')
				   	{
				   		$('#errmsg').html("提交成功，请注意接听电话，稍后会有工作人员联系您！");
						$('#modal1').show();
						dismsg();
						window._agl && window._agl.push(['track', ['success', {t: 19}]]);
						meteor.track('form', {convert_id: '1643628582323208' });
				   	}
				   	else
				   	{
				   		$('#errmsg').html(obj.message);
						$('#modal1').show();
						dismsg();
				   	}
				},
				function(){});
			}
				
			function getdata02()
			{
				// checkValidity
				if($('#name2').val() == '')
				{
					$('#errmsg').html("姓名不能为空！");
					$('#modal1').show();
					return;
				}
				
				var sex = getsex02();
				
				if(sex==null||sex=="")
				{
					$('#errmsg').html("性别不能为空！");
					$('#modal1').show();
					return;
				}
				
				if(!validatemobile($('#tel2').val()))
				{
					return false;	
				}
				
				if($('#code2').val() == '')
				{
					$('#errmsg').html("验证码不能为空！");
					$('#modal1').show();
					return;
				}
				
				var age = getage02();
				
				if(age==null||age=="")
				{
					$('#errmsg').html("测算年龄不能为空！");
					$('#modal1').show();
					return;
				}
				
				var transdata = 
				{
					"name":$('#name2').val(),
					"sex":sex,
					"mobile":$('#tel2').val(),
					"checkno":$('#code2').val(),
					"age":age,
					"channelCode":$('#channelCode').val(),
					"pageType":$('#pageType').val(),
					"planId":$('#planId').val()
				};
				
				sendRequest("../../life/activity/getChannelData.do",transdata,function (data) 
				{
					var obj = JSON.parse(data);
				   	console.log(obj);
				   	if(obj.code == '00')
				   	{
				   		$('#errmsg').html("提交成功，请注意接听电话，稍后会有工作人员联系您！");
						$('#modal1').show();
						dismsg();
						window._agl && window._agl.push(['track', ['success', {t: 19}]]);
						meteor.track('form', {convert_id: '1643628582323208' });
				   	}
				   	else
				   	{
				   		$('#errmsg').html(obj.message);
						$('#modal1').show();
						dismsg();
				   	}
				},
				function(){});
			}
				
			function dismsg()
			{
				// 三秒后自动消失
				setTimeout(function()
				{
					$('#modal1').hide();
				},3000)
			}
			
			function getsex01()
			{
				if($('#sexm1').hasClass('active'))
				{
					return "m";
				}
				
				if($('#sexf1').hasClass('active'))
				{
					return "f";
				}
				
				return "";
			}
			
			function getsex02()
			{
				if($('#sexm2').hasClass('active'))
				{
					return "m";
				}
				
				if($('#sexf2').hasClass('active'))
				{
					return "f";
				}
				
				return "";
			}
			
			function getage01()
			{
				if($('#age101').hasClass('active'))
				{
					return "age01";
				}
				
				if($('#age102').hasClass('active'))
				{
					return "age02";
				}
				
				if($('#age103').hasClass('active'))
				{
					return "age03";
				}
				
				if($('#age104').hasClass('active'))
				{
					return "age04";
				}
				
				if($('#age105').hasClass('active'))
				{
					return "age05";
				}
				
				if($('#age106').hasClass('active'))
				{
					return "age06";
				}
				
				return "";
			}
			
			function getage02()
			{
				if($('#age201').hasClass('active'))
				{
					return "age01";
				}
				
				if($('#age202').hasClass('active'))
				{
					return "age02";
				}
				
				if($('#age203').hasClass('active'))
				{
					return "age03";
				}
				
				if($('#age204').hasClass('active'))
				{
					return "age04";
				}
				
				if($('#age205').hasClass('active'))
				{
					return "age05";
				}
				
				if($('#age206').hasClass('active'))
				{
					return "age06";
				}
				
				return "";
			}
			
			function validatemobile(mobile)
			{
				if(mobile==null||mobile=="")
			    {
				   $('#errmsg').html("请输入手机号码！");
				   $('#modal1').show();
				   return;
			    }
				
			    if(mobile.length==0)
			    {  
			       $('#errmsg').html("请输入手机号码！");
				   $('#modal1').show();
				   return;
			    }
			    
			    if(mobile.length!=11)
			    {
			    	$('#errmsg').html("请输入有效的手机号码！");
					$('#modal1').show();
					return;
			    }
			    
			    var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
			    if(!myreg.test(mobile))
			    {
			    	$('#errmsg').html("请输入有效的手机号码！");
					$('#modal1').show();
					return;
			    }
			    return true;
			}
			
			</script>	
 </head>	
	<body>
		
		<img src="../../images/activity/0002/change_01.jpg" width="100%" height="28%"/>
		<img id="clickmd" src="../../images/activity/0002/change_06.jpg" width="100%" height="28%"/>
		<form class="form-box" id="myform">
		<div id="hqbdfa">
			<input type="hidden" style="display:none" class="channelCode" id="channelCode" value="${channelCode}">
			<input type="hidden" style="display:none" class="pageType" id="pageType" value="${pageType}">
			<input type="hidden" style="display:none" class="planId" id="planId" value="${planId}">
			<div class="name-box">
				<div class="text">
				您的姓名(您的信息将严格保密)<span style="color: red;">*<span></div>
				<input  name="" value="" id="name1"class="name" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/>
			</div>
		
			<div class="nannv">
				<div class="text">您的性别<span style="color: red;">*</span></div>
				<div class="nannv-box">
					<input class="nan nnid" type="button" value="男" id = "sexm1"/>
					<input class="nv nnid" type="button" value="女" id = "sexf1"/>
				</div>
			</div>

			<div class="tel-box">
				<div class="text">您的电话<span style="color: red;">*<span></div>
				<input type="text" id="tel1" class="tel" maxlength='11'/>
			</div>
			<div class="verify-box">
				<div class="text">验证码<span style="color: red;">*<span></div>
				<input id="code1" name="" value="" class="verify-input" oninput="value=value.replace(/[^\d]/g,'')" maxlength='4'/>
				<button  name="" value="" class="verify-button" id = "verify-button01" onclick = "checkno('01')">获取验证码</button>
			</div>
			<div class="nannv">
				<div class="text">测算年龄<span style="color: red;">*</span></div>
				<div class="nannv-box">
					<div class="left llbox" id = "age101">0-17岁</div>
					<div class="right llbox" id = "age102">18-25岁</div>
					<div class="left llbox" id = "age103">26-30岁</div>
					<div class="right llbox"  id = "age104">31-35岁</div>
					<div class="left llbox" id = "age105">36-40岁</div>
					<div class="right llbox" id = "age106">41-45岁</div>	
				</div>
			</div>
			<input type = "button" class="ljcs" id="dz1" value="免费领取" onclick = "getdata01()">
		</div>
		<!-- <div id="showModel">
			<button type="submit" class="ljcs">免费领取</button>
		</div> -->
	</form>
		<img style="width:100%;height:auto;" src="../../images/activity/0002/change_02.jpg"/>
		<img style="width:100%;height: 450%;" src="../../images/activity/0002/change_03.jpg"/>
		<img style="width:100%;height: 450%;" src="../../images/activity/0002/change_04.jpg"/>
		<img style="width:100%;height: 450%;" src="../../images/activity/0002/change_06.jpg"/>
		
	
	<form  class="form-box" id="myform1">
		<div id="hqbdfa">
			<div class="name-box">
				<div class="text">
				您的姓名(您的信息将严格保密)<span style="color: red;">*<span></div>
				<input  name="" value="" id="name2"class="name" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/>
			</div>
		
			<div class="nannv">
				<div class="text">您的性别<span style="color: red;">*</span></div>
				<div class="nannv-box">
					<input class="nan nnid" type="button" value="男" id = "sexm2"/>
					<input class="nv nnid" type="button" value="女" id = "sexf2"/>
				</div>
			</div>

			<div class="tel-box">
				<div class="text">您的电话<span style="color: red;">*<span></div>
				<input type="tel" id="tel2" name="" value="" class="tel" maxlength='11'/>
			</div>
			<div class="verify-box">
				<div class="text">验证码<span style="color: red;">*<span></div>
				<input id="code2" class="verify-input" oninput="value=value.replace(/[^\d]/g,'')" maxlength='4'/>
				<button class="verify-button" id = "verify-button02" onclick = "checkno('02')">获取验证码</button>
			</div>
			<div class="nannv">
				<div class="text">测算年龄<span style="color: red;">*</span></div>
				<div class="nannv-box">
					<div class="left llbox" id = "age201">0-17岁</div>
					<div class="right llbox" id = "age202">18-25岁</div>
					<div class="left llbox" id = "age203">26-30岁</div>
					<div class="right llbox" id = "age204">31-35岁</div>
					<div class="left llbox" id = "age205">36-40岁</div>
					<div class="right llbox" id = "age206">41-45岁</div>	
				</div>
			</div>
			<input type = "button" class="ljcs" id="dz1" value="免费领取" onclick = "getdata02()">
		</div>
		<!-- <div id="showModel">
			<button type="submit" class="ljcs">免费领取</button>
		</div> -->
	</form>
					
	<img style="width:100%;height: 180%;" src="../../images/activity/0002/change_05.jpg"/>		
		
	<br></br>
	<div class="hqbxfa">
		<button class="zt"><a href="#clickmd">免费领取</a></button>	
	</div>

	<!--隐形弹框--> 
	<div id="modal1" class="modal">  
		<div class="modal-content">  
			 
			<div class="modal-body">  
				<p id = "errmsg">提交成功，请注意接听电话，稍后会有工作人员联系您</p>  
			</div>  
			<footer class="modal-footer">  
				<a id="sure">确定</a>
			</footer>  
		</div>  
	</div>
			
	</body>
</html>
