$(function () {
	// 发送验证码接口url
	var sendVarifyCodeUrl = './checkno.do?mobilenumber='
	// 倒计时时间60s
	var delay = 60
	// 计时器
	var timer = null
	var agreementFunc = {
		init: function () {
			this.setStyle()
			this.bindEvent()
		},
		setStyle: function () {
		},
		bindEvent: function () {
			var uNameMaxLength = 6
			var idCardMaxLength = 18
			var varifyCodeLength = 4
			// varify input on change
			$('#uName').on('blur', function () {
				var inputVal = $(this).val()
				var reg = /[^\u4E00-\u9FA5]/gi
				if (reg.test(inputVal)) {
					$(this).val(inputVal.replace(reg,''))
					toast({
						message: '请输入中文姓名',
						time: 1500
					})
				}
				if (inputVal.length > uNameMaxLength) {
					$(this).val(inputVal.substring(0, uNameMaxLength));
				}
			});
			$('#idCard').on('input', function () {
				var inputVal = $(this).val()
				// console.log(inputVal);
				var reg = /[\W]/g
				if (reg.test(inputVal)) {
					$(this).val(inputVal.replace(reg, ''))
					toast({
						message: '请输入正确的身份证号码',
						time: 1500
					})
				}
				if (inputVal.length > idCardMaxLength) {
					$(this).val(inputVal.substring(0, idCardMaxLength));
				}
			});
			$('#varifyCode').on('input', function () {
				var inputVal = $(this).val()
				if (inputVal.length > varifyCodeLength) {
					$(this).val(inputVal.substring(0, varifyCodeLength));
				}
			});
			// 点击发送验证码按钮
			$('#sendVarifyCode').on('click', function () {
				console.log('click vc')
				var btn = $('#sendVarifyCodeButton')
				var mobileNumber = $('#cellphoneNumber').val()
				// 验证手机号
				if (validatemobile(mobileNumber)) {
					btn.attr('disabled', 'disabled')
					timer = setInterval(function () {
						delay--
						if (delay > 0) {
							btn.text(delay + 's').attr('disabled', 'disabled')
						} else {
							delay = 60
							btn.text('发送').removeAttr('disabled')
							clearInterval(timer)
							timer = null
						}
					}, 1000)
					//发送 验证码
					sendRequest(sendVarifyCodeUrl + mobileNumber)
				}
			});
			// 点击下一步按钮
			$('#nextButton').on('click', function () {
				var uName = $('#uName').val()
				var idCard = $('#idCard').val()
				var cellphoneNumber = $('#cellphoneNumber').val()
				var varifyCode = $('#varifyCode').val()
				//姓名是否全部为中文并且长度小于5
				if (!isChinese(uName) || uName.length >= 5) {
					toast({
						message: '您的姓名输入有误！',
						time: 1500
					})
					return false
				}
				//验证身份证是否合法
				if (!checkCardId(idCard)) {
					return false
				}
				//验证手机号
				if (!validatemobile(cellphoneNumber)) {
					return false
				}
				//是否填写验证码并且验证码是4位数字
				if (typeof (varifyCode - 0) !== 'number' || varifyCode.length !== 4) {
					toast({
						message: '请输入有效验证码！',
						time: 1500
					})
					return false
				}
				//跳转下一页
				
				var transdata = 
				{
					"mobile":cellphoneNumber,
					"name":uName,
					"idno":idCard,
					"checkno":varifyCode,
					"openid":$('#openid').val(),
				};
				
				sendRequest("./userAgreement.do",transdata,function (data) 
				{
					var obj = JSON.parse(data);
				   	console.log(obj);
				   	if(obj.code == '00')
				   	{
				   		window.location.href = './signature.do?buzid='+obj.buzid
				   	}
				   	else
				   	{
				   		toast({
							message: obj.message,
							time: 1500
						})
				   	}
				},
				function(){});
			});
		}
	}
	agreementFunc.init();

	function sendRequest(url, data, success, error) {
		$.ajax({
			url: url,
			type: "post",
			async: true,
			data: data ? data : {},
			beforeSend: function () {
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
			complete: function () {
				$(".loading").hide();
			}
		});
	}

	function validatemobile(mobile) {
		if (mobile == null || mobile == "") {
			toast({
				message: '请输入手机号码！',
				time: 1500
			})
			return false;
		}

		if (mobile.length == 0) {
			toast({
				message: '请输入手机号码！',
				time: 1500
			})
			return false;
		}

		if (mobile.length != 11) {
			toast({
				message: '请输入有效的手机号码！',
				time: 1500
			})
			return false;
		}

		// var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
		
		if (!myreg.test(mobile)) {
			toast({
				message: '请输入有效的手机号码！',
				time: 1500
			})
			return false;
		}
		return true;
	}

	function isChinese(str){
		var reg=/^[\u4E00-\u9FA5]+$/;
		if(!reg.test(str)){
			return false;
		}
		return true;
	}

	function checkCardId(socialNo) {
		if (socialNo == "") {
			toast({
				message: '身份证号码不能为空！',
				time: 1500
			})
			return false
		}

		if (socialNo.length != 15 && socialNo.length != 18) {
			toast({
				message: '身份证号码格式不正确！',
				time: 1500
			})
			return false
		}

		var area = {
			11: "北京",
			12: "天津",
			13: "河北",
			14: "山西",
			15: "内蒙古",
			21: "辽宁",
			22: "吉林",
			23: "黑龙江",
			31: "上海",
			32: "江苏",
			33: "浙江",
			34: "安徽",
			35: "福建",
			36: "江西",
			37: "山东",
			41: "河南",
			42: "湖北",
			43: "湖南",
			44: "广东",
			45: "广西",
			46: "海南",
			50: "重庆",
			51: "四川",
			52: "贵州",
			53: "云南",
			54: "西藏",
			61: "陕西",
			62: "甘肃",
			63: "青海",
			64: "宁夏",
			65: "新疆",
			71: "台湾",
			81: "香港",
			82: "澳门",
			91: "国外"
		};

		if (area[parseInt(socialNo.substr(0, 2))] == null) {
			toast({
				message: '身份证号码不正确(地区非法)！',
				time: 1500
			})
			return false
		}

		if (socialNo.length == 15) {
			var pattern = /^\d{15}$/;
			if (pattern.exec(socialNo) == null) {
				toast({
					message: '15位身份证号码必须为数字！',
					time: 1500
				})
				return false
			}
			var birth = parseInt("19" + socialNo.substr(6, 2));
			var month = socialNo.substr(8, 2);
			var day = parseInt(socialNo.substr(10, 2));
			switch (month) {
				case '01':
				case '03':
				case '05':
				case '07':
				case '08':
				case '10':
				case '12':
					if (day > 31) {
						toast({
							message: '身份证号码格式不正确！',
							time: 1500
						})
						return false
					}
					break;
				case '04':
				case '06':
				case '09':
				case '11':
					if (day > 30) {
						toast({
							message: '身份证号码格式不正确！',
							time: 1500
						})
						return false
					}
					break;
				case '02':
					if ((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {
						if (day > 29) {
							toast({
								message: '身份证号码格式不正确！',
								time: 1500
							})
							return false
						}
					}
					else {
						if (day > 28) {
							toast({
								message: '身份证号码格式不正确！',
								time: 1500
							})
							return false
						}
					}
					break;
				default:
					toast({
						message: '身份证号码格式不正确！',
						time: 1500
					})
					return false
			}

			var nowYear = new Date().getYear();

			if (nowYear - parseInt(birth) < 15 || nowYear - parseInt(birth) > 100) {
				toast({
					message: '身份证号码格式不正确！',
					time: 1500
				})
				return false
			}
			return true;
		}

		var Wi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
		var lSum = 0;
		var nNum = 0;
		var nCheckSum = 0;

		for (var i = 0; i < 17; ++i) {
			if (socialNo.charAt(i) < '0' || socialNo.charAt(i) > '9') {
				toast({
					message: '身份证号码格式不正确！',
					time: 1500
				})
				return false
			}
			else {
				nNum = socialNo.charAt(i) - '0';
			}
			lSum += nNum * Wi[i];
		}

		if (socialNo.charAt(17) == 'X' || socialNo.charAt(17) == 'x') {
			lSum += 10 * Wi[17];
		}
		else if (socialNo.charAt(17) < '0' || socialNo.charAt(17) > '9') {
			toast({
				message: '身份证号码格式不正确！',
				time: 1500
			})
			return false
		}
		else {
			lSum += ( socialNo.charAt(17) - '0' ) * Wi[17];
		}

		if ((lSum % 11) == 1) {
			return true;
		}
		else {
			toast({
				message: '身份证号码格式不正确！',
				time: 1500
			})
			return false
		}
	}

	function toast(params, fn) {
		if (params.message == null || params.message.trim == "") return false
		params.time = params.time || 1000

		var el = document.createElement('div')
		el.setAttribute('id', 'toast')
		el.innerHTML = params.message
		document.body.appendChild(el)
		el.classList.add("fadeIn")
		setTimeout(function () {
			el.classList.remove("fadeIn")
			el.classList.add("fadeOut")
			el.addEventListener("animationend", function () {
				document.body.removeChild(el)
				el = null
				if (fn) {
					fn()
				}
			})
		}, params.time)
	}
})
