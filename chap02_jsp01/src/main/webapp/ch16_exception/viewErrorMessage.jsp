<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>	<!-- 중요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생</title>
</head>
<body>

	<h3> jsp 설정 부분에 page 지시자를 통해서 <br>
		isErorrPage = "true"로 설정하면 해당 파일은 예외 처리 <br>
		파일로 지정된다.(exception 객체 사용 가능해짐.)</h3>
		
		<br>
		<br>	
		"오류가 발생했습니다."<br>
		<br>
요청 처리 과정에서 에러가 발생하였습니다.<br>
<p>
에러 타입: <%=exception.getClass().getName() %><br>
에러 메세지: <b><%=exception.getMessage() %></b>
</p>
</body>
</html>