<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javalab.util.Cookies" %>

<%
// jsp 내장 객체인 request를 Cookies 클래스 객체 생성자의
// 파라미터로 전달함.
Cookies cookies = new Cookies(request);
%>

<!DOCTYPE html>
<html>
<head>
<title>Cookies 유틸 클래스 사용하여 쿠키 읽기</title>
</head>
<body>
	<h2>Cookies 유틸 클래스 사용하여 쿠키 읽기</h2>
	<br><br>
	
	name 쿠키 = <%=cookies.getValue("name") %><br>
	<%if (cookies.exists("id")) { %>
	id 쿠키 = <%= cookies.getValue("id") %> <br>
	<% } %>
</body>
</html>