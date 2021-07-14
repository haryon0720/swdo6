<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 정보 수정</title>
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
.inin{
	background-color: rgb(74,74,74);
	border-left-width:0;
	border-right-width:0;
	border-top-width:0;
	height:25px;
	color: #2bd3c6;
	text-align: center;
	font-size: 22px;
	border-bottom-width:1;
	width: 210px;
}
input:focus {outline:none;}
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

function formCheck(){
	var user_pw = document.getElementById("user_pw").value;
	if(user_pw == ""|| user_pw.length == 0){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	return true;
}	   
function searchBoard(){
	var searchForm = document.getElementById("searchForm");
	searchForm.submit();
}	   
	    
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<a href="/">
	<img alt="" src="/resources/image/logo5.png" width="150" height="20" style="float:left; padding: 10px 0px 5px 10px;">	<!-- 로고 이미지 -->
	</a>
	
	
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
		<h1 id="kensaku">멤버 정보 수정</h1>
		
	<form action="/user/update" method="post" onsubmit="return formCheck();">
		<table id="um">
			<tr>
				<td>ID:</td>
				<td>
					${userVO.user_id }
				</td>
			</tr>
			<tr>
				<td>NickName:</td>
				<td>
					<input type="text" name="user_nm" class="inin" value="${userVO.user_nm }"/>
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td>
					<input type="text" name="user_email"  class="inin" value="${userVO.user_email }" />
				</td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td>
					<input type="text" name="user_phone" class="inin" value="${userVO.user_phone }" />
				</td>
			</tr>
			<tr>
				<td>PW:</td>
				<td>
					<input type="password" name="user_pw" id="user_pw" class="inin">
				</td>
			</tr>
		</table><br>
			<span style="margin-left: 1000px;margin-bottom: 70px;font-weight: 400;">
				<input type="hidden" name="user_id" value="${userVO.user_id }" >
				<input type="submit" value="수정완료" style="border:0;outline:0;background-color: rgb(74,74,74);color:white;font-weight: 400;font-size:14px;">
			</span>	
	</form>
	<br>
		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px; margin-left: 50px;">
		</footer>		
	
</body>
</html>