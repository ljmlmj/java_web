<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>$.getJSON 함수 테스트</title>

    <title>$.getJSON을 통해서 비동기적으로 외부에서 받아서 <br>
          하드디스크에 저장한 JSON 파일 읽어들이기</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function() {
         
           //아이디가 btn이고 그 자식들 중에서 btnLoad 클래스를 찾아서 click이벤트 부여
           $('#btn > .btnLoad').click(function(){

              /*
                 jquery 내장 함수인 getJSON()함수를 이용해서
                 "json_data.js"를 읽어라. 그리고 읽은 값을
                 function(data)라는 콜백 함수의 파라미터로 줘라.
                 
                 $.getJSON(Url, 콜백함수(결과데이터)){....}
                 - 응답으로 오는 파일이 반드시 json 형태일 경우만 사용
                 
                 [콜백함수] : 서버에 어떤 요청을 보내면 그 요청이 
                    성공/실패하고 난후 자동으로 불려지는 함수를 
                    콜백함수라고 한다. function(data){...}
              */
              $.getJSON('${contextPath}/01_json/json_data.js', function(data) {
                 //panelView 요소의 값을 지워라.
                 $('#panelView').empty();
                 
                 // html의 body 부분에 나타낼 html tag 생성
                 // table의 제목 부분
                 var table = "<table border='1'><tr><td>인덱스</td><td>번호</td><td>이름</td></tr>";
                 
                 /*
                  - data : 읽어들인 json_data
                  - json data 가 갖고 있는 값을 each 문으로 반복(inde:순번, entry:값)
                  - 배열에 들어있는 json data를 하나씩 꺼내서 entry에 할당
                  - entry.Num entry 내부의 key가 Num인 것의 값
                 */
                 $.each(data, function(index, entry){
                    table += '<tr>';
                    table += '<td>' + index + '</td>';         //첫번째 <td>
                    table += '<td>' + entry.Num + '</td>';   //두번째 <td>
                    table += '<td>' + entry.Name + '</td>';   //세번째 <td>
                    table += '</tr>';
                 });
                 table += '</table>';
                 
                 // 만들어진 html을 다음 요소에 할당
                   $('#panelView').append(table);
                   
              }); // end $.getJSON          
           });
        });

    </script>

</head>
<body>

    <div id="btn">
       <div class="btnLoad">HTML 파일에서 JSON Data 읽어오기</div>
    </div>

    <div id="panelView">
      <!-- 이 위치에 Json 객체의 값을 Table형태로 출력 -->
    </div>
</body>
</html>