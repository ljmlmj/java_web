<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.javalab.el.*" %>
<%
Member member = new Member();
member.setName("John");
member.setAge(18);

request.setAttribute("member", member);
%>

<!DOCTYPE html>
<html>
<head>
<title>EL로 객체 핸들링</title>
</head>
<body>

<h2>EL로 객체 핸들링</h2>

<jsp:forward page="useObject.jsp" />

</body>
</html>