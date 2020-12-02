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
		
		// 비밀번호 미입력시 경고창
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
	<div class="wrap2">
        <header class="hd">
            <div class="hd_top_wrap">
                <nav class="tnb">
                    <ul class="right">
                        <li><a href="LogoutPro.jsp">로그아웃</a></li>
                        <li><a href="JoinForm.jsp">회원가입</a></li>
                        <li><a href="">장바구니</a></li>
                        <li><a href="">게시판</a></li>
                        <li><a href="UserInForm.jsp">마이페이지</a></li>
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