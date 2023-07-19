<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지가 들어간 게시물 목록</title>
</head>
<body>
	<c:set var="title1" value="hello world!" />
	<c:set var="title2" value="쇼핑물 중심 JSP입니다!" />
	<c:set var="str1" value="중심" />
	
	<h2>여러 가지 문자열 함수 기능</h2>
	title1 = "hello world!"<br>
	title2 = "쇼핑물 중심 JSP 입니다.!"<br>
	str1 = "중심"<br>
	<br>
	fn:length(title1) = ${fn:length(title1) }<br>
	fn:toUpperCase(title1) = ${fn:toUpperCase(title1) }<br>
	
	fn:substring(title1,3,7) = ${fn:substring(title1,3,7) }<br>
	fn:replace(title1," ","/") = ${fn:replace(title1," ","/") }<br>
	
	fn:indexOf(title2,str1) = ${fn:indexOf(title2,str1) }<br>
	fn:contains(title1,str1) = ${fn:contains(title1,str1) }<br>
</body>
</html>