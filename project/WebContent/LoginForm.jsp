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
// 인코딩 처리
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
		// 회원가입 버튼 클릭시 회원가입 화면으로 이동
		function goJoinForm() {
				location.href="JoinForm.jsp";
		}
	</script>
</head>
<body>
	<div class="wrap2">
        <header class="hd">
            <div class="hd_top_wrap">
                <nav class="tnb">
                    <ul class="right">
                        <li><a href="LoginForm.jsp">로그인</a></li>
                        <li><a href="JoinForm.jsp">회원가입</a></li>
                        <li><a href="">장바구니</a></li>
                        <li><a href="">게시판</a></li>
                        <li><a href="">마이페이지</a></li>
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
				// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
				// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
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
                        <a href="" class="sns_btn"><img src="img/facebook.jpg" alt=""></a>
                        <a href="" class="sns_btn"><img src="img/instagram.jpg" alt=""></a>    
                        <a href="" class="sns_btn"><img src="img/naverblog.jpg" alt=""></a>
                        <p id="ft_point">DELIVERY INFO</p>
                        <p id="ft_nomal">배송조회 : <a href="" id="ft_a">CJ대한통운 조회</a></p>
                        <p id="ft_nomal">반송주소 : 경기도 고양시 일산서구 가좌동 933번지</p>
                        <p id="ft_nomal">자세한 교환/반품 안내는 문의란 및 FAQ를 참고해주세요.</p>
                        <h4 class="ft_tit4"></h4>
                    </li>
                </ul>
            </div>
        </footer>
     </div>
</body>
</html>