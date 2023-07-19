<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<title>초기화 파라미터 읽어오기</title>
</head>
<body>
	<h2>web.xml 파일에 설정해놓은 어플리케이션에서 공통으로 사용할 정보(초기화 파라미터) 조회하기</h2>
	<br>
	설정된 초기화 파라미터는? : <br>
	<br>
	<ul>
	<%
	Enumeration<String>	initParamEnum = application.getInitParameterNames();
	while (initParamEnum.hasMoreElements()) {
		String initParamName = initParamEnum.nextElement();
	%>
	<li><%= initParamName %> =
		<%= application.getInitParameter(initParamName) %>
	<% 
	}
	%>
	</ul>
</body>
</html>