<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 읽기</title>
</head>
<body>
	<h2>application 기본 객체 사용하여 자원(파일,이미지 등) 읽기</h2>
	<br>
	<br>
	<%
	/* 웹 어플리케이션 내에서의 파일의 상대 경로 */
	String resourcePath = "/message/notice.txt";
	%>
	자원(파일)의 실제 경로:<br>
	<%= application.getRealPath(resourcePath) %>
	<br>
	------------------<br>
	<%= resourcePath %>의 내용<br>
	------------------<br>
	<%
		char[] buff = new char[128];
		int len = -1;
		
		try(InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath), "UTF-8")) {
			while ((len = br.read(buff)) != -1) {
				out.print(new String(buff, 0, len));
			}
		} catch(IOException ex) {
			out.println("예외 발생 : " + ex.getMessage());
		}
	%>

</body>
</html>