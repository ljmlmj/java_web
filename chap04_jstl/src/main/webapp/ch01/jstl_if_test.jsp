<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바코드 사용하는 스크립트릿 사용</title>
</head>
<body>
	<%
	int sum = 0;
	for (int i = 0; i <= 10; i++) {
		sum += i;
	
	%>
	<%= i %><br />
	<%
		}	
	%>
	
	합계 : <%= sum %>
	
</body>
</html>