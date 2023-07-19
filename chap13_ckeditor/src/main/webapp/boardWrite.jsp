<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 등록 폼</title>
	
	<!-- ckeditor 설정 -->
	<script type="text/javascript" 
		src='<c:url value="/ckeditor/ckeditor.js"/>'>
	</script>
	<script type="text/javascript" 
		src='<c:url value="/ckeditor/config.js"/>'>
	</script>
	
	<style type="text/css">
      * {
         font-size: 12px;
      }
      p {
         width: 600px; 
         text-align: right;
      }
      table{
         border-collapse: collapse; 
      }
      table tbody tr th {
         background-color: #05bcac;
      }

	</style>
</head>

<body>
<h3>게시글 등록 화면</h3>
<hr>

	<form action="<c:url value='/boardWrite' />" method="post" >
	
	<table border="1" summary="게시판 등록 폼">
		<caption>게시글 등록 화면</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td><input type="text" name="subject" size="80" maxlength="100" required /></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><input type="text" name="writer" maxlength="20" required /></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="contents" cols="80" rows="10"></textarea>
					<script>CKEDITOR.replace('contents')</script>
				</td>
			</tr>
		</tbody>
	</table>
	<p>
		<input type="submit" value="저장" />
		<input type="button" value="목록" onclick="location.href='${contextPath}/boardList'" />
	</p>
	</form>
</body>
</html>