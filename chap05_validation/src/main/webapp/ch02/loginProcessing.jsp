<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과창</title>
</head>
<body>
	<h3>중첩 if문</h3>
	
	
	<c:if test="${not empty param.id }">
		아이디 : <c:out value="${param.id }" />
	</c:if>
	
	<c:if test="${not empty param.pwd }">
		비밀번호 : <c:out value="${param.pwd }" />
	</c:if>

</body>
</html>