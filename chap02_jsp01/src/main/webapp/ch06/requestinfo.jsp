<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
	
	<!-- jsp 페이지가 만들어지면 기본적으로 제공되는 기본객체
		- 클라이언트가 보내온 파라미터를 읽어올 수 있다. -->
	클라이언트IP = <%= request.getRemoteAddr() %> <br>
	요청 URI = <%= request.getRequestURI() %> <br>
	컨텍스트 경로 = <%= request.getContextPath() %> <br>
	서버이름 = <%= request.getServerName() %> <br>
	서버포트 = <%= request.getServerPort() %> <br>
</body>
</html>