<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>OSOT</title>
<!-- <link rel="stylesheet" href="/resources/css/home.css"> -->
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/a.css"> 
 

<style type="text/css">
h1{
	color:white;
} 
#introImg{
	position:relative;
	overflow:hidden;
	height: 800px; 
}
</style>
<script type="text/javascript">
	var imgArray = new Array();		//큰 이미지 목록
	imgArray[0] = "/resources/image/1.jpg";
	imgArray[1] = "/resources/image/2.jpg";
	imgArray[2] = "/resources/image/3.jpg"
	imgArray[3] = "/resources/image/4.jpg";
	imgArray[4] = "/resources/image/5.jpg";
	imgArray[5] = "/resources/image/6.jpg";
	imgArray[6] = "/resources/image/7.jpg"; 
	
	function showImage(){			//큰 이미지 랜덤으로 보여주는 기능
		var imgNum = Math.round(Math.random()*6);
		var objImg = document.getElementById("introImg");
		objImg.src = imgArray[imgNum];
	}
	setTimeout(function() {			//팝업창
	    opener.location.reload(); //부모창 리프레쉬
	    self.close(); //현재창 닫기
	    }, 5); // 0.005초후 실행 1000당 1초

function searchBoard(){
	var searchForm = document.getElementById("searchForm");
	searchForm.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body onload = "showImage()">

	<img alt="" src="/resources/image/logo5.png" width="150" height="20" style="float:left; padding: 10px 0px 5px 10px;">	<!-- 로고 이미지 -->
	
	
	
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
					<div class="local-nav-links" style="float: right; padding-right: 30px;">
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 2px;">
							<img alt="" src="/resources/image/search.png" width="20" height="13" style="margin-bottom: -5px;">&nbsp;
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a href="#" onclick='window.open("/user/loginForm","_blank","height=490,width=530, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a> &nbsp;
						<a href="/user/joinForm">회원가입</a>
					</div>
				</nav>				
			</c:when>
			<c:when test="${Naver != null}">
				<nav class="local-nav">
					<div class="local-nav-links"  style="float: right; padding-right: 30px;">
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 2px;">
 							<img alt="" src="/resources/image/search.png" width="20" height="13" style="margin-bottom: -5px;">&nbsp;
							<input type="text" name="searchText" placeholder="제목" style="width:170px;height: 22px;"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn"" >
						</form>
						<a>${Naver}님 환영합니다!</a>
						<a href="logout">로그아웃</a>
					</div>
				</nav>
			</c:when>
			<c:otherwise>
				<nav class="local-nav">
					<div class="local-nav-links"  style="float: right; padding-right: 30px;">
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 2px;">
							<img alt="" src="/resources/image/search.png" width="20" height="13" style="margin-bottom: -5px;">&nbsp;
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a>${sessionScope.loginVO.user_nm }님 환영합니다!</a>
						<a href="/user/logout">로그아웃</a>
					</div>
				</nav>
			</c:otherwise>
			
		</c:choose>
	</div>
 
	 
	<img  alt="" id = "introImg" border="0" style="width:1600px; height:600px; padding-top: 20px; padding-bottom: 50px;" >
	  
	     <br>
	     
	   	<h1 style="color:white; padding-bottom:15px;"><strong>&nbsp;&nbsp;전체 작품 보기</strong></h1>
	    
	      <div class="slide_wrapper">
		<ul class="slides">
			<li>
			<a href="/board/detail1?board_no=1&user_id=${sessionScope.loginVO.user_id}" style="padding:0px;">
			<img src="/resources/image/1.jpg" onmouseover="this.src='/resources/image/1_2.jpg'" onmouseout="this.src='/resources/image/1.jpg'" 
				width="300" height="160" alt="">
			</a>
			</li>
			<li>
			<a href="/board/detail2?board_no=2&user_id=${sessionScope.loginVO.user_id}"style="padding:0px;">
			<img src="/resources/image/2.jpg" onmouseover="this.src='/resources/image/2_2.jpg'" onmouseout="this.src='/resources/image/2.jpg'" 
			width="300" height="160"alt="">
			</a>
			</li>
			<li>
			<a href="/board/detail3?board_no=3&user_id=${sessionScope.loginVO.user_id}"style="padding:0px;">
			<img src="/resources/image/3.jpg" onmouseover="this.src='/resources/image/3_2.jpg'" onmouseout="this.src='/resources/image/3.jpg'" 
				 width="300" height="160"alt="">
				</a>
				 </li>
			<li>
			<a href="/board/detail4?board_no=4&user_id=${sessionScope.loginVO.user_id}"style="padding:0px;">
			<img src="/resources/image/4.jpg" onmouseover="this.src='/resources/image/4_2.jpg'" onmouseout="this.src='/resources/image/4.jpg'" 
				width="300" height="160"alt=""></a></li>
			<li>
			<a href="/board/detail5?board_no=5&user_id=${sessionScope.loginVO.user_id}"style="padding:0px;">
			<img src="/resources/image/5.jpg" onmouseover="this.src='/resources/image/5_2.jpg'" onmouseout="this.src='/resources/image/5.jpg'" 
				width="300" height="160" alt="">
				</a>
				</li>
			<li><a href="/board/detail6?board_no=6&user_id=${sessionScope.loginVO.user_id}"style="padding:0px;">
			<img src="/resources/image/6.jpg" onmouseover="this.src='/resources/image/6_2.jpg'" onmouseout="this.src='/resources/image/6.jpg'" 
				width="300" height="160"alt=""></a></li>
			<li><a href="/board/detail7?board_no=7&user_id=${sessionScope.loginVO.user_id}"style="padding:0px;"><img src="/resources/image/7.jpg" onmouseover="this.src='/resources/image/7_2.jpg'" onmouseout="this.src='/resources/image/7.jpg'" 
				width="300" height="160"alt=""></a></li>
			<li><a href="/board/detail1?board_no=1&user_id=${sessionScope.loginVO.user_id}"style="padding:0px; visibility: hidden;"><img src="/resources/image/3.jpg" onmouseover="this.src='/resources/image/3_2.jpg'" onmouseout="this.src='/resources/image/3.jpg'" 
				width="300" height="160"alt=""></a></li>
			
		</ul>	
		
	</div>  
	<p class="controls">
			<span style="margin-top: 0px; padding-top: 0px;padding-right:30px;"class="prev"><img src="/resources/image/ar1.jpg" width=20px, height=20px></span>
			<span class="next"><img src="/resources/image/ar2.jpg" width=20px, height=20px></span>
	</p>
			<script src="/resources/js/b.js"></script> 
	  <br>
	  <br>
	  <h1 style="color:white;padding-bottom:15px;"><strong>&nbsp;&nbsp;#로맨스</strong></h1>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
	 <c:forEach var="board" items="${boardList }">
		<c:if test="${board.board_type eq '1' }">
			<a href="/board/detail${board.board_no }?board_no=${board.board_no }&user_id=${sessionScope.loginVO.user_id}" style="padding-left: 30px;" >
				<img src="/resources/image/${board.board_no }.jpg" onmouseover="this.src='/resources/image/${board.board_no}_2.jpg'" onmouseout="this.src='/resources/image/${board.board_no}.jpg'" 
				width="300" height="150" style="vertical-align:middle;">
			</a>
		</c:if>
	</c:forEach>
	<img src="/resources/image/8.jpg" onmouseover="this.src='/resources/image/8_2.jpg'" onmouseout="this.src='/resources/image/8.jpg'" 
				width="300" height="150" style="vertical-align:middle;padding-left: 30px;">
	  <br>
	  <br>
	<h1 style="color:white;padding-bottom:15px;"><strong>&nbsp;&nbsp;#애니메이션</strong></h1>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
	 <c:forEach var="board" items="${boardList }">
		<c:if test="${board.board_type eq '2' }">
			<a href="/board/detail${board.board_no }?board_no=${board.board_no }&user_id=${sessionScope.loginVO.user_id}" style="padding-left: 30px;" >
			<img src="/resources/image/${board.board_no }.jpg" onmouseover="this.src='/resources/image/${board.board_no}_2.jpg'" onmouseout="this.src='/resources/image/${board.board_no}.jpg'" 
				width="300" height="150" style="vertical-align:middle;">
			</a>
		</c:if>
	</c:forEach>
		<img src="/resources/image/13.jpg" onmouseover="this.src='/resources/image/13_2.jpg'" onmouseout="this.src='/resources/image/13.jpg'" 
				width="300" height="150" style="vertical-align:middle;padding-left: 30px;">
	<br><br>
	<h1 style="color:white;padding-bottom:15px;"><strong>&nbsp;&nbsp;#일상</strong></h1>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
	<c:forEach var="board" items="${boardList }">
		<c:if test="${board.board_type eq '3' }">
			<a href="/board/detail${board.board_no }?board_no=${board.board_no }&user_id=${sessionScope.loginVO.user_id}" style="padding-left: 30px;" >
			<img src="/resources/image/${board.board_no }.jpg" onmouseover="this.src='/resources/image/${board.board_no}_2.jpg'" onmouseout="this.src='/resources/image/${board.board_no}.jpg'" 
				width="300" height="150" style="vertical-align:middle;">
			</a>
		</c:if>
	</c:forEach>
	<img src="/resources/image/18.jpg" onmouseover="this.src='/resources/image/18_2.jpg'" onmouseout="this.src='/resources/image/18.jpg'" 
				width="300" height="150" style="vertical-align:middle;padding-left: 30px;">
				<img src="/resources/image/19.jpg" onmouseover="this.src='/resources/image/19_2.jpg'" onmouseout="this.src='/resources/image/19.jpg'" 
				width="300" height="150" style="vertical-align:middle;padding-left: 30px;">
				<img src="/resources/image/20.jpg" onmouseover="this.src='/resources/image/20_2.jpg'" onmouseout="this.src='/resources/image/20.jpg'" 
				width="300" height="150" style="vertical-align:middle;padding-left: 30px;">

	<br><br><br><br> 
	
	
	
	
	
	
	
		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px; margin-left: 50px;">
		</footer>	
	
	
	
	
	
	
	
	
	
</body>
</html>
