<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
%>

<!-- 변수 선언 -->
<c:set var="id" value="hong" scope="page" />
<c:set var="name" value="홍길동" scope="page" />
<c:set var="age" value="22" scope="page" />
<c:set var="height" value="${177 }" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문 실습</title>
</head>
<body>
	<h2>조건문 실습</h2>
	
	<c:if test="${(id == 'hong') && (name == '홍길동') }">
		<h3>아이디는 ${id}이고, 이름은 ${name}입니다. </h3>
	</c:if>
	
	<c:if test="${(age == 22)}">
		<h3>${name}의 나이는 ${age}살입니다. </h3>
	</c:if>
	
	<c:if test="${(age == '22')}">
		<h3>${name}의 나이는 ${age}살입니다.</h3>
	</c:if>
	
	<c:if test="${(height > 160)}">
		<h3>${name}의 키는 160보다 큽니다 </h3>
	</c:if>
</body>
</html>