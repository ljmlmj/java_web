<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post 방식 파라미터 전달</title>
</head>
<body>
	<h1>post 방식 파라미터 전달</h1>
	
	<form action="viewParam.jsp" method="post">
		<label for="name">Name:</label>
		<input type="text" name="name" id="name">
		<br>
		<label for="email">Email:</label>
		<input type="email" name="email" id="email">
		<br>
		<input type="submit" value="Submit">
	</form>
</body>
</html>