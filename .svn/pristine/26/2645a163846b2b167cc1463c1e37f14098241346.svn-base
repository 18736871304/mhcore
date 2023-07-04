<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<title>${keywords}</title>
<script src="./js/jquery/jquery-3.6.0.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=20180227"></script>
<script src="./js/common/insuCommon.js"></script>
<link rel="stylesheet" href="./css/hengqin/index.css?v=180425">
</head>
<body>
	<div class="mainIndex_wrapper">
		<c:if test="${empty searchList}">
		<img src="./images/life/searchNoResult.png" / style="width:7rem;margin:2.55rem auto;display:block">
		</c:if>
		<div class="mainOther mainProduct" style="margin:0">
			<div class="contentDesc" id="etlist">
				<c:forEach items="${searchList}" var="risk">
				<div class="contentDesc_item">
					<a href="${risk.url}"><img
						src="${risk.imgsrc}">
					<div class="otherTitle">${risk.title}</div>
						<div class="otherDesc">${risk.description}</div>
						<div class="otherPic">
							<div class="left">
								<span class="Price">${risk.prem}</span><span>元/年</span>起
							</div>
							<div class="right">
								<img src="${risk.inslogo}">
							</div>
						</div></a>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="main_footer">
			<img src="./images/life/mainFooter.png" />
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>