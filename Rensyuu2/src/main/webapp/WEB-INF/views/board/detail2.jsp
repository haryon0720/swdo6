<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>지금,만나러 갑니다</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
 
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
			<h1 style="font-family: 'Noto Serif KR', serif; color:white;">지금,<br>만나러 갑니다</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p style="color: #3d3d3d; font-family: 'Nanum Myeongjo', serif;">나는<br>몇 번 다시 태어나도</p>
			</div>
			<div class="sticky-elem main-message b">
				<p style="color: #3d3d3d;font-family: 'Nanum Myeongjo', serif;"><br>반드시 같을 길을 선택합니다</p>
			</div>
			<div class="sticky-elem main-message c">
				<p style="color: white;font-family: 'Nanum Myeongjo', serif;">나의 행복은 당신과 사는 것,<br>그러니까 당신을</p>
			</div>
			<div class="sticky-elem main-message d">
				<p style="color: white;font-family: 'Nanum Myeongjo', serif;">지금,<br>만나러 갑니다</p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#dbe6ff;">베르가 공원</strong>
				<br>
				<br>
				<br>
				엄마 '미우'가 세상을 떠나고 1년 뒤 비의 계절에<br>
				돌아온 기적같은 이야기가 펼쳐진 곳<br><br>
				싱그러움이 가득한 숲속의 자연과 함께 힐링하고 싶은 사람들에게 추천해드립니다<br>
				공원에 캠프장과 온천시설, 숙박시설도 함께 있어 일상의 느긋한 여유를 만끽할 수 있습니다<br><br>
				
				점심에는 이곳 레스토랑에서 근사한 식사를, 저녁에는 가족과 함께 BBQ파티를<br>
				그리고 여러가지 체험도 가능한 이곳에서 멋진 추억을 만들어가세요<br><br><br>
				&#9836; <span style="text-decoration:underline;text-underline-position: under;">오픈 및 휴관일</span><br>
				9시 00분 ~ 17시 00분<br> 
				수요일 휴관<br><br>
				&#165; <span style="text-decoration:underline;text-underline-position: under; ">입장료</span><br>
				무료<br>
				골든위크나 여름방학때는 입장료 200엔<br>
				<br>
				<br>
				
				<br>
				<br>
				<br>
				
				<strong style="color:#dbe6ff;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp후레루 양과자점</strong>
				
				<br>
				<br>
				<br>
				
				<div style="text-align: right;">
					<p class="description" style="color:white;">
				미우가 12년간의 유우지의 생일 케이크를 예약한 곳<br>
				미우의 유우지에 대한 따뜻한 마음을 알 수 있는 장소입니다<br><br>
				영화와 완전히 같은 케이크는 아니지만 영화의 분위기를 느껴볼 수 있습니다<br>
				현지 과일을 사용하였으며 큰 특별함이 있기보다는 정겨움이 있는 맛입니다<br><br>
				&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 오픈 및 영엽시간</span><br>
				영업시간 - 10시 ~ 19시<br>
				연중무휴<br><br>
				
				&#165; <span style="text-decoration:underline;text-underline-position: under;">가격</span><br>
				
				예산 - 999엔 ~ <br>
				<br>
 
			 </p>
			 </p>
			 </div>
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p style="font-size:50px; font-family: 'Nanum Myeongjo', serif;">
					<small></small>
					생일 케이크를 예약하고 싶어요<br>
					앞으로 12년 동안 아이가 18살 될 때까지<br>
					 
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
				<strong style="color:#dbe6ff;font-size:80px;">아케노 해바라기밭</strong><br>
				미우와 타쿠미의 아름다운 마지막 장면<br>
			 	활짝 핀 해바라기들 속에서 그들의 사랑을 확인할 수 있는 곳<br><br>
				넓은 해바라기밭에서 영화 속 장면을 재현해보세요<br>
				<br>
				7월과 8월에는 해바라기 페스티벌도 열리니 즐거운 추억을 만들어 가세요<br> 
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 800px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	  
    	 var beruga = { lat: 35.79997777404655,lng: 138.3130955006421};
    	 var hureru = {lat: 36.07609997989415,lng: 138.081905070239};
    	 var himawari = {lat:35.78025778803841, lng:138.46131289744702};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:8.5,
    	      center: hureru,
    	    });

    	  new google.maps.Marker({
    	    position: beruga,
    	    map: map,
    	    label: "베르가 공원", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: hureru,
      	    map: map,
      	    label: "후레루 양과자점",
      	    
      	  });
    	  new google.maps.Marker({
        	    position: himawari,
        	    map: map,
        	    label: "아케노 해바라기밭",
        	    
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

  <br><br>
  &#9971;아케노 히마와리밭  &#8680; 자동차(소요시간 20분)	&#8680; &#9971;베르가 공원&nbsp&nbsp<br>
  베르가 공원&#8680; 자동차(소요시간 1시간) &#8680;&#9971;후레루 양과자점<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/detail2.js"></script>
</body>
</html>

</html>