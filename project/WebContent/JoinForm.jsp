<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="css/header.css" rel="stylesheet" style="text/css" />
	<link href="css/footer.css" rel="stylesheet" style="text/css" />
	<link href="css/join.css" rel="stylesheet" style="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>


	
	<script type="text/javascript">
			
			function checkValue()
			{
				if(!document.userInfo.id.value){
					alert("아이디를 입력하세요.");
					return false;
			}
				if(!document.userInfo.password.value){
					alert("비밀번호를 입력하세요.");
					return false;
			}
				// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
				if(document.userInfo.password.value != document.userInfo.passwordcheck.value){
					alert("비밀번호를 동일하게 입력하세요.");
					return false;
				}
			}
			function goLoginForm(){
				location.href="LoginForm.jsp";
			}
			function openIdChk(){
				window.name = "parentForm";
				window.open("IdCheckForm.jsp",
				"chkForm", "width=500, height=300, resizable = no, scrollbars=no");
				}
				// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
				// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력
				// 다시 중복체크를 하도록 한다.
				function inputIdChk(){
				document.userInfo.idDuplication.value ="idUncheck";
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
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다. -->
		<div id="wrap">
			<br><br>
			<b><font size="6" color="gray">회원가입</font></b>
			<br><br><br>
				
				
			<form method="post" action="JoinPro.jsp" name="userInfo"
					onsubmit="return checkValue()">
				<table>
					<tr>
						<td id="title">아이디</td>
						<td>
							<input type="text" name="id" maxlength="20" onkeydown="inputIdChk()" >
							<input type="button" value="중복확인" onclick="openIdChk()">
							<input type="hidden" name="idDuplication" value="idUncheck" >
						</td>
					</tr>
					<tr>
							<td id="title">비밀번호</td>
							<td>
								<input type="password" name="password" maxlength="15">
							</td>
					</tr>
					<tr>
							<td id="title">비밀번호 확인</td>
							<td>
								<input type="password" name="passwordcheck" maxlength="15">
							</td>
					</tr>
					<tr>
							<td id="title">이름</td>
							<td>
								<input type="text" name="name" maxlength="40">
							</td>
					</tr>
					<tr>
							<td id="title">성별</td>
							<td>
								<input type="radio" name="gender" value="남" checked>남
								<input type="radio" name="gender" value="여" checked>여
							</td>	
					</tr>
					<tr>
							<td id="title">생일</td>
							<td>
								<input type="text" name="birthyy" maxlength="4" placehold="년(4자)"/>
								<select name="birthmm">
									<option value="">월</option>
									<option value="01" >1</option>
									<option value="02" >2</option>
									<option value="03" >3</option>
									<option value="04" >4</option>
									<option value="05" >5</option>
									<option value="06" >6</option>
									<option value="07" >7</option>
									<option value="08" >8</option>
									<option value="09" >9</option>
									<option value="10" >10</option>
									<option value="11" >11</option>
									<option value="12" >12</option>
								</select>
								<input type="text" name="birthdd" maxlength="2" placehold="일"/>
							</td>
					</tr>
					<tr>
							<td id="title">이메일</td>
							<td>
								<input type="text" name="mail1" maxlength="30">@
								<select name="mail2">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>nate.com</option>
								</select>
							</td>
					</tr>
					<tr>
							<td id="title">휴대전화</td>
							<td>
								<input type="text" name="phone" />
							</td>
					</tr>
					<tr>
							<td id="title">주소</td>
							<td>
								<input type="text" size="50" name="address"/>
							</td>
					</tr>
				</table>
				<br>
				<a><input type="submit" value="가입" id="bottom"/></a>
				<a><input type="button" value="취소" onClick="goLoginForm()" id="bottom"/></a>
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
</body>
</html>