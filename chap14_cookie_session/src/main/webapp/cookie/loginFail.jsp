<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
	<h1 style="text-align: center;">로그인에 실패했습니다.</h1>
	
	<a href="${contextPath}/cookieLogin">로그인 페이지</a>
</body>
</html>