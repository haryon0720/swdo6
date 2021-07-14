<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>장난스런 키스</title>
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
			<h1 style="font-family: 'Jua', sans-serif; color:#ffd9e6;">장난스런 키스</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p>이리에<br>안녕?</p>
			</div>
			<div class="sticky-elem main-message b">
				<p>난 F반<br>아이하라 고토코야</p>
			</div>
			<div class="sticky-elem main-message c">
				<p>넌 날 모르겠지만<br>난 널 알아</p>
			</div>
			<div class="sticky-elem main-message d">
				<p><br></p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif;">핫포엔</strong>
				<br>
				<br>
				<br>
				나오키가 고토코가 아닌 다른 여자와 맞선을 봤던 화려한 호텔이 바로 이곳입니다<br>
				도심 한 가운데에서 일본의 기품을 느끼고 싶은 여행자에게 추천합니다<br><br>
				연못을 중심으로 한 정원에 여러 건물들이 아름답게 배치되어 있어<br>
				계절마다의 풍경을 제대로 즐길 수 있습니다<br><br>
				
				정원을 산책 한 다음 카이세키 레스토랑에서 맛있는 요리를 맛보고<br>
				특히 커플들에게는 이곳에서의 분위기를 사진으로 담아 아름다운 추억으로 간직하세요<br><br><br>
				&#9836; <span style="text-decoration:underline;text-underline-position: under;">오픈 및 휴관일</span><br>
				영업시간: 시설에 따라 다릅니다<br><br> 
				&#165; <span style="text-decoration:underline;text-underline-position: under; ">요금</span><br>
				시설에 따라 다릅니다<br> 
				<br>
				<br>
				
				<br>
				<br>
				<br>
				
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp도쿄 타워</strong>
				
				<br>
				<br>
				<br>
				
				<div style="text-align: right;">
					<p class="description" style="color:white;">
				
				고토코와 고토코 친구들이 나오키를 찾던 공원입니다<br>
				도쿄 타워 밑에서 그들의 이야기를 따라가보세요<br><br>
				오랫동안 사람들의 가슴 속에 소박한 빛을 밝혀 준 영원한 도쿄의 심볼<br>
				도쿄 타워 전망대에 올라가서 도쿄의 화려한 야경을 한눈에 감상해보세요<br><br>
				도쿄타워에는 여름과 겨울버전의 라이트 업 패턴으로<br>
				깜깜한 밤을 아름답게 비춥니다<br><br><br>

				&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 오픈 및 영엽시간</span><br>
				연중무휴<br>
				영업시간 - 9시 00분 ~ 23시 00분<br><br>
								
				&#165; <span style="text-decoration:underline;text-underline-position: under;">요금</span><br>
 
				1600엔(대전망대 900엔, 특별전망대 700엔)<br>
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
					<span style="color:#fdedff;">시마 온천</span>이란 역에서 내려라 -->
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
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif; font-size:80px;">오다이바</strong><br>
				고토코와 나오키가 처음으로 데이트를 한 장소<br>
			 	레인보우 브릿지와 자유의 여신상을 동시에 보이는 장면을 직접 눈으로 확인하실 수 있습니다<br><br>
				복합쇼핑몰도 있어 쇼핑도 함께할 수 있으며<br>
				건담 카페도 있어서 건담을 좋아하는 매니아에게는 일석이조입니다<br>
				볼거리 즐길거리가 많은 이곳에 꼭 놀러와보세요<br> 
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	  
    	 var tokyoutower = { lat: 35.6586763697215, lng: 139.7454328976318};
    	 var odaiba = {lat: 35.62496453791798,lng: 139.77401627549028};
    	 var happouen = {lat: 35.63842082938315,lng: 139.72781142593607};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:11,
    	      center: odaiba,
    	     
    	    });

    	  new google.maps.Marker({
    	    position: odaiba,
    	    map: map,
    	    label: "오다이바", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: tokyoutower,
      	    map: map,
      	    label: "도쿄 타워",
      	    
      	  });
    	  new google.maps.Marker({
        	    position: happouen,
        	    map: map,
        	    label: "핫포엔",
        	    
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
  &#9971;핫포엔 &#8680; 자동차(소요시간 12분)	&#8680; &#9971;도쿄타워&nbsp&nbsp<br> 
  도쿄타워 &#8680;자동차(소요시간 14분) &#8680; &#9971;오다이바<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/detail5.js"></script>
</body>
</html>

</html>
