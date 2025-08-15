<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<html lang="zh-cmn-Hans">

			<head>
				<meta charset="UTF-8">
				<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
					name="viewport">
				<meta content="yes" name="apple-mobile-web-app-capable">
				<meta content="black" name="apple-mobile-web-app-status-bar-style">
				<meta content="telephone=no" name="format-detection">
				<title>美华保险服务</title>
				<script src="./js/jquery/jquery-3.6.0.min.js"></script>
				<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=20180227"></script>
				<script src="./js/common/insuCommon.js"></script>
				<script src="./js/common/Lstorage.js"></script>
				<script src="./js/common/purify.min.js"></script>
				<link rel="stylesheet" href="./css/hengqin/index.css?v=20200102">
			</head>

			<style>
				.mainContent {
					width: 100%;
					height: auto;
					overflow: hidden;

				}

				.mainOther {
					padding: 0;
					margin-top: 15px;
					padding: 0 15px;
				}

				.contentDescone {
					width: 100%;
					margin-bottom: 15px;
					background: #fff;
					position: relative;
					border-radius: 5px;
					box-shadow: 0 2px 4px rgba(0, 0, 0, .1);
				}

				/*.mainProduct {*/

				/*background: none;*/

				/*}*/
				.d_boxSz {
					display: inline-block;
					width: 100%;
					padding: 15px 20px;
					position: relative;
					-webkit-box-sizing: border-box;
					-moz-box-sizing: border-box;
					box-sizing: border-box;
				}

				.contentDescone .title {
					font-size: 0.9rem;
					color: #0C0C0E;
					/* line-height: 1; */
					display: inline-block;
					width: 100%;
					margin-bottom: 5px;
				}

				.explain {
					font-size: 0.7rem;
					color: #6D6666;
					line-height: 1.4rem;
					display: block;
					margin-bottom: 15px;
					text-overflow: ellipsis;
					overflow: hidden;
					white-space: nowrap;
				}

				.contentDescone .pricebox {
					font-size: 0.7rem;
					color: #999;
					line-height: 1.4rem;
					display: inline-block;
					position: absolute;
					bottom: 10px;
				}

				.contentDescone .price {
					font-size: 0.7rem;
					color: #DA251D;
					display: inline-block;
					margin-right: 5px;
				}

				.contentDescone .pricebox span {
					font-size: 1.0rem;
					font-weight: bold;
					line-height: 1.4rem;
				}

				.contentDescone .icon_img {
					width: 80px;
					height: 16px;
					display: inline-block;
					float: right;
				}

				a img,
				img {
					-ms-interpolation-mode: bicubic;
				}

				img {
					border: 0;
					vertical-align: middle;
				}

				.contentBjTitle {
					margin-top: 0.5rem;
					background: #fff;
					padding: 0 0.75rem;
				}

				.contentBjTitle .title {
					display: inline-block;
					margin: 1rem 0;
					width: 100%;
					height: 0.75rem;
					line-height: 0.75rem;
					font-size: 0.8rem;
					border-left: 2px solid #dc220d;
					padding-left: 0.25rem;
				}

				.contentDescone .title span {
					background: #ffecea;
					border-radius: 5px;
					border: 1px solid #ffdcd8;
					color: #dc220d;
					padding: 0.1rem;
					cursor: pointer;
					font-size: 0.6rem;
					margin-left: 0.5rem;
				}
			</style>

			<body>
				<div class="mainIndex_wrapper">
					<div class="main_search">
						<img class="logoIcon left logo" src="./images/life/mhLogo417.png" />
						<img class="logoIcon left close-sW-wrap" src="./images/life/back.png?v=20180524" />
						<input class="serchInput" type="text" placeholder="搜索产品" /> <a href="javascript:;"
							class="serchBtn">搜索</a>
					</div>
					<div class="main_nav">
						<div class="main_navItem navItem_active">
							<span>意外</span>
						</div>
						<div class="main_navItem">
							<span>医疗</span>
						</div>
						<div class="main_navItem">
							<span>重疾</span>
						</div>
						<div class="main_navItem">
							<span>定寿</span>
						</div>
						<div class="main_navItem">
							<span>理财</span>
						</div>
						<div class="main_navItem">
							<span>其他</span>
						</div>
					</div>
					<!-- 1.意外 -->
					<div class="mainContent mainContent_01">
						<!-- <div class="mainRecommend mainProduct">
				<div class="contentTitle">每月精选</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${risktype_01_url}${reuserStr}"> <img src="${risktype_01_imgsrc}" />
						</a>
					</div>
				</div>
			</div> -->

						<!-- <div class="contentBjTitle content">
				<div class="title">百家争鸣</div>
			</div> -->

						<div class="mainOther" id="risktype01list">
						</div>

						<div class="seeMore" id="risktype01more">查看更多＞</div>
					</div>
					<!-- 2.医疗 -->
					<div class="mainContent mainContent_02">
						<!-- <div class="mainRecommend mainProduct">
				<div class="contentTitle">每月精选</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${risktype_02_url}${reuserStr}"> <img src="${risktype_02_imgsrc}" />
						</a>
					</div>
				</div>
			</div> -->

						<!-- <div class="contentBjTitle content">
				<div class="title">百家争鸣</div>
			</div> -->

						<div class="mainOther" id="risktype02list">
						</div>

						<div class="seeMore" id="risktype02more">查看更多＞</div>
					</div>
					<!-- 3.重疾 -->
					<div class="mainContent mainContent_03">
						<!-- <div class="mainRecommend mainProduct">
				<div class="contentTitle">每月精选</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${risktype_03_url}${reuserStr}"> <img src="${risktype_03_imgsrc}" />
						</a>
					</div>
				</div>
			</div> -->

						<!-- <div class="contentBjTitle content">
				<div class="title">百家争鸣</div>
			</div> -->

						<div class="mainOther" id="risktype03list">
						</div>

						<div class="seeMore" id="risktype03more">查看更多＞</div>
					</div>
					<!-- 4.寿险 -->
					<div class="mainContent mainContent_04">
						<!-- <div class="mainRecommend mainProduct">
				<div class="contentTitle">每月精选</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${risktype_04_url}${reuserStr}">
							<img src="${risktype_04_imgsrc}" />
						</a>
					</div>
				</div>
			</div> -->

						<!-- <div class="contentBjTitle content">
				<div class="title">百家争鸣</div>
			</div> -->

						<div class="mainOther" id="risktype04list">
						</div>

						<div class="seeMore" id="risktype04more">查看更多＞</div>
					</div>
					<!-- 5.年金 -->
					<div class="mainContent mainContent_05">
						<!-- <div class="mainRecommend mainProduct">
				<div class="contentTitle">每月精选</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${risktype_05_url}${reuserStr}">
							<img src="${risktype_05_imgsrc}" />
						</a>
					</div>
				</div>
			</div> -->

						<!-- <div class="contentBjTitle content">
				<div class="title">百家争鸣</div>
			</div> -->

						<div class="mainOther" id="risktype05list">
						</div>

						<div class="seeMore" id="risktype05more">查看更多＞</div>
					</div>

					<!-- 6.其他 -->
					<div class="mainContent mainContent_06">
						<!-- 
			<div class="mainRecommend mainProduct">
				<div class="contentTitle">每月精选</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${risktype_06_url}&item=zhonglaonian">
							<img src="${risktype_06_imgsrc}" />
						</a>
					</div>
				</div>
			</div>
			 -->

						<!-- <div class="contentBjTitle content">
				<div class="title">百家争鸣</div>
			</div> -->

						<div class="mainOther" id="risktype06list">
						</div>

						<div class="seeMore" id="risktype06more">查看更多＞</div>
					</div>

					<div class="main_footer">
						<img src="./images/life/mainFooter.png" />
					</div>
				</div>
				<div class="search-con-warp">
					<div class="history-wrap">
						<ul class="list">

						</ul>
						<a class="showAllBtn">全部搜索记录</a>
						<a class="clearAllBtn">清除搜索记录</a>
					</div>
					<div class="bgCCC"></div>
					<div class="wanted-wrap" style="display:none">
						<h4>猜你想搜的</h4>
						<ul class="list">
							<li class="item guessitem">开启健康生活</li>
							<li class="item guessitem">月光也能理财</li>
							<li class="item guessitem">锁定品质养老</li>
							<li class="item guessitem">迈入中产阶级</li>
							<li class="item guessitem">畅想财富人生</li>
							<li class="item guessitem">迎来人生新增</li>
							<li class="item guessitem">人在囧途</li>
							<li class="item guessitem">备战二胎</li>
						</ul>
					</div>
				</div>
				<script>
					//解决
					var reuserStr = '${reuserStr}';

					$('.guessitem').click(function () {
						//alert($(this).html());
						toSearch($(this).html());
					})

					function toSearch(keywords) {
						window.location.href = "./searchResult.do?keywords=" + keywords;
					}

					/* 搜索前端通过LS记录功能 Start */
					$('.close-sW-wrap').click(function () {
						$('.search-con-warp').hide();
						$('.main_search').removeClass('active')
					})

					function search() {
						this.Shistory = Lstorage.getItem('Shistory') || [];
						this.update();
						this.deleteItem();
						this.deleteAll();
						this.focus();
						this.quickserch();
						this.showAllHistory();
					}
					search.prototype = {
						focus: function () {
							var that = this;
							$('.serchInput').focus(function () {
								var val = $('.serchInput').val();
								var clean = DOMPurify.sanitize(val);
								console.log("1")
								that.focusRander();
							})
						},
						showAllHistory: function () {
							var that = this;
							$('.showAllBtn').on('click', function () {
								that.render();
								$('.showAllBtn').css('display', 'none');
								$('.clearAllBtn').css('display', 'block');
							})
						},
						focusRander: function () {
							$('.showAllBtn,.clearAllBtn').hide();
							$('.search-con-warp').show();
							$('.history-wrap').show();
							$('.main_search').addClass('active');
							Lstorage.setItem('Shistory', this.Shistory);
							if (this.Shistory.length > 0) {
								$('.history-wrap').show();
							}
							$('.history-wrap .item').remove();
							if (this.Shistory.length > 3) {
								for (var i = 0; i < 3; i++) {
									$('<li class="item"></li>').html(
										'<img src="./images/life/search-item-icon.png" /><div class="txt hisitem">' + this
											.Shistory[i] + '</div> <a class="clearItem">×</a>').appendTo('.history-wrap .list')
								}
								$('.showAllBtn').css('display', 'block');
							} else {
								this.Shistory.forEach(function (item, index) {
									$('<li class="item"></li>').html(
										'<img src="./images/life/search-item-icon.png" /><div class="txt hisitem">' +
										item + '</div> <a class="clearItem">×</a>').appendTo('.history-wrap .list')
								})
								if (this.Shistory.length > 0) {
									$('.clearAllBtn').css('display', 'block');
								}
							}
						},
						render: function () {
							Lstorage.setItem('Shistory', this.Shistory);
							if (this.Shistory.length > 0) {
								$('.history-wrap').show();
							}
							$('.history-wrap .item').remove();
							this.Shistory.forEach(function (item, index) {
								$('<li class="item"></li>').html(
									'<img src="./images/life/search-item-icon.png" /><div class="txt hisitem">' +
									item + '</div> <a class="clearItem">×</a>').appendTo('.history-wrap .list')
							})
						},
						handleArr: function (arr) {
							var length = arr.length;
							if (length > 10) {
								arr.splice(10, length - 10)
							}
							return arr
						},
						update: function () {
							var that = this;
							$('.main_search').on('click', '.serchBtn', function () {
							
								var val = $('.serchInput').val();
								 
								var clean = DOMPurify.sanitize(val);
							 
								if (!clean) {
									alert("请输入正确的查询条件")
									return
								}
								that.Shistory.unshift(clean);
								Lstorage.setItem('Shistory', that.handleArr(that.Shistory));
								that.render();

								window.location.href = "./searchResult.do?keywords=" + clean;
							})
						},
						deleteItem: function () {
							var that = this;
							$('.search-con-warp').on('click', '.clearItem', function () {
								var index = $(this).index('.clearItem');
								if (index === 0) {
									that.Shistory.shift()
								} else if (index === that.Shistory.length - 1) {
									that.Shistory.pop()
								} else {
									that.Shistory.splice(index, 1)
								}
								if (that.Shistory.length === 0) {
									$('.history-wrap').hide();
								}
								that.render();
							})
						},
						deleteAll: function () {
							var that = this;
							$('.search-con-warp').on('click', '.clearAllBtn', function () {
								that.Shistory = [];
								that.render();
								$('.history-wrap,.showAllBtn,.clearAllBtn').hide();
							})

						},
						quickserch: function () {
							$('.search-con-warp').on('click', '.hisitem', function () {
								toSearch($(this).html());
							})
						}
					}
					var searchObj = new search();
					/* 搜索前端通过LS记录功能end */
					var mainpagecount = 0;

					//分页长度，仅供下一页更多那个按钮使用
					var mainpagelength = 9;
					var mainrisktype;
					var maintype;

					$('.seeMore').click(
						function () {
							var distype = $(this).attr("id");
							getPageList(mainrisktype, mainpagecount, mainpagelength, distype)
						})
					$('.main_navItem').click(function () {
						var Nindex = $(this).index();
						console.log(Nindex)
						$('.main_navItem').removeClass('navItem_active');
						$(this).addClass('navItem_active');
						$('.mainContent').hide();
						$('.mainContent').eq(Nindex).show();

						var risktype;

						if (Nindex == 0) {
							risktype = "01";
						} else if (Nindex == 1) {
							risktype = "02";
						} else if (Nindex == 2) {
							risktype = "03";
						} else if (Nindex == 3) {
							risktype = "04";
						} else if (Nindex == 4) {
							risktype = "05";
						} else if (Nindex == 5) {
							risktype = "06";
						}

						location.hash = "risktype" + risktype;
						getPageList(risktype, "0", "100", "risktype" + risktype + "more");
					});

					function getPageList(risktype, pagecount, pagelength, distype) {
						risklist = $("#risktype" + risktype + "list");
						dismore = $("#risktype" + risktype + "more");
						var transdata = {
							"risktype": risktype,
							"pagecount": pagecount,
							"pagelength": pagelength
						};
						sendRequest("./getNextPageList.do", transdata, function (data) {
							var obj = JSON.parse(data);
							//console.log(obj);
							if (obj.code == '00') {
								//alert(obj.homeList.length);
								//alert(distype);
								//alert(pagecount);
								if (pagecount == 0 && obj.homeList.length == 0) {
									$("#" + distype).hide();
								} else {
									if (pagecount == 0) {
										risklist.html("");
									}
									disList(risklist, obj);
									mainrisktype = risktype;
									mainpagecount = Number(obj.homeList.length) + Number(pagecount);
									//alert(mainpagecount);
									if (obj.homeList.length < pagelength) {
										dismore.hide();
									} else {
										dismore.show();
									}
								}
							} else { }
						}, function () { });
						//etlist
					}

					function disList(risklist, obj) {
						var html = ''
						for (var i = 0; i < obj.homeList.length; i++) {
							var reuserStrUrl = '';

							if (obj.homeList[i].channel == '10' && reuserStr != '') {
								reuserStrUrl = reuserStr;
							}
							if (obj.homeList[i].jointype == '01') {

								html += `
				<div class="contentDescone" id="lclist">
					<a class="d_boxSz" href=" ${"${obj.homeList[i].url}"}${"${reuserStrUrl}"}">
					<div class="title"> ${"${obj.homeList[i].title}"}
					<span>互联网专属</span></div>
					<p class="explain"> ${"${obj.homeList[i].description}"}</p>
					<div class="pricebox">
					<p class="price"><span>${"${obj.homeList[i].prem}"}</span>元/年</p>起
					</div>
					<img class="icon_img" src="${"${obj.homeList[i].logo}"}">
					</a>
					</div>
				`
								// obj.homeList[i]['jointypeName'] = '互联网专属'
							} else {

								html += `
				<div class="contentDescone" id="lclist">
					<a class="d_boxSz" href=" ${"${obj.homeList[i].url}"}${"${reuserStrUrl}"}">
					<div class="title"> ${"${obj.homeList[i].title}"} </div>
					<p class="explain"> ${"${obj.homeList[i].description}"}</p>
					<div class="pricebox">
					<p class="price"><span>${"${obj.homeList[i].prem}"}</span>元/年</p>起
					</div>
					<img class="icon_img" src="${"${obj.homeList[i].logo}"}">
					</a>
					</div>
				`
								// obj.homeList[i]['jointypeName'] = ''
							}
						}
						risklist.append(html)
					}

					function hashShowItem() {
						if (location.hash == "#risktype01" || !location.hash || location.hash == "#lc") {
							$('.main_navItem').eq(0).click();
						} else if (location.hash == '#risktype02') {
							$('.main_navItem').eq(1).click();
						} else if (location.hash == '#risktype03') {
							$('.main_navItem').eq(2).click();
						} else if (location.hash == '#risktype04') {
							$('.main_navItem').eq(3).click();
						} else if (location.hash == '#risktype05') {
							$('.main_navItem').eq(4).click();
						} else if (location.hash == '#risktype06') {
							$('.main_navItem').eq(5).click();
						}
					}
					hashShowItem()
					window.addEventListener('hashchange', function (ev) {

						hashShowItem();
					})



					var reuserid = '${reuserid}';
					var jsstr = ${ jsstr };
					wx.config(jsstr);

					wx.ready(function () { //朋友圈
						wx.onMenuShareTimeline({
							title: '美华保险服务', // 分享标题
							link: 'https://insure.meihualife.com/index.do?reuserid=' + reuserid, // 分享链接
							imgUrl: 'https://insure.meihualife.com/images/logo/meihua_wx.png',
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
							title: '美华保险服务', // 分享标题
							desc: '亲爱的朋友，让我们一起用正确的方式打开保险世界，美好人生，就此开启', // 分享描述
							link: 'https://insure.meihualife.com/index.do?reuserid=' + reuserid, // 分享链接
							imgUrl: 'https://insure.meihualife.com/images/logo/meihua_wx.png',
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
					wx.error(function (res) { });
				</script>
			</body>

			</html>