<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.javalab.jstl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   request.setCharacterEncoding("UTF-8");

   List<User> userList = new ArrayList<User>();
   User user1 = new User("dream", "1234", "홍길동", "a@a.com");
   User user2 = new User("magic", "5678", "장길산", "abc@d.com");
   User user3 = new User("kbs", "1586", "국민의방송", "kbs@k.com");
   
   userList.add(user1);
   userList.add(user2);
   userList.add(user3);

   /*
    유저 리스트를 request 객체에 저장하면 저장한 객체는 <a href=> 로 
    못 보낸다. 왜냐하면 <a href>는 get방식이기 때문에 담아놓은 객체가
    사라져서 전달 못함. 값을 쿼리스트링에 달아서 보내거나 세션에 저장해서 
    사용해야 한다. 그런데 객체는 쿼리스트링에 실어서 못보냄. 결국 객체는 
    세션에 저장한다.
   */
   // request.setAttribute("userList", userList);   
   
   // [대안] 세션은 사용자의 브라우저가 살아있는 한 유지된다.
   session.setAttribute("userList", userList);

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset=”UTF-8">
  <title>회원 정보 출력창</title>
</head>
<body>
   
   <h3>ArrayList로 자바 컬렉션을 만들고 (세션에 저장해서)다음 화면으로 전달</h3>
   <br>
   <a href="${pageContext.request.contextPath }/ch04/member2.jsp">1. 페이지 이동</a>
   
</body>
</html>