<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
1. PageContext : EL에서 제공하는 기본 객체
2. pageContext.request : jsp의 내장 객체인 request의 참조
3. pageContext.request.contextPath : request 객체의 속성으로
	현재 어플리케이션의 컨텍스트 패스 정보를 갖고 있음.
 -->
 <form action="${pageContext.request.contextPath}/ch05/userInsert.jsp" method="post">
 
 <label for="id">ID:</label>
 <input type="text" name="id" id="id"><br>
 <label for="password">Password:</label>
 <input type="password" name="password" id="password"><br>
 <label for="name">Name:</label>
 <input type="text" name="name" id="name"><br>
 <label for="email">Email:</label>
 <input type="email" name="email" id="email"><br>
 <input type="submit" value="Submit">
 </form>
 
</body>
</html>