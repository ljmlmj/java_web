<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
	<jsp:foward> 액션태그를 실행하면
	이전에 생성했던 출력결과는 모두 없어진다. --%>
<html>
<head>
<title>from.jsp의 제목</title>
</head>
<body>
	<pre>이 페이지는 from.jsp가 생성한 부분입니다.
하지만 웹프라우저에 나오지 않습니다.왜냐하면
forward 페이지로 이동하기 전에 현재의 페이지에서
생성되어 있던 내용을 버리기 때문입니다.
	</pre>

<jsp:forward page="to.jsp"></jsp:forward>
</body>
</html>