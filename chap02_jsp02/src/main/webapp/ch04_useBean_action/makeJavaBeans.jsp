<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- useBean 액션 태그로 Member 객체를 생성함 -->
<jsp:useBean id="member" scope="request" class="com.javalab.jsp.Memeber" />

<%
	/* 위에서 생성한 Member 객체(자바빈즈)에 하드 코딩으로 값 세팅*/
	member.setId("promise");
	member.setName("홍길동");
	member.setPassword("1234");
	member.setEmail("a@a.com");
%>

<jsp:forward page="useJavaBeans.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>