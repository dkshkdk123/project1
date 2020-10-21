<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO" %>
<%@ page import="jsp.member.model.MemberBean" %>
<%  request.setCharacterEncoding("UTF-8"); %>   
<!DOCTYPE html>
<html>
<head>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	<style type="text/css">
		table{margin-left:auto;margin-right:auto;border:3px solid skyblue;}
		td{border:1px solid skyblue}
		#title{background-color:skyblue}
		.content{clear: both; width:1280px; height:600px; margin:0 auto; text-align:center;}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		String id = session.getAttribute("sessionID").toString();
	
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean memberBean = dao.getUserInfo(id);
	%>
	<title>회원정보 수정화면</title>

	
	<script type="text/javascript">
		function init(){
				setComboValue("<%=memberBean.getMail2()%>");
		}
		function setComboValue(val)
		{
				var selectMail = document.getElementById('mail2'); // select 아이디를
				for (i = 0, j = selectMail.length; i < j; i++) // select 하단 optio
				{
					if (selectMail.options[i].value == val) // 입력된값과 option의
				{
					selectMail.options[i].selected = true; // 같은경우라면 체크되
					break;
				}
			}
		}
		function checkValue() {
			if(!document.userInfo.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
		}
	</script>
	
</head>
<body onload="init()">
	<div class="wrap2">
        <jsp:include page="header.jsp"></jsp:include>
        <div class="content">
			<br><br>
			<b><font size="6" color="gray">회원정보 수정</font></b>
			<br><br><br>
			
			<form method="post" action="ModifyPro.jsp"
					name="userInfo" onsubmit="return checkValue()">
				<table>
					<tr>
						<td id="title">아이디</td>
						<td id="title"><%=memberBean.getId() %></td>
					</tr>
					<tr>
						<td id="title">비밀번호</td>
						<td>
							<input type="password" name="password" maxlength="50"
								value="<%=memberBean.getPassword()%>">
						</td>
					</tr>
				</table>
				<br><br>
				<table>
					<tr>
						<td id="title">이름</td>
						<td><%=memberBean.getName() %></td>
					</tr>
					<tr>
						<td id="title">성별</td>
						<td><%=memberBean.getGender()%></td>
					</tr>
					<tr>
						<td id="title">생일</td>
						<td>
							<%=memberBean.getBirthyy() %>년
							<%=memberBean.getBirthmm() %>월
							<%=memberBean.getBirthdd() %>일
						</td>
					</tr>
					<tr>
						<td id="title">이메일</td>
						<td>
							<input type="text" name="mail1" maxlength="50"
								value="<%=memberBean.getMail1() %>">
							@
							<select name="mail2" id="mail2">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net" >daum.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td id="title">휴대전화</td>
						<td>
							<input type="text" name="phone" value="<%=memberBean.getPhone()%>"/>
						</td>
					</tr>
					<tr>
						<td id="title">주소</td>
						<td>
							<input type="text" size="50" name="address"
								value="<%=memberBean.getAddress() %>"/>
						</td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="취소" onclick="javascript:window.location='MainLogoutForm.jsp'"/>
				<input type="submit" value="수정" onclick="javascript:window.location='ModifyPro.jsp'"/>
		
		
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>