<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalab.el.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2><b>1. 세션에 저장된 값 확인</b></h2>
		${sessionScope.user.id}<br>
		${sessionScope.user.name}
</body>
</html>