<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*" %>    
<%@ page import="com.javalab.jstl.User" %>    
    
<%
   List<User> userList = new ArrayList<>();
   User user1 = new User("dream1", "1234", "hong1", "a1@a.com");   
   User user2 = new User("dream2", "1234", "hong2", "a2@a.com");   
   User user3 = new User("dream3", "1234", "hong3", "a3@a.com");   
   User user4 = new User("dream4", "1234", "hong4", "a4@a.com");   
   User user5 = new User("dream5", "1234", "hong5", "a5@a.com");
   
   userList.add(user1);
   userList.add(user2);
   userList.add(user3);
   userList.add(user4);
   userList.add(user5);

   // 현재 페이지에서만 사용
    //pageContext.setAttribute("userList", userList);
    // request 영역에 저장
   request.setAttribute("userList", userList);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <jsp:forward page="boardList.jsp" />

</body>
</html>