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
<form id="form" action="updateOK">
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
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="location.href='delete?idx=${boardVO.idx}'">
		</td>
	</tr>
</table>
</div>
</form>
</body>

<script type="text/javascript">

</script>
</html>