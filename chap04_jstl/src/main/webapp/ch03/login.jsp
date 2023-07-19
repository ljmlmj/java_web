<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 본 어플리케이션의 컨텍스트를 경로를 갖고와서 변수에 저장 -->
<c:set var = "contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
</head>
<body>
	<!-- 폼태그에서 전송방식을 기재하지 않으면 기본 get방식으로 전송 주소창에 붙여서 전송 -->
	<form action="${contextPath}/ch03/result.jsp">
		아이디 : <input type="text" name="id" size="20" /> <br>
		<br>
		비밀번호 : <input type="password" name="password" size="20" /> <br>
		<br>
		<input type="submit" value="로그인" />
		<input type="reset" value="다시입력" />
	</form>
	
	<a href="${contextPath}/ch03/memberForm.jsp">회원등록</a><br>
	<br>
	<%-- 별도의 변수로 안 만들고 이렇게 바로 사용해도 됨 --%>
	<a href="${pageContext.request.contextPath}/memberForm.jsp">회원등록</a>
</body>
</html>