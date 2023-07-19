<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.javalab.vo.*"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.errorMsg {
	color: red;
	text-align: center;
}

.okMsg {
	color: blue;
	text-align: center;
}
</style>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>         
	$(document).ready(function(){
	// 이벤트 핸들러 
        $("#btnCheck").on('click', function(e){  
            // 다음 처리 안하면 서버로 요청이 일어남
            e.preventDefault();
        
            let id = $('#id').val();   // id에 입력된 값
            
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
                type : 'get',              // 요청방식 (get, post, put 등등)
                data : {id: id},         // 서버로 전송할 데이터(key:value)
                dataType : 'text',          // 전달받을 데이터타입(html,xml,json,text)
                success : function(result) {// 결과 성공 콜백함수
                console.log(result);   // [디버깅]받은 결과 출력
                    if(result === 'true'){
                        $('#result').addClass('errorMsg').text('아이디가 이미 존재합니다.');
                        return;
                    } else {
                        $('#result').addClass('okMsg').text('사용 가능한 아이디입니다.');
                        return;
                    }
                },
                error : function(request, status, error) { // 결과 에러 콜백함수
                    console.log(error)
                }
            })   // end ajax
           
        }); // end btnCheck
           
        // 메시지 클리어 버튼 클릭 이벤트 핸들러
        $('#clearMsg').on('click', function(e){
           // 다음 처리 안하면 서버로 요청이 일어남
           e.preventDefault();
           // result text값 클리어
           $('#result').text('');
        });
    	     
	});   // end ready
</script>
</head>
<body>
	<h2 style="text-align: center;">아이디 중복 체크</h2>

	<form name="frmLogin" method="post" action="${contextPath}/idCheck">
		<h3 style="text-align: center">로그인</h3>

		<table align="center" border="0">
			<tr>
				<td width="200"><p align="right">아이디</td>
				<td width="400"><input type="text" name="id" id="id"
					value="user01"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호</td>
				<td width="400"><input type="password" name="pwd" id="pwd"
					value="1234"></td>
			</tr>
			<tr>
				<td colspan="2">
					<p style="" id="result"></p>
				</td>
			</tr>
			<tr>
				<td width="200"><p>&nbsp;</p></td>
				<td width="400">
					<button id="btnCheck">ID체크</button>
					<button id="clearMsg">메시지 클리어</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>