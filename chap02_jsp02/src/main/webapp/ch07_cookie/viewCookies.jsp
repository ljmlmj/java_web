<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>

<!DOCTYPE html>
<html>
<head>
<title>쿠키 목록</title>
</head>
<body>
쿠키 목록<br>
<%
	// 클라이언트에 저장된 전체 쿠키값을 가져온다.
	Cookie[] cookies = request.getCookies();
// 가져온 쿠키를 하나씩 출력하도록 반복 
// URLDecoder.decode : 저장된 쿠키를 가져올 때는 디코딩해야 함.
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
%>
	<%=cookies[i].getName() %> =
	<%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %> <br>
<%
		}
	} else {
%>
쿠키가 존재하지 않습니다.
<% 
	}
%>
</body>
</html>