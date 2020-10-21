<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	<style type="text/css">
	#title{height : 16; font-family :'돋움'; font-size : 12; text-align :center;}
	#wrap{clear: both; width:1280px; height:600px; margin-left:600px; text-align:center;}
	#font{display:block; width:100px; line-height:20px; text:align:center;
	margin-left:320px;}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
       <jsp:include page="header.jsp"></jsp:include>
       	<div id="wrap">
			<br>
			<b id="font"><font size="6" color="gray">글쓰기</font></b>
			<br>
			
			<form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data">
			
			<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
			<table width="700" border="3" bordercolor="lightgray" align="center">
				<tr>
					<td id="title">작성자</td>
					<td>${sessionScope.sessionID}</td>
				</tr>
				<tr>
					<td id="title">
					제 목
					</td>
					<td>
					<input name="board_subject" type="text" size="70" maxlength="100">
					</td>
				</tr>
				<tr>
					<td id="title">
					내 용
					</td>
					<td>
					<textarea name="board_content" cols="72" rows="20"></textarea>
					</td>
				</tr>
				<tr>
					<td id="title">
					파일첨부
					</td>
					<td>
					<input type="file" name="board_file" />
					</td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="reset" value="작성취소" >
						<input type="submit" value="등록" >
						<input type="button" value="목록" >
					</td>
				</tr>
			</table>
			</form>
		</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>