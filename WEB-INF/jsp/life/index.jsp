<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<title>美华保险服务</title>
	<script src="./js/jquery/jquery-3.6.0.min.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=20180227"></script>
	<script src="./js/common/insuCommon.js"></script>
	<link rel="stylesheet" href="./css/hengqin/index.css?v=180428">
</head>
<body>
	<div class="mainIndex_wrapper">
		<div class="main_search">
			<img class="logoIcon left" src="./images/life/mhLogo417.png" />
			<!-- 
			<input class="right" type="text" placeholder="搜索产品、计划书" />
			<img class="searchIcon" src="./images/life/mainSearch.png" />
			 -->
		</div>
		<div class="main_nav">
			<div class="main_navItem navItem_active"><span>理财</span></div>
			<div class="main_navItem"><span>儿童</span></div>
			<div class="main_navItem"><span>成人</span></div>
			<div class="main_navItem"><span>中老年</span></div>
			<div class="main_navItem"><span>其他</span></div>
		</div>
		<!-- 1.理财 -->
		<div class="mainContent mainContent_01">
			<div class="mainRecommend mainProduct">
				<div class="contentTitle">产品推荐</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${lc_url}">
							<img src="${lc_imgsrc}" />
						</a>
					</div>
				</div>
			</div>
			<div class="mainOther mainProduct" id = "lcdis">
				<div class="contentTitle">百家争鸣</div>
				<div class="contentDesc" id = "lclist">
					
				</div>
				<div class="seeMore" id = "lcmore">
					查看更多＞
				</div>
			</div>
		</div>
		<!-- 2.儿童 -->
		<div class="mainContent mainContent_02">
			<div class="characteristic">
				<div class="left" onclick = 'getPageList("etyw","0",mainpagelength,"02","et")'>
					<a href="javascript:;">
						<img src="./images/life/ywbx.png" />
						意外保障
					</a>
				</div>
				<div class="left" onclick = 'getPageList("etzj","0",mainpagelength,"02","et")'>
					<a href="javascript:;">
						<img src="./images/life/zdjb.png" />
						重大疾病
					</a>	
				</div>
				<div class="left" onclick = 'getPageList("etjk","0",mainpagelength,"02","et")'>
					<a href="javascript:;">
						<img src="./images/life/jkyl.png" />
						健康医疗
					</a>
				</div>
				<div class="left" onclick = 'getPageList("etjy","0",mainpagelength,"02","et")'>
					<a href="javascript:;">
						<img src="./images/life/jycx.png" />
						教育储蓄
					</a>
				</div>
			</div>
			<div class="mainRecommend mainProduct">
				<div class="contentTitle">产品推荐</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${et_url}">
							<img src="${et_imgsrc}" />
						</a>
					</div>
				</div>
			</div>
			<div class="mainOther mainProduct" id = "etdis">
				<div class="contentTitle">百家争鸣</div>
				<div class="contentDesc" id = "etlist">
					
				</div>
				<div class="seeMore" id = "etmore">
					查看更多＞
				</div>
			</div>
		</div>
		<!-- 3.成人 -->
		<div class="mainContent mainContent_03">
			<div class="characteristic">
				<div class="left" onclick = 'getPageList("cryw","0",mainpagelength,"02","cr")'>
					<a href="javascript:;">
						<img src="./images/life/ywbx.png" />
						意外保障
					</a>
				</div>
				<div class="left" onclick = 'getPageList("crdb","0",mainpagelength,"02","cr")'>
					<a href="javascript:;">
						<img src="./images/life/jkyl.png" />
						大病医疗
					</a>	
				</div>
				<div class="left" onclick = 'getPageList("crrs","0",mainpagelength,"02","cr")'>
					<a href="javascript:;">
						<img src="./images/life/rsbz.png" />
						人寿保障
					</a>
				</div>
				<div class="left" onclick = 'getPageList("cryl","0",mainpagelength,"02","cr")'>
					<a href="javascript:;">
						<img src="./images/life/yljj.png" />
						养老基金
					</a>
				</div>
			</div>
			<div class="mainRecommend mainProduct">
				<div class="contentTitle">产品推荐</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${cr_url}">
							<img src="${cr_imgsrc}" />
						</a>
					</div>
				</div>
			</div>
			<div class="mainOther mainProduct" id = "crdis">
				<div class="contentTitle">百家争鸣</div>
				<div class="contentDesc" id = "crlist">
					
				</div>
				<div class="seeMore" id = "crmore">
					查看更多＞
				</div>
			</div>
		</div>
		<!-- 4.中老年 -->
		<div class="mainContent mainContent_04">
			<div class="characteristic">
				<div class="left" onclick = 'getPageList("zlnyw","0",mainpagelength,"02","zln")'>
					<a href="javascript:;">
						<img src="./images/life/ywbx.png" />
						意外保障
					</a>
				</div>
				<div class="left" onclick = 'getPageList("zlnjk","0",mainpagelength,"02","zln")'>
					<a href="javascript:;">
						<img src="./images/life/jkyl.png" />
						健康医疗
					</a>	
				</div>
				<div class="left" onclick = 'getPageList("zlnyl","0",mainpagelength,"02","zln")'>
					<a href="javascript:;">
						<img src="./images/life/yljj.png" />
						养老基金
					</a>
				</div>
				<div class="left" onclick = 'getPageList("zlnlx","0",mainpagelength,"02","zln")'>
					<a href="javascript:;">
						<img src="./images/life/lxbz.png" />
						旅行保障
					</a>
				</div>
			</div>
			<!-- 
			<div class="mainRecommend mainProduct">
				<div class="contentTitle">产品推荐</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${zln_url}">
							<img src="${zln_imgsrc}" />
						</a>
					</div>
				</div>
			</div>
			 -->
			<div class="mainOther mainProduct" id = "zlndis">
				<div class="contentTitle">百家争鸣</div>
				<div class="contentDesc" id = "zlnlist">
					
				</div>
				<div class="seeMore" id = "zlnmore">
					查看更多＞
				</div>
			</div>
		</div>
		<!-- 5.其他 -->
		<div class="mainContent mainContent_05">
			
			<img src="${qt_imgsrc}" width = "100%" />
			
			<!-- 
			<div class="mainRecommend mainProduct">
				<div class="contentTitle">产品推荐</div>
				<div class="contentDesc">
					<div class="contentDesc_item">
						<a href="${qt_url}">
							<img src="${qt_imgsrc}" />
						</a>
					</div>
				</div>
			</div>
			 -->
			<div class="mainOther mainProduct" id = "qtdis">
				<div class="contentTitle">百家争鸣</div>
				<div class="contentDesc" id = "qtlist">
					
				</div>
				<div class="seeMore" id = "qtmore">
					查看更多＞
				</div>
			</div>
			
		</div>
		<div class="main_footer">
			<img src="./images/life/mainFooter.png" />
		</div>
	</div>
	<script>
	
	var mainpagecount = 0;
	var mainpagelength = 3;
	var mainrisktype;
	var maintype;
	
	$(function()
	{
		risktype = "lc";
		risklist = $("#lclist");
		dismore = $("#lcmore");
		
		getPageList(risktype,"0",mainpagelength,"01",risktype);
	})
	
	$('.seeMore').click(function()
	{
		var distype;
		
		if($(this).attr("id")=="lcmore")
		{
			distype = "lc";
		}
		else if($(this).attr("id")=="etmore")
		{
			distype = "et";
		}
		else if($(this).attr("id")=="crmore")
		{
			distype = "cr";
		}
		else if($(this).attr("id")=="zlnmore")
		{
			distype = "zln";
		}
		else if($(this).attr("id")=="qtmore")
		{
			distype = "qt";
		}
		
		getPageList(mainrisktype,mainpagecount,mainpagelength,maintype,distype)
	})
	
		$('.main_navItem').click(function(){
			var Nindex = $(this).index();
			$('.main_navItem').removeClass('navItem_active'); 
			$(this).addClass('navItem_active');
			$('.mainContent').hide();
			$('.mainContent').eq(Nindex).show();
			
			var risktype;
			
			if(Nindex==0)
			{
				risktype = "lc";
			}
			else if(Nindex==1)
			{
				risktype = "et";
			}
			else if(Nindex==2)
			{
				risktype = "cr";
			}
			else if(Nindex==3)
			{
				risktype = "zln";
			}
			else if(Nindex==4)
			{
				risktype = "qt";
			}
			
			getPageList(risktype,"0",mainpagelength,"01",risktype);
		});
		
		function getPageList(risktype,pagecount,pagelength,type,distype)
		{
			risklist = $("#"+distype+"list");
			dismore = $("#"+distype+"more");
			
			var transdata = 
			{
				"risktype":risktype,
				"type":type,
				"pagecount":pagecount,
				"pagelength":pagelength
			};
			
			sendRequest("./getNextPageList.do",transdata,function (data) 
			{
			    var obj = JSON.parse(data);
			    //console.log(obj);
				if(obj.code == '00')
				{
				   //alert(obj.homeList.length);
				   //alert(pagecount);
				   
				   if(pagecount==0&&obj.homeList.length==0)
				   {
					   $("#"+distype+"dis").hide();
				   }
				   else
				   {
					   if(pagecount==0)
					   {
						   risklist.html("");
					   }
					   disList(risklist,obj);
					   
					   mainrisktype = risktype;
					   maintype = type;
					   mainpagecount = Number(obj.homeList.length)+Number(pagecount);
					   
					   //alert(mainpagecount);
					   
					   if(obj.homeList.length<3)
					   {
						   dismore.hide();
					   }
					   else
					   {
						   dismore.show();
					   }
				   }
				}
				else
				{
				}
			},
			function(){});
			//etlist
		}
		
		function disList(risklist,obj)
		{
			for(var i=0;i<obj.homeList.length;i++)
			{
				  risklist.append("<div class='contentDesc_item'>"
					   +"<a href='"+obj.homeList[i].url+"'>"
					   +"<img src='"+obj.homeList[i].imgsrc+"' />"
					   +"<div class='otherTitle'>"+obj.homeList[i].title+"</div>"
					   +"<div class='otherDesc'>"+obj.homeList[i].description+"</div>"
					   +"<div class='otherPic'>"
					   +"<div class='left'><span class='Price'>"+obj.homeList[i].prem+"</span><span>元/年</span>起</div>"
					   +"<div class='right'>"
					   +"<img src='"+obj.homeList[i].inslogo+"' />"
					   +"</div>"
					   +"</div>"
					   +"</a>"
					   +"</div>"
				  );
			   }
		}
	</script>
</body>
</html>