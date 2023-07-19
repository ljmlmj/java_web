<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>   

<!DOCTYPE html>
<%
	// 서버로 전달된 파라미터 주어진 캐릭터셋으로 인코딩
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>요청 파라미터 출력</title>
</head>
<body>
	<h2>클라이언트에서 서버로 파라미터 전달하는 방법 </h2>
	<br><br>
	
	<%
		String pName = request.getParameter("name");
		String pAddress = request.getParameter("address");
		System.out.println("pName : " + pName);
		System.out.println("pAddress : " + pAddress);
	%>
	
	<h2> 1. 파라미터 한 개씩 읽어오는 경우</h2>
	<b>request.getParameter() 메소드 사용</b>
	<br>
	
	name 파라미터 : <%= pName %><br>
	address 파라미터 : <%= pAddress %><br><br>
	
	<h2> 2. 체크박스 같은 여러 개의 값을 읽어오는 경우</h2>
	<b>request.getParameterValues() 메소드 사용</b><br>
	<%
		String[] values = request.getParameterValues("pet");
		if (values != null) {
			for (int i=0; i<values.length; i++) {
	%>
	<%= values[i] %>
	<%
			}	//for
		}	//if
	%>
	<br><br>
	
	<h2>3. Map을 통해서 Key-Value 형태로 읽어오는 경우</h2>
	<b>request.getParameter() 메소드 사용</b><br>
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		String[] addressParam = (String[])parameterMap.get("address");
		if (nameParam != null) {
	%>
	name = <%= nameParam[0] %><br>
	<%
		}
		if (addressParam != null) {
	%>
	address = <%= addressParam[0] %>
	<%
		}
	%>
</body>
</html>