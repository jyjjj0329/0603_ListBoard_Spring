<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<div align="center">
	<form action="insertOK">
	<table border="1">
		<tr>
			<td>
				<select name="category">
					<option value="Notice">Notice</option>
					<option value="gallery">갤러리</option>
				</select>
			</td>
			<td> 작성자 </td> 
			<td> <input type="text" name="writer"/> </td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="4"><input type="text" name="title" style="width: 300px;"/></td>
		</tr>
		<tr>
			<td>내용 </td>
			<td colspan="3"> <textarea rows="5" cols="50" name="content"></textarea>
		</tr>
		<tr>
			<td colspan="5"><input type="submit" value="입력"></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>