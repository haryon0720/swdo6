<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/detail1.css">
<script type="text/javascript">
setTimeout(function() {			//로그인 팝업창
	opener.location.reload(); //부모창 리프레쉬
	self.close(); //현재창 닫기
}, 5); // 0.005초후 실행 1000당 1초
function searchBoard(){
	var searchForm = document.getElementById("searchForm");
	searchForm.submit();
}
function boardDelete(board_no){
	location.href= "/board/delete?board_no="+board_no;
}
function boardUpdateForm(board_no){
	location.href="/board/updateForm?board_no="+board_no;
}
function loginNeed(){
	alert("로그인!");
}

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

/* 좋아요 */
function like_func(){
  var frm_read = $('#frm_read');
  var board_no = $('#board_no', frm_read).val();
  var user_id = $('#user_id', frm_read).val();
  console.log("board_no, user_id : " + board_no +","+ user_id);
  
  $.ajax({
    url: "/board/likeUpdate",
    type: "POST",
    cache: false,
    dataType: "json",
    data: 'board_no=' +board_no+ '&user_id=' +user_id,
    success: function(data) {
      var msg = '';
      var like_img = '';
      msg += data.msg;
      alert(msg);
      
      if(data.like_check == 0){
        like_img = "/resources/image/dislike.png";
      } else {
        like_img = "/resources/image/like.png";
      }      
      $('#like_img', frm_read).attr('src', like_img);
      $('#like_cnt').html(data.like_cnt);
      $('#like_check').html(data.like_check);
    },
    error: function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}
</script>
</head>
<body>

	<img alt="" src="/resources/image/logo5.png" width="200" height="80" style="float:left;">	<!-- 로고 이미지 -->
	
	
	
		<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver }">
				<div style="padding-top:30px;">
					<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 5px;">
						<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
						<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()">&nbsp;
					</form>
					<a href="#" onclick='window.open("/user/loginForm","_blank","height=400,width=530, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a> &nbsp;
					<a href="/user/joinForm" style="padding-right: 15px">회원가입</a>
				</div>
			</c:when>
			<c:when test="${Naver != null}">
				<div style="padding-top:30px;">
					<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 5px;">
						<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
						<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()">&nbsp;
					</form>
					<span>${Naver}님 환영합니다!</span> &nbsp;
					<a href="logout">로그아웃</a> <!-- 세션의 로그인된 정보만 지우기 -->
				</div>
			</c:when>
			<c:otherwise>
				<div style="padding-top:30px;">
					<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 5px;">
						<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
						<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()">&nbsp;
					</form>
					<span>${sessionScope.loginVO.user_nm }님 환영합니다!</span> &nbsp;
					<a href="/user/logout">로그아웃</a> <!-- 세션의 로그인된 정보만 지우기 -->
				</div>
			</c:otherwise>
			
		</c:choose>
		
		<br><br><br>
		
	<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver}">
				<ul>
     				<li><a href="/">Home</a></li>
  			   		<li><a href="/board/searchForm">Movie</a></li>
 			    	<li><a href="/request/listForm">Request</a></li>
			    </ul>
			</c:when>
			<c:when test="${sessionScope.loginVO.user_id eq 'admin'}">
				<ul>
     				<li><a href="/">Home</a></li>
  			   		<li><a href="/board/searchForm">Movie</a></li>
 			    	<li><a href="/request/listForm">Request</a></li>
   			    	<li><a href="/user/detail">Member</a></li>
   			    	<li><a href="/board/writeForm">Write</a>
			    </ul>
			</c:when>
			<c:otherwise>
				<ul>
     				<li><a href="/">Home</a></li>
  			   		<li><a href="/board/searchForm">Movie</a></li>
 			    	<li><a href="/request/listForm">Request</a></li>
   			    	<li><a href="/user/detail">Member</a></li>
			    </ul>
			</c:otherwise>
		</c:choose>
		
		<!-- 여기부터 코드를 작성해주세요 -->
		<br>
		<img alt="" src="/resources/image/kimi5.jpg" width="500px" height="600px" style="float:left; padding-right:40px;">
		<img alt="" src="/resources/image/heart.png" width="30px" height="30px"  align="right" style="padding: 30px 100px 0px 0px">
		<h1>너의 이름은</h1>
		
		<h2 style="color:white;">${board.board_title }</h2>
		<span>아직 만난 적 없는 너를, 찾고 있어 천년 만에 다가오는 혜성 기적이 시작된다.<br>도쿄에 사는 소년 ‘타키’와 시골에 사는 소녀 ‘미츠하’는 서로의 몸이 뒤바뀌는 신기한 꿈을 꾼다.<br>낯선 가족, 낯선 친구들, 낯선 풍경들... 반복되는 꿈과 흘러가는 시간 속, 마침내 깨닫는다 우리, 서로 뒤바뀐 거야?<br>절대 만날 리 없는 두 사람 반드시 만나야 하는 운명이 되다 서로에게 남긴 메모를 확인하며 점점 친구가 되어가는 ‘타키’와 ‘미츠하’<br>언제부턴가 더 이상 몸이 바뀌지 않자 자신들이 특별하게 이어져있었음을 깨달은 ‘타키’는 ‘미츠하’를 만나러 가는데...<br>잊고 싶지 않은 사람 잊으면 안 되는 사람 너의 이름은?</span><br><br>
		<img alt="" src="https://cdn.lecturernews.com/news/photo/202012/57672_222240_5359.jpg" width="400" height="300">
		<img alt="" src="https://img.insight.co.kr/static/2020/01/26/700/971uib850e3dc027d409.jpg" width="400" height="300" style="padding-left: 40px">
		<br><br><br>
		<h1>#추천 여행지</h1>
		<h2 style="color:white;">1.스가 신사</h2>
		<br>
		<img alt="" src="/resources/image/kimimap4.jpg">
		<img alt="" src="https://www.picuki.com/hosted-by-instagram/url=https%3A%7C%7C%7C%7Cinstagram.flwo4-2.fna.fbcdn.net%7C%7Cv%7C%7Ct51.2885-15%7C%7Ce35%7C%7C24274799_1480033282117898_5574720606491901952_n.jpg%3Ftp%3D1%26_nc_ht%3Dinstagram.flwo4-2.fna.fbcdn.net%26_nc_cat%3D102%26_nc_ohc%3DuqIdjz08y4oAX-PTBO3%26edm%3DAABBvjUBAAAA%26ccb%3D7-4%26oh%3D7adbf20bdc4562b4fa255baad8942db3%26oe%3D60D21473%26_nc_sid%3D83d603" width="500" height="450" style="padding-left: 30px">
		<br>
		<div id="map" style="width:400px; height: 400px;"></div>
		  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDicrSVbC5pPcTLC7v8Pez70uEygqZmGYI&callback=initMap&region=kr"></script>
		  <script>
		    function initMap() {
		    	 var suga = { lat: 35.685321787444316  ,lng: 139.72244652352182 };
		    	  map = new google.maps.Map( document.getElementById('map'), {
		    	      zoom: 12,
		    	      center: suga,
		    	    });
		
		    	  new google.maps.Marker({
		    	    position: suga,
		    	    map: map,
		    	    label: "스가 신사"
		    	  });
		    }
  		</script>

		<br><br><br><br>
		<img alt="" src="/resources/image/kimimap.png">
		<br><br><br><br>
		<img alt="" src="/resources/image/kimimap2.png">

		 <!--  좋아요  -->
		<div class="div1">
		 <div class="div2">
		   <div class="div3">
		   <c:choose>
		    <c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver}">
		     <a href='javascript: loginNeed();'><img src='/resources/image/dislike.png' width="30px" height="30px"></a>
		    </c:when>
		    <c:otherwise>
		     <a href='javascript: like_func();'><img src='/resources/image/dislike.png' width="30px" height="30px" id='like_img'></a>
		    </c:otherwise>
		   </c:choose>
		   </div>
		 </div>
		</div>
	

		
		
		
		<c:if test="${sessionScope.loginVO.user_id eq 'admin' }">
			<input type="button" value="수정" onclick="boardUpdateForm(${detail.board_no})">
			<input type="button" value="삭제" onclick="boardDelete(${detail.board_no })">
		</c:if>	
		
		
</body>
</html>