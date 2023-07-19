<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page session = "true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	// long 타입의 시간 값을 저장하기 위해 사용하여 Date 객체 생성
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<!DOCTYPE html>
<html>
<head>
<title>세션 정보</title>
</head>
<body>
	<h3> 모든 jsp 페이지는 세션이 기본적으로 만들어진다(session="true")</h3>
	<br>
	<br>
	세션ID: <%= session.getId()  %><br>
	<% 
	// 세션의 생성시간을 Date 객체인 time에 저장
		time.setTime(session.getCreationTime());
	%>
	세션생성시간: <%= formatter.format(time) %> <br>
	<%
		
		time.setTime(session.getLastAccessedTime());
	%>
	최근접근시간: <%= formatter.format(time) %>	
</body>
</html>