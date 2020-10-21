<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="css/adheader.css" rel ="stylesheet" style="text/css"/>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.10.0.js" type="text/javascript"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
		<script type="text/javascript">
		function adlogout() {
			location.href="MainForm.jsp";
		}
	</script>
</head>
<body>
<jsp:include page="adheader.jsp"></jsp:include>
        <div class="content">
            <div class="left">
                <ul>
                    <h1>회원관리</h1>
                    <li><a href="">회원리스트</a></li>
                    <li><a href="">회원등급관리</a></li>
                    <li><a href="">회원그룹관리</a></li>
                    <li><a href="">회원가입환경설정</a></li>
                    <li><a href="">환경탈퇴삭제</a></li>
                </ul>
            </div>
            <div class="right">
                <nav class="rnb">
                    <a href="">홈</a>
                    <a href="">회원관리</a>
                    <a href="">회원리스트</a>
                    <ul>
                        <li>회원리스트</li>
                        <li>가입대기회원</li>
                    </ul>
                    <nav class="cnb">
                        <p>회원 정보 검색 ></p>
                    </nav>
                </nav>
                <div class="r_bot">
                <button>탈퇴</button>
                <button>회원등록</button>
                <button>선택등급이동</button>
                <table>
                    <th>성명</th>
                    <th>이메일</th>
                    <th>나이</th>
                    <th>닉네임</th>
                    <th>주소</th>
                    <th>가입일</th>
                    <th>생년월일</th>
                    <tr>
                        <td>윤재섭</td>
                        <td>apd_korea@naver.com</td>
                        <td>25</td>
                        <td>라산</td>
                        <td>관악구</td>
                        <td>20-10-20</td>
                        <td>96-12-16</td>
                    </tr>
                    <tr>
                        <td>김병석</td>
                        <td>kbs@naver.com</td>
                        <td>25</td>
                        <td>병순</td>
                        <td>의정부</td>
                        <td>20-09-11</td>
                        <td>96-05-11</td>
                    </tr>
                    <tr>
                        <td>육현석</td>
                        <td>6hs@naver.com</td>
                        <td>25</td>
                        <td>오른</td>
                        <td>제주</td>
                        <td>20-08-08</td>
                        <td>96-07-23</td>
                    </tr>
                    <tr>
                        <td>정하늘</td>
                        <td>skysky@naver.com</td>
                        <td>18</td>
                        <td>스카이</td>
                        <td>서울시</td>
                        <td>20-10-08</td>
                        <td>03-05-05</td>
                    </tr>
                    <tr>
                        <td>서지원</td>
                        <td>wesrG1@naver.com</td>
                        <td>26</td>
                        <td>wesrG1</td>
                        <td>서울시</td>
                        <td>19-12-02</td>
                        <td>95-03-01</td>
                    </tr>
                    <tr>
                        <td>윤준오</td>
                        <td>junoflow@naver.com</td>
                        <td>21</td>
                        <td>juno</td>
                        <td>청주</td>
                        <td>19-07-19</td>
                        <td>00-09-11</td>
                    </tr>
                    <tr>
                        <td>백유안</td>
                        <td>whiteUinside@daum.net</td>
                        <td>12</td>
                        <td>Uinside</td>
                        <td>대전</td>
                        <td>20-01-01</td>
                        <td>09-02-14</td>
                    </tr>
                </table>
                </div>
            </div>
            
        </div>
     	<jsp:include page="adfooter.jsp"></jsp:include>
    </div>
</body>
</html>