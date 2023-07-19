<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>
	<h1 style="text-align: center">환영합니다.</h1>
	
	${sessionScope.member.id }님 환영합니다.<br>
	
	<a href="${pageContext.request.contextPath }/sessionLogout">로그아웃</a>
</body>
</html>