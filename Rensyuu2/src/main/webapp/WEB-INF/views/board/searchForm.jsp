<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>네이버 영화 검색</title>
<link rel="stylesheet" href="/resources/css/home2.css">

<!-- <link rel="stylesheet" href="/resources/css/searchForm.css"> -->
<!-- <link rel="stylesheet" href="/resources/css/home.css"> -->
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
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#search").click(function() {
         $.ajax({
            url : "<c:url value="/MovieServiceJSON"/>",
            type : "post",
            dataType : "json",
            data : {
               query : $("#query").val()
            },
            success : function(json) {
            	$("#you").append(
               "<h2>\""+$("#query").val()+"\"에 대한 검색 결과입니다</h2>"
               )
               $.each(json.items,function(i,item){
                  console.log(item.title);
                  $("#movieResult").append(
                          "<td width='150' style='text-align: center;'><img src='"+item.image+"' style=' display:block;width:150px;height:200px;''>"+
                             "<a href='"+item.link+"' target='_blank' style='font-size:18px;color:white;'>"+item.title+"</a></td>"
                       );
              });
           },
            error : function(err) {
               alert("에러");
            }
         });
      });
   });

</script>
<style type="text/css">
h2{
	text-align: center;
}
td{
	padding: 0px 5px 0px 5px;
}
#search{
	border-radius: 4px;
	background-color: #19ce60;
	border: none;
	color: #white;
	text-align: center;
	font-size: 12px;
	padding: 5px;
	width: 60px;
	cursor: pointer;
	margin: 5px;
}
</style>
</head>
<body style="height: 100%">
	<a href="/">
	<img alt="" src="/resources/image/logo5.png" width="150" height="20" style="float:left; padding: 10px 0px 5px 10px;">
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
	
	<!-- 여기부터 -->
	<br><br><br>
		<h1 id="kensaku">네이버 영화 검색</h1>
		<br>
		<div id="searchDiv" >
			<input type="text" id="query" name="query" style="width:150px; height:28px;">
	   		<input type="button" id="search" value="검색">
	   	</div><br><br>
	   	<div id="content" style="height: 364px;">
	   	<div id="you"></div><br>
		   	<c:set var="i" value="0" />
	 		<c:set var="j" value="4" />
	   		<table id="movieResult" style="padding-right: 230px;" >
	   		</table>
	   	</div>
		
<%-- 		<div id="searchDiv">
			<form action="<c:url value="/MovieServiceJSON"/>">
				<input type="text" id="query" name="query" style="width:150px; height:30px;">
	  	 		<input type="submit" id="search" value="검색">
			</form>
		</div><br><br>
	   	<div id="content" style="height: 387px;">
	   	<div id="you"></div><br>
	   		<table id="movieResult" style="padding-right: 230px;" >
	   		</table>
	   	</div> --%>


		<footer class="footer">
			<img alt="" src="/resources/image/logo6.png" width="400" height="100" style="padding: 0px 0px 0px 0px;">
		</footer>	
	
</body>
</html>
