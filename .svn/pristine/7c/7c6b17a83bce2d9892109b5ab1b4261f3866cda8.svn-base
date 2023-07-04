<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="net.sf.json.*" %>
<%
	JSONArray tjson = (JSONArray)request.getAttribute("mainmenu");
	
	System.out.println(tjson);
	
	PrintWriter pw = response.getWriter();
	
	pw.print(tjson);
	
	pw.close();
%>