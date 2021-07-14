<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>꽃보다 남자</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet"> 	
	
	
	
	
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript">
setTimeout(function() {			//팝업창
    opener.location.reload(); //부모창 리프레쉬
    self.close(); //현재창 닫기
    }, 5); // 0.005초후 실행 1000당 1초

function searchBoard(){
	var searchForm = document.getElementById("searchForm");
	searchForm.submit();
}
</script>
</head>
<body class="before-load">
	<div class="loading">
		<svg class="loading-circle">
			<circle cx="50%" cy="50%" r="25"></circle>
		</svg>
	</div>
	
	<div class="container">
	
	<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver}">
	 			<nav class="global-nav">
				<div class="global-nav-links">	
					<ul>
						<li >
							<a href="/" class="global-nav-item">Home</a>
						</li>
						<li>
							<a href="/board/searchForm" class="global-nav-item" >Movie</a>
						</li>
						<li>
							<a href="/request/listForm" class="global-nav-item" >Request</a>
						</li>
					</ul>
			    </div>
				</nav> 
			</c:when>
			<c:when test="${sessionScope.loginVO.user_id eq 'admin'}">
				<nav class="global-nav">
				<div class="global-nav-links">
					<ul>
						<li >
							<a href="/" class="global-nav-item">Home</a>
						</li>
						<li>
							<a href="/board/searchForm" class="global-nav-item" >Movie</a>
						</li>
						<li>
							<a href="/request/listForm" class="global-nav-item">Request</a>
						</li>
						<li>
							<a href="/user/detail?user_id=${sessionScope.loginVO.user_id}" class="global-nav-item">Member</a>
						</li>
						<li>
							<a href="/board/writeForm" class="global-nav-item">Write</a>
						</li>
					</ul>					
			    </div>
				</nav> 
			</c:when>
			<c:otherwise>
				<nav class="global-nav">
				<div class="global-nav-links">	
					<ul>
						<li >
							<a href="/" class="global-nav-item">Home</a>
						</li>
						<li>
							<a href="/board/searchForm" class="global-nav-item" >Movie</a>
						</li>
						<li>
							<a href="/request/listForm" class="global-nav-item">Request</a>
						</li>
						<li>
							<a href="/user/detail?user_id=${sessionScope.loginVO.user_id}" class="global-nav-item">Member</a>
						</li>
					</ul>			
			    </div>
				</nav> 
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver }">
				<nav class="local-nav">
					<div class="local-nav-links">
						<a href="/" class="product-name"><img alt="" src="/resources/image/logo6.png" width="400" height="200" style="margin-left: -150px;"></a>
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 5px;">
							<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a href="#" onclick='window.open("/user/loginForm","_blank","height=480,width=530, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a> &nbsp;
						<a href="/user/joinForm">회원가입</a>
					</div>
				</nav>				
			</c:when>
			<c:when test="${Naver != null}">
				<nav class="local-nav">
					<div class="local-nav-links">
						<a href="/" class="product-name"><img alt="" src="/resources/image/logo6.png" width="400" height="200" style="margin-left: -150px;"></a>
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 5px;">
							<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a>${Naver}님 환영합니다!</a>
						<a href="logout">로그아웃</a>
					</div>
				</nav>
			</c:when>
			<c:otherwise>
				<nav class="local-nav">
					<div class="local-nav-links">
						<a href="/" class="product-name"><img alt="" src="/resources/image/logo6.png" width="400" height="200" style="margin-left: -150px;"></a>
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 5px;">
							<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a>${sessionScope.loginVO.user_nm }님 환영합니다!</a>
						<a href="/user/logout">로그아웃</a>
					</div>
				</nav>
			</c:otherwise>
			
		</c:choose>



		<section class="scroll-section" id="scroll-section-0">
			<h1 style="font-family: 'Jua', sans-serif; color:#ffffd9;">꽃보다<br>男子</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a" style=" font-family: 'Nanum Myeongjo', serif;">
				<p>나 네게 중요한 말을<br>하나도 못 했어</p>
			</div>
			<div class="sticky-elem main-message b" style=" font-family: 'Nanum Myeongjo', serif;">
				<p>고마워 정말<br>언제나 나를 믿어줘서</p>
			</div>
			<div class="sticky-elem main-message c" style=" font-family: 'Nanum Myeongjo', serif;">
				<p>반했어<br>바보같고 건방지고 이기적인 도묘지에게</p>
			</div>
			<div class="sticky-elem main-message d" style=" font-family: 'Nanum Myeongjo', serif;">
				<p><br></p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#dbf3ff;font-family: 'Jua', sans-serif;">교토 국립 박물관</strong>
				<br>
				<br>
				<br>
				하나자와 루이의 집이 바로 이곳입니다<br>
				넓고 화려한 이곳에서 F4의 느낌을 느낄 수 있습니다<br><br>
				교토 국립 박물관은 헤이안에서 에도시대를 중심으로 한 일본의 문화재를<br>
				전시 및 보관하고 있는 곳입니다.<br><br>
				
				상실 전시 외에도 특별 전시회도 한 해에 한 두 차례 열리고 있으니<br>
				꼭 참고하여 더욱 특별한 추억을 만들어가세요<br><br><br>
				&#9836; <span style="text-decoration:underline;text-underline-position: under;">오픈 및 휴관일</span><br>
				9시 30분 ~ 17시 00분<br>
				월요일 휴관<br><br>
				&#165; <span style="text-decoration:underline;text-underline-position: under; ">관람료</span><br>
				대학생 350엔, 일반 700엔<br> 
				<br>
				<br>
				
				<br>
				<br>
				<br>
				
				<strong style="color:#dbf3ff;;font-family: 'Jua', sans-serif;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp요코하마 코스모월드</strong>
				
				<br>
				<br>
				<br>
				
				<div style="text-align: right;">
					<p class="description" style="color:white;">
				소지로와 아키라가 오가와하라와 놀았던 유원지입니다<br>
				직접 작품 속에 들어간 것처럼 색다른 느낌을 즐겨보세요<br><br>
				이곳의 명물인 대관람차 '코스모클록21'에 커다란 시계가 붙어있어<br>
				전에 볼 수 없던 대관람차를 경험하실 수 있습니다<br><br>
				세계 최초의 수중 돌입형 제트코스터 ‘바닛슈’도 빼놓을 수 없고<br>
				저녁이 되면 관람차의 조명이 환상적인 분위기의 연출을 더해 <br>
				데이트 코스로 각광받고 있습니다<br><br><br>
				
				&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 오픈 및 영엽시간</span><br>
				
				휴관일 - 매달 상이<br>
				영업시간 - 11시 00분 ~ 20시 00분<br><br>
	
				&#165; <span style="text-decoration:underline;text-underline-position: under;">요금</span><br>
				
				3500엔, 5000엔<br>
				<br>
 
			 </p>
			 </div>
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p style="font-size:50px;">
					<!-- <small></small>
					센, 여기서 여섯 번째인<br>
					<span style="color:#fdedff;">시마 온천</span>이란 역에서 내려라
				</p> -->
			</div>
			<div class="sticky-elem desc-message b">
				<p>
					</p>
				<div class="pin"></div>
			</div>
			<div class="sticky-elem desc-message c">
				<p>
					</p>
				<div class="pin"></div>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-3">
			<p class="mid-message" style="font-size: 25px; color: white;">
				<strong style="color:#dbf3ff;font-family: 'Jua', sans-serif; font-size:80px;">우에노 동물원</strong><br>
				츠쿠시와 도묘지가 동물원에서 데이트를 하던 곳입니다<br>
			 	팬더는 우에노 동물원의 상징이기에 많은 사람들이 이곳을 방문합니다<br><br>
				대왕 판다와 수마트라 호랑이, 로랜드 고릴라 등 희소 동물도<br>
				눈으로 직접 확인 해보실 수 있습니다<br>
				연인과 함께 도묘지와 츠쿠시가 되어 작품 속으로 흠뻑 빠져보세요<br> 
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	  
    	 var kyouto = { lat: 34.990006259605174,lng: 135.7731052687765};
    	 var yokohama = {lat: 35.45629823730012,lng:139.6352878976258};
    	 var ueno = {lat: 35.71636708234266,lng: 139.77049174918415};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:6.2,
    	      center: yokohama,
    	     
    	    });

    	  new google.maps.Marker({
    	    position: kyouto,
    	    map: map,
    	    label: "교토 국립 박물관", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: yokohama,
      	    map: map,
      	    label: "요코하마 코스모월드",
      	    
      	  });
    	  new google.maps.Marker({
        	    position: ueno,
        	    map: map,
        	    label: "우에노 동물원",
        	    
        	  });
      	  
    }
  </script>
  <div style="color: white; font-size:25px;">
  <br>
  <span style="font-size:30px;"><strong >여행 일정 및 교통편 추천</strong></span>
  	<span>
  		 <!--  좋아요  -->
		   <c:choose>
		    <c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver}">
		     <a href='javascript: loginNeed();'><i class="fa fa-heart-o fa-lg" aria-hidden="true" style="color:#2bd3c6"></i></a>
		    </c:when>
		    <c:otherwise>
		    <c:choose>
		    	<c:when test="${like.like_check == 1 && like.user_id eq sessionScope.loginVO.user_id && like.board_no == detail.board_no }">
		    		<a href="/like/likeUpdate?board_no=${detail.board_no }&user_id=${sessionScope.loginVO.user_id}">
		    			<i class="fa fa-heart fa-lg" aria-hidden="true" style="color:#2bd3c6"></i>
		    		</a>
		    	</c:when>
		    	<c:otherwise>
		    		<a href="/like/likeUpdate?board_no=${detail.board_no }&user_id=${sessionScope.loginVO.user_id}">
						<i class="fa fa-heart-o fa-lg" aria-hidden="true" style="color:#2bd3c6"></i>
					</a>
		    	</c:otherwise>
		    </c:choose>
		    </c:otherwise>
		   </c:choose>
	</span>
  &nbsp&nbsp&nbsp&nbsp<br><br>
  &#9971;쿄토 국립 박물관 &#8680; 신칸센(소요시간 3시간 00분)	&#8680; &#9971;요코하마 코스모월드&nbsp&nbsp<br>
  요코하마 코스모월드 &#8680; 기차(소요시간 1시간) &#8680; &#9971;우에노 동물원<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/detail6.js"></script>
</body>
</html>

</html>
