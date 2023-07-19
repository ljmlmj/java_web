<%@ page contentType="text/html; charset=UTF-8"%>

<%
	/*
		세션은 현재 브라우저가 유지되는 동안 클라이언트의 정보를
		서버측에 저장하면서 클라이언트를 식별할 수 있게 된다.
	*/
	
	// 세션에 사용자 정보를 저장
	session.setAttribute("id", "promise");
	session.setAttribute("name", "최범균");
%>


<!DOCTYPE html>
<html>
<head>
<title>세션에 정보 저장</title>
</head>
<body>
	세션에 정보를 저장하였습니다. <br>
	<br>
	<%
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
	%>
	세션에 저장된 아이디 : <%= id %><br>
	세션에 저장된 이름 : <%= name %>
	<!-- 새로 발급된 세션ID : -->
</body>
</html>