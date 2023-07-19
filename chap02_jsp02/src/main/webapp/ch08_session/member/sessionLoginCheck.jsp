<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 세션에서 사용자 정보 추출(세선에 id라는 이름으로 저장된 값이 있으면)
	String strId = (String)session.getAttribute("id");
	// 로그인 여부 체크
	boolean login = strId == null? false : true;
%>

<!DOCTYPE html>
<html>
<head>
<title>로그인 여부 검사</title>
</head>
<body>
<%
	if (login){
		
%>
회원님의 아이디는 : <%= strId %>입니다.
<%
	} else {
%>
로그인하지 않은 상태입니다.
<%
	}
%>
</body>
</html>