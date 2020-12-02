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
		// 비밀번호 입력여부 체크
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
        <header class="hd">
            <div class="hd_top_wrap">
                <nav class="tnb">
                    <ul class="right">
                        <li><a href="MainForm.jsp">로그아웃</a></li>
                        <li><a href="JoinForm.jsp">회원가입</a></li>
                        <li><a href="">장바구니</a></li>
                        <li><a href="BoardListForm.jsp">게시판</a></li>
                        <li><a href="UserInfoForm.jsp">마이페이지</a></li>
                        <li><a href="">고객센터</a></li>
                    </ul>
                </nav>
            </div>
            <div class="hd_bottom_wrap">
                <nav class="gnb">
                    <ul class="bottom_left">
                        <a href="" class="logo"></a>
                    </ul>
                    <ul class="bottom_right">
                    <li><a href="">꽃 정기구독</a></li>
                    <li><a href="">꽃다발</a></li>
                    <li><a href="">테마 정기구독</a></li>
                    <li><a href="">플랜트</a></li>
                    <li><a href="">소품</a></li>
                    <li><a href="">EVENT</a></li>
                    <li><a href="">당신의 꾸까</a></li>
                </ul>
                </nav>
            </div>
        </header>
        <div class="content">
			<br><br>
			<b><font size="6" color="gray">회원정보 수정</font></b>
			<br><br><br>
			
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<!-- 값(파라미터) 전송은 POST 방식 -->
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
		<footer class="ft">
	            <div class="ft_wrap">
	                <ul class="ft_col">
	                    <li class="ft_box">
	                        <p id="ft_point">꽃 오는날 꾸까_kukka</p>
	                        <p id="ft_nomal">COMPANY : 꽃 오는날 꾸까_kukka</p>
	                        <p id="ft_nomal">CEO : 김병석</p>
	                        <p id="ft_nomal">CPO : 김진아( <a href="" id="ft_a">dkshkdk123@naver.com</a> )</p>
	                        <p id="ft_nomal">ADDRESS :  경기도 의정부시 용현동</p>
	                        <p id="ft_nomal" style="margin-left: 75px;"> 세아 2차 아파트 102동 603호</p>
	                    </li>
	                    <li class="ft_box">
	                        <p id="ft_point">CS CENTER</p>
	                        <p id="ft_point">TEL:02-812-1237</p>
	                        <p id="ft_nomal">OPEN:AM 09:00~PM 18:00/Sat, Sun, Holiday OFF</p>
	                        <p id="ft_nomal">LUNCH BREAK PM 12:00~PM 13:00</p>
	                        <p id="ft_point" style="margin-top: 30px;">CS CENTER</p>
	                        <p id="ft_nomal">예금주:김병석</p>
	                        <p id="ft_nomal">국민은행 1002-453-128382</p>
	                    </li>
	                    <li class="ft_box">
	                        <a href="" class="sns_btn"><img src="./img/facebook.jpg" alt=""></a>
	                        <a href="" class="sns_btn"><img src="./img/instagram.jpg" alt=""></a>    
	                        <a href="" class="sns_btn"><img src="./img/naverblog.jpg" alt=""></a>
	                        <p id="ft_point">DELIVERY INFO</p>
	                        <p id="ft_nomal">배송조회 : <a href="" id="ft_a">CJ대한통운 조회</a></p>
	                        <p id="ft_nomal">반송주소 : 경기도 고양시 일산서구 가좌동 933번지</p>
	                        <p id="ft_nomal">자세한 교환/반품 안내는 문의란 및 FAQ를 참고해주세요.</p>
	                        <h4 class="ft_tit4"></h4>
	                    </li>
	                </ul>
	            </div>
	        </footer>
</body>
</html>