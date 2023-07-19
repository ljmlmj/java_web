
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
  <title>ajax 게시물 조회</title>
      <style type="text/css">
      .backColor{
         background-color: lightBlue;
      }
   </style>
    
   <!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>     
    <script type="text/javascript">
    
       // $(document).ready(function(){
       $(function() {
          //body에 배경색 적용, 화면 로딩후 바로 적용됨. 
         $('body').addClass('backColor');
          
          // sendBtn의 onclick 이벤트 처리기(리스너, 핸들러)
           $("#btnSubmit").on('click', function() {
             var no = $('#no').val();      // 게시물 번호
             
                // ajax 함수를 통해서 서버에 전송
                $.ajax({
               type:"get",
               url:"${contextPath}/boardView",
               data : { no: no},   // 서버로 보낼 데이터
               dataType : "text",   // 서버로부터 받을 데이터 타입
               // 처리결과 성공시 호출되는 콜백 함수
               success:function (result){
                  
                    // 1) 서버에서 받은 JSON Type 문자열을 자바 객체로 변환
                    const board = JSON.parse(result);                  
                  
                      $('#output').empty(); // clear div
                      
                      // Build HTML table
                      var table = "<table border='1'>";
                      table += '<tr><th>제목</th><td>' + board.title + '</td></tr>';
                      table += '<tr><th>작성자</th><td>' + board.id + '</td></tr>';
                      table += '<tr><th>내용</th><td>' + board.content + '</td></tr>';
                      table += '<tr><th>조회수</th><td>' + board.hit + '</td></tr>';
                      table += '<tr><th>작성일</th><td>' + board.regdate + '</td></tr>';
                      table += "</table>";
                      // 서버에서 받아온 데이터 출력
                      $('#output').append(table);
                     
                 }, // 처리결과 실패시 호출되는 콜백 함수
                 error:function(data,textStatus){
                    alert("에러가 발생했습니다.");ㅣ
                 },
                 complete:function(data,textStatus){
                    //success 콜백 호출후에 호출되는 콜백함수
                 }
            })  //end ajax   
   
         })   // end onclick
            
      })   // end $(function() {
    </script>
    
</head>
<body>
   <form action="" method="get">
      <h3 style="text-align: center">게시물 조회</h3>
      <h5 style="text-align: center">조회를 원하는 게시물 번호를 입력하세요.</h5>
      게시물 번호 : <input type="text" name="no" id="no" /><br>
      <input type="button" id="btnSubmit" value="조회"  /><br><br>
   </form>

    <div id="output"></div>
    
</body>
</html>