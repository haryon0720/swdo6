<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
#um{
	width: 600px;
	height: 400px;

	margin: auto;
	padding: 30px 0px 30px 0px;
	font-size: 18pt;
	border-radius: 10px;
	text-align: center;
	border: 2px solid #2bd3c6;	
	border-collapse: separate;
	border-spacing: 0 45px;
	color: #2bd3c6;
}
td{
	font-weight: 500;
	text-color:#2bd3c6;
}

</style>
<!-- <link rel="stylesheet" href="/resources/css/userDetail.css"> -->
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/home2.css">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div style="float:left; padding: 10px 0px 5px 10px;">
	<a href="/" style="display:inline-block;">
		<img alt="" src="/resources/image/logo5.png" width="150" height="20">
	</a>
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
					<div class="local-nav-links" style="float: right; padding-right: 30px; color: white;">
						<form action="/board/mySearchForm" method="get" id="searchForm" style="padding-right: 2px;">
							<img alt="" src="/resources/image/search.png" width="20" height="13" style="margin-bottom: -5px;">&nbsp;
							<input type="text" name="searchText" placeholder="제목" width="40"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
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
							<input type="text" name="searchText" placeholder="제목"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
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
		<!-- 여기부터 코드 -->
		
		<br>
		<h1 id="kensaku">멤버 정보</h1>
		
		<c:choose>
			<c:when test="${sessionScope.loginVO.user_id != null }">
				<div id="umm">
				<table id="um">
					<tr>
						<td>ID:</td>
						<td>${userDetail.user_id}</td>
					</tr>
					<tr>
						<td>NickName:</td>
						<td>${userDetail.user_nm}</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td>${userDetail.user_email}</td>
					</tr>
					<tr>
						<td>Phone:</td>
						<td>${userDetail.user_phone}</td>
					</tr>
				</table><br>
				<a href="/user/updateForm?user_id=${sessionScope.loginVO.user_id }" style="margin-left: 1000px;margin-bottom: 70px;font-weight: 400;">수정하기</a>
				</div>
			</c:when>
	
			<c:when test="${sessionScope.Naver != null }">
				<div id="umm">
				<table id="um">
					<tr>
						<td>NickName:</td>
						<td>${sessionScope.Naver}</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td>${sessionScope.NaverEmail}</td>
					</tr>
					<tr>
						<td>Phone:</td>
						<td>${sessionScope.NaverPhone}</td>
					</tr>
				</table><br>
				<a href="https://nid.naver.com/user2/help/myInfo?lang=ko_KR" style="margin-left: 1000px;margin-bottom: 70px;font-weight: 400;" target="_blank">수정하기</a>		
				</div>			
			</c:when>
		</c:choose>
		<br>
		<hr>
		<br>
		<h1 id="gim">찜 목록&nbsp;<i class="fa fa-heart fa-lg" aria-hidden="true" style="color:#2bd3c6"></i></h1>
		
		<div style="padding: 40px 0px 40px 5px;">
		<c:forEach var="like" items="${likeList}">
			<c:if test="${like.like_check eq 1}">
				<a href="/board/detail${like.board_no }?board_no=${like.board_no }&user_id=${sessionScope.loginVO.user_id}">
					<img src="/resources/image/${like.board_no }.jpg" class="post" style="width:300px;height: 160px; margin-bottom: 10px;">
				</a>
			</c:if>
		</c:forEach>		
		</div>
		
		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px; margin-left: 50px;">
		</footer>	
		
</body>
</html>