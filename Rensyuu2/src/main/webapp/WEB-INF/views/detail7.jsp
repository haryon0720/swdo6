<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>AirMug Pro</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/default.css">
	<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body class="before-load">
	<div class="loading">
		<svg class="loading-circle">
			<circle cx="50%" cy="50%" r="25"></circle>
		</svg>
	</div>
	<div class="container">
		<nav class="global-nav">
			<div class="global-nav-links">
				<a href="#" class="global-nav-item">Rooms</a>
				<a href="#" class="global-nav-item">Ideas</a>
				<a href="#" class="global-nav-item">Stores</a>
				<a href="#" class="global-nav-item">Contact</a>
			</div>
		</nav>
		<nav class="local-nav">
			<div class="local-nav-links">
				<a href="#" class="product-name">AirMug Pro</a>
				<a href="#">개요</a>
				<a href="#">제품사양</a>
				<a href="#">구입하기</a>
			</div>
		</nav>
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
			<p class="description">
				<strong>에도 도쿄 건축 박물관</strong>
				<br>
				<br>
				<br>
				미야자키 하야오의 산책 akdjflajfd;ljfa;fjajdlakf<br>
				akdlf;jakl;jdfklfjkal;djkfla;kd;fal;jf;kfj<br>
				adfsssssssssssssssssss<br>
				afsddddddddddddddddddddddddddddd<br>
				aaaaaaaaaaaaaaaaaa<br>
				a<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				
				<br>
				<br>
				<br>
				
				 <strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp시마 온천</strong> 
				
				<br>
				<br>
				<br>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  미야자키 하야오의 산책 akdjflajfd;ljfa;fjajdlakf<br>
				     akdlf;jakl;jdfklfjkal;djkfla;kd;fal;jf;kfj<br>
				adfsssssssssssssssssss<br>
				afsddddddddddddddddddddddddddddd<br>
				aaaaaaaaaaaaaaaaaa<br>
				a<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
				aaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
			 </p>
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p style="font-size:50px;">
					<small></small>
					센, 여기서 여섯 번째인<br>
					시마 온천이란 역에서 내려라
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
			<p class="mid-message">
				<strong>시모나다 역</strong><br>
				집으로<br>
				돌아갈 시간이야
			</p>
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
				 <div id="map" style="width:500px; height: 500px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeVPhRYJAy6-WZgHmxcX5OoMs7EigFSyc&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	 var seoul = { lat: 35.78028389983173  ,lng: 138.46130485100844 };
    	 var simonada = { lat: 33.65537671663174,lng: 132.5895349550526};
    	  map = new google.maps.Map( document.getElementById('map'), {
    	      zoom:5,
    	      center: seoul,
    	     
    	    });

    	  new google.maps.Marker({
    	    position: seoul,
    	    map: map,
    	    label: "지금 만나러 갑니다",
    	    
    	  });
    	  new google.maps.Marker({
      	    position: simonada,
      	    map: map,
      	    label: "시모나다",
      	    
      	  });
      	  
    }
  </script>
			</p>
		</section>
		<footer class="footer">
			OSOT
		</footer>
	</div>

	<script src="/resources/js/main.js"></script>
</body>
</html>

</html>
