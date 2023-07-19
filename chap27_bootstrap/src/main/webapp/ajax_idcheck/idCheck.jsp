<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.javalab.vo.*"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author"
		content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.104.2">
	<title>Signin Template · Bootstrap v5.2</title>
	
	<link rel="canonical"
		href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
	
	<!-- 다운로드 받아서 사용하는 형태 -->
	<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<style>
	.bd-placeholder-img {
		font-size: 1.125rem;
		text-anchor: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		user-select: none;
	}
	
	@media ( min-width : 768px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
	}
	
	.b-example-divider {
		height: 3rem;
		background-color: rgba(0, 0, 0, .1);
		border: solid rgba(0, 0, 0, .15);
		border-width: 1px 0;
		box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
			rgba(0, 0, 0, .15);
	}
	
	.b-example-vr {
		flex-shrink: 0;
		width: 1.5rem;
		height: 100vh;
	}
	
	.bi {
		vertical-align: -.125em;
		fill: currentColor;
	}
	
	.nav-scroller {
		position: relative;
		z-index: 2;
		height: 2.75rem;
		overflow-y: hidden;
	}
	
	.nav-scroller .nav {
		display: flex;
		flex-wrap: nowrap;
		padding-bottom: 1rem;
		margin-top: -1px;
		overflow-x: auto;
		text-align: center;
		white-space: nowrap;
		-webkit-overflow-scrolling: touch;
	}
	</style>

	<style type="text/css">
		.errorMsg{
			color : red;
			text-align: center;
		}
		.okMsg{
			color : blue;
			text-align: center;
		}
	</style>

	<script>         
		$(document).ready(function(){
			// 이벤트 핸들러 
			$("#btnCheck").on('click', function(e){  
				// 다음 처리 안하면 서버로 요청이 일어남
				e.preventDefault();
			
				let id = $('#id').val();	// id에 입력된 값
				if(id.length == 0 || id == ""){
					alert("아이디를 입력하세요.");
					$('#id').focus();
					return;
				}
							
				// 입력값 디버깅
				console.log('id / pwd', id, pwd); 
				
				// ajax 호출
				$.ajax({
					url : '${contextPath}/idCheck',  // 서버 url
					type : 'get',           	// 요청방식 (get, post, put 등등)
				    data : {id: id},			// 서버로 전송할 데이터(key:value)
				    dataType : 'text',       	// 전달받을 데이터타입(html,xml,json,text)
				    success : function(result) {// 결과 성공 콜백함수
				        console.log(result);	// [디버깅]받은 결과 출력
				        if(result === 'true'){
				            $('#result').addClass('errorMsg')
				            			.text('아이디가 이미 존재합니다.');
				        }else{
				            $('#result').addClass('okMsg')
				            			.text('사용 가능한 아이디입니다.');				        	
				        }
				    },
				    error : function(request, status, error) { // 결과 에러 콜백함수
				        console.log(error)
				    }
				})	// end ajax
				
			}); // end btnCheck
		});	// end ready
	</script>	


<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form>
			<img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">Login</h1>

			<div class="form-group">
				<label for="id" class="label-left">ID</label>
				<input type="text" class="form-control" id="id" name="id" value="user01" required> 
				<small id="result" class="form-text"></small>
			</div>
			<div class="form-group mt-1">
				<label for="pwd" class="text-start">Password</label>
				<input type="password" class="form-control" name="pwd" id="pwd" value="1234"> 
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="w-100 btn btn-sm btn-primary" id="btnCheck" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
		</form>
	</main>

</body>
</html>
