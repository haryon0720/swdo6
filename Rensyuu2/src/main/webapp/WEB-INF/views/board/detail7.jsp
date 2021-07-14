<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>고독한 미식가</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">	
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
						<a href="#" onclick='window.open("/user/loginForm","_blank","height=400,width=530, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a> &nbsp;
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
			<h1 style="font-family: 'Do Hyeon', sans-serif; color:#ebd831;">고독한 미식가</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a" style="font-family: 'Nanum Brush Script', cursive;">
				<p style="font-size:150px;">배고프다</p>
			</div>
			<div class="sticky-elem main-message b" style="font-family: 'Nanum Brush Script', cursive;">
				<p style="color:black; font-size:100px;">오늘의 대전 상대는<br>이 가게로 정했다</p>
			</div>
			<div class="sticky-elem main-message c" style="font-family: 'Nanum Brush Script', cursive;">
				<p style="color:black;font-size:100px;">실례합니다<br>한명인데요</p>
			</div>
			<div class="sticky-elem main-message d" style="font-family: 'Nanum Brush Script', cursive;">
				<p><br></p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description" style="color:white;">
				<strong style="color:#f0fff6;font-family: 'Jua', sans-serif; ">카와에이</strong>
				<br>
				<br>
				<br>
				고독한 미식가 시즌3 1화에서 나온 장어덮밥집<br>
				아카바네의 옛 정취가 남아있는 술과 식당입니다<br><br>
				장어와 닭고기 요리를 중심으로 희귀하고 풍부한 요리를 판매하고 있습니다<br>
				<br><br>
				
				"하루에 만들어지는 맛이 아니다. 나는 역사를 먹었다"라는 대사처럼<br>
				깊은 맛을 직접 맛보세요<br><br><br>
				&#9836; <span style="text-decoration:underline;text-underline-position: under;">오픈 및 휴업일</span><br>
				영업시간: 9시 00분 ~ 20시 00분<br> 
				수요일 휴업<br><br>
				&#165; <span style="text-decoration:underline;text-underline-position: under; ">가격</span><br>
				3000엔 이상<br> 
				<br>
				<br>
				
				<br>
				<br>
				<br>
				
				<strong style="color:#f0fff6;font-family: 'Jua', sans-serif;">&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp스미레</strong>
				
				<br>
				<br>
				<br>
				<div style="text-align:right;">
				<p class="description" style="color:white;">
				고독한 미식가 시즌1의 11화에 나온 매운 카레라이스가 바로 이곳입니다<br>
				5가지 종류의 향신료를 사용하여 특제 카레를 만들었습니다<br><br>
				
				처음 일본 카레를 먹는다면<br>
				이곳에서 일본의 최고의 카레를 맛보세요<br><br>
				
				카레뿐만 아니라 고등어요리도 함께 즐길 수 있으니<br>
				저녁 한끼로 배 속을 든든히 채울 수 있습니다<br><br><br>
				
				
				&#9836;<span style="text-decoration:underline;text-underline-position: under;"> 오픈 및 영엽시간</span><br>
				영업시간- 18시 00분 ~ 25시 00분<br>
			 	휴업일 - 수요일<br><br>
				
				&#165; <span style="text-decoration:underline;text-underline-position: under;">가격</span><br>
				점심 : 20000엔 ~ <br>  
 
			 </p>
			 </div>
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<!-- <p style="font-size:50px;">
					<small></small>
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
				<strong style="color:#f0fff6;font-family: 'Jua', sans-serif; font-size:80px;">히로키 오코노미야키</strong><br>
				고독한 미식가 시즌1 9화에 나온 오코노미야키<br>
			 	철판위에서 벌어지는 야채와 해산물의 치열한 싸움<br><br>
				오징어, 새우, 가리비의 압도적인 비주얼과<br>
				달달한 양배추가 어울려 풍미가 더욱 깊어져<br>
				우리의 입에 화려한 축제가 벌여지게 될 것입니다<br> 
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
			
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	  
    	 var kawaei = { lat: 35.78009128412263,lng: 139.7201248974469};
    	 var sumire = {lat:35.71985611653813, lng: 139.76497075928722};
    	 var okonomi = {lat: 35.660100265554036, lng:139.6678734974431};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:9,
    	      center: sumire,
    	     
    	    });

    	  new google.maps.Marker({
    	    position: kawaei,
    	    map: map,
    	    label: "카와에이", 
    	    
    	  });
    	  new google.maps.Marker({
      	    position: sumire,
      	    map: map,
      	    label: "스미레",
      	    
      	  });
    	  new google.maps.Marker({
        	    position: okonomi,
        	    map: map,
        	    label: "히로키 오코노미야키",
        	    
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
  &#9971;카와에이&#8680; 기차(소요시간 30분)	&#8680; &#9971;스미레&nbsp&nbsp<br>
  스미레  &#8680; 기차(소요시간 40분) &#8680; &#9971;히로키 오코노미야키<br><br>
   

  </div>
			</p>
		</section>
		<footer class="footer">
		  		<img alt="" src="/resources/image/logo6.png" width="500" height="30">
		</footer> 
					
	</div>

	<script src="/resources/js/detail7.js"></script>
</body>
</html>

</html>
