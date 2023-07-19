<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>

<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("minari", "utf-8"));
	response.addCookie(cookie);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키생성</title>
</head>
<body>

<%= cookie.getName() %> 쿠키의 값 = "<%=cookie.getValue() %>"
<br><br>
<%= cookie.getName() %> 쿠키의 값 = <%=URLDecoder.decode(cookie.getValue(), "utf-8")%>
</body>
</html>