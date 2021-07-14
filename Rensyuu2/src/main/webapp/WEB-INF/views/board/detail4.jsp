<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>센과 치히로의 행방불명</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
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
						<a href="#" onclick='window.open("/user/loginForm","_blank","height=490,width=530, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a> &nbsp;
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
			<h1 style="font-family: 'Jua', sans-serif; color:#fdedff;">센과 치히로의<br>행방불명</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p>이름을 뺏기면<br>돌아가는 길을 잊게 돼</p>
			</div>
			<div class="sticky-elem main-message b">
				<p>무서워하지마<br>나는 너의 편이야</p>
			</div>
			<div class="sticky-elem main-message c">
				<p>자 어서 가,<br>뒤돌아보지 말고</p>
			</div>
			<div class="sticky-elem main-message d">
				<p><br></p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif;">에도 도쿄 건축 박물관</strong>
				<br>
				<br>
				<br>
				터널을 지나 이상한 기운이 흐르는 조용한 마을<br>
				치히로의 부모님이 돼지로 변해버린 바로 그 곳<br><br>
				일본의 옛 정취를 느낄 수 있어 일본이 좁다거나 우리나라와 별 다를 바 없다고<br>
				말하시는 분에게 특히 추천하고 싶은, 하루가 짧게 느껴지도록 할 대형 박물관입니다<br><br>
				
				꽃의 명소인 고가네이 공원과 목욕탕 장면의 배경인 고다카라 유<br>
				그리고 이국적인 외관의 그릇 가게인 마루니 상점도 둘러보세요<br><br><br>
				&#9836; <span style="text-decoration:underline;text-underline-position: under;">오픈 및 휴관일</span><br>
				4~9월&nbsp&nbsp  - 9시 30분 ~ 17시 30분<br>
				10~3월 - 9시 30분 ~ 16시 30분<br>
				월요일 휴관<br><br>
				&#165; <span style="text-decoration:underline;text-underline-position: under; ">관람료</span><br>
				대학생 320엔, 일반 400엔<br>
				중고등학생 및 65세 이상 200엔, 초등학생 이하 무료<br>
				<br>
				<br>
				
				<br>
				<br>
				<br>
				
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp시마 온천</strong>
				
				<br>
				<br>
				<br>
				<div style="text-align: right;">
					<p class="description" style="color:white;">
				영화 속에 들어가있는 듯한 화려한 료칸을 즐길 수 있는 곳<br>
				시마 온천 중 세키젠칸 료칸이 바로 그 배경지입니다<br><br>
				
				이 온천은 에도시대 때 지어져 현재 일본에서 가장 오래된 온천이라고 합니다<br>
				
				일본 최초로 건강 효능을 인정받은 온천에 몸을 담그고 상쾌한 기분을 느껴보세요<br><br>
				내부를 거닐다 로마네스크풍 욕탕에서 온천욕을 즐기고<br>
				
				이곳을 찾아 온천욕을 즐겼던모든 역사 속 인물을 떠올려보는 것도 추천해드립니다<br><br><br>
			
				&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 오픈 및 영엽시간</span><br>
				연중무휴<br>
				영업시간(온천) - 9시 - 15시<br><br>
				
				&#165; <span style="text-decoration:underline;text-underline-position: under;">객실 요금</span><br>
				2인기준 : 8800엔 ~ <br>
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
					<small></small>
					센, 여기서 여섯 번째인<br>
					<span style="color:#fdedff;">시마 온천</span>이란 역에서 내려라
				</p>
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
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif; font-size:80px;">시모나다 역</strong><br>
				바다 한가운데 역이 있는 듯한 분위기를 자아내어<br>
			 	작품 속의 신비로움이 더해진 곳<br><br>
				철로가 바다로 이어지는 장면도 재현하여<br>
				사진찍는 재미도 곁들였습니다<br>
				시모나다역에서 넓푸른 바다를 보며 자연의 아름다움을 경험해보세요<br> 
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	  
    	 var simonada = { lat: 33.65537671663174,lng: 132.5895349550526};
    	 var edo = {lat: 35.69655361476555,lng: 139.79644170080147};
    	 var simaonsen = {lat: 36.68646354188707, lng:138.77388008416986};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:5.3,
    	      center: edo,
    	     
    	    });

    	  new google.maps.Marker({
    	    position: edo,
    	    map: map,
    	    label: "에도 도쿄 건축 박물관", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: simonada,
      	    map: map,
      	    label: "시모나다 역",
      	    
      	  });
    	  new google.maps.Marker({
        	    position: simaonsen,
        	    map: map,
        	    label: "시마온천",
        	    
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
  &#9971;에도 도쿄 건축박물관 &#8680; 기차(소요시간 3시간 30분)	&#8680; &#9971;시마온천&nbsp&nbsp<br>
  시마온천 &#8680; 기차(소요시간 2시간) &#8680; 하네다 공항&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br>
  하네다 공항 &#8680; 비행기(소요시간 4시간) &#8680; &#9971;시모나다 역<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/main.js"></script>
</body>
</html>

</html>
