<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>mypage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="#">아띠</a>`

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
			<li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
			<li class="nav-item"><a class="nav-link" href="#">예약내역</a></li>
		</ul>
	</nav>
	<form action="${contextPath}/member/modifySave" method="post">
		<label for="id">아이디</label> <input type="text" name="u_id" id="u_id"
			value="${myDetail.u_id}" readonly /> <label for="pwd">비밀번호</label> <input
			type="password" name="u_pw" id="u_pw" class="user-margin"
			value="${myDetail.u_pw}" readonly /> <label for="name">이름</label> <input
			type="text" name="u_name" id="u_name" value="${myDetail.u_name}"
			readonly /> <label for="phone">휴대폰 번호 (-없이)</label> <input type="tel"
			name="u_tel" id="u_tel" value="${myDetail.u_tel}" /> <label
			for="email">이메일</label> <input type="email" name="u_email"
			id="u_email" value="${myDetail.u_email}" /> <label for="birth">생년월일</label>
		<input type="text" name="u_bitrh" id="u_birth"
			value="${myDetail.u_birth}" /> <label for="addr">주소</label> <input
			type="text" name="u_addr" id="u_addr" value="${myDetail.u_addr}" />
		<button type="submit" id="save-btn">변경 내용 저장</button>
	</form>


</body>
</html>