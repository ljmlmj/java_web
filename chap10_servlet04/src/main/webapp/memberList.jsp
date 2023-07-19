<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${empty memberList }">
		회원이 존재하지 않습니다.
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<th>순번</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="member" items="${memberList }" varStatus="idx">
				<tr>
					<td>${idx.count }</td>
					<td>${member.id }</td>
					<td>${member.pwd }</td>
					<td>${member.name }</td>
					<td>${member.email }</td>
					<td>${member.joinDate }</td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>
</body>
</html>