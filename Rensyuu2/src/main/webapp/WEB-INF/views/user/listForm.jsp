<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function userDelete(user_no){
	//컨트롤러로 삭제 요청을 전달하는데 onclick으로 부터 전달받은 데이터도 같이보낸다.
		location.href = "/user/delete?user_no="+user_no;
	}  


</script>
</head>
<body>
<table>
<input type="button" class="delBtn" value="삭제" onclick=”userDelete(${user.user_no })”>
<tbody class="tbody">
			<c:forEach var ="user" items="${userList }">
				<tr>
					<td>${user.user_no }</td>
					<td>
	<a href="/user/detail?user_no=${user.user_no }">${user.user_id }</a>
					</td>
					<td>${user.user_pw }</td>
					<td>${user.user_nm }</td>
					<td>${user.user_indate }</td>
					<td>  
<!--  <input  type="button" value="삭제" onclick="userDelete(${user.user_no })">  -->
						<input type="button" class="delBtn" value="삭제">
						<input type="hidden" class="hidUserNo" value="${user.user_no }">
					</td>
				</tr>
			</c:forEach>
		</tbody>



</table>
</body>
</html>