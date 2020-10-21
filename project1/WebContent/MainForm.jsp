<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href ="css/header.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/footer.css" rel = " stylesheet" style="text/css"/>
	<link href ="css/content.css" rel = " stylesheet" style="text/css"/>
	  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script>
function ani() {
    $(".ban").not(":animated").animate({"margin-left":"-1920px"},500, function(){
        $(".ban li").eq(0).appendTo(".ban");
        $(".ban").css("margin-left","0");
    });
}
var intv = setInterval(function(){ ani(); }, 4000);
</script>
	<script type="text/javascript">
		function logoutPro(){
			location.href="LogoutPro.jsp";
		}
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
	        <div class="contents">
	            <figure class="vs">
	                <ul class="ban">
	                    <li><a href="shop.html"><img src="./img/배너1.jpg" alt=""></a></li>
	                    <li><a href="shop.html"><img src="./img/배너2.jpg" alt=""></a></li>
	                    <li><a href="event.html"><img src="./img/배너1.jpg" alt=""></a></li>
	                </ul>
	            </figure>
	        <section class="page" id="page1">
	            <h2 class="page_tit_s">2주에 한번, 정기구독상품</h2>
	            <h5 class="page_tit_l">subscription</h5>
	            <ul class="lst1">
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/메인배너1.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/메인배너2.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/메인배너3.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	            </ul>
	        </section> 
	        <div class="contents2">
	            <figure class="vs2">
	                <ul class="ban2">
	                    <li><a href="shop.html"><img src="./img/images_1.png" alt=""></a></li>
	                    <li><a href="shop.html"><img src="./img/images_2.png" alt=""></a></li>
	                    <li><a href="event.html"><img src="./img/images_4.png" alt=""></a></li>
	                </ul>
	            </figure> 
	        <section class="page2" id="page2">
	            <h2 class="page_tit_s2">꾸까와 함께 사랑을 전하세요</h2>
	            <h5 class="page_tit_l2">Products</h5>
	            <ul class="lst2">
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너1.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너2.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너3.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너4.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너5.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너6.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너7.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	                <li>
	                    <a href="shop.html">
	                        <img src="./img/서브배너8.jpg" alt="임시이미지" class="pic">
	                    </a>
	                </li>
	            </ul>
	        </section> 
	        </div>
	        <jsp:include page="footer.jsp"></jsp:include>      
	    </div>


</body>
</html>