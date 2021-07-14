<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>너의 이름은</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@700&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
setTimeout(function() {			//팝업창
    opener.location.reload(); //부모창 리프레쉬
    self.close(); //현재창 닫기
    }, 5); // 0.005초후 실행 1000당 1초

function searchBoard(){
	var searchForm = document.getElementById("searchForm");
	searchForm.submit();
}
function loginNeed(){
	alert("로그인!");
}
</script>
<script type="text/javascript">
$.ajax({
	url:"/like/likeUpdate",
	type:"post",
	data:{
		user_id : user_id,
		board_no : board_no
	}
	dataType: "json",
	success: function(data){
		console.log(data);
	}
})
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
							<img alt="" src="/resources/image/search.png" width="20" height="13" style="margin-top:0px;">&nbsp;
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a>${sessionScope.loginVO.user_nm }님 환영합니다!</a>
						<a href="/user/logout">로그아웃</a>
					</div>
				</nav>
			</c:otherwise>
			
		</c:choose>

<!-- <!--  --> -->


		<section class="scroll-section" id="scroll-section-0">
			<h1 style="font-family: 'Noto Serif KR', serif; color:#fdedff;">너의 이름은</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p>그날, 별이 무수히 쏟아지던 날<br>그것은 마치 꿈 속 풍경처럼<br>그저 한 없이 아름다운 광경이었다.</p>
			</div>
			<div class="sticky-elem main-message b">
				<h4 align="center">소중한 사람!<br>잊으면 안되는 사람!<br>잊고 싶지 않았던 사람!</h4>
			</div>
			<div class="sticky-elem main-message c">
				<p>누구지, 누구? 너는 누구야?<br>너의 이름은?</p>
			</div>
			<div class="sticky-elem main-message d">
				<p><br></p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif;">히에신사</strong>
				<br>
				<br>
				<br>
				미츠하가 춤을 추고 있을 것 같은 곳<br>
				빨간 도리이가 인상적인 너의 이름은 대표 배경지<br><br>
				신사까지 가는 골목길에 늘어져있는 상점들을 구경하는 재미가 있고<br>
				몇백년을 살았을지 모르는 나무들 사이에 위치한 신사입니다.<br><br>
				
				에도 시대의 분위기를 고이 간직한 다카야마는 작은 교토라 불립니다.<br>
				운세뽑기도 체험하고<br>
				전통 사케집과 일본의 3대 와규인 히다규를 맛보세요!<br><br><br>
				&#9836; <span style="text-decoration:underline;text-underline-position: under;">보물전 개관 시간</span><br>
				10시 ~ 16시<br>
				정기 휴일은 화요일, 금요일(신사 행사에 따라 변동)<br><br>
				&#165; <span style="text-decoration:underline;text-underline-position: under; ">부적, 지폐 및 기도료</span><br>
				부적, 지폐 - 300엔 ~ 5000엔<br>
				기도료 - 개인 10000엔, 법인 20000엔<br>
				<br>
				<br>
				
				<br>
				<br>
				<br>
				
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				국립신미술관</strong>
				
				<br>
				<br>
				<br>
				<div style="text-align: right;">
					<p class="description" style="color:white;">
					

				타키와 오쿠테라 선배가 데이트를 했던 장소<br>
				
				원뿔 모양의 독특한 기둥이 인상적인 곳<br><br>
				
				각 층마다 카페와 레스토랑이 위치해있습니다.<br>
				
				데이트 장소인 살롱 더 테론드 카페는 2층에 있습니다.<br><br>
				다양한 전시를 즐길 수 있는 곳으로 기획전은 홈페이지를 참고하세요.<br>
				
				미술작품도 구경하고 타키와 오쿠테라 선배의 데이트를 같이 즐겨보세요.<br><br><br>
				
				&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 개관 시간 </span><br>
				(금요일은 20시까지 운영)<br><br>
				&#165; <span style="text-decoration:underline;text-underline-position: under;">관람 요금</span><br>
				일반 1500엔 / 대학생 1200엔 / 고등학생 이하 800엔 <br>
					</p>
				</div>
				<br>
 
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p style="font-size:50px;">
					<small></small>
					네가 이 세상 어디에 있건<br>
					내가 꼭 다시 만나러 갈 거라고<br>
					너의 이름은<br><br>
					<span style="color:#fdedff;">미츠하</span>
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
				<strong style="color:#ffedf3;font-family: 'Jua', sans-serif; font-size:80px;">스와호</strong><br>
				타테이시 공원의 고도가 꽤나 높은 곳에 위치한 스와호<br>
			 	작품 속의 황혼의 시간이 흐르는 스와호의 배경처럼<br><br>
				실제 배경지도 아름다운 노을을 감상할 수 있습니다.<br>
				미츠하와 타키가 되어<br>
				스와호에서 기적의 시간, 황혼의 시간을 보내보세요.<br> 
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	  
    	 var hie = { lat: 35.674814843187356, lng: 139.73991111104672};
    	 var museum = {lat: 35.665463310050384, lng: 139.7263739976318};
    	 var swaho = {lat: 36.05067142958834, lng:138.0855168331277};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:7.5,
    	      center: hie,
    	    });
    	  
    	  new google.maps.Marker({
    	    position: hie,
    	    map: map,
    	    label: "히에신사", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: museum,
      	    map: map,
      	    label: "국립신미술관",
      	    
      	  });
    	  new google.maps.Marker({
        	 position: swaho,
        	 map: map,
        	 label: "스와호",
        	    
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
		    	<c:when test="${sessionScope.loginVO != null }">
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
		    	</c:when>
		    	<c:otherwise>
		    		<c:choose>
				    	<c:when test="${like.like_check == 1 && like.user_id eq sessionScope.NaverId && like.board_no == detail.board_no }">
				    		<a href="/like/likeUpdate?board_no=${detail.board_no }&user_id=${sessionScope.NaverId}">
				    			<i class="fa fa-heart fa-lg" aria-hidden="true" style="color:#2bd3c6"></i>
				    		</a>
				    	</c:when>
				    	<c:otherwise>
				    		<a href="/like/likeUpdate?board_no=${detail.board_no }&user_id=${sessionScope.NaverId}">
								<i class="fa fa-heart-o fa-lg" aria-hidden="true" style="color:#2bd3c6"></i>
							</a>
				    	</c:otherwise>		    			
		    		</c:choose>		    	
		    	
		    	</c:otherwise>
		    </c:choose>
		    </c:otherwise>
		   </c:choose>
	</span>
  &nbsp&nbsp&nbsp&nbsp<br><br>
  &#9971;히에신사 &#8680; 자동차(소요시간 10뷴)	&#8680; &#9971;도쿄국립신미술관&nbsp&nbsp<br>
  도쿄국립신미술관 &#8680; 자동차(소요시간 3시간) &#8680; &#9971;스와호&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/detail1.js"></script>
</body>
</html>

</html>
