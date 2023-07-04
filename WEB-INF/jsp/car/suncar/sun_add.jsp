<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>阳光车险</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180718_01">
    <link rel="stylesheet" href="../../css/car/car-index.css?v=20180717">
    <link rel="stylesheet" href="../../css/car/car_search.css?v=20180718_18">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=2180719_01"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=2180719_06" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=2180719_01" type="text/javascript"></script>
    <script src="../../js/common/insuCommon.js?v=2180719_01"></script>
	<%--<script src=" ../../js/car/suncar/checkFn.js?v=2180719_05"></script>--%>
	<%--<script src=" ../../js/car/suncar/sun_02.js?v=2180725_09"></script>--%>
	<%--<script src=" ../../js/car/suncar/chengshi2.js?v=2180618_09"></script>--%>
	<style>
		.loading .sk-circle {
		    margin: 0 auto;
		    width: 8rem;
		    height: 3rem;
		    position: relative;
		    top: 20%;
		}
		.img{
			width:100%;
		}
		.infoSec .infoDl dt {
			font-size: 0.87rem;
		}
		.infoSec .borBot1 dt {
			font-size: 0.87rem;
		}
		 .zhanshi{
		 	font-size: 0.87rem;
		 }
		.info .infoList p{
			font-size: 0.99rem;
		}
	</style>
<script type="text/javascript">

    var vehicleCodeIdData = cData('${vehicleInfo.vehicleCodeId.data}');
    var seatsData= cData('${vehicleInfo.seats.data}');

	$(function ()
	{
		$("#sureToSave").on("click", function ()
		{
			fm.submit();
		});
	});

	function cData(data){
		var ones = data.split(";");
		var json1 = new Array();
		for(var i=0;i<ones.length;i++){
			var cc = new Object();
			cc.id = ones[i].split(':')[1];
			cc.value = ones[i].split(':')[0];
			json1.push(cc);
		}
		return json1;
	}
</script>
</head>
<body style="">
	<header class="header w100 pl bgColor">
        <span>阳光车险</span>
        <br/>
        <span>本产品由阳光财险有限公司承保</span>
        <img src="../../images/car/yangguang/yangguang.png"/>
    </header>
	
    <article class="info" style="margin-top: 5.2rem;">
        <form id="fm" name="fm" method="post" action = "../../car/sunCar/carAdd.do">
        	<input type="hidden" class="personInfo" id="productNo" value="suncar">
			<input type="text" hidden="hidden" class="personInfo" id="orderid" name="orderid" value="${orderid}">
            <section class="infoList product yingchang">
             <div class="infoSec pl pr bgColor borTop1 borBot1">
             
             
				<dl class="clearfix borBot1 dlSec">
					<dt class="w30 l-float">品牌型号</dt>
					<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
						<c:if test="${vehicleInfo.vehicleModelName.value==''}">
							<input type="text" class="textfield txtR personInfo" id="vehicleModelName" name="vehicleModelName" value="" placeholder="请输入品牌型号">
						</c:if>
						<c:if test="${vehicleInfo.vehicleModelName.value!=''}">
							<input type="text" class="textfield txtR personInfo" id="vehicleModelName" name="vehicleModelName" value="${vehicleInfo.vehicleModelName.value}" placeholder="请输入品牌型号">
						</c:if>
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec pr" id="select_vehicleId">
					<dt class="w30 l-float">车型选择</dt>
					<dd class="w70 l-float  hasArrow txtR">
						<span class="mr-1 my_yanse " id="vehicleId" style="padding-right: 0.75rem;" data-id = ''>请选择</span>
						<input type="text" hidden id="vehicleId_v" name="vehicleId_v" value="">
						
					</dd>
					<i class="arrow" ></i>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec pr" id="select_seats">
					<dt class="w30 l-float">座位数</dt>
					<dd class="w70 l-float  hasArrow txtR">
						<span class="mr-1 my_yanse " id="seats" style="padding-right: 0.75rem;" data-id = '5'>请选择</span>
						<input type="text" hidden id="seats_v" name="seats_v" value="">
						
					</dd>
					<i class="arrow" ></i>
					<span class="errorMsg"></span>
				</dl>
				</div>
            </section>
        </form>
        <!--投保按钮-->
         <div class="fixedBox w100 my_next">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC dianji" id="sureToSave">下一步</div>
				</dd>
            </dl>
        </div>
        
        <div class="fixedBox w100 my_sure">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC dianji" id="sureGo">确定</div>
				</dd>
            </dl>
        </div>
    </article>
    
    <div class="search-con-warp" id = "search-con-warp">
		
		<div class="main_search active">
			<img class="logoIcon left close-sW-wrap" id = "close-sW-wrap" src="../../images/life/back.png?v=20180718" />
			<input class="serchInput" id = "serchInput" type="text" value = "" placeholder="搜索车辆品牌"/> 
			<a href="javascript:;" class="serchBtn" id = "serchBtn">搜索</a>
		</div>
		
		<div id = 'sousuo'>
			<div class="bg000" id="disa"><p class = "disfont">A</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">奥迪</li>
					<li class="item">奥克斯</li>
					<li class="item">奥路卡</li>
					<li class="item">阿斯顿-马丁</li>
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">B</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">保时捷</li>
					<li class="item">宝骏</li>
					<li class="item">宝马</li>
					<li class="item">北京奔驰</li>
					<li class="item">北京吉普</li>
					<li class="item">北京克莱斯勒</li>
					<li class="item">北京汽车</li>
					<li class="item">北京三菱</li>
					<li class="item">北京现代</li>
					<li class="item">北汽</li>
					<li class="item">北汽幻速</li>
					<li class="item">北汽坤宝</li>
					<li class="item">北汽威旺</li>
					<li class="item">本田</li>
					<li class="item">比速</li>
					<li class="item">比亚迪</li>
					<li class="item">标志</li>
					<li class="item">别克</li>
					<li class="item">宾利</li>
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">C</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">昌河</li>
					<li class="item">昌河铃木</li>
					<li class="item">长安</li>
					<li class="item">长安福特</li>
					<li class="item">长安铃木</li>
					<li class="item">长安马自达</li>
					<li class="item">长安沃尔沃</li>
					<li class="item">长安谛艾仕</li>
					<li class="item">长城</li>
					<li class="item">长丰</li>
					<li class="item">长丰三菱</li>
					<li class="item">长丰扬子</li>
				</ul>
				
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">D</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">大迪</li>
					<li class="item">大众</li>
					<li class="item">道奇</li>
					<li class="item">东风</li>
		            <li class="item">东风本田</li>
		            <li class="item">东风标致</li>
		            <li class="item">东风风度</li>
		            <li class="item">东风风神</li>
		            <li class="item">东风风行</li>
		            <li class="item">东风日产</li>
		            <li class="item">东风雪铁龙</li>
		            <li class="item">东风英菲尼迪</li>
		            <li class="item">东风悦达起亚</li>
		            <li class="item">东南</li>
		            <li class="item">东南道奇</li>
		            <li class="item">东南克莱斯勒</li>
		            <li class="item">东南三菱</li>
			<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">F</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">法拉利</li>
					<li class="item">菲亚特</li>
					<li class="item">飞碟</li>
					<li class="item">丰田</li>
					<li class="item">福建奔驰</li>
					<li class="item">福汽启腾</li>
					<li class="item">福特</li>
					<li class="item">福田</li>
		            <li class="item">富迪</li>
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">G</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">观致</li>
					<li class="item">广汽本田</li>
					<li class="item">广汽本田理念</li>
					<li class="item">广汽乘用车</li>
					<li class="item">广汽菲亚特</li>
					<li class="item">广汽丰田</li>
					<li class="item">广汽三菱</li>					
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">H</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">哈飞</li>
					<li class="item">哈弗</li>
					<li class="item">海马</li>
					<li class="item">海南马自达</li>
					<li class="item">悍霸</li>
					<li class="item">悍马</li>
					<li class="item">华晨宝马</li>	
					<li class="item">华晨中华</li>
					<li class="item">华普</li>
					<li class="item">华颂</li>
					<li class="item">华泰</li>
					<li class="item">华泰现代</li>
					<li class="item">华翔富奇</li>
					<li class="item">黄海</li>					
					
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">J</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">吉奥</li>
					<li class="item">吉利</li>
					<li class="item">吉利帝豪</li>
					<li class="item">吉普</li>
					<li class="item">江淮</li>
					<li class="item">江铃</li>
					<li class="item">江铃福特</li>	
					<li class="item">江南</li>
					<li class="item">捷豹</li>
					<li class="item">解放(一汽哈轻)</li>
					<li class="item">解放(一汽红塔)</li>
					<li class="item">解放(一汽吉林)</li>
					<li class="item">金杯</li>
					<li class="item">金旅</li>
					<li class="item">精灵Smart</li>
					<li class="item">俊风</li>						
					
					
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">k</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">卡威</li>
					<li class="item">开瑞</li>
					<li class="item">凯迪拉克</li>
					<li class="item">凯翼</li>
					<li class="item">克莱斯勒</li>								
					<li class="item">&nbsp;</li>
					 
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">L</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">兰博基尼</li>
					<li class="item">劳斯莱斯</li>
					<li class="item">雷克萨斯</li>
					<li class="item">雷诺</li>
					<li class="item">力帆(乘用车)</li>						
					<li class="item">力帆(重庆)</li>
					<li class="item">猎豹</li>
					<li class="item">林肯</li>
					<li class="item">铃木</li>
					<li class="item">路虎</li>
					<li class="item">陆风</li>							
					<li class="item">&nbsp;</li>					 
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">M</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">MG名爵</li>
					<li class="item">玛莎拉蒂</li>
					<li class="item">马自达</li>
					<li class="item">梅赛德斯-奔驰</li>
					<li class="item">迷你</li>								
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">N</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">纳智捷</li>
					<li class="item">南京菲亚特</li>
					<li class="item">南京依维柯</li>
					<li class="item">南汽新雅途</li>							
					
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">O</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">欧宝</li>
					<li class="item">讴歌</li>						
					
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">Q</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">奇瑞</li>
					<li class="item">奇瑞捷豹</li>
					<li class="item">起亚</li>
					<li class="item">启辰</li>
					<li class="item">青年莲花</li>	
					<li class="item">全球鹰</li>								
				
					
				</ul>
			</div>
			
			
			
			
			<div class="bg000" id="disb"><p class = "disfont">R</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">日产</li>
					<li class="item">荣威</li>
					<li class="item">瑞麒</li>
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">S</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">萨博</li>
					<li class="item">三菱</li>
					<li class="item">上海大众</li>
					<li class="item">上汽大众</li>
					<li class="item">上汽通用五菱</li>						
					<li class="item">上汽通用五菱雪佛兰</li>
					<li class="item">上汽通用雪佛兰</li>
					<li class="item">双环红星</li>
					<li class="item">双龙</li>
					<li class="item">斯巴鲁</li>
					<li class="item">斯柯达</li>	
					<li class="item">思铭</li>
					<li class="item">四川一汽丰田</li>							
					<li class="item">&nbsp;</li>					 
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">T</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">特斯拉</li>
					<li class="item">天津达路</li>
					<li class="item">天津一汽</li>
					<li class="item">天津一汽丰田</li>
					<li class="item">天汽美亚</li>	
					<li class="item">通家福</li>								
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">W</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">威麟</li>
					<li class="item">潍柴汽车</li>
					<li class="item">沃尔沃</li>
					<li class="item">沃尔沃亚太</li>							
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">X</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">西雅特</li>
					<li class="item">夏利</li>
					<li class="item">现代</li>
					<li class="item">新凯</li>
					<li class="item">雪佛兰</li>
					<li class="item">雪铁龙</li>								
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">Y</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">野马</li>
					<li class="item">一汽奥迪</li>
					<li class="item">一汽奔腾</li>
					<li class="item">一汽大发</li>
					<li class="item">一汽大众</li>						
					<li class="item">一汽红旗</li>
					<li class="item">一汽华利</li>
					<li class="item">一汽吉林</li>
					<li class="item">一汽马自达</li>
					<li class="item">一汽欧朗</li>
					<li class="item">英菲尼迪</li>	
					<li class="item">英伦</li>										 
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">Z</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">郑州东风</li>
					<li class="item">郑州海马</li>
					<li class="item">郑州日产</li>
					<li class="item">中顺</li>
					<li class="item">中兴</li>
					<li class="item">众泰</li>	
					<li class="item">&nbsp;</li>
					<li class="item">&nbsp;</li>
					<li class="item1">&nbsp;</li>
					<li class="item1">&nbsp;</li>							
					
				</ul>
			</div>

		
		</div>
		
			
		<section class="infoList product" id = "searchtypein" style="display: none;">
        	
        	<div class="infoSec pl pr bgColor borTop1 borBot1">
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车辆品牌</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qbrand" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车款</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qfamily" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">排气量</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qenginedesc" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">手动自动</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qgearboxtype" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车辆型号</dt>
				        <dd class="w65 l-float txtR hasArrow">
				        <p value="0" class="zhanshi">请选择</p>
					       <!--  <select id="qvehicle" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>  -->
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			       
	           </div>
	      </section>
		
	</div>
    
    <!--加载动画-->
    <div class="loading">
        <div class="sk-circle">
         <img alt="" class="img" src="../../images/car/guodu.gif">
        </div>
    </div>
    <!--弹窗-->
    <div class="mask" >
        <div class="pop repeat">
            <span>失败提示</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
    <div class="xinghao" style="display: none;">
    	<ul id="qvehicle">
    	</ul>
    	<div class="dianji1">
			<div class="quxiao yanse">取消</div>
			<div class="quding yanse">确定</div>
		</div>
    </div>
</body>
<script>

    var vehicleId = document.querySelector('#vehicleId');
    var select_vehicleId = document.querySelector('#select_vehicleId');

    vehicleId.addEventListener('click', function () {

        var bankId = vehicleId.dataset['id'];
        var bankName = vehicleId.dataset['value'];

        var bankSelect = new IosSelect(1,
            [vehicleCodeIdData],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_vehicleId.value = selectOneObj.id;
                    vehicleId.innerHTML = selectOneObj.value;
                    vehicleId.dataset['id'] = selectOneObj.id;
                    vehicleId.dataset['value'] = selectOneObj.value;
                    $("#vehicleId_v").val(selectOneObj.id);
                }
            });
    });

    var seats = document.querySelector('#seats');
    var select_seats = document.querySelector('#select_seats');

    seats.addEventListener('click', function () {

        var bankId = seats.dataset['id'];
        var bankName = seats.dataset['value'];

        var bankSelect = new IosSelect(1,
            [seatsData],
            {
                container: '.container',
                title: '',
                headerHeight: 50,itemHeight: 36,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    select_seats.value = selectOneObj.id;
                    seats.innerHTML = selectOneObj.value;
                    seats.dataset['id'] = selectOneObj.id;
                    seats.dataset['value'] = selectOneObj.value;
                    $("#seats_v").val(selectOneObj.id);
                }
            });
    });
</script>
</html>