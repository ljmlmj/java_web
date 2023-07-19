<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.first {
	padding: 60px;
	text-align: left;
	background: #1abc9c;
	color: white;
	font-size: 20px;
}

.second {
	padding: 60px;
	text-align: left;
	background: yellow;
	color: red;
	font-size: 20px;
}
</style>
<title>main</title>
</head>
<body>
	<h2>include 액션 태그</h2>
	<h3 class="first">여기는 포함하는 페이지입니다.</h3>
	<jsp:include page="second.jsp" flush="true"></jsp:include>
	<h3 class="first">여기는 포함하는 페이지입니다.</h3>
</body>
</html>