<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 본 어플리케이션의 컨텍스트를 경로로 갖고와서 변수에 저장 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<h1>Login</h1>
	<br>
	<form name="frmLogin" method="post" action="${contextPath}/login">
	
	아이디 : <input type="text" name="user_id"><br>
	비밀번호 : <input type="password" name="user_pw"><br><br>
	
	<input type="submit" value="로그인">
	<input type="reset" value="다시입력">
	</form>
</body>
</html>