<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/text.css" rel = " stylesheet" style="text/css"/>
	
	<script type="text/javascript">
		

		function checkValue(){
			if(!document.deleteform.password.value){
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		function changeForm2(val){
			if(val == "0"){
					location.href="UserInfoForm.jsp";
			}
		}
	</script>
</head>
<body>
      <jsp:include page="header.jsp"></jsp:include>
        
    <div class="content">
		<br><br>
		<b><font size="6" color="gray">내 정보</font></b>
		<br><br><br>
		
		<form name="deleteform" method="post" action="DeletePro.jsp"
			onsubmit="return checkValue()">
			<table>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>
			
			<br>
			<input type="button" value="취소" onclick="changeForm2(0)"/>	
			<input type="submit" value="탈퇴" />
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>