<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admin/common.css" />
<style>
.wraplogin {
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 20px;
	margin: 0 auto;
	width: 380px;
}

.form-signin {
	padding: 30px 15px;
}

#u_email, #u_name, .btn {
	margin-bottom: 30px;
	height: 50px;
}

.footer {
	position: absolute;
	bottom: 0;
	background-color: #343a40;
	color: white;
	text-align: center;
	padding: .7rem 0 1rem;
	width: 100%;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>

	<div class="content">
		<p class="title">비밀번호 찾기</p>
		<div class="wraplogin">
			<main class="form-signin text-center">
				<form method="POST" action="./checkPw">
					<input type="text" id="u_name" name="u_name" class="form-control"
						placeholder="이름을 입력해주세요" required autofocus /> <input type="text"
						id="u_email" class="form-control" name="u_email"
						placeholder="이메일을 입력해주세요" required />

					<button class="btn btn-dark form-control" type="submit">인증번호
						보내기</button>
				</form>
			</main>
		</div>
	</div>


	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>
