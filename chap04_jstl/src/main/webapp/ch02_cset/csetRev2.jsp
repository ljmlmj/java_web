<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String strId = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	1. param.id(EL의 기본 객체인 param 사용) : ${param.id}<br>
	2. strId(자바코드) : ${strId}><br>
	3. 표현식(자바코드) : <%=strId %>
	
	
</body>
</html>