<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="/resources/css/joinForm.css">
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
	var user_pwCh =  document.getElementById("user_pwCh").value; 
	if(user_pwCh == ""|| user_pwCh.length == 0){
		alert("비밀번호 다시입력을 다시 입력해주세요.");
		return false;
	}else if(user_pw != user_pwCh){
		alert("동일한 비밀번호를 입력해주세요.");
		return false;
	}
	var user_nm = document.getElementById("user_nm").value;
	if(user_nm == ""|| user_nm.length == 0){
		alert("이름을 입력해 주세요.");
		return false;
	}else if(user_nm.length < 2 ||  user_nm.length > 5){
		alert("이름은 2~5글자 사이로 입력해주세요.");
		return false;
	}
	var user_email = document.getElementById("user_email").value;
	if(user_email == ""|| user_email.length == 0){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	var user_phone = document.getElementById("user_phone").value;
	if(user_phone == ""|| user_phone.length == 0){
		alert("핸드폰번호를 입력해 주세요.");
		return false;
	}else if(user_phone.length < 12 ||  user_phone.length > 13){
		alert("핸드폰번호를 다시 입력해주세요.");
		return false;
	}
	var user_chk = document.getElementById("user_chk");
	
	if(!user_chk.checked ){
			alert("개인정보 활용에 동의해주세요.");
			return false;
	}else if(user_chk.checked){
			return true;
		}
	return true;
}

</script>
</head>
<body>
	<form action="/user/join" method="post" onsubmit="return formCheck();">
	
		<table>
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
					<td>
						<label>아이디</label>
					</td>
					<td>
						<input type="text" id="user_id" name="user_id">
					</td>
				</tr>
				<tr>
					<td>
						<label>비밀번호</label>
					</td>
					<td>
						<input type="password" id="user_pw" name="user_pw">
					</td>
				</tr>
				<tr>
					<td>
						<label>비밀번호 확인</label>
					</td>
					<td>
						<input type="password" id="user_pwCh">
					</td>
				</tr>
				<tr>
					<td>
						<label>이름</label>
					</td>
					<td>
						<input type="text" id="user_nm" name="user_nm">
					</td>
				</tr>
				<tr>
					<td class="title">주로 사용하는 이메일<span class="star" >(*)</span></td>
					<td> 
						<input type="text" id="user_email" name="user_email" placeholder="user123@ocot.com"> 
					</td>
				</tr>
				<tr>
					<td class="title" >휴대폰 번호<span class="star" >(*)</span></td>
					<td>				
					 	<input type="text" id="user_phone"  name="user_phone" placeholder="010-1234-5678"> 
					</td>
				</tr>
				<tr>
					<td>
						<label>개인정보 활용 동의</label>
					</td>
					<td>
						<input type="checkbox"  id="user_chk">개인정보 수집 및 이용에 대한 안내에<br> 동의합니다.(필수)<br>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<input class = "bt" id = "joinBt" type="submit" value="가입">
						<input class = "bt"  id = "canBt" type="button" value="취소" onClick="location.href='/'">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	
</body>

 
</html>