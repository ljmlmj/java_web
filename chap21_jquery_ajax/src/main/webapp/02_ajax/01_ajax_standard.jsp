
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Example1</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	/*
	 [ajax 호출]
	 - url : 요청을 받을 서버의 서블릿 또는 jsp의 경로
	 - type : 서버로 요청할 method type(get, post)
	 - dataType : 처리 결과를 서버로 부터 전송 받을 type
	 - data : 서버로 전송할 데이터(키:값 쌍으로)
	 - success, error, complete : 콜백함수 
	    
	 [콜백함수]
	 - ajax 호출후에 전송 받을 결과를 처리하는 함수로 자동으로 불려짐
	 - 콜백함수 호출 순서 :  
	   성공 시 : success > complete
	   실패 시 : error > complete
	 */
	$(document).ready(function() {
		$('#btnSend').on('click', function() {
			$.ajax({
				url : "${contextPath}/ajaxTest",
				type : "get",
				dataType : "text",
				data : {
					id : "dream",
					pwd : "1234"
				},
				success : function(data, textStatus) {
					console.log("1. 작업 성공 success 콜백 호출됨!!");
					$('#message').append(data);
				},
				error : function(data, textStatus) {
					console.log("2. 작업 실패 error 콜백 호출됨!!");
				},
				complete : function(data, textStatus) {
					console.log("3. 작업 성공/실패 상관없이 complete 콜백 호출됨!!");
				}
			}); // end ajax call()
		}); // end on click()
	}); // end ready()
</script>
</head>
<body>
	<input type="button" value="전송하기" id="btnSend" />
	<br>
	<br>
	<div id="message"></div>
</body>
</html>