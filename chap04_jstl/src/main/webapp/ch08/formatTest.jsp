<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<h2>fmt의 number 태그를 이용한 숫자 포맷팅 예제.</h2>
	<c:set var="price" value="100000000" /><br>
	
	<!-- type = currency/number/percent -->
	<fmt:formatNumber type="currency" var="priceNumber" value="${price }" />
	1. 천단위 통화로 표현 : ${priceNumber}
	
	<h2>formatDate 예제</h2>
	<c:set var="now" value="<%=new Date() %>"/>
	<fmt:formatDate value="${now }" var="dateFormat" pattern="YYYY-MM-dd :hh:mm:ss" /><br>
	
	2. 날짜 : ${dateFormat}<br>
</body>
</html>