<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie cookie = new Cookie("oneh", "1time");
	cookie.setMaxAge(60*60); // 60초(1분) * 60 = 1시간
	response.addCookie(cookie);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키유효시간 설정</title>
</head>
<body>

유효시간이 1시간인 one hour(oneh) 쿠키 생성.
</body>
</html>