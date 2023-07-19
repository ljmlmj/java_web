<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:set 변수 재선언</title>
</head>
<body>

	<h3>c:set 변수가 재선언시 기존 값을 덮어씀</h3>
	
	<!-- 변수 설정 -->
	<c:set var="id" value="hong" scope="page"></c:set>
	
	<!-- 같은 이름으로 다시 설정될 경우 기존 값을 덮어쓴다. -->
	<c:set var="id" value="hong1234" scope="page" />
	
	<br>
	<a href="${pageContext.request.contextPath}/ch02_cset/csetRev2.jsp?id=${id}">페이지 이동</a>
</body>
</html>