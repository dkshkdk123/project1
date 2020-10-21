<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	<style type="text/css">
		#wrap{clear: both; width:1280px; height:600px; 
		margin-left:600px; margin-top:200px; text-align:center;}
		#topForm{text-align :center; margin-left:275px;}
		#board, #pageForm, #searchForm{text-align :center; margin-right:400px;
		margin-top:10px;}
		#bList{text-align :center;}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	<script type="text/javascript">
		function writeForm(){
			location.href="BoardWriteForm.jsp";
		}
	</script>
	
</head>
<body>
       <jsp:include page="header.jsp"></jsp:include>
	<div id="wrap">
		<br>
		<div id="topForm">
			<c:if test="${sessionScope.sessionID!=null}">
				<input type="button" value="글쓰기" onclick="writeForm()">
			</c:if>
		</div>
		<br>
		<div id="board">
			<table id="bList" width="800" border="3" bordercolor="lightgray">
				<tr heigh="30">
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
			</table>
		</div>
		<br>
		<div id="pageForm">
		페이지 번호
		</div>
		<br>
		<div id="searchForm">
			<form>
				<select name="opt">
					<option value="0">제목</option>
					<option value="1">내용</option>
					<option value="2">제목+내용</option>
					<option value="3">글쓴이</option>
				</select>
				<input type="text" size="20" name="condition"/>&nbsp;
				<input type="submit" value="검색"/>
			</form>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>