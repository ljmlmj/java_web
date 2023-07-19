<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>여기는 index.jsp</h2>
	<br>
	<h3>1. 쿠키 로그인</h3>
	
	<a href="${pageContext.request.contextPath }/cookieLogin">
	1) 쿠키 로그인</a><br>
	<a href="<c:url value='/cookieLogin' />">
	2) 쿠키 로그인 (c:url 사용)</a><br>
	
	<a href="${pageContext.request.contextPath }/cookieLogout">
	3) 쿠키 로그아웃</a><br><br>
	
	<h3>2. 세션 로그인</h3>
	
	<a href="${pageContext.request.contextPath }/sessionLogin">
	1) 세션 로그인</a><br>
	<a href="<c:url value='/sessionLogin' />">
	2) 세션 로그인 (c:url 사용)</a><br><br>
	<a href="${pageContext.request.contextPath }/sessionLogout">
	3) 세션 로그아웃</a><br><br>
	
	<a href="${pageContext.request.contextPath }/getCookie.jsp">
	3. 쿠키 조회 페이지 이동</a>>
	
	</body>
</html>