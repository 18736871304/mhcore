<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>我的订单</title>
    <script src="../../js/jquery/jquery-3.6.0.min.js"></script>
    <script src="../../js/common/insuCommon.js"></script>
<style type="text/css">
body{font-size: 0.8rem;margin: 0;background-color: #f3f3f3;width: 100%;}
p{-webkit-margin-before: 0em; -webkit-margin-after: 0em; display: inline-block;}
hr{border-color: #fcfcfc}
input{
	width: 100%;
    outline: none;
    border: 1px solid #cdd4da;
    border-radius: 0.2rem;
    line-height: 1.3rem;
}
.header{
	background-color: #df3331;
	padding: 10px 0px 10px 15px;
	color: #fff;
	font-size: 0.9rem;
}
.menu{
	background-color: #fff;
	padding: 0.4rem;
    text-align: center;
	margin-bottom: 0.6rem;
}
.menu input{
	background: url(../images/life/search.png) no-repeat;
    background-position: 0.2rem 0.1rem;
    padding-left: 1.7rem;
    width: 91%;
}
.menu ul{-webkit-padding-start: 0px;}
.menu li{
    display: inline-block;
    padding: 0rem 0.1rem;
}
.detail{
	background-color: #fff;    
	padding: 0.7rem 0.7rem 2.7rem;
    color: #757575;
	margin-bottom: 0.6rem;
}
.detail span{
	line-height: 1.4rem;
}
.check{
	color: #d13149;
    border: 1px solid #d13149;
    border-radius: 0.2rem;
	background: #fff;
	padding: 0.2rem;
	width: 23%;
    text-align: center;
    display: inline-block;
    float: right;
    font-size: 0.9rem;
}
.m1{

}
/* navbar bg color and bottom edge*/
  .navbar-default {
      background-color: #fff;
      margin-bottom: 0px;
  }
  /* links text/hover & background/hover colors */
  .navbar-default .navbar-nav > li > a:hover,
  .navbar-default .navbar-nav > li > a:focus {
    border-bottom: solid #e51e23 1px;
    color: #df3331;    
    padding-bottom: 1.1rem;
  }
  /* links text/CURRENT & background/CURRENT colors */
  .navbar-default .navbar-nav > .active > a, 
  .navbar-default .navbar-nav > .active > a:hover, 
  .navbar-default .navbar-nav > .active > a:focus {
    border-bottom: solid #e51e23 1px;
    color: #df3331;    
    padding-bottom: 1.1rem;
  }
</style>
</head>
<body>
<!--main page-->
    <div class="header">
    	<p>我的订单</p>
    </div>
    
    <!-- 
    <div class="menu">
    	<input type="text" name="search" placeholder="搜索">
	
		<nav class="navbar navbar-default">
	  
	      <div class="collapse navbar-collapse" id="myNavbar">
	         
	         	<ul class="nav navbar-nav">
			    	<li class="m1"><a>全部</a></li>
			    	<li class="m2"><a>待支付</a></li>
			    	<li class="m3"><a>已出单</a></li>
			    	<li class="m4"><a>已取消</a></li>
			    	<li class="m5"><a>带续保</a></li>
			    	<li class="m6"><a>已预约</a></li>
			    	<li class="m7"><a>暂存单</a></li>
	          	</ul>
	      </div>
		</nav>

    </div>
     -->
    <c:forEach items="${contList}" var="cont">
    <div class="detail">
    	<div class=dtit>
	    	<span>${cont.makedate}</span>
	    	<span style="float: right;">${cont.state}</span>
    	</div>
    	<hr>
		<h3>${cont.riskname}</h3>
    	<dl>
	    	<dt>
	    		<p>姓名：</p>
	    		<span>${cont.appname}</span>
	    	</dt>
	    	<dt>
	    		<p>保险期限：</p>
	    		<span>${cont.insuyear}</span>
	    	</dt>
	    	<dt>
	    		<p>保费：</p>
	    		<span>${cont.sumprem}</span>
	    	</dt>
	    </dl>
    	<hr>
    	<div class="check" onclick = "querydetail('${cont.orderid}','${cont.insorgancode}','${cont.riskcode }')">查看详情</div>
    </div>
    </c:forEach>
</body>
<script type="text/javascript"> 

function querydetail(orderid,insorgancode,riskcode)
{
		window.location.href = "../../life/common/common_queryDetail.do?orderNo="+orderid+"&insorgancode="+insorgancode;
}

</script> 
</html>