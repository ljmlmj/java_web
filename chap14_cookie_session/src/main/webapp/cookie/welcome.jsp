<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>
	<h1 style="text-align: center">환영합니다.</h1>
	
	${cookie.id.value }님 환영합니다.<br>
	
	<a href="${contextPath}/cookieLogout">로그아웃</a>
</body>
</html>