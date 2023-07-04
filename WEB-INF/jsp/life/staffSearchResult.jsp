<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${keywords}</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="full-screen" content="yes">
    <meta name="x5-fullscreen" content="true">
    <link rel="stylesheet" href="../../css/user/staff/public.css?v=20180716" />
    <link rel="stylesheet" href="../../css/user/staff/product_list.css?v=20180716" />
    <link rel="stylesheet" type="text/css" href="../../css/user/staff/dropload.css" />
    <link rel="stylesheet" href="../../css/hengqin/index.css?v=20180720_01"/>
</head>
<body>
<div class="main d_footback proListBox">
    <c:if test="${empty searchList}">
        <img src="./images/life/searchNoResult.png" / style="width:7rem;margin:2.55rem auto;display:block">
    </c:if>
    <div class="tabbody js_tabbody">
        <div class="tabCon js_live_tablist cur">
            <br>
            <ul>
                <c:forEach items="${searchList}" var="risk">
                    <li class="row d_boxSz">
                        <a class="d_boxSz" href="${risk.url}">
                            <div class="title">${risk.title}</div>
                            <p class="explain">${risk.description}</p>
                            <div class="pricebox"><p class="price"><span>${risk.prem}</span>元/年</p>起</div>
                            <img class="icon_img" src="${risk.logo}">
                        </a>
                    </li>
                </c:forEach>
            </ul>
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