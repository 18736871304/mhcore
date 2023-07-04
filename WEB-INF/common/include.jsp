<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.insure.common.vo.iams_uservo" %>
<link rel="stylesheet" type="text/css" href="js/jquery/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/jquery/demo/demo.css">
<link rel="stylesheet" type="text/css" href="css/common.css?v=20200719">
<!-- <link rel="stylesheet" type="text/css" href="css/ajaxfileupload.css"> -->
<script type="text/javascript" src="js/jquery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/common/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/common/Component.js?v=20230501"></script>
<%
	iams_uservo oprVo  = (iams_uservo)request.getSession().getAttribute("iamsuserinfo");
%>

<div id = 'div1' class = 'div1' display:none>
</div>

<div id = 'div2' class = 'div2' display:none>
	<img alt="" src="images/loading.gif" id="kaptchaImage" /><p>正在努力执行中，请稍后......</p>
</div>

<html>
<input type="hidden" name="iamsopr" id="iamsopr" value = '<%=oprVo.getIamsOpr()%>'>
<input type="hidden" name="iamsoprname" id=iamsoprname value = '<%=oprVo.getIamsOprName()%>'>
<input type="hidden" name="iamsoprorgan" id="iamsoprorgan" value = '<%=oprVo.getIamsOprOrgan()%>'>
<input type="hidden" name="iamsorgangrade" id="iamsorgangrade" value = '<%=oprVo.getIamsOrganGrade()%>'>
</html>