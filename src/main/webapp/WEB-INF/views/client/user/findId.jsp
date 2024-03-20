<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<jsp:include page = "../../common/aTemplates/adminHeader.jsp"/>
	<form method = "POST" action = "./checkEmail.action">
		<input type = "text" id = "u_name" name = "u_name"/>
		<input type = "text" id = "u_email" name = "u_email"/>
		<button type = "submit">인증번호 보내기</button>
	</form>
	<form method = "POST" action = "./checkEmailAutorization.action">
		<input type = "text" id = "authenticationCode" name = "authenticationCode"/>
		<button type = "submit">인증 확인</button>
	</form>
	<jsp:include page = "../../../template/footer.jsp"/>
</body>
</html>