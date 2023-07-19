<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#tbl {
	width: 50%;
	border-collapse: collapse;
}

#tbl td, #tbl th {
	border: 1px solid;
}

#tbl th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	/*color:white;*/
}

#tbl tr:hover {
	background-color: #ddd;
}
</style>

<title>layout1</title>
</head>
<body>
	<table id="tbl">
		<tr>
			<th colspan="2"><jsp:include page="module/top.jsp" flush="false" />
			</th>
		</tr>
		<tr>
			<td width="100" valign="top">
				<jsp:include page="module/left.jsp" flush="false" />
			</td>
			<td width="300" valign="top">
				<!-- 내용 부분: 시작 --> 여기는 내용 부분 <br><br><br><!-- 내용 부분: 끝 -->
				<!-- 내용 부분: 시작 --> 여기는 내용 부분 <br><br><br><!-- 내용 부분: 끝 -->
				<!-- 내용 부분: 시작 --> 여기는 내용 부분 <br><br><br><!-- 내용 부분: 끝 -->
				<!-- 내용 부분: 시작 --> 여기는 내용 부분 <br><br><br><!-- 내용 부분: 끝 -->
				<!-- 내용 부분: 시작 --> 여기는 내용 부분 <br><br><br><!-- 내용 부분: 끝 -->
				<!-- 내용 부분: 시작 --> 여기는 내용 부분 <br><br><br><!-- 내용 부분: 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="module/bottom.jsp" flush="false" />
			</td>
	</table>
</body>
</html>