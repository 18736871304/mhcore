<%@page import="java.util.*"%> 
<%@page import="java.io.*"%> 
<%@page import="java.net.*"%> 
<% 
	Map<String, String> tjsonMap = (Map<String, String>)request.getAttribute("fileinfo");
	
	String filename = tjsonMap.get("filename");
	
	String dowanloadname = tjsonMap.get("dowanloadname");
		
	String filepath = tjsonMap.get("filepath");
		
    //response.setContentType("application/msnotepad"); 
	response.setHeader("Content-disposition","attachment; filename="+java.net.URLEncoder.encode(dowanloadname, "UTF-8")); 
    
	BufferedInputStream bis = null;
	BufferedOutputStream bos = null;
	try
	{
		bis = new BufferedInputStream(new FileInputStream(filepath+filename));
		
		out.clear(); 
		out = pageContext.pushBody(); 
		
		bos = new BufferedOutputStream(response.getOutputStream()); 
 
		byte[] buff = new byte[2048]; 
		int bytesRead;
 
		while(-1 != (bytesRead = bis.read(buff, 0, buff.length)))
		{ 
			bos.write(buff,0,bytesRead); 
		}
	}
	catch(final IOException e)
	{ 
		//System.out.println ( "&sup3;&ouml;&Iuml;&Ouml;IOException." + e ); 
	} 
	finally 
	{ 
		if (bis != null)
		{
			bis.close();
		}
		if (bos != null)
		{
			bos.close();
		}
	}
%>