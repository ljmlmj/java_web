<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Example1</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#changeBtn").click(function(e) {
			// submit()되지 않도록
			e.preventDefault();
			
			// 입력값 추출
			let id = $('#id').val();
			let pwd = $('#pwd').val();
			
			$.ajax({
				url : '${contextPath}/insertMember',
				type : 'post',
				async : true,
				data : {id : id, pwd : pwd},
				dataType : 'text',
				success : function(result){
					console.log(result);
					$('#result').text(result);
				},
				
				error : function(request, status, error){
					console.log(error)
				}
			})
		});
	});
</script>
</head>
<body>
	<h3>일반 문자열 상태로 서버에 요청, 서버에서 일반문자열 상태로 응답</h3>
	<h4>1. [전송]버튼을 클릭하면 자바스크립트 부분 jQuery의<br>
		2. ajax 함수를 통해서 서블릿으로 요청이 가고<br>
		3. 서블릿은 요청을 처리하고 그 결과를 일반 문자열로<br>
		   웹브라우저로 전송.<br>
		4. 클라이언트의 자바스크립트 부분에서 서버에서 받은 결과를<br>
		   화면에 보여줌.</h4>
	<br>
	<br>
	<form action="www.naver.com" method="get">
		아이디 : <input type="text" id="id"><br>
		비밀번호 : <input type="password" id="pwd"><br>
		<br>
		<button id="changeBtn">Json Type 전송</button>
	</form>
	<div id="result"></div>
</body>
</html>