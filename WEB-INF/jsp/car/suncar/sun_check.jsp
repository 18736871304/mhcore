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
		.my_ys{
			width: 100%;
    		height: 2.7rem;
		}
		.info .infoList .my_p{
		    background-color: #f0efef;
		    margin: 0;
		    font-size: 0.8999rem;
		    line-height: 2.58rem;
		    padding-left: 0.75rem;
		}
	</style>
<script type="text/javascript">

	$(function ()
	{
		$("#sureToSave").on("click", function ()
		{
			$(".loading").show();
			fm.submit();
		});
	});

</script>
</head>
<body style="">
	<header class="header w100 pl bgColor">
        <span>阳光车险</span>
        <br/>
        <span>本产品由阳光财险有限公司承保</span>
        <img src="../../images/car/yangguang/yangguang.png"/>
    </header>
    <article class="info" style="margin-top: 4.2rem;">
        <form id="fm" name="fm" method="post" action = "../../car/sunCar/carCheck.do">
        	<input type="hidden" class="personInfo" id="productNo" value="suncar">
			<input type="text" hidden="hidden" class="personInfo" id="orderid" name="orderid" value="${orderid}">
			<input type="text" hidden="hidden" id="renewFlag" name="renewFlag" value="${reinsuranceCheckCode.renewFlag.value}">
			<input type="text" hidden="hidden" id="renewFlagCI" name="renewFlagCI" value="${reinsuranceCheckCode.renewFlagCI.value}">
            <section class="infoList product yingchang">
            	<p class="infoSec my_p">商业险验证码</p>
				<div class="infoSec pl pr bgColor borTop1 borBot1 my_ys">			
						<c:if test="${reinsuranceCheckCode.renewFlag.value == 1}">
							<input type="text" class="textfield txtR personInfo" id="checkNo" name="checkNo" value="" placeholder="请输入验证码" style="width: 62%;float: left;margin-top: 0.9rem;">
							<img src="data:image/png;base64,${reinsuranceCheckCode.checkCode.value}" style="position: absolute;top: 0.56rem;right: 0.75rem;">
						</c:if>					
				</div>
				<p class="infoSec my_p">交强险验证码</p>
				<div class="infoSec pl pr bgColor borTop1 borBot1 my_ys">			
						<c:if test="${reinsuranceCheckCode.renewFlagCI.value == 1}">
							<input type="text" class="textfield txtR personInfo" id="checkNoCI" name="checkNoCI" value="" placeholder="请输入验证码" style="width: 62%;float: left;line-height: 1.5rem;">
							<img src="data:image/png;base64,${reinsuranceCheckCode.checkCodeCI.value}">
						</c:if>			
			
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
     <!--加载动画-->
    <div class="loading">
        <div class="sk-circle">
         <img alt="" class="img" src="../../images/car/guodu.gif">           
        </div>
    </div>
</body>
</html>