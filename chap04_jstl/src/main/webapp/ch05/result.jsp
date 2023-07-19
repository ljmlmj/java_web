<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과창</title>
</head>
<body>
	<h3>c:out을 escapeXml="true" 처리로
		cross-site scripting (XSS) 공격 예방</h3>
		
		<br>
		<br>
		<c:if test="${not empty param.id}">
		<%-- ${param.id} 님 환영합니다 --%>
		<c:out value="${param.id }" escapeXml="true" />님 환영합니다.
		</c:if>
</body>
</html>