<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>大白定期寿险</title>
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
				<img src="../../images/hongkang/dbds/dbdqsx_01.png"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">20-50周岁</span></p>
					<p><span class="left">保障期限</span><span class="right">最高报至70周岁</span></p>
					<p><span class="left">最高保障</span><span class="right">100万</span></p>
				</div>
			</div>
			<div class="product_wrapper">
				<div id="nav">
					<div class="product_nav">
						<a href="javascript:;" class="active_nav"><span>产品介绍</span></a>
						<a href="javascript:;"><span>投保案例</span></a>
						<a href="javascript:;"><span>理赔流程</span></a>
						<a href="javascript:;"><span>承保公司</span></a>
					</div>
				</div>
				<div id="nav1" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_02.png" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_03.png" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_04.png" alt="">
					<div class="recommend_wrapper">
						<a href="../../contract/hongkang/hk-lpxz.pdf"></a>
						<a href="../../contract/hongkang/dbds/hk-dbds.pdf"></a>
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_05.png" alt="">
				</div>
			</div>
		</div>
	</div>
</body>
</html>