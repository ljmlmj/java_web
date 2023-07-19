<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
<%
	// 서버로 전달된 파라미터 디코딩
	request.setCharacterEncoding("utf-8");
%>
	<h1>입력폼에서 전달받은 파라미터 값</h1>
	<p>Name: <%= request.getParameter("name") %></p>
	<p>Email: <%= request.getParameter("email") %></p>
	
	
</body>
</html>