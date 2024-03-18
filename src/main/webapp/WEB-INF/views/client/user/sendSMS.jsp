<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.anim.clinic.admin.user.biz.SendSMSTwilio"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sms 인증</title>
</head>
<body>

	<h1>SMS 인증</h1>
	<p>휴대전화 번호로 인증번호를 보냈습니다. 입력란에 인증번호를 입력하세요.</p>
	<form method="post" action="verifySMS.jsp">
		<label for="otp">인증번호:</label> <input type="text" id="otp" name="otp" /><br>
		<input type="submit" value="확인" />
	</form>
</body>
</html>
