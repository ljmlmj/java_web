<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 브라우저 주소창을 통한 파라미터 전달(주소?id=hong&pwd=1234)
String strId = request.getParameter("id");
String strpwd = request.getParameter("pwd");

// jsp 기본 객체인 request에 값 저장.
// request 객체를 통해서 저장한 값 조회할 수 있음
request.setAttribute("email", "abc@a.com");

// 세션에 값 저장
session.setAttribute("email", "abc@a.com");
%>




<!DOCTYPE html>
<html>
<head>
<title>EL Object</title>
</head>
<body>
	<h3>1. 기존 방식</h3>
	아이디 : <%= strId %><br>
	비밀번호 : <%= strpwd %> <br>
	이메일 : <%= request.getAttribute("email") %> <br>
	<br>
	<br>
	
	<h3>2. EL 방식</h3>
	<h5> = EL 기본 객체인 param 객체를 통해서 편리하게 파라미터 추출</h5>
	아이디 : ${param.id}<br>
	비밀번호 : ${param.pwd}<br>
	이메일 : ${requestScope.email}<br>
	이메일(sessionScope) : ${sessionScope.email }<br>
	<br>
	<br>
	
	<!-- 테스트 할 때는 주석처리하고 테스트 끝나면 주석해제해서 forward 테스트 -->
	<%-- <jsp:forward page="useEl02.jsp" /> --%>
	
</body>
</html>