<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalab.el.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	// request 내장 객체에 저장할 객체 생성
	User user = new User("dream", "5678", "박명수", "abc@a.com");
	
	// request 영역에 객체 저장
	request.setAttribute("user", user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>a href와 forward를 통한 페이지 이동의 차이점</h2>
	
	<h3>1. a href 를 통한 페이지 이동<br></h3>
	- get 방식 요청이다.<br>
	- 클라이언트에게 새로운 요청을 하도록 하는 것과 같다.<br>
	  새로운 request가 생성되는 것이므로 기존에 request에 저장한 내용은 모두 사라진다.<br>
	- 또한 외부에서 톰캣을 거쳐서 웹 어플리케이션 안으로 들어와야 하기 때문에 <br>
	  컨텍스트 패스를 걸어줘야 정확하게 해당 jsp 페이지를 찾을 수 있다.<br>
	- 이동해 간 페이지로 전달하고 싶은 내용은 세션에 저장해야 한다.<br>
	
	<a href="${pageContext.request.contextPath}/ch06/aLinkTagTo.jsp">aTag 이동</a><br>
	<br>
	
	<h3>2. forward를 통한 이동<br></h3> 
	- forward는 웹 어플리케이션 내부에서의 페이지간 직접 이동이다.<br>
	  바깥에서 컨텍스트 패스를 거쳐서 오는 요청이 아니다.<br>
	- request가 새로 만들어지는 것이 아니므로 기존에 request에 <br>
	  저장한 내용은 그대로 사용할 수 있다.(1.번 테스트 끝나고 다음 주석 해제)
	- 이동 경로를 만들 때 컨텍스트 패스 생략하고 해당 경로만 적어도 됨.
	<jsp:forward page="/ch06/aLinkTagTo.jsp" />
</body>
</html>