
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>회원가입</title>
   
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script>
      $(document).ready(function(){
         // 폼에서 submit 이벤트 발생시 작동
         $('form').on('submit', function(event) {
             event.preventDefault();
      
             // 폼에 있는 입력값들을 URL 쿼리스트링 형태로 만들어줌
             // ex) www.naver.com?id=magic&pwd=1234&email=a@a.com
            var params = $("form").serialize();
         
            // [디버깅]
            console.log('자바스크립트단', params);
            
             // 서블릿으로 Ajax 요청 보내기
             $.ajax({
               url: "${pageContext.request.contextPath}/memberSerialize",
               type: "post",
                dataType: 'text',
                /* 폼의 내용을 serialize해서 url로 전송(변수 이름 무관) */
               data: params, 
               success: function(result) {
                  
                console.log('result', result);
               member = JSON.parse(result);
                
                 // 테이블 생성
                 var tableHtml = '<table border=1>';
                 tableHtml += '<tr><th>아이디</th><td>' + member.id + '</td></tr>';
                 tableHtml += '<tr><th>비밀번호</th><td>' + member.pwd + '</td></tr>';
                 tableHtml += '<tr><th>이름</th><td>' + member.name + '</td></tr>';
                 tableHtml += '<tr><th>이메일</th><td>' + member.email + '</td></tr>';
                 tableHtml += '<tr><th>가입일</th><td>' + member.joindate + '</td></tr>';
                 tableHtml += '</table>';
         
                 $('#result').html(tableHtml);
               },
               error: function(xhr, status, error) {
                 // 오류 처리
                 console.error("An error occurred: " + error);
               }
            }); // ajax
         }); // on submit
      });   // ready
   </script>

</head>
<body>
   <form id="regform" method="post"
      action="${contextPath}/memberReg">
      <h1 style="text-align: center">회원 등록 화면</h1>
      <table >
         <tr>
            <td><p align="right">아이디</td>
            <td><input type="text" name="id" id="id"></td>
         </tr>
         <tr>
            <td><p align="right">비밀번호</td>
            <td><input type="password" name="pwd" id="pwd"></td>
         </tr>
         <tr>
            <td><p align="right">이름</td>
            <td><p>
                  <input type="text" name="name" id="name"></td>
         </tr>
         <tr>
            <td><p align="right">이메일</td>
            <td><p>
                  <input type="text" name="email" id="email"></td>
         </tr>
         <tr>
            <td><p>&nbsp;</p></td>
            <td>
            <input type="submit" value="가입하기"> 
            <input type="reset" value="다시입력"></td>
         </tr>
      </table>
   </form>

   <div id="result">   
   </div>

</body>
</html>