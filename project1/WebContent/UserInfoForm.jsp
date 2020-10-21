<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO" %>
<%@ page import="jsp.member.model.MemberBean" %>
<%  request.setCharacterEncoding("UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	
	<style>
	table{margin-left:auto;margin-right:auto;border:3px solid skyblue;}
	td{border:1px solid #ffc948}
	#title{background-color:skyblue}
	.content{clear: both; width:1280px; height:600px; margin:0 auto; text-align:center;}
	.title_tit{clear both; margin-top:100px; margin-bottom:30px;}
	</style>
	<script type="text/javascript">
		function changeForm(val){
			if(val == "-1"){
					location.href="MainLogoutForm.jsp";
			}else if(val == "0"){
				location.href="ModifyForm.jsp";
			}else if(val == "1"){
				location.href="DeleteForm.jsp";
			}
		}
	</script>
</head>
<body>	

	<%
		String id = session.getAttribute("sessionID").toString();


		MemberDAO dao = MemberDAO.getInstance();
		MemberBean memberBean = dao.getUserInfo(id);

	%>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="content">
			<h2 class="title_tit">마이페이지</h2>
			<!-- 가져온 회원정보를 출력한다. -->
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><%=memberBean.getId() %></td>
				</tr>
							
				<tr>
					<td id="title">비밀번호</td>
					<td><%=memberBean.getPassword() %></td>
				</tr>
						
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
						<%=memberBean.getMail1() %>@
						<%=memberBean.getMail2() %>
					</td>
				</tr>
						
				<tr>
					<td id="title">휴대전화</td>
					<td><%=memberBean.getPhone() %></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td>
						<%=memberBean.getAddress() %>
					</td>
				</tr>
			</table>
			<br>
			<input type="button" value="뒤로" onclick="changeForm(-1)">
			<input type="button" value="회원정보 변경" onclick="changeForm(0)">
			<input type="button" value="회원탈퇴" onclick="changeForm(1)">
		</div>
		
		  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>