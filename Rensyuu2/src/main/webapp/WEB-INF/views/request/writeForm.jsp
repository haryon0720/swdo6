<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 등록</title>
<!-- <link rel="stylesheet" href="/resources/css/detail.css"> -->
<link rel="stylesheet" href="/resources/css/home2.css">
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

function formCheck(){

	var request_title = document.getElementById("request_title").value;
 	if(request_title == ""|| request_title.length == 0){
		alert("제목을 입력해주세요");
		return false;
	}else if(request_title.length < 2 ){
		alert("제목을 2글자 이상 써주세요");
		return false;
	}
	var request_content = document.getElementById("request_content").value;
	if(request_content == ""|| request_content.length == 0){
		alert("내용을 입력해주세요");
		return false;
	}else if(request_content.length < 2 ){
		alert("내용을 2글자 이상 써주세요");
		return false;
	}
</script>
<style type="text/css">
table{
	width: 500px;
	padding-left: 400px;
	height: 40px;
	color: white;
}
td{
	height: 25px;
	text-align: center;
}
</style>
</head>
<body>

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

	
	<br>
	<h1 id="kensaku">건의글 작성</h1>
	 
	 
	   <div id="divDetail" style="padding:20px 250px 200px 250px; height: 484px;" >
		<form action="/request/write" method="post" onsubmit="return formCheck();">
		<table border="1" style="width:1000px;border-top: 2px solid #403d3d; color:white; background-color: rgb(74,74,74); border-radius: 10px;"  >
				<tr  >
					
					<td class="tdSpace" colspan="4" style="padding-bottom:3px; text-align: left; font-size:50px; font-weight:bold;"><input  type="text" placeholder="제목을 입력하세요" name="request_title" id="request_title"   style="padding:20px 840px 5px 0px;"   ></td>
					 
				</tr> 
			</table> 
			<textarea name="request_content" id="request_content" class="tdSpace" rows="20" cols="136" name="request_content" placeholder="내용을 입력하세요"> </textarea>
				  
			<br>  
		<input type="submit" value="등록"  style="margin-left:870px;" id="searchBtn">
		<input type="reset" value="취소" id="searchBtn">		
 </form>	
	</div>
	 
	 
	 
	 
	 
	 
	 
		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px; margin-left: 50px;">
		</footer>	

</body>
</html>