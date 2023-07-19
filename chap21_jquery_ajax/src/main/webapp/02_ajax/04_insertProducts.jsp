[04_insertProducts.jsp]

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>         
      $(document).ready(function(){
         // 이벤트 핸들러 - json type 변환
         $("#changeBtn").click(function(e){ 
            // submit()되지 않도록 
            e.preventDefault();
         
            // 1. 입력값 추출
            let id = $('#id').val();   // id에 입력된 값
            let pwd = $('#pwd').val();   // pwd에 입력된 값

            // 2. 데이터를 저장할 자바스크립트 배열 객체생성
            let products = new Array();
            
            /*
              3. 화면에 입력된 데이터들을 자바스크립트 객체로 만들어서
                 자바스크립트 배열에 저장
              - tbody밑에 있는 tr만큼 반복
              - $(this) : 현재 반복되는 tr 자신을 가리킴
              - let td : tr에서 td의 참조값을 얻어온 후에 인덱스로 
                각 td에 접근하여 value값을 갖고 온다.
            */
            $('table tbody tr').each(function(index){
               let tr = $(this);
               let td = tr.find('td');
               
               let product = new Object();   // 자바스크립트 객체(상품) 생성
               // 상품ID(1번째 td)
               product.productId = td.eq(1).find('input').val();
               // 상품명(2번째 td)
               product.productName = td.eq(2).find('input').val();
               // 가격(3번째 td)
               product.price = td.eq(3).find('input').val();
               // 만들어진 한개의 상품객체를 배열에 저장
               products.push(product); 
            });   
            
            // 4. JSON.stringify(products) 스트링지 파이 함수
            //  - 자바스크립트 배열 객체를 JSON Type 문자열로 변환
            var jsonData = JSON.stringify(products);
            console.log('[디버깅]보내기전 jsonData : ', jsonData);               
            
            // ajax 서블릿 호출(서버에 값 전달)
            $.ajax({
               url : '${contextPath}/insertProducts',  // 서버 url
               type : 'post',              // 요청방식 (get, post, put 등등)
                async : true,               // 비동기 여부 (default : true)
                data : {data: jsonData},   // 서버로 전송할 데이터(key:value)
                dataType : 'text',          // 전달받을 데이터타입(html,xml,json,text)
                success : function(result) { // 결과 성공 콜백함수
                    console.log('서버 처리결과 받은 jsonData : ', result);   // [디버깅]받은 결과 출력
                    
                    // 1) 서버에서 받은 JSON Type 문자열을 자바 객체로 변환
                    const productList = JSON.parse(result);
                    $('#result').text(${member.id});
            
                    //table 변수에 제목 부분 만들어서 보관
                    var table = "<table border='1'><tr><td>순번</td><td>상품ID(productID)</td><td>상품명(productName)</td><td>가격(price)</td></tr>";
                    
                    // productList 반복 : 서버에서 넘어와서 자바스크립트 객체로 변환된 객체
                    $.each(productList, function(index, product){
                       table += '<tr>';
                          table += '<td>' + index + '</td>';            //첫번째 td
                          table += '<td>' + product.productId + '</td>';   //두번째 td
                            table += '<td>' + product.productName + '</td>';//세번째 td
                            table += '<td>' + product.price + '</td>';//세번째 <td>
                       table += "</tr>";
                    });
                    
                    table += "</table>";
                      $('#panelView').html(table);
                },
                error : function(request, status, error) { // 결과 에러 콜백함수
                    console.log(error)
                }
            })
         });    
      });
   </script>
</head>
<body>
	<h3>
		1. 여러개의 데이터를 JSON 문자열로 변환하여 서버에 전달,<br> 2. 서버에서는 JSON 문자열을 가공하여
		데이터베이스 작업<br> 3. 클라이언트에서 전달되어 자바 객체로 변환된 걸 다시 JSON 문자열로 변환<br>
		4. 웹브라우저에서는 서버에서 받은 JSON 문자열을 자바스크립트 객체로 변환<br> 5. 자바스크립트 객체를
		반복(each)해서 화면의 특정 부분에 살짝 끼워넣기
	</h3>

	<div>
		<table>
			<thead>
				<tr>
					<th>순서</th>
					<th>상품ID</th>
					<th>상품명</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><input type="text" id="productId1" value="elec001"></td>
					<td><input type="text" id="productName1" value="냉장고"></td>
					<td><input type="number" id="price1" value="5000000"></td>
				</tr>
				<tr>
					<td>2</td>
					<td><input type="text" id="productId2" value="elec002"></td>
					<td><input type="text" id="productName2" value="세탁기"></td>
					<td><input type="number" id="price2" value="3800000"></td>
				</tr>
				<tr>
					<td>3</td>
					<td><input type="text" id="productId3" value="elec003"></td>
					<td><input type="text" id="productName3" value="공기청정기"></td>
					<td><input type="number" id="price3" value="2300000"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div>
		<button id="changeBtn">전송</button>
	</div>
	<br>
	<div>
		<div id=panelView></div>
	</div>


</body>
</html>