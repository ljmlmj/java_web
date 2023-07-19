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
<title>이미지가 들어간 게시물 목록</title>
</head>
<body>
	<ul>
		<li>
			<span>선택하기</span>
			<span style='margin-left: 50px'>이미지 </span>
			<span>이미지 이름</span>
		</li>
		<c:forEach var="i" begin="1" end="9" step="1">
			<li>
				<a href='#'>
					<input name='chk${i}' type='checkbox' />
				</a>
				<a href='#' sytle='margin-left: 50px'>
					<img src='img/duke.png' width='90' height='90' alt='' />
				</a>
				<a href='#'>
					<strong>이미지 이름: 듀크${i}</strong>
				</a>
		</c:forEach>
	</ul>
</body>
</html>