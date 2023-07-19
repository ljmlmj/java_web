<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. useBean 액션 태그로 Member 객체를 생성함 -->
<jsp:useBean id="member" scope="request" class="com.javalab.el.Member"/>

<!-- 1.2 위에서 생성한 객체에 값 저장 -->
<jsp:setProperty property="name" name="member" value="장기하"/>
<jsp:setProperty property="age" name="member" value='${20+5 }'/>

<jsp:forward page="useJavaBeans.jsp" />


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>EL의 empty 검사 예제</h2>
</body>
</html>