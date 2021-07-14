<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>시간을 달리는 소녀</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
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
function loginNeed(){
	alert("로그인!");
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
			<h1 style="font-family: 'Nanum Brush Script', sans-serif; color:#a3c9ff;">시간을 달리는<br>소녀</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<br><p style="font-family: 'Nanum Brush Script', sans-serif;">「시간은 누구도 기다려주지 않는다」</p>
			</div>
			<div class="sticky-elem main-message b">
				<br><p>미래에서 기다릴게</p>
			</div>
			<div class="sticky-elem main-message c">
				<br><p>응, 금방 갈게<br>뛰어 갈게</p>
			</div>
			<div class="sticky-elem main-message d">
				<p><br></p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#a3c9ff;">후미코 기념관</strong>
				<br>
				<br>
				<br>
				마코토 집의 배경지인 하야시 후미코 기념관<br><br>
				가쿠슈인시타 역에서 언덕을 따라 올라가면<br>
				마코토가 살았던 마을이 나옵니다<br>
				일본 마을의 정취를 느낄 수 있으므로 천천히 산책하기 좋습니다<br><br>
				마코토의 집에서 길을 따라 내려오면<br>
				마코토와 치아키, 고스케가 하교 할 때 나오던 갈림길이 나옵니다<br><br>
				
				<br>
				
				<br>
				<br>

				
				<strong style="color:#a3c9ff; text-align: right;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;도쿄 국립 박물관</strong>
				
				<br>
				<br>
				<br>
				<div style="text-align: right;">
					<p class="description" style="color:white;">
						마코토가 이모에게 자주 상담을 받으러 온 곳<br>
						또한 치아키가 과거로 온 이유를 듣게 된 장소입니다<br><br>
						
						1872년에 창설된 일본에서 가장 오래된 박물관으로,<br>
						일본의 3대 박물관에 속합니다<br><br>
						
						도쿄의 벚꽃 명소인 우에노 공원이 가까이 있으므로<br>
						박물관 관람 후 공원 산책을 추천해드립니다<br><br>
					
						&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 오픈 및 휴관일</span><br>
						월요일 휴무<br>
						운영시간-9시 30분 ~ 17시 00분<br>
						(입장은 16시 30분까지)<br><br>
						
						&#165; <span style="text-decoration:underline;text-underline-position: under;">입장료</span><br>
						일반: 1000엔, 대학생:500엔
					</p>
				</div>				
				
				<br><br><br>

				
				<br>
 
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p style="font-size:50px;">
					<small></small>
					<br>
					<span style="color:#ffffff;;font-family:'Nanum Brush Script', sans-serif; ">시간은 돌아오지 않는다</span>
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
				<strong style="color:#a3c9ff;font-size:80px;">아라카와 강</strong><br>
				치아키가 몇 번이나 마코토에게 고백을 한 곳<br>
				둘이 마지막으로 서로에게 약속을 한 장소입니다<br><br>
				노을이 아름다우므로 하루 일정의 마지막으로 <br>넣는 것을 추천해드립니다.
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	
    	 var humi = { lat: 35.71589296299912,lng: 139.6842920346859};
    	 var hakubutsu = {lat: 35.72022625593432,lng: 139.77677898542615};
    	 var ara = {lat: 35.75742772310114, lng:139.80501145616748};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:11.8,
    	      center: hakubutsu,
    	     
    	    });

    	  new google.maps.Marker({
    	    position: hakubutsu,
    	    map: map,
    	    label: "도쿄 국립 박물관", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: humi,
      	    map: map,
      	    label: "후미코 기념관",
      	    
      	  });
    	  new google.maps.Marker({
        	    position: ara,
        	    map: map,
        	    label: "아라카와 강",
        	    
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
  &#9971;후미코 기념관 &#8680; 지하철(소요시간 40분)	&#8680; &#9971;도쿄 국립 박물관&nbsp&nbsp<br>
  &#8680; 지하철&도보(소요시간 40분) &#8680; &#9971;아라카와 강<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/detail3.js"></script>
</body>
</html>

</html>
