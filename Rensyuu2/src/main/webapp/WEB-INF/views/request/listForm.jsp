<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 목록</title>

<script type="text/javascript">
function requestWriteForm(){
	location.href = "/request/writeForm"; 
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
<!-- <link rel="stylesheet" href="/resources/css/home.css"> -->
<link rel="stylesheet" href="/resources/css/home2.css">
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<script type="text/javascript">
setTimeout(function() {			//팝업창
    opener.location.reload(); //부모창 리프레쉬
    self.close(); //현재창 닫기
    }, 5); // 0.005초후 실행 1000당 1초
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
table{
	width: 1000px;
	margin: auto;
	/* background-color: rgba(255,255,255,0.05); */
	height: 40px;
	color: white;
	/* border: 1px solid white; */
}
th{
 	background-color: #2bd3c6;
 	height: 30px;
 	color: black;

}
td{
	height: 25px;
	text-align: center;
	/* border-bottom: 1px solid white; */
	width: 200px;
	padding: 15px 5px 10px 5px;
}  

.footer {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 7rem;
	color: white;
	background: #2bd3c6;
}
input[type="button"]{
	border-radius: 4px;
	background-color: #ffffff;
	border: none;
	color: #000000;
	text-align: center;
	font-size: 12px;
	padding: 5px;
	width: 60px;
	cursor: pointer;
	margin: 5px;
}
#searchBtn{
	border-radius: 4px;
	background-color: #ffffff;
	border: none;
	color: #000000;
	text-align: center;
	font-size: 12px;
	padding: 5px;
	width: 60px;
	cursor: pointer;
	margin: 5px;
}
.tr_hover th, .tr_header td {
    padding: 5px;
    font-weight: bold;
    white-space: nowrap;
    
    background-color: #EFEFEF;
    vertical-align: bottom;
    text-align: left;
}
.tr_hover td {
    padding: 5px;
    white-space: nowrap;
   
}

.tr_hover {
 	background: rgba(255,255,255,0.05);

}

.tr_hover:hover {
    background-color: #2bd3c6;
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
							<input type="text" name="searchText" placeholder="제목" width="30"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
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
							<input type="text" name="searchText" placeholder="제목" width="20"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
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
							<input type="text" name="searchText" placeholder="제목" width="10"> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
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
	<h1 id="kensaku">문의 게시판</h1>
	<div id="divFuLi">
	
		<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver}">
			
			</c:when>
			<c:otherwise>
				<div id="div2">
					<input type="button" value="글쓰기" class="button" onclick="requestWriteForm()" style="margin-left: 1200px; margin-top: 10px; margin-bottom: 10px;">
				</div>
			</c:otherwise>
		</c:choose>
		
	<!-- background-repeat: no-repeat;
	 background-size: cover;  -->
		<table class=mytable>
		<thead>
			<tr class="tr_header">
				<th>글 번호</th>
				<th style="text-align: left;">글 제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>	
			</thead>
			<tbody>
			<c:forEach var="request" items="${requestList }" varStatus="status">
				<tr class="tr_hover">
					<td style="text-align: center; width:30px">${status.count }</td>
					<td style="text-align: left;">
						<a href="/request/detail?request_no=${request.request_no }">${request.request_title }</a>
					</td>
					<td style="width:70px">${request.user_id }</td>
					<td style="text-align: center; width:50px">${request.request_indate}</td>
				</tr>		
			</c:forEach>
			</tbody>	
		</table>
	</div>
	
		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px; margin-left: 50px;">
		</footer>
	
</body>
</html>