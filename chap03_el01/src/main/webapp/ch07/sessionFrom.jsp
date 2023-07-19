<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalab.el.*" %>

<%
	// session 내장 객체에 저장할 객체 생성
	User user = new User("dream", "5678", "박명수", "abc@a.com");
	
	// session 영역에 저장
	session.setAttribute("user", user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 통한 객체 전달</title>
</head>
<body>
	<h2>세션을 통한 객체 전달</h2>
	
	<!-- 세션에 객체 정보를 저장하고 a href를 통해서 이동
		1. 새로운 요청으로 request가 새로 만들어지지만
		session에 저장한 정보는 그대로 유지됨. -->
	<a href="${pageContext.request.contextPath }/ch07/sessionTo.jsp">세션에 저장한 값 확인하기</a>
</body>
</html>