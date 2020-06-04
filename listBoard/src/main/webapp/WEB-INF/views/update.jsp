<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
</head>
<body>
<form id="form">
<input type="hidden" value="${boardVO.idx }" name="idx">
<div align="center">
<table>
	<tr>	
		<td>분류</td>
		<td>${boardVO.category }</td>
		<td>작성자</td>
		<td>${boardVO.writer }</td>
	</tr>
	<tr>	
		<td>조회수</td>
		<td>${boardVO.ref }</td>
		<td>날짜</td>
		<td><fmt:formatDate value="${boardVO.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	</tr>
	<tr>	
		<td>제목</td>
		<td colspan="3">
		<input type="text" name="title" value="${boardVO.title }" class="title"/>
		</td>
	</tr>
	<tr>	
		<td>내용</td>
		<td colspan="3">
		<textarea rows="5" cols="50" name="content" class="content">${boardVO.content }</textarea>
		</td>
	</tr>
	<tr>	
		<td colspan="4">
			<input type="button" value="수정" onclick="updateOK()">
			<%-- <input type="button" value="삭제" onclick="location.href='delete?idx=${boardVO.idx}'"> --%>
			<input type="button" value="삭제" onclick="delete2()">
		</td>
	</tr>
</table>
</div>
</form>
</body>

<script type="text/javascript">
function delete2() {
	$.ajax({
		type: "Get",
		url: "delete",
		async: false,
		data: {"idx": ${boardVO.idx}},
			success: function(data){
				console.log("삭제 성공");
				location.href="list";
				/* location.reload; */
			}, error: function(){
				console.log("삭제 실패")
			}
	});
};

function updateOK() {
	$.ajax({
		type: "Post",
		url: "updateOK",
		data: $("#form").serialize(),
			success: function(data){
				console.log("수정 성공");
				location.href="list";
				/* location.reload; */
			}, error: function(){
				console.log("수정 실패")
			}
	});
};
</script>
</html>