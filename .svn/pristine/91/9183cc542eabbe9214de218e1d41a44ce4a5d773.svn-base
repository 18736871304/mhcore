<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<title>众安平安联合车险</title>
    <link rel="stylesheet" href="../css/hengqin/infos.css?v=20180620_01">
<script src="../js/jquery/jquery-3.6.0.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<link rel="stylesheet" href="../css/car/car-index.css?v=20180620">
<script src=" ../js/hengqin/mobiscroll-2.13.2.full.min.js" type="text/javascript"></script>
<script src=" ../js/hengqin/iscroll.js" type="text/javascript"></script>
<script src="../js/hengqin/checkFn.js"></script>
<script src=" ../js/hengqin/iosSelect.js" type="text/javascript"></script>
<script src=" ../js/hengqin/insuranceInformation.js"></script>

</head>
<script>
    $(".pop-sure").on("click",function(){
        $(".pop").hide();
        $(".mask").hide();
    });
</script>
<body>
	<div class="car-wrap">
		<a href="#" class="banner"> <img src="../images/car/zhongan/zhonganCar_01.png?v=20190610" />
		</a>
		<div class="info-wrap">
			<div class="item flex">
				<div class="icon-box">
					<span class="icon1"></span>
				</div>
				<div class="name flex-all">投保城市</div>
					<input type="text" style="display:none" name="" id="" value="3">
                 	<input type="hidden" class="personInfo" id="Province" value="">
				 	<input type="hidden" class="personInfo" id="City" value=""> 
				 	<input type="hidden" class="personInfo" id="County" value="">
				 	<input type="text" class="input-right bg-arrow" readonly="" placeholder="请选择" id="appntArea" value=""> 
				 	<span class="errMsg" id = "citymsg"></span>
				</div>
			<div class="item flex carNumber" id = "select_car">
				<div class="icon-box">
					<span class="icon2"></span>
				</div>
				<div class="name flex-all">车牌号码</div>
				<input type="text" id="plate_number" class="input-right" placeholder="请输入车牌号码">
				<span class="errMsg"></span>
			</div>
			<div class="item flex">
				<div class="icon-box">
					<span class="icon3"></span>
				</div>
				<div class="name flex-all">车主姓名</div>
				<input type="text" id="carowner" class="input-right" placeholder="请输入车主姓名">

				<span class="errMsg"></span>
			</div>
			<div class="item flex">
				<div class="icon-box">
					<span class="icon4"></span>
				</div>
				<div class="name flex-all">联系方式</div>
				<input type="text" id="mobilenumber" style='text-align: right;' class="mobilenumber" placeholder="请输入联系方式"> <span class="errMsg"></span>

			</div>
		</div>
		<div class="sub-btn" id="getprice">获取报价</div>
		<div class="success-tips-dialog">
			<div class="wrap">
				<a class="close-dialog">×</a>
				<div class="txt">
					稍后会有工作人员联系您<br /> 请您耐心等待！
				</div>
			</div>
		</div>
		<div class="mask">
			<div class="pop repeat">
				<span></span>
				<a href="javascript:void(0);" class="pop-sure">确定</a>
			</div>
		</div>
	</div>

	<!--加载动画-->
	<div class="loading">
		<div class="sk-circle">
			<div class="sk-circle1 sk-child"></div>
			<div class="sk-circle2 sk-child"></div>
			<div class="sk-circle3 sk-child"></div>
			<div class="sk-circle4 sk-child"></div>
			<div class="sk-circle5 sk-child"></div>
			<div class="sk-circle6 sk-child"></div>
			<div class="sk-circle7 sk-child"></div>
			<div class="sk-circle8 sk-child"></div>
			<div class="sk-circle9 sk-child"></div>
			<div class="sk-circle10 sk-child"></div>
			<div class="sk-circle11 sk-child"></div>
			<div class="sk-circle12 sk-child"></div>
		</div>
	</div>

<script>
	var provinces=
		[
			{'id':'110000','codeValue':'110000','value':'北京市','parentId':'0'},
			{'id':'120000','codeValue':'120000','value':'天津市','parentId':'0'},
			{'id':'130000','codeValue':'130000','value':'河北省','parentId':'0'},
			{'id':'140000','codeValue':'140000','value':'山西省','parentId':'0'},
			{'id':'150000','codeValue':'150000','value':'内蒙古自治区','parentId':'0'},
			{'id':'210000','codeValue':'210000','value':'辽宁省','parentId':'0'},
			{'id':'220000','codeValue':'220000','value':'吉林省','parentId':'0'},
			{'id':'230000','codeValue':'230000','value':'黑龙江省','parentId':'0'},
			{'id':'310000','codeValue':'310000','value':'上海市','parentId':'0'},
			{'id':'320000','codeValue':'320000','value':'江苏省','parentId':'0'},
			{'id':'330000','codeValue':'330000','value':'浙江省','parentId':'0'},
			{'id':'340000','codeValue':'340000','value':'安徽省','parentId':'0'},
			{'id':'350000','codeValue':'350000','value':'福建省','parentId':'0'},
			{'id':'360000','codeValue':'360000','value':'江西省','parentId':'0'},
			{'id':'370000','codeValue':'370000','value':'山东省','parentId':'0'},
			{'id':'410000','codeValue':'410000','value':'河南省','parentId':'0'},
			{'id':'420000','codeValue':'420000','value':'湖北省','parentId':'0'},
			{'id':'430000','codeValue':'430000','value':'湖南省','parentId':'0'},
			{'id':'440000','codeValue':'440000','value':'广东省','parentId':'0'},
			{'id':'450000','codeValue':'450000','value':'广西壮族自治区','parentId':'0'},
	//			{'id':'460000','codeValue':'460000','value':'海南省','parentId':'0'},
	//			{'id':'500000','codeValue':'500000','value':'重庆市','parentId':'0'},
			{'id':'510000','codeValue':'510000','value':'四川省','parentId':'0'},
	//			{'id':'520000','codeValue':'520000','value':'贵州省','parentId':'0'},
	//			{'id':'530000','codeValue':'530000','value':'云南省','parentId':'0'},
	//			{'id':'540000','codeValue':'540000','value':'西藏自治区','parentId':'0'},
			{'id':'610000','codeValue':'610000','value':'陕西省','parentId':'0'},
	//			{'id':'620000','codeValue':'620000','value':'甘肃省','parentId':'0'},
	//			{'id':'630000','codeValue':'630000','value':'青海省','parentId':'0'},
			{'id':'640000','codeValue':'640000','value':'宁夏回族自治区','parentId':'0'},
			{'id':'650000','codeValue':'650000','value':'新疆维吾尔自治区','parentId':'0'}
        ];

	var numReg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;

	$('.close-dialog').click(function() {
		$('.success-tips-dialog').hide()
	})
	$('#relation_dummy2').on('click', function() {
		document.activeElement.blur()
	})

	//点击立即咨询框，逻辑
	$("#getprice").on('click',function()
	{
		var mobile = $('#mobilenumber').val();

		if(!numReg.test(mobile)){
		    alert("请填写正确的电话号码格式");
		    return;
		}

		if($('#Province').val()==null||$('#Province').val()=="")
		{
			alert("请选择投保城市!");
			return;
		}

		if($('#City').val()==null||$('#City').val()=="")
		{
			alert("请选择投保城市!");
			return;
		}

		if($('#County').val()==null||$('#County').val()=="")
		{
			alert("请选择投保城市!");
			return;
		}

		if($('#plate_number').val()==null||$('#plate_number').val()=="")
		{
			alert("请填写车牌号码!");
			return;
		}

		if($('#carowner').val()==null||$('#carowner').val()=="")
		{
			alert("请选择车主姓名!");
			return;
		}

		if($('#mobilenumber').val()==null||$('#mobilenumber').val()=="")
		{
			alert("请选择联系方式!");
			return;
		}

		sendRequest("../car/saveInfo.do",{"province":$("#Province").val(),
			"city":$("#City").val(),
			"county":$("#County").val(),
			"plate_number":$("#plate_number").val(),
			"carowner":$("#carowner").val(),
			"insorgancode":"suncar",
			"mobilenumber":$("#mobilenumber").val()},function(data)
		{

			var obj = JSON.parse(data);
			console.log(obj);
			if(obj.code == 0){
				var orderNo = obj.orderNo;
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text(obj.msg);
			}else{
				$(".pop").show();
				$(".mask").show();
				$(".pop span").text("电话号码重复");
			}
		},function(){})

	})

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

    /* 车牌号 */
    var car_p = [
        {'id': '京', 'value': '京'},
        {'id': '津', 'value': '津'},
        {'id': '冀', 'value': '冀'},
        {'id': '晋', 'value': '晋'},
        {'id': '蒙', 'value': '蒙'},
        {'id': '辽', 'value': '辽'},
        {'id': '吉', 'value': '吉'},
        {'id': '黑', 'value': '黑'},
        {'id': '沪', 'value': '沪'},
        {'id': '苏', 'value': '苏'},
        {'id': '浙', 'value': '浙'},
        {'id': '皖', 'value': '皖'},
        {'id': '闽', 'value': '闽'},
        {'id': '赣', 'value': '赣'},
        {'id': '鲁', 'value': '鲁'},
        {'id': '豫', 'value': '豫'},
        {'id': '鄂', 'value': '鄂'},
        {'id': '湘', 'value': '湘'},
        {'id': '粤', 'value': '粤'},
        {'id': '桂', 'value': '桂'},
        {'id': '琼', 'value': '琼'},
        {'id': '渝', 'value': '渝'},
        {'id': '川', 'value': '川'},
        {'id': '黔', 'value': '黔'},
        {'id': '滇', 'value': '滇'},
        {'id': '藏', 'value': '藏'},
        {'id': '陕', 'value': '陕'},
        {'id': '甘', 'value': '甘'},
        {'id': '青', 'value': '青'},
        {'id': '宁', 'value': '宁'},
        {'id': '新', 'value': '新'},
        {'id': '台', 'value': '台'},
        {'id': '港', 'value': '港'},
        {'id': '澳', 'value': '澳'}
    ];

    var show_car = document.querySelector('#plate_title');
    var select_car = document.querySelector('#select_car');

    show_car.addEventListener('click', function () {
        var bankId = show_car.dataset['id'];
        var bankName = show_car.dataset['value'];
        var bankSelect = new IosSelect(1,
            [car_p],
            {
                container: '.container',
                title: '',
                itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_car.value = selectOneObj.id;
                    show_car.innerHTML = selectOneObj.value;
                    show_car.dataset['id'] = selectOneObj.id;
                    show_car.dataset['value'] = selectOneObj.value;
                }
            });
    });
</script>
<script>
	var jsstr = ${jsstr};
	wx.config(jsstr);

	var pyqtitle = '${pyqtitle}';
	var pyqlink = '${pyqlink}';
	var pyqimgurl = '${pyqimgurl}';

	var hytitle = '${hytitle}';
	var hydesc = '${hydesc}';
	var hylink = '${hylink}';
	var hyimgurl = '${hyimgurl}';

	var reuserid = '${reuserid}';
	var shareid = '${shareid}';

	wx.ready(function () {	//朋友圈
	   	wx.onMenuShareTimeline({
	        title: pyqtitle, // 分享标题
	        link: pyqlink+'&shareid='+shareid+'&reuserid='+reuserid, // 分享链接
	        imgUrl: pyqimgurl,
	        success: function (res) {
	            //alert(1);
	        },
	        cancel: function (res) {
	        	//alert(2);
	        },
	        fail: function (res) {
			            
	        }
	    });
	    //朋友
	    wx.onMenuShareAppMessage({
	        title: hytitle, // 分享标题
	        desc: hydesc, // 分享描述
	        link: hylink+'&shareid='+shareid+'&reuserid='+reuserid, // 分享链接
	        imgUrl: hyimgurl,
	        type: '', // 分享类型,music、video或link，不填默认为link
	        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	        success: function () {
	            // 用户确认分享后执行的回调函数
	        	//alert(2);
	        },
	        cancel: function () {
	            // 用户取消分享后执行的回调函数
	        	//alert(4);
	        }
	    });
	});
	wx.error(function (res) {
	  alert(res.errMsg);
	});	
</script>

</body>
</html>