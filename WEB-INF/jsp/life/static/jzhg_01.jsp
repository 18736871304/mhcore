<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>金掌柜万能账户</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=180428">
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180428"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180428"></script>
    <script src=" ../../js/common/insuCommon.js?v=180428"></script>
    <script src=" ../../js/common/intention.js?v=180428"></script>
    <style type="text/css">
    	#nav1,#nav2,#nav3,#nav4{
    		padding: 0;
    	}
		#nav1 img,#nav2 img,#nav3 img,#nav4 img{
			display: block;
			width: 100%;
			margin: auto;
		}
		.footer_go{
			width: 100%;
		}
		a.kefu:hover {color:white;} a.kefu:visited {color:white;} a.kefu:link {color:white;} a.kefu {color:white;}
		
		#width33
		{
			width:33.3%;
		}
		
		.recommend_wrapper{
			position: absolute;
			left: 0;
			bottom: 1.5rem;
			width: 100%;
			overflow: hidden;
			padding: 0 0.75rem;
		}
		.recommend_wrapper a{
			display: block;
			width: 5.75rem;
			height: 4.5rem;
			float: left;
		}
    </style>
</head>
<body>
	<div class="index_wrapper">
		<div class="main_wrapper">
			<div class="banner_wrapper">
				<img src="../../images/xintai/jzhg/jzgwnzh_01.png"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">28天-80周岁</span></p>
					<p><span class="left">保障期限</span><span class="right">终身</span></p>
					<p><span class="left">起投金额</span><span class="right">4万</span></p>
				</div>
			</div>
			<div class="product_wrapper">
				<div id="nav">
					<div class="product_nav">
						<a href="javascript:;" class="active_nav" id = "width33"><span>产品介绍</span></a>
						<a href="javascript:;" id = "width33"><span>理赔流程</span></a>
						<a href="javascript:;" id = "width33"><span>承保公司</span></a>
					</div>
				</div>
				<div id="nav1" class="product_desc">
					<img src="../../images/xintai/jzhg/jzgwnzh_02.png" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/xintai/jzhg/jzgwnzh_03.png" alt="">
					<div class="recommend_wrapper">
						<a href="javascript:;"></a>
						<a href="../../contract/xintai/jzhg/jzhg.pdf"></a>
						<a href="javascript:;"></a>
					</div>
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/xintai/jzhg/jzgwnzh_04.png" alt="">
				</div>
			</div>
		</div>
	</div>
</body>
</html>