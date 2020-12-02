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

		//세션에 저장된 아이디를 가져와서
		// 그 아이디 해당하는 회원정보를 가져온다.
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean memberBean = dao.getUserInfo(id);

	%>
	 <div class="wrap2">
        <header class="hd">
            <div class="hd_top_wrap">
                <nav class="tnb">
                    <ul class="right">
                        <li><a href="MainLogoutForm.jsp">로그아웃</a></li>
                        <li><a href="JoinForm.jsp">회원가입</a></li>
                        <li><a href="">장바구니</a></li>
                        <li><a href="">게시판</a></li>
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