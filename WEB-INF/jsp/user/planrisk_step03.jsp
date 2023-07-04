<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <title></title>
   	<link rel="stylesheet" type="text/css" href="../../css/planrisk/style.css?v=2019">
    <link rel="stylesheet" type="text/css" href="../../css/planrisk/sure.css?v=2019">
    <script type="text/javascript" src="../../js/planrisk/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../../js/planrisk/flexible.js"></script>
    <script type="text/javascript" src="../../js/planrisk/mobiscroll-2.13.2.full.min.js"></script>
    <script type="text/javascript" src="../../js/planrisk/iscroll.js"></script>
    <script type="text/javascript" src="../../js/planrisk/iosSelect.js"></script>
    <script type="text/javascript" src="../../js/planrisk/checkFn.js"></script>
    <script type="text/javascript" src="../../js/planrisk/sure.js"></script>
</head>
<body>
<div class="wrap">
<div class="henggang"></div>
    <div class="bigbox1">
        <p class="can_p fs36">被保险人信息</p>
        <ul class="clearfix list5">
            <li class="fl juli1"><span class="span1">年龄</span></br><span class="span2">${age }</span></li>
            <li class="fl juli2"><span class="span1">性别</span></br><span class="span2">${sex }</span></li>
            <%-- <li class="fl juli2"><span class="span1">缴费期限</span></br><span class="span2">${payendyear }年</span></li> --%>
            <li class="fl juli3"><span class="span1">基本保额</span></br><span class="span2">${amnt}万</span></li>
        </ul>
    </div>
    <div class="henggang"></div>
    <c:forEach items="${planriskList}" var="planrisk" varStatus="i">
    <div class="bigbox1" style="background: #ffffff;">
        <p class="can_p fs36">
        <c:if test="${i.index==0 }">产品一</c:if>
        <c:if test="${i.index==1 }">产品二</c:if>
        <c:if test="${i.index==2 }">产品三</c:if>
        <c:if test="${i.index==3 }">产品四</c:if>
        </p>
	        <table class="my_libiao1" border="0">
				<tr class="clearfix libiao">
				  	<th class="fs34 my_color1">产品名称</th>					    
				    <th class="my_input1 fs34">${planrisk.riskname }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">保险公司</th>					    
				    <th class="my_input1 fs34">${planrisk.insorganname }</th>			        				    
				</tr>
				
				
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">承保年龄</th>					    
				    <th class="my_input1 fs34">${planrisk.insuredAge }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">保障期限</th>					    
				    <th class="my_input1 fs34">${planrisk.insureyearname }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">缴费期限</th>					    
				    <th class="my_input1 fs34">${planrisk.payendyearname }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">重疾种类</th>					    
				    <th class="my_input1 fs34">${planrisk.zjtype }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">重疾保额</th>					    
				    <th class="my_input1 fs34">${planrisk.zjamnt }万</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">重疾赔付次数</th>					    
				    <th class="my_input1 fs34">${planrisk.zjpfnumber }</th>			        				    
				</tr>	
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">轻症种类</th>					    
				    <th class="my_input1 fs34">${planrisk.qjtype }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">轻症保额</th>					    
				    <th class="my_input1 fs34">${planrisk.qjamnt }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">轻症赔付次数</th>					    
				    <th class="my_input1 fs34">${planrisk.qjpfnumber }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">被保人轻症豁免</th>					    
				    <th class="my_input1 fs34">${planrisk.hm }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">身故保障</th>					    
				    <th class="my_input1 fs34">${planrisk.deathguarantee }</th>			        				    
				</tr>
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">保单贷款</th>					    
				    <th class="my_input1 fs34">${planrisk.policyloan }</th>			        				    
				</tr>	
				<tr class="clearfix libiao ">
				  	<th class="fs34 my_color1">其他</th>					    
				    <th class="my_input1 fs34">${planrisk.other }</th>
				    <span class="errorMsg"></span>			        				    
				</tr>
				<tr class="clearfix libiao "  style="border: none;">
				  	<th class="fs34 my_color1">保费</th>					    
				    <th class="my_input1 fs34">${planrisk.prem }元</th>	
				    <span class="errorMsg"></span>		        				    
				</tr>					  
			</table>  
    </div>
    <div class="henggang"></div>
    </c:forEach>
     <div class=" kongbai" style="width: 100%;height: 1.36rem;"></div>
    <div class="queding fs36 sure_color">生成计划书</div>
</div>
<input type="text" style="display:none" class="personInfo" id="userplanid" value="${userplanid}">
<script>
	$(".sure_color").on("click", function () {
		window.location.href = "./planrisk_step04.do?userplanid="+$("#userplanid").val();
	})

</script>
</body>
</html>
