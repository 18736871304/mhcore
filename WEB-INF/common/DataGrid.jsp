<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="net.sf.json.*" %>
<%@ page import="com.insure.common.tools.JsonDateValueProcessor" %>
<%
	Map<String, Object> tjsonMap = (Map<String, Object>)request.getAttribute("datalist");
	//System.out.println(tjsonMap);
	JSONObject jsonObjb = new JSONObject();
	PrintWriter pw = response.getWriter();
	
	JsonConfig jsonConfig = new JsonConfig();
	jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());

	
	//System.out.println(jsonObjb.fromObject(tjsonMap,jsonConfig));
	
	pw.print(jsonObjb.fromObject(tjsonMap,jsonConfig));
	pw.close();
%>