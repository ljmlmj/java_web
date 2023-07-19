<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script>         
      $(document).ready(function(){
         /*
          이벤트 핸들러(처리 함수)
           - 화면의 값을 읽어서 그대로 화면에 보여줌
         */
         $("#changeBtn").click(function(e){  
            // 다음 처리 안하면 서버로 요청이 일어남
            //e.preventDefault();
         
            let id = $('#id').val();   // id에 입력된 값
            let pwd = $('#pwd').val();   // pwd에 입력된 값
            
            // 입력값 디버깅
            console.log('id / pwd', id, pwd); 
            
            // 입력값을 하나의 문자열로 합침
              let idPwd = "일반 문자열 : " + id + " " + pwd;
            
            // body 부분의 result 출력 
            $("#result").html(idPwd);                           
         });    
         
         /*
           이벤트 핸들러(처리 함수)
            - 화면의 값을 읽어서 직접 json type으로 변환
            - JSON Type : {"name":"John","age":"30"}
         */
         $("#changeBtn2").click(function(e){  
            // 다음 처리 안하면 서버로 요청이 일어남
            //e.preventDefault();
         
            let id = $("#id").val();   // id에 입력된 값
            let pwd = $("#pwd").val();   // pwd에 입력된 값
            
            // 입력값 디버깅
            console.log('id / pwd', id, pwd); 
            
            // 입력값을 JSON Type으로 만듦
              let idPwd = 'JSON 타입 문자열 : ' +'{' + '"id"' + ":" + '"' + id + '", "pwd"' + ':"'+ pwd + '"}';
            
            // body 부분의 result 출력 
            $("#result").html(idPwd);                           
         });    
      });

   </script>
</head>
<body>
   <h4>1. 버튼을 클릭하면 자바스크립가 실행되고 <br>
      2. body 부분에 입력값을 조회해서<br>
      3. 다시 body부분에 출력하는 예제</h4>
   <br><br>
   <form action="www.naver.com" method="get">
      아이디 : <input type="text" id="id"><br>
      비밀번호 : <input type="password" id="pwd">
      <br><br>
      <button type="button" id="changeBtn">전송1</button>
      <br><br>
      <input type="submit" id="changeBtn2" value="전송2" />
   </form>
   <br><br>
   <div id="result"></div>
</body>
</html>