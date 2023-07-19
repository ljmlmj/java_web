<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// ID와 암호가 같으면 로그인에 성공한 것으로 판단.
	if (id.equals(password)) {
		session.setAttribute("id", id);
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
	} else { // 아이디 패스워드가 같지 않으면 로그인 실패
%>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
</script>
<%
	}
%>

