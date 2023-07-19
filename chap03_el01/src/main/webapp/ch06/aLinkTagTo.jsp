<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.javalab.el.User" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>request에 저장된 값 확인</h2>
	유저 객체가 전달되었습니까? : ${not empty user} <br>
	유저 객체의 id 값은 : ${requestScope.user.id}<br>
	<br>
</body>
</html>