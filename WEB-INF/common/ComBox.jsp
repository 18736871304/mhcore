<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="net.sf.json.*" %>
<%
	List<?> tCombox = (List<?>)request.getAttribute("comboxdata");

	JSONArray tt = new JSONArray();

	tt.addAll(tCombox);

	PrintWriter pw = response.getWriter();
	
	//System.out.println(tt);
	
	pw.print(tt);
	pw.close();
%>