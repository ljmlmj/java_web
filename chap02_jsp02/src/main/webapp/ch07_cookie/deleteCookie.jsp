<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<%
	Cookie[] cookies = request.getCookies();
if (cookies != null && cookies.length > 0) {
	for (int i = 0; i<cookies.length; i++) {
		if (cookies[i].getName().equals("name")){
			// 새로운 쿠키 객체 생성
			Cookie cookie = new Cookie("name", "");
			// 쿠키 객체의 유효 기간을 0으로 세팅(삭제)
			cookie.setMaxAge(0);
			// name 이라는 이름의 쿠키의 유효기간을 0으로 해서
			// response 헤더에 저장(기존 쿠키 엎어씀)
			response.addCookie(cookie);
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 삭제</title>
</head>
<body>
name 쿠키를 삭제합니다.
</body>
</html>