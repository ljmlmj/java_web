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
						<td><a href="${contextPath}/view?id=${member.id }">이어서
								${member.id }</a></td>
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