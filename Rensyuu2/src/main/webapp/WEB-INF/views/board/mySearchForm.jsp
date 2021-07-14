<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>영화 검색</title>
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
function printmyq(){
	var myq = document.getElementById("myq").value;

	document.getElementById("result").innerText = myq;
}
</script>
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/home2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<a href="/" ><img alt="" src="/resources/image/logo5.png" width="150" height="20" style="float:left; padding: 10px 0px 5px 10px;"></a>
	
	
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
							<input type="text" name="searchText" placeholder="제목" id="myq" name="myq" onchange='printmyq()'> <input type="button" value="검색" onclick="searchBoard()" id="searchBtn">&nbsp;
						</form>
						<a>${sessionScope.loginVO.user_nm }님 환영합니다!</a>
						<a href="/user/logout">로그아웃</a>
					</div>
				</nav>
			</c:otherwise>
			
		</c:choose>
	</div>
	
	<!-- 여기부터 -->
	<br>
		<div id="result" style="color:white;"></div>
		<h1 id="kensaku">검색 결과</h1>
		<br>	
	<div style="height: 467px;">
	<table id="movieResult" style="padding-right: 300px;">
		<tr>
		<c:forEach var="board" items="${boardList }">
			<td style="border-spacing: 10px;text-align:center;">
				<a href="/board/detail${board.board_no }?board_no=${board.board_no }">
					<img src="/resources/image/${board.board_no }.jpg" width="200" height="100" style="vertical-align:middle;display:block;">
				</a>
				<a href="/board/detail${board.board_no }?board_no=${board.board_no }">
					${board.board_title }
				</a>
			</td>
		</c:forEach>
		</tr>
	</table>
	</div>
		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px; margin-left: 50px;">
		</footer>		
</body>
</html>
