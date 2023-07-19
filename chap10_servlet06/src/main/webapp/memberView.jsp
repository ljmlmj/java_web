<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!-- 본 어플리케이션의 컨텍스트를 경로를 갖고와서 변수에 저장 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
	<h3>회원 정보 상세보기</h3>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${requestScope.member.id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${requestScope.member.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${requestScope.member.email }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${requestScope.member.joinDate }</td>
		</tr>
	</table>
</body>
	</html>