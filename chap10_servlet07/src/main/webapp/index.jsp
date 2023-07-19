<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>여기는 index.jsp</h2>
	<br>
	<a href="${pageContext.request.contextPath}/list">
		회원 목록 보기 서블릿 호출
	</a><br>
	<a href="${contextPath}/insertForm">회원 등록
	</a>
</body>
</html>