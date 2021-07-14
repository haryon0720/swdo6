<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/loginForm.css">
<script type="text/javascript">
function formCheck(){
	var user_id = document.getElementById("user_id").value;
 	if(user_id == ""|| user_id.length == 0){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(user_id.length < 3 ||  user_id.length > 10){
		alert("아이디는 3~10글자 사이로 입력해주세요.");
		return false;
	}
	var user_pw = document.getElementById("user_pw").value;
	if(user_pw == ""|| user_pw.length == 0){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(user_pw.length < 3 ||  user_pw.length >10 ){
		alert("비밀번호는 3~10글자 사이로 입력해 주세요.");
		return false;
	}
	return true;
}

</script>
</head>
<body>

			<form action="/user/login" method="post" onsubmit="return formCheck();">

				<table >
					<thead>
						<tr>
							<th colspan="2">
								<label class="header">
									<img alt="" src="/resources/image/logo5.png" width="160" height="85">
								</label>
							</th>
						</tr>
					</thead>	
					<tbody>			
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요."> <br>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" id="user_pw" name="user_pw" placeholder="비밀번호를 입력해주세요."> <br>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<input type="submit" value="로그인" >
							</td>
						</tr>
					</tbody>
				</table>
		
	</form>
		<br>
	<center>		
		<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img width="150" height="50" src="/resources/image/btnW.png" style="border-radius:15px;"></a></div>
		<br>
	</center>
	
	
	


</body>
</html>