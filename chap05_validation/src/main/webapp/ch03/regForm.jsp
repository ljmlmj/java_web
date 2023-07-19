<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function checkMember(event) {
		// form의 submit()못하도록 막음
		event.preventDefault();
		
		// 각 입력값을 검증할 정규표현식
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExpName = /^[가-힣]*$/;
		var regExppwd = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var id = document.getElementById('id').value;
		var name = document.getElementById('name').value;
		var pwd = document.getElementById('pwd').value;
		var phone = document.getElementById('phone1').value + "-" + document.getElementById('phone2').value + "-" + document.getElementById('phone3').value;
		var email = document.getElementById('email').value;

		// 아이디 공란 여부 체크
		if (id.trim() === '') {
			alert('아이디를 입력하세요.');
			document.getElementById('id').focus();	// id 입력칸으로 포커스 이동
			return;
		}
		// 아이디의 길이 체크
		if (id.length < 5) {
			alert('아이디는 5자 이상이어야 합니다.');
			document.getElementById('id').focus();
			return;
		}
		// 아이디 정규표현식 체크
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요");
			document.getElementById('id').focus();
			return;
		}

		// 비밀번호 공란 검증
		if (pwd.trim() === '') {
			alert('비밀번호를 입력하세요.');
			document.getElementById('pwd').focus();
			return;
		}
		// 비밀번호 길이 검증
		if (pwd.length < 8) {
			alert('비밀번호는 8자 이상이어야 합니다.');
			document.getElementById('pwd').focus();
			return;
		}		
		// 비밀번호 정규표현식 검증
		if(!regExppwd.test(pwd)){
			alert("비밀번호는 특수문자가 포함되어야 합니다.");
			document.getElementById('pwd').focus();
			return;
		}
		
		// 이름 검증
		if(!regExpName.test(name)){
			alert("이름은 한글만 입력해주세요");
			document.getElementById('name').focus();
			return;
		}
		// 연락처 검증
		if(!regExpPhone.test(phone)){
			alert("연락처를 확인해주세요");
			document.getElementById('phone1').focus();
			return;
		}
		// 이메일 검증
		if(!regExpEmail.test(email)){
			alert("이메일 입력을 확인해주세요");
			document.getElementById('email').focus();
			return;
		}
		
		// 모든 검증이 끝나서 막아놓았던 submit을 실행함.
		document.getElementById('loginForm').submit();	
	}
</script>
</head>
<body>
	<form id="loginForm" action="${pageContext.request.contextPath }/ch03/loginProcessing.jsp" method="post">
		<div>
			아이디 : <input type="text" name="id" id="id" value="hong12">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd" id="pwd" value="12345678@a">
		</div>
		<div>
			이름 : <input type="text" name="name" id="name" value="이민지">
		</div>
		<div>
			연락처 : 
			<select name="phone1" id="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2" id="phone2" value="1234"> -
			<input type="text" maxlength="4" size="4" name="phone3" id="phone3" value="5678">
		</div>
		<div>
			이메일 : <input type="text" name="email" id="email" value="a@a.com">
		</div>
		<div>
			<input type="button" value="전송" onclick="checkMember(event)">
		</div>
	</form>
</body>
</html>