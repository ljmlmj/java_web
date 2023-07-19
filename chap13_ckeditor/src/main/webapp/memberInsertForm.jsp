<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 본 어플리케이션의 컨텍스트 경로를 갖고와서 변수에 저장해놓고 아래서 사용한다. -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 화면</title>
</head>
<body>
	<form name="frmMember" action="${contextPath }/insert" method="post">
		<table>
			<tr>
				<th>회원 등록</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<!--  <tr>
				<td>등록일</td>
				<td><input type="date" name="joindate"  max="2024-01-01" min="1999-12-31"></td>
			</tr> -->
		</table>
		<input type="submit" value="등록하기" >
		<input type="reset" value="다시입력">
	</form>
</body>
</html>