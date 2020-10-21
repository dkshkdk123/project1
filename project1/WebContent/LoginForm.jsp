<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/login.css" rel = " stylesheet" style="text/css"/>
	
<meta charset="UTF-8">
<title>Insert title here</title>
	<%

	request.setCharacterEncoding("UTF-8");
	%>
	
	<script type="text/javascript">
		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				alert("비밀번호를 입력하세요");
				inputForm.password.focus();
				return false;
				}
			}

		function goJoinForm() {
				location.href="JoinForm.jsp";
		}
	</script>
</head>
<body>
      <jsp:include page="header.jsp"></jsp:include>

		<div class="contents">
			<h2>로그인</h2>
            <span style="color: #888888; font-size: 12px;">회원 로그인을 하시면 각종 혜택 및 정보를 제공 받으실 수 있습니다</span>
			<form name="loginInfo" method="post" action="LoginPro.jsp"
			onsubmit="return checkValue()">

				<br><br>
				<table>
					<tr>
						<td bgcolor="skyblue">아이디</td>
						<td><input type="text" name="id" maxlength="50"></td>
					</tr>
					<tr>
						<td bgcolor="skyblue">비밀번호</td>
						<td><input type="password" name="password" maxlength="50"></td>
					</tr>
				</table>
					<br>
					<input type="submit" value="로그인"/>
					<input type="button" value="회원가입" onclick="goJoinForm()" />
			</form>
			<%
				
				String msg=request.getParameter("msg");
			
				if(msg!=null && msg.equals("0"))
				{
					out.println("<br>");
					out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
				}
				else if(msg!=null && msg.equals("-1"))
				{
					out.println("<br>");
					out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
				}
			%>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
     </div>
</body>
</html>