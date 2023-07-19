<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalab.el.Member" %>

<%
Member member = (Member)request.getAttribute("member");
%>

<!DOCTYPE html>
<html>
<head>
<title>EL Empty 예제</title>
</head>
<body>
	<h2>여기는 forward 페이지 EL의 empty 검사 예제</h2>
	<h3>EL의 empty를 통해서 객체 및 값의 존재 유무 판별</h3><br><br>
	
	<h3>1. EL 방식</h3>
	
	1. member 객체의 Empty 유무(범위 미지정) : ${empty member }<br>
	<br>
	2. member 객체의 not Empty 유무(범위 지정) : ${requestScope.member }<br>
	<br>
	3. member 객체 name : ${member.getName() }<br>
	<br>
	4. member 객체의 name 속성의 값 비교 eq(equal) '장기하' or "장기하" 여부 : ${member.name eq '장기하' }<br>
	<br>
	5. member 객체의 age 속성의 숫자값 비교 (속성값 eq '25') : ${member.age eq '25' }<br>
	<br>
	
	<h3>2. 예전 방식</h3>
</body>
</html>