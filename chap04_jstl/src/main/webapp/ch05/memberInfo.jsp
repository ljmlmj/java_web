<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   // post 방식으로 메시지 바디에 담겨오는 파라미터들 인코딩
   request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  
   <script type="text/javascript">
      function goBack() {         // 함수 선언문 형태
         window.history.back(); // 브라우저 뒤로 가기
      }
      /*
      const goBack = function () {   // 함수표현식
         window.history.back();
      }
      goback();
      */
   </script>  
  
  <title>회원 정보 출력</title>
</head>

<body>

   <h2>choose + when + otherwise + empty </h2>

   <table border="1">
       <tr bgcolor="lightgreen">
         <td><b>아이디</b></td>
         <td><b>비밀번호</b></td>
         <td><b>이름</b></td>
         <td><b>이메일</b></td>
      </tr>
      <c:choose> 
         <c:when test="${empty param.id}">
            <tr>
               <td colspan=5>입력한 정보가 올바르지 않습니다.</td>
            </tr>
         </c:when>
         <c:otherwise >
             <tr>
               <!-- EL 기본 객체인 param 객체를 통해서 파라미터 추출 -->
               <td><c:out value="${param.id}" /></td>
               <td><c:out value="${param.pwd}"  /></td>
               <td><c:out value="${param.name}" /></td>
               <td><c:out value="${param.email}" /></td>
         </tr>
         </c:otherwise>
      </c:choose>   
   </table>
   
   <div style="text-align: center; margin-top: 5px;">
      <button onclick="goBack()">뒤로 가기</button>
   </div>

</body>
</html>