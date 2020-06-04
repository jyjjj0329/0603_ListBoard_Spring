<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script>


</script>
<style type="text/css">
  .button {
  	height: 25px; 
  	font-size: 15px;
  	background: white;
  	border-color: gray;
  	margin-bottom: 5px;
  	text-align: center;
  }
  
  </style>
</head>
<body>
<div class="container" id="Context">
  <h2>전체 글보기 ${totalCount }</h2>
  <hr>
  	<input type="button" value="전체 선택" id="AllCheck" class="button" onclick="AllCheck()">
  	<input type="button" value="글쓰기" name="write" class="button" onclick="insert()">
  	<input type="button" value="삭제" name="delete" class="button">
  <table class="table table-striped">
    <thead>
      <tr>
      	<th><input type="checkbox" name="check" class="check" onclick="check()"></th>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>조회</th>
        <th>게시일</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${boardVO.size() == 0}">
        <td colspan="6" align="center">게시글이 없습니다. 첫번째 게시글의 주인공이 되어주세요.</td>
    </c:if>
	  <c:if test="${boardVO.size() > 0}">
	  <c:forEach var="item" items="${boardVO}" varStatus="status">
      <tr>
      	<td><input type="checkbox" name="check" id="check" class="check"></td>
        <td>${status.count }</td>
        <td><a href="update?idx=${item.idx}">${item.title }</a></td>
        <td>${item.writer }</td>
        <td>${item.ref }</td>
        <td><fmt:formatDate value="${item.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
	  </c:forEach>
      </c:if>
    </tbody>
  </table>
</div>

</body>
<script type="text/javascript">
  
function AllCheck() {
var AllCheck = document.getElementById("AllCheck");
var check = document.getElementsByName('check')[0].getAttribute('checked');
	alert("실행")
	var size = document.getElementsByName("check").length;
		if(AllCheck.value == '전체 선택' || !check){
			for(var i = 0; i < size; i++){ 
				document.getElementsByName("check")[i].setAttribute('checked', true )
			}
			AllCheck.value = '전체 해제';
		}else{
			for(var i = 0; i < size; i++){ 
				document.getElementsByName("check")[i].removeAttribute('checked')
			}
			AllCheck.value = '전체 선택';
		}
	
}

function check() {
	var check = document.getElementsByName('check')[0].getAttribute('checked');
	var size = document.getElementsByName("check").length;
	if(!check){
		for(var i = 0; i < size; i++){ 
			document.getElementsByName("check")[i].setAttribute('checked', true )
		}
	}else{
		for(var i = 0; i < size; i++){ 
			document.getElementsByName("check")[i].removeAttribute('checked')
		}
	}
}

function insert(){
	$.ajax({
		type: "Post",
		url: "insert",
		async: false,
		success: function(){
			console.log("글쓰기 페이지로 이동");
			location.href="insert";
			/* location.reload; */
		}, error: function(){
			console.log("글쓰기 페이지로 이동 실패")
		}
	});
}

</script>
</html>

