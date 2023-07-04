<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
   	<link rel="stylesheet" type="text/css" href="../../css/planrisk/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/planrisk/sure.css?v=1019">
    <script type="text/javascript" src="../../js/planrisk/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../../js/planrisk/flexible.js"></script>
    <script type="text/javascript" src="../../js/planrisk/mobiscroll-2.13.2.full.min.js"></script>
    <script type="text/javascript" src="../../js/planrisk/iscroll.js"></script>
    <script type="text/javascript" src="../../js/planrisk/iosSelect.js"></script>
    <script type="text/javascript" src="../../js/planrisk/checkFn.js"></script>
    <script type="text/javascript" src="../../js/planrisk/sure.js?v=1018"></script>
</head>
<style>
    body,html{
        background: #ffffff;
        height: 100%;
    }
</style>

<body>

<div class="wrap">
   <div class="banner"></div>
    <div class="henggang"></div>
   <div class="bigbox">
        <p class="can_p fs34">被保险人信息</p>
        <ul class="clearfix list5">
            <li class="fl juli1"><span class="span1">年龄</span><br><span class="span2">${age }</span></li>
            <li class="fl juli2"><span class="span1">性别</span><br><span class="span2">${sex }</span></li>
            <%-- <li class="fl juli2"><span class="span1">缴费期限</span><br><span class="span2">${payendyear }</span></li> --%>
            <li class="fl juli3"><span class="span1">基本保额</span><br><span class="span2">${amnt}</span></li>
        </ul>
    </div>
    <div class="xiangqing">
    <p class="can_p1 fs34">产品推荐如下</p>
        <div class="small_box">       
	        <table border="0">
			  <tr class="list1 ">
			    <th class="">产品名称</th>
			    <c:forEach items="${planriskList}" var="planrisk" varStatus="i">
			    	<th class="">${planrisk.riskname }</th>
	        	</c:forEach>			    
			  </tr>
			<tr class="list2 ">
			    <th class="">产品名称</th>
			    <th class="">${planriskList[0].insorganname }</th>
			    <th class="">${planriskList[1].insorganname }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].insorganname }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].insorganname }</th>
			    <th class="">${planriskList[3].insorganname }</th>
	            </c:if>			    			    
			  </tr>
			  <tr class="list2 ">
			    <th class="">承保年龄</th>
			    <th class="">${planriskList[0].insuredAge }</th>
			    <th class="">${planriskList[1].insuredAge }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].insuredAge }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].insuredAge }</th>
			    <th class="">${planriskList[3].insuredAge }</th>
	            </c:if>			    			    
			  </tr>	
			   <tr class="list2 ">
			    <th class="">保障期限</th>
			    <th class="">${planriskList[0].insureyearname }</th>
			    <th class="">${planriskList[1].insureyearname }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].insureyearname }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].insureyearname }</th>
			    <th class="">${planriskList[3].insureyearname }</th>
	            </c:if>			    			    
			  </tr>
			  <tr class="list2 ">
			    <th class="">缴费期限</th>
			    <th class="">${planriskList[0].payendyearname }</th>
			    <th class="">${planriskList[1].payendyearname }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].payendyearname }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].payendyearname }</th>
			    <th class="">${planriskList[3].payendyearname }</th>
	            </c:if>			    			    
			  </tr>		
			   <tr class="list2 ">
			    <th class="">重疾类型</th>
			    <th class="">${planriskList[0].zjtype }</th>
			    <th class="">${planriskList[1].zjtype }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].zjtype }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].zjtype }</th>
			    <th class="">${planriskList[3].zjtype }</th>
	            </c:if>			    			    
			  </tr>
			  <tr class="list2 ">
			    <th class="">重疾保额</th>
			    <th class="">${planriskList[0].zjamnt }万</th>
			    <th class="">${planriskList[1].zjamnt }万</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].zjamnt }万</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].zjamnt }万</th>
			    <th class="">${planriskList[3].zjamnt }万</th>
	            </c:if>			    			    
			  </tr>
			  <tr class="list2 ">
			    <th class="">重疾赔付次数</th>
			    <th class="">${planriskList[0].zjpfnumber }</th>
			    <th class="">${planriskList[1].zjpfnumber }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].zjpfnumber }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].zjpfnumber }</th>
			    <th class="">${planriskList[3].zjpfnumber }</th>
	            </c:if>			    			    
			  </tr>
			   <tr class="list2 ">
			    <th class="">轻症类型</th>
			    <th class="">${planriskList[0].qjtype }</th>
			    <th class="">${planriskList[1].qjtype }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].qjtype }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].qjtype }</th>
			    <th class="">${planriskList[3].qjtype }</th>
	            </c:if>			    			    
			  </tr>
			     <tr class="list2 ">
			    <th class="">轻症保额</th>
			    <th class="">${planriskList[0].qjamnt }</th>
			    <th class="">${planriskList[1].qjamnt }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].qjamnt }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].qjamnt }</th>
			    <th class="">${planriskList[3].qjamnt }</th>
	            </c:if>			    			    
			  </tr>
			    <tr class="list2 ">
			    <th class="">轻疾赔付次数</th>
			    <th class="">${planriskList[0].qjpfnumber }</th>
			    <th class="">${planriskList[1].qjpfnumber }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].qjpfnumber }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].qjpfnumber }</th>
			    <th class="">${planriskList[3].qjpfnumber }</th>
	            </c:if>			    			    
			  </tr>
			    <tr class="list2 ">
			    <th class="">被保人轻疾豁免</th>
			    <th class="">${planriskList[0].hm }</th>
			    <th class="">${planriskList[1].hm }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].hm }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].hm }</th>
			    <th class="">${planriskList[3].hm }</th>
	            </c:if>			    			    
			  </tr>
			   <tr class="list2 ">
			    <th class="">身故保障</th>
			    <th class="">${planriskList[0].deathguarantee }</th>
			    <th class="">${planriskList[1].deathguarantee }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].deathguarantee }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].deathguarantee }</th>
			    <th class="">${planriskList[3].deathguarantee }</th>
	            </c:if>			    			    
			  </tr>
			   <tr class="list4 ">
			    <th class="">其他</th>
			    <th class="">${planriskList[0].other }</th>
			    <th class="">${planriskList[1].other }</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].other }</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].other }</th>
			    <th class="">${planriskList[3].other }</th>
	            </c:if>			    			    
			  </tr>
			   <tr class="list2 ">
			    <th class="">保费</th>
			    <th class="">${planriskList[0].prem}元</th>
			    <th class="">${planriskList[1].prem }元</th>
			    <c:if test="${fn:length(planriskList)==3}">
			    <th class="">${planriskList[2].prem }元</th>
	            </c:if>
			    <c:if test="${fn:length(planriskList)==4}">
	            <th class="">${planriskList[2].prem }元</th>
			    <th class="">${planriskList[3].prem }元</th>
	            </c:if>			    			    
			  </tr>
			</table>
        </div>
    </div>
</div>
<script>
	if(${fn:length(planriskList) == 2}){
		$(".list1 li").css({"width":"3.06rem","display":"block"});
		$(".list2 li").css({"width":"3.06rem","display":"block"});
		$(".list4 li").css({"width":"3.06rem","display":"block"});
		
		$(".list1 th").css({"width":"3.06rem"});
		$(".list2 th").css({"width":"3.06rem"});
		$(".list4 th").css({"width":"3.06rem"});
	}
	if(${fn:length(planriskList) == 3}){
		$(".list1 li").css({"width":"2.3rem","display":"block"});
		$(".list2 li").css({"width":"2.3rem","display":"block"});
		$(".list4 li").css({"width":"2.3rem","display":"block"});
		
		$(".list1 th").css({"width":"2.3rem"});
		$(".list2 th").css({"width":"2.3rem"});
		$(".list4 th").css({"width":"2.3rem"});
	}
	if(${fn:length(planriskList) == 4}){
		$(".list1 li").css({"width":"1.81rem"});
		$(".list2 li").css({"width":"1.81rem"});
		$(".list4 li").css({"width":"1.81rem"});
		$(".list1 th").css({"width":"1.81rem"});
		$(".list2 th").css({"width":"1.81rem"});
		$(".list4 th").css({"width":"1.81rem"});
	}

</script>
</body>
</html>
