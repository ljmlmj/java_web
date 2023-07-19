<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<!-- 짝수/홀수 항상 변수 선언 -->
		<c:set var="sumEven" value="0" scope="page" />
		<c:set var="sumOdd" value="0" scope="page" />
		
		<!-- 반복문 돌리면서 홀/짝 구분 -->
		<c:forEach var="i" begin="1" end="10">
			<c:choose>
				<c:when test="${i % 2 == 0}">
					<c:set var="sumEven" value="${sumEven + i}" scope="page" />
					<tr>
						<td>${i}짝수입니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:set var="sumOdd" value="${sumOdd + i}" scope="page" />
					<tr>
						<td>${i}홀수입니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
	1. 짝수합 : ${sumEven }<br>
	2. 홀수합 : ${sumOdd }
</body>
</html>