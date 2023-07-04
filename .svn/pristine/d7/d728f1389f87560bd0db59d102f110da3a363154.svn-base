<%@ page contentType="text/html;charset=utf-8"%>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
<link rel="stylesheet" href="../../css/hengqin/index.css?v=180428_04">
</head>
<body>
<!--START  客服信息-->

	<div id="prompt" style="display: none;"></div>
		<input type="text" id="reuserid" hidden="hidden" value="${reuserid}">
		<div class="prpmptBox kf_prpmpt js_kf_prpmpt">
			<div class="titlebox d_boxSz"><span>客服信息</span><i class="js_kf_close"></i></div>
			<div class="infobox d_boxSz">
				<div class="headbox">
					<div class="img">
						<img class="my_img" src="" />
					</div>
					<div class="txt">
						<h1 class="name1"></h1>
						<h2 ><i class="grade"></i><span class="name2"></span></h2>
						<h2 class="name2"><i class="job_title"></i><span class="name3"></span></h2>
						<h3><i class="job_num"></i><span class="name4"></span></h3>
					</div>
				</div>
				<div class="contact phone"><i></i><span class="phone1"></span></div>
				<div class="contact weixin"><i></i><span class="weixin1"></span></div>
				<div class="contact qq"><i></i><span class="qq1"></span></div>
			</div>
		</div>
		<!--END     客服信息-->
</body>
<script>
$(function(){
	//客服弹层
	$(".kf_p").on('click', function() {
		$("#prompt").show();
		$(".js_kf_prpmpt").show();
	})
	$(".js_kf_close").on('click', function() {
		$("#prompt").hide();
		$(".js_kf_prpmpt").hide();
	})
	var transdata = {
		"id":$("#reuserid").val()
	};
	sendRequest("../../user/getCspInfo.do",transdata,function (data) {
			   var obj = data;
			   console.log(obj);
			   if(obj.code == '00'){
			      $(".name1").append(obj.realname);
			      $(".name2").append(obj.diploma);
			      $(".name3").append(obj.title);
			      $(".name4").append(obj.usercode);
			      $(".phone1").append(obj.mobilenumber);
			      $(".weixin1").append(obj.weixin);
			      $(".qq1").append(obj.qq);
			      if(obj.picurl.indexOf("upload")>0){
                      $(".my_img").attr("src",obj.picurl);
                  }else{
                      $(".my_img").attr("src","../../images/hengqin/bwyl/icon_kf_woman.png");
			      }
			   }else{
				 
			   }
			},
			function(){});
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
});


</script>
</html>