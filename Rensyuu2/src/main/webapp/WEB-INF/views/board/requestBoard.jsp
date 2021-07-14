<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/detail.css">
<script type="text/javascript">
	setTimeout(function() {			//팝업창
	    opener.location.reload(); //부모창 리프레쉬
	    self.close(); //현재창 닫기
	    }, 5); // 0.005초후 실행 1000당 1초
</script>
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
               
               $.each(json.items,function(i,item){
                  console.log(item.title);
                  $("#movieResult").append(
                          "<tr>"+"<td width='100'><img src='"+item.image+"'></td>"+
                          "<td width='300'><a href='"+item.link+"'>"+item.title+"</a></td>"+
                          +"</tr>"
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
</head>
<body>

	<img alt="" src="/resources/image/love.png" width="200" height="50" style="float:left;">	<!-- 로고 이미지 -->
	
	
	
		<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver }">
				<div>
					<form action="/board/mySearchForm" method="get" id="searchForm">
						<img alt="" src="/resources/image/search.png" width="20" height="13">&nbsp;
						<input type="text" name="searchText" style="width:150px;"> <input type="button" value="검색" onclick="searchBoard()">
					</form>
					<a href="#" onclick='window.open("/user/loginForm","_blank","height=400,width=530, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a> &nbsp;
					<a href="/user/joinForm">회원가입</a>
				</div>
			</c:when>
			<c:when test="${Naver != null}">
				<p>
				<a href="/board/searchForm"><img alt="" src="/resources/image/search.png" width="20" height="10">검색</a> &nbsp;
				<span>${Naver}님 환영합니다!</span> &nbsp;
				<a href="logout">로그아웃</a></p> <!-- 세션의 로그인된 정보만 지우기 -->
			</c:when>
			<c:otherwise>
				<p>
				<img alt="" src="/resources/image/search.png" width="20" height="10"><a>검색</a> &nbsp;
				<span>${sessionScope.loginVO.user_nm }님 환영합니다!</span> &nbsp;
				<a href="/user/logout">로그아웃</a></p> <!-- 세션의 로그인된 정보만 지우기 -->
			</c:otherwise>
			
		</c:choose>
		
		<br><br><br>
		
	<c:choose>
			<c:when test="${empty sessionScope.loginVO && empty sessionScope.Naver}">
				<ul>
     				<li><a href="/">Home</a></li>
  			   		<li><a href="/board/searchForm">Movie</a></li>
 			    	<li><a href="/board/requestBoard">Request</a></li>
			    </ul>
			</c:when>
			<c:when test="${sessionScope.loginVO.user_id eq 'admin'}">
				<ul>
     				<li><a href="/">Home</a></li>
  			   		<li><a href="/board/searchForm">Movie</a></li>
 			    	<li><a href="/board/requestBoard">Request</a></li>
   			    	<li><a href="/user/detail">Member</a></li>
   			    	<li><a href="/board/writeForm">Write</a>
			    </ul>
			</c:when>
			<c:otherwise>
				<ul>
     				<li><a href="/">Home</a></li>
  			   		<li><a href="/board/searchForm">Movie</a></li>
 			    	<li><a href="/board/requestBoard">Request</a></li>
   			    	<li><a href="/user/detail">Member</a></li>
			    </ul>
			</c:otherwise>
		</c:choose>
	
	<h1 align="center">건의게시판</h1>
	

</body>
</html>