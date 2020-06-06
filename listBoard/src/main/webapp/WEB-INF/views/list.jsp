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
<c:set var="list" value="${listVO.boardVO }"/>
<div class="container" id="Context">
  <h2>전체 글 수 ${listVO.totalCount }</h2>
  <hr>
  	<input type="button" value="글쓰기" name="write" class="button" onclick="insert()">
  	<input type="button" value="삭제" name="delete" class="button">
  	<div align="right" style="display: inline-block; float: right;">
  	<form>
		<input type="search">
		<input type="submit" value="검색">
	</form>
	</div>
  <table class="table table-striped">
    <thead>
      <tr>
      	<th><input type="checkbox" name="check" class="check" onclick="check()"></th>
        <th>번호</th>
        <th>[분류]제목</th>
        <th>글쓴이</th>
        <th>조회</th>
        <th>게시일</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${list.size() == 0}">
        <td colspan="6" align="center">게시글이 없습니다. 첫번째 게시글의 주인공이 되어주세요.</td>
    </c:if>
	  <c:if test="${list.size() > 0}">
	  <c:forEach var="item" items="${list}" varStatus="status">
      <tr>
      	<td><input type="checkbox" name="check" id="check" class="check"></td>
        <td>${item.idx }</td>
        <td><a href="update?idx=${item.idx}">[${item.category}]${item.title }</a></td>
        <td>${item.writer }</td>
        <td>${item.ref }</td>
        <td><fmt:formatDate value="${item.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
	  </c:forEach>
      </c:if>
    </tbody>
  </table>
</div>

 <ul class="pagination pagination-sm justify-content-center" style="margin:20px 0">
    <li class="page-item">
    <c:if test="${listVO.currentPage > 3}">
	    <a class="page-link" aria-label="Previous" href="list?page=${listVO.currentPage - 3 }">
			<span aria-hidden="true">&laquo;</span>
	       	<span class="sr-only">Previous</span>
	    </a>
	</c:if>
    </li>
    <li class="page-item">
    <c:if test="${listVO.currentPage > 2}">
	    <a class="page-link" href="list?page=${listVO.currentPage - 2 }">
	    	${listVO.currentPage - 2 }
	    </a>
	</c:if>
    </li>
    <li class="page-item">
    <c:if test="${listVO.currentPage > 1}">
    	<a class="page-link" href="list?page=${listVO.currentPage - 1 }">
    		${listVO.currentPage - 1 }
    	</a>
   	</c:if>
    </li>
    <li class="page-item disabled">
    	<a class="page-link">
    		${listVO.currentPage}
    	</a>
    </li>
    <li class="page-item">
    <c:if test="${listVO.currentPage < listVO.totalPage}">
    	<a class="page-link" href="list?page=${listVO.currentPage + 1 }">
    		${listVO.currentPage + 1 }
    	</a>
   	</c:if>
    </li>
    <li class="page-item">
    <c:if test="${listVO.currentPage + 1 < listVO.totalPage}">
    	<a class="page-link" href="list?page=${listVO.currentPage + 2 }">
    		${listVO.currentPage + 2 }
    	</a>
   	</c:if>
    </li>
    <li class="page-item">
    <c:if test="${listVO.currentPage + 2 < listVO.totalPage}">
		<a class="page-link" aria-label="Next" href="list?page=${listVO.currentPage + 3 }">
        	<span aria-hidden="true">&raquo;</span>
        	<span class="sr-only">Next</span>
       	</a> 
    </c:if>
	</li>
  </ul>

</body>
<script type="text/javascript">
  
function check() {
	var check = document.getElementsByName('check')[0].getAttribute('checked');
	var size = document.getElementsByName("check").length;
	if(!check){
		for(var i = 0; i < size; i++){ 
			document.getElementsByName("check")[i].setAttribute('checked', true )
		}
	}else if(check){
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

