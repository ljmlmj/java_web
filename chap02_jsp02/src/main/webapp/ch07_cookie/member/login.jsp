<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javalab.util.Cookies" %>

<% 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// ID와 암호가 같으면 로그인에 성공한 것으로 판단.
	if (id.equals(password)) {
		// 쿠키 생성
		// / : 컨텍스트 패스에 쿠키 전송
		// -1 : 브라우저 닫기 전까지 살아있다가 브라우저를 닫으면 쿠키가 사라짐
		response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 성공</title>
</head>
<body>
로그인에 성공했습니다.
</body>
</html>
<%
	} else { // 로그인 실패시
%>
<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%
	}
%>
