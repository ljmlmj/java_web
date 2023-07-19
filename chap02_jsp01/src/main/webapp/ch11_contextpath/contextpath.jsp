<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>웹 어플리케이션 경로 구하기</title>
</head>
<body>
	<h2>현재 jsp 페이지가 속한 웹 어플리케이션의 컨텍스트경로(진입점)</h2>
	<br>
	<br>
	웹 어플리케이션 컨텍스트 경로(getContextPath)<br>
	: <%= request.getContextPath() %><br>
	<br>
	웹 어플리케이션 경로 + 파일경로(getRequestURI)<br>
	: <%= request.getRequestURI() %><br>
	<br>
	
</body>
</html>