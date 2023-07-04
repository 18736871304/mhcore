<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<title>保全服务</title>
	<link rel="stylesheet" href="/css/mypolicy/members/common.css?v=20191218_01">
	<link rel="stylesheet" href="/css/mypolicy/members/list.css">
	<style>
		.header {
			background: url("/images/mypolicy/members/baoquanfuwu-hbg.jpg") no-repeat center;
			background-size: cover;
		}
		.menu-list {
			display: flex;
			justify-content: space-between;
			padding: 0 10px;
			margin-top: 14px;
			flex-wrap: wrap;
		}
		.menu-list .menu-item {
			width: 45.8vw;
			height: 49px;
			line-height: 49px;
			border-left: 6px solid #dc220d;
			box-sizing: border-box;
			box-shadow: 3px 3px 3px #f3f3f3;
			margin-top: 10px;
			border-radius: 3px;
			text-align: left;
			padding-left: 20px;
			cursor: pointer;
		}
		.menu-list .menu-item:nth-of-type(odd) {
			/*margin-right: 10px;*/
		}
		
		.contact-button {
            position: fixed;
            bottom: 0;
        }
	</style>
</head>
<body>
<div class="main">
	<div class="header">
		<div class="header-title opacity-title">
			保全服务
		</div>
	</div>
	<div class="menu-box">
		<ul id="menubox" class="menu-list"></ul>
	</div>
	<div class="contact-button"><button id="contactBtn" onclick = "connect_us('bq')">立即联系</button></div>
</div>
<script src="/js/mypolicy/policytrust/lib/jquery1.12.4.min.js"></script>
<script src="/js/mypolicy/members/common.js?v=20191218"></script>
<script src="/js/common/insuCommon.js?v=20200228"></script>
<script>
	$(function () {
		var menuData = [
			{
				name: '银行卡变更',
				type: 'yinhangkabiangeng'
			},
			{
				name: '受益人变更',
				type: 'shouyirenbiangeng'
			},
			{
				name: '联系方式变更',
				type: 'lianxifangshibiangeng'
			},
			{
				name: '补充告知',
				type: 'buchonggaozhi'
			},
			{
				name: '保单贷款',
				type: 'baodandaikuan'
			},
			{
				name: '追加保费',
				type: 'zhuijiabaofei'
			},
			{
				name: '部分领取',
				type: 'bufenlingqu'
			},
			{
				name: '保单复效',
				type: 'baodanfuxiao'
			},
			{
				name: '退保申请',
				type: 'tuibaoshenqing'
			}
		]

		var menuFunc = {
			init: function () {
				renderMenu(menuData)
				this.bindEvent()
			},
			bindEvent: function () {
				$('body').on('click', '.menu-item', function () {
					var type = $(this).data('type')
					//这里可以根据type跳转相应的页面
					console.log(type)
				})
			}
		}

		menuFunc.init()

		function renderMenu(data) {
			console.log(data)
			if (!data.length || !Array.isArray(data)) {
				return ''
			}
			var tpl = ''
			data.forEach(function (item) {
				tpl += '<li class="menu-item" data-type="'+item.type+'">' + item.name + '</li>'
			})
			// console.log(tpl)
			$('#menubox').html(tpl)
		}
	})
</script>
</body>
</html>
