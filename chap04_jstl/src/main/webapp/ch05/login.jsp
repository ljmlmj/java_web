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
	<h2>전달된 값이 비었는지 체크 + escapeXml 실습 예제</h2>
	<form action="${contextPath }/ch05/result.jsp" method="post">
	<%-- 아이디 : <input type="text" name="id" size="20" value="hong"/><br> --%>
	
	아이디 : <input type="text" name="id" size=20 
		value="<script>alert('Hello World!');</script>"/> <br>
	비밀번호 : <input type="password" name="password" size="20" /><bR>
	<input type="submit" value="로그인" />
	<input type="reset" value="다시입력" />
	</form>
	<a href="${contextPath}/ch05/memberForm.jsp">회원등록</a><br>
	<br>
</body>
</html>