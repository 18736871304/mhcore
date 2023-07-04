<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="net.sf.json.*" %>
<%@ page import="com.insure.common.bo.iams_messageBo" %>
<%
	iams_messageBo tiams_messageBo = (iams_messageBo)request.getAttribute("message");
	
	//System.out.println("come here");
	PrintWriter pw = response.getWriter();
	if(tiams_messageBo==null)
	{
		pw.print("{}");
	}
	else
	{
		JSONObject jsonObjb = JSONObject.fromObject(tiams_messageBo);
		//System.out.println(jsonObjb.toString());
		pw.print(jsonObjb.toString());
	}
	
	pw.close();
%>